package com.ict.healim.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ict.healim.service.EmailService;
import com.ict.healim.service.JoinService;
import com.ict.healim.vo.JoinVO;
import com.ict.healim.vo.SessionUserVO;

@Controller
public class JoinController {
	
	@Autowired
	private JoinService joinService;
	
	@Autowired BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private EmailService emailService;
	
	// 이메일 중복여부 확인
	@PostMapping("/checkEmail")
	@ResponseBody
	public String checkEmail(@RequestParam("mber_id") String mberId) {
	    try {
	        // 이메일 중복 여부를 확인하기 위해 JoinService의 메서드를 호출
	        boolean isAvailable = joinService.isEmailAvailable(mberId);

	        // 사용 가능한 이메일일 경우 "available" 반환, 그렇지 않으면 "unavailable" 반환
	        return isAvailable ? "available" : "unavailable";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "error";
	    }
	}
	
	// 회원가입 이메일 보내기
	@PostMapping("/email_send")
	public ModelAndView sendMail(
		@RequestParam("mber_id") String mber_id,
		HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("login&join/join");
			// 임시번호 만들기
			Random random = new Random();
			String randomNumber = String.valueOf(random.nextInt(1000000));
			
			if(randomNumber.length()<6) {
				int substract = 6 - randomNumber.length();
				StringBuffer sb = new StringBuffer();
				for(int i=0; i < substract; i++) {
					sb.append("0");
				}
				sb.append(randomNumber);
				randomNumber = sb.toString();
			}
			// 임시번호 서버에 확인하기
			System.out.println("임시번호 : " + randomNumber);
			
			// 해당 임시번호를 DB에 저장 또는 세션에 저장
			request.getSession().setAttribute("sessionNumber", randomNumber);
			emailService.sendEmail(randomNumber, mber_id);
			// 이메일 값을 Model에 추가하여 JSP에서 유지하도록
			mv.addObject("mber_id", mber_id);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	
	// 회원가입 인증번호 확인하기
	@PostMapping("/email_send_chk")
	@ResponseBody
	public Map<String, Object> sendMailChk(@RequestParam("authNumber") String authNumber,
	                                       @RequestParam("mber_id") String mber_id,
	                                       HttpServletRequest request) {
	    Map<String, Object> result = new HashMap<>();

	    String sessionNumber = (String) request.getSession().getAttribute("sessionNumber");

	    if (authNumber.equalsIgnoreCase(sessionNumber)) {
	        result.put("authSuccess", true);
	        result.put("message", "인증번호가 확인되었습니다.");
	    } else {
	        result.put("authSuccess", false);
	        result.put("message", "인증번호가 일치하지 않습니다.");
	    }

	    return result;
	}
	 // 회원가입 메서드
	 @PostMapping("/join_ok")
	 public ModelAndView getMemberJoinOK(JoinVO jvo) {
		 ModelAndView mv = new ModelAndView("login&join/login");
		 String password = jvo.getPassword();
		 
		 try {
			 // 비번 암호화
			 String encryptedPassword = passwordEncoder.encode(password);
			 jvo.setPassword(encryptedPassword);

			 jvo.setMber_email_adres(jvo.getMber_id());  // 이메일 주소와 ID가 같음
		     jvo.setCrt_by(jvo.getMber_id());  // 회원가입하는 사용자의 아이디로 설정
		     jvo.setSbscrb_de(LocalDate.now().toString());  // 가입일자를 현재 날짜로 설정
		     
		     // 회원가입 서비스 호출 (tb_member_log)
			 int resultLog = joinService.joinLog(jvo);
		     
			 // 회원가입 서비스 호출 (tb_member)
			 int result = joinService.join(jvo);
			 if(result > 0) {
				 mv.addObject("result", "회원가입이 완료되었습니다.");
			 }else {
				 mv.addObject("result", "0");
			 }
		} catch (Exception e) {
			e.printStackTrace();  // 예외 스택 출력 (오류 추적을 위해)
	        mv.setViewName("login&join/join");
	        mv.addObject("result", "오류 발생");
		}
		 return mv;
	 }
	 	// 마이페이지 가기 전 검증
		@RequestMapping("/myPage")
		public ModelAndView myPage(HttpSession session, String mber_id) {
			SessionUserVO sessionUser = (SessionUserVO) session.getAttribute("sessionUser");
			try {
				// 로그인 확인 검증
				if (sessionUser != null) {
					ModelAndView mv = new ModelAndView("redirect:/myPage_OK");
					// 로그인한 회원 정보를 가져온다.
					mber_id = sessionUser.getUser_id();
					// 재검증
					if(mber_id == null) {
						
							return new ModelAndView("error/error_page");
					}
					// mber_id 저장
					mv.addObject("mber_id", mber_id);
					return mv;
				}else {
					return new ModelAndView("login&join/login");
				}
			} catch (Exception e) {
				System.out.println(e);
				return new ModelAndView("error/error_page");
			}
		}
		
		// 마이페이지로 이동
		@RequestMapping("/myPage_OK")
		public ModelAndView myPageOK(String mber_id) {
			try {
				ModelAndView mv = new ModelAndView("myPage/myPage");
				JoinVO jvo = joinService.getMyPage(mber_id);
				
				if(jvo != null) {
					mv.addObject("jvo", jvo);
					return mv;
				}
				return new ModelAndView("error/error_page");
			} catch (Exception e) {
				System.out.println(e);
			}
			return new ModelAndView("error/error_page");
		}
		// 마이페이지 수정
		@PostMapping("/myPage_update")
		public ModelAndView myPageUpdate(@ModelAttribute JoinVO jvo, RedirectAttributes rat){
			String password = jvo.getPassword();
			try {
				ModelAndView mv = new ModelAndView("redirect:/myPage_OK");
				// 비번 암호화
				String encryptedPassword = passwordEncoder.encode(password);
				jvo.setPassword(encryptedPassword);
				int result = joinService.MyPageUpdate(jvo);
				if(result>0) {
					mv.addObject("mber_id", jvo.getMber_id());
					rat.addFlashAttribute("editchk", "수정 완료되었습니다.");
					return mv;
				}

				return new ModelAndView("error/error_page");
			} catch (Exception e) {
				System.out.println(e);
				return new ModelAndView("error/error_page");
			}
		}
		
		// 찜 목록 삭제
		@PostMapping("/removePick")
		@ResponseBody
		public Map<String, Object> removePick(@RequestParam("h_id") String h_id,
				HttpSession session) {
			Map<String, Object> result = new HashMap<>();
			SessionUserVO sessionUser = (SessionUserVO) session.getAttribute("sessionUser");
			String mber_id = sessionUser.getUser_id();
			try {
				// 찜 목록에서 삭제
				int deleteresult = joinService.removePick(mber_id, h_id);
				if (deleteresult > 0) {
					// 요양병원 찜한 시설 수 조회
					int hPickCount = joinService.getHPickCount(mber_id);
					// 요양원 찜한 시설 수 조회
					int nPickCount = joinService.getNPickCount(mber_id);
					
					result.put("status", "success");
					result.put("hPickCount", hPickCount);
					result.put("nPickCount", nPickCount);
		            
		        } else {
		        	result.put("status", "failure");
		        }
			} catch (Exception e) {
				System.out.println(e);
				result.put("status", "error");
			}
			return result; // 삭제 성공
			
		}
}