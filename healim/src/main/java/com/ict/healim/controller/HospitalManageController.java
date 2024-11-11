package com.ict.healim.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.ict.healim.service.HospitalManageService;
import com.ict.healim.vo.CityVO;
import com.ict.healim.vo.HosptVO;
import com.ict.healim.vo.AdmCfgVO;
import com.ict.healim.vo.AdmHosPagingVO;
import com.ict.healim.vo.SearchVO;
import com.ict.healim.vo.SessionUserVO;


@Controller
public class HospitalManageController {

	@Autowired
	private HospitalManageService hospitalManageService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/hospital_info")
    public ModelAndView HospitalList( SearchVO sc, HttpServletRequest request, Model m) {
		
		try {
			
			Map<String, ?> flashMap =RequestContextUtils.getInputFlashMap(request);
			
			ModelAndView mv = new ModelAndView("admin_pages/hospital_info");
			
		    if(flashMap!=null) {
		    	sc =(SearchVO)flashMap.get("sc");
				String savechk = (String)flashMap.get("savechk");
		    	// 새로 입력된 병원의 페이지 위치를 가져 온다.
				int pagenum = hospitalManageService.getNewRegNum(sc.getH_name(), sc);
				
				//sc 에 현재 페이지로 넣는다.
				sc.setPage(pagenum);
				// 저장 성공을 hospital_info로 보낸다.
				mv.addObject("savechk", savechk);
		    }
            
		    String deletechk = request.getParameter("deletechk");
		    
		    // delete 에서 넘어온 flag를 다시 보낸다.
		    if(deletechk != null || deletechk !="" ) {
		    	
		    	mv.addObject("deletechk", deletechk);
		    }
		    
			System.out.println("hospital_info-------------------> sc.getKeyword() :"+ sc.getKeyword());
			System.out.println(sc.getOption());
			System.out.println("sc.getPage()1 : "+ sc.getPage());
			
			
			sc.setH_type("%"); //요양병원 설정

			int totalCnt = hospitalManageService.getSearchResultCnt(sc);
			System.out.println("totalCnt :" + totalCnt);
            mv.addObject("totalCnt", totalCnt);

            AdmHosPagingVO pgvo = new AdmHosPagingVO(totalCnt, sc);
            
			if( totalCnt == 0 ){
			    // 조회 결과가 없을 경우 바로 hospital_info로 넘긴다.
				return mv;
			}
			            
            System.out.println("hospital_info-----> sc.getKeyword() : "+ sc.getKeyword());
            
            try {
                List<HosptVO> list = hospitalManageService.getBothList(sc);
                
                System.out.println(" 최종 넘어가는 현재 페이지 --->sc.getPage()   : "+ sc.getPage()); 
                
                
                mv.addObject("list", list);
                mv.addObject("pg", pgvo);

                return mv; 

            } catch (BadSqlGrammarException e) {
                // 예외가 발생하면 에러 페이지로 이동
                mv.addObject("errorMessage", "SQL 구문 오류가 발생했습니다.");
                mv.addObject("errorDetail", e.getMessage());
                mv.setViewName("admin_pages/404");
                return mv; // 에러 페이지로 이동
            }
            


			
		} catch (Exception e) {
			System.out.println(e);
			return null ;
		}
	}    
	
	@RequestMapping("/hospital_edit")// 병원 수정으로 이동
	public ModelAndView GetHospitalEdit(@RequestParam("h_id") String h_id ,
			@ModelAttribute("sc") SearchVO sc , @ModelAttribute("updatechk") String updatechk ) {
		
		System.out.println("h_id :" + h_id);
		ModelAndView mv =  new ModelAndView("admin_pages/hospital_edit");
		
		try {
			
			System.out.println("h_id :" + h_id);
			
			HosptVO hvo = hospitalManageService.getHospitalDetail(h_id);
			
			List<CityVO> list = hospitalManageService.getCityList();
			mv.addObject("hvo", hvo);
			mv.addObject("list", list );
			
			
			System.out.println("<--------------------------------------->City_name  :" + hvo.getCity_name());
			System.out.println(hvo);
			
			return mv;
			
		} catch (Exception e) {
			
			System.out.println(e);
		}
		
		
		
		return null;
	}
	
	@RequestMapping("/hospital_editok")
	public ModelAndView GetHospitalEditOk( HosptVO hosptvo , SearchVO scvo , HttpServletRequest request ) {
		
		System.out.println("<----------editok 시작----------------->");
		
		try {
			
			SessionUserVO suvo = (SessionUserVO) session.getAttribute("sessionUser");
			String sessionUserId = (suvo != null) ? suvo.getUser_id() : null;

			hosptvo.setUpd_by("sessionUserId");
			
			System.out.println("<----------editok 중간 h_id----------------->  :" + hosptvo.getH_id());
			
			System.out.println("open_date : "+hosptvo.getOpen_date());
			System.out.println("tel_no : "+hosptvo.getTel_no());
			System.out.println("addr : "+hosptvo.getAddr());
			System.out.println("city_name : "+hosptvo.getCity_name());
			System.out.println("city_code : "+hosptvo.getCity_code());
			System.out.println("h_type : "+hosptvo.getH_type());
			System.out.println("zipcode : "+hosptvo.getZipcode());
			System.out.println("h_name : "+hosptvo.getH_name());
			System.out.println("h_id : "+hosptvo.getH_id());
			System.out.println("zipcode : "+hosptvo.getZipcode());
			
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file_1 = hosptvo.getFile_1();
			MultipartFile file_2 = hosptvo.getFile_2();
			
			UUID uuid = UUID.randomUUID();
			if(!file_1.isEmpty() && file_1 != null) {
				hosptvo.setF_name1(uuid.toString()+"_"+file_1.getOriginalFilename());
				file_1.transferTo(new File(path, hosptvo.getF_name1()));
			}else {
				hosptvo.setF_name1(hosptvo.getOri_f_name1());
			}
			if(!file_2.isEmpty() && file_2 != null) {
				hosptvo.setF_name2(uuid.toString()+"_"+file_2.getOriginalFilename());
				file_2.transferTo(new File(path, hosptvo.getF_name2()));
			}else {
				hosptvo.setF_name2(hosptvo.getOri_f_name2());
			}
			
			System.out.println("hosptvo.getCity_name() ----------------------->" + hosptvo.getCity_name());
			
			int result = hospitalManageService.getHostpitalEdit(hosptvo);
			
			List<CityVO> cityvo = hospitalManageService.getCityList();
			
			System.out.println("<----------editok 중간----------------->cityvo  :" + cityvo);
			
			ModelAndView mv = new ModelAndView("redirect:/hospital_edit?");
			
			System.out.println(result);
			if( result > 0 ) {
				
				//mv.addObject("hvo", hosptvo);
				mv.addObject("sc", scvo);
				mv.addObject("h_id", hosptvo.getH_id());
				
				mv.addObject("updatechk" , "S" );
				//mv.addObject("cityvo", cityvo );				
				return mv;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		return null;
	} 
	
	// 병원 삭제
	@RequestMapping("/hospital_delete")
	public ModelAndView GetHospitalDelete(@RequestParam("h_id") String h_id ,
			@ModelAttribute("sc") SearchVO sc ) {
		
		System.out.println("h_id :" + h_id);
		ModelAndView mv =  new ModelAndView("redirect:/hospital_info");
		
		try {
			
			System.out.println("h_id :" + h_id);
			System.out.println("keyword : " + sc.getKeyword());
			
			SessionUserVO suvo = (SessionUserVO) session.getAttribute("sessionUser");
			String user_id = (suvo != null) ? suvo.getUser_id() : null;
			
			int result = hospitalManageService.getHospitalDelete(h_id , user_id);
			if(result> 0) {
				
				mv.addObject("deletechk", "S");
				return mv;
			}
			
			return null;
			
		} catch (Exception e) {
			
			System.out.println(e);
			return null;
		}
		
	}
	
	@RequestMapping("/hospital_reg")
	public ModelAndView GetHostpitalReg(SearchVO sc , HttpServletRequest request) {
		
		System.out.println("hospital_reg");
		ModelAndView mv =  new ModelAndView("admin_pages/hospital_reg");
		
		List<CityVO> list = hospitalManageService.getCityList();
		
		System.out.println("hospital_reg ----> getKeyword() : " + sc.getKeyword());
		
	    mv.addObject("list", list );
	    mv.addObject("sc", sc);
		return mv;
	}	
	
	@RequestMapping("/hospital_regok")
	public ModelAndView GetHostpitalRegOk(
			RedirectAttributes redirect,
			HosptVO hosptvo,
			SearchVO sc,
			HttpServletRequest request) {
		
		System.out.println(hosptvo.toString());
		System.out.println("hospital_regok");
		System.out.println("hospital_regok ---->getKeyword()" + sc.getKeyword());
		
		SessionUserVO suvo = (SessionUserVO) session.getAttribute("sessionUser");
		String sessionUserId = (suvo != null) ? suvo.getUser_id() : null;
		
		hosptvo.setCrt_by("sessionUserId");
		hosptvo.setUpd_by("sessionUserId");
		
		
		
		try {
			
			ModelAndView mv =  new ModelAndView("redirect:/hospital_info");
			
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file_1 = hosptvo.getFile_1();
			MultipartFile file_2 = hosptvo.getFile_2();
			
			UUID uuid = UUID.randomUUID();
			if(!file_1.isEmpty() && file_1 != null) {
				hosptvo.setF_name1(uuid.toString()+"_"+file_1.getOriginalFilename());
				file_1.transferTo(new File(path, hosptvo.getF_name1()));
			}
			if(!file_2.isEmpty() && file_2 != null) {
				hosptvo.setF_name2(uuid.toString()+"_"+file_2.getOriginalFilename());
				file_2.transferTo(new File(path, hosptvo.getF_name2()));
			}

			int result = hospitalManageService.getHospitalReg(hosptvo);
			
			if(result > 0) {
				
			    String h_name = hosptvo.getH_name();
			    System.out.println("h_name   :" + h_name);
				// 새로 저장한 병원정보가 전체 데이터에서 있는 위치를 가지고 온다.
				int pagenum = hospitalManageService.getNewRegNum(h_name, sc);
				
				System.out.println("pagenum : " + pagenum);
				System.out.println("hospital_regok 2 ---->getKeyword()" + sc.getKeyword());
				
				sc.setH_name(h_name);
			    mv.addObject("savechk", "S");
			    
				redirect.addFlashAttribute("sc", sc);
				redirect.addFlashAttribute("savechk", "S");
				
				return mv;	
			}
			
			
			return null;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	@GetMapping("/hospital_download")
	public void fileDown(HttpServletRequest request , HttpServletResponse response ) {
		try {
			String f_name = request.getParameter("f_name");
			String path = request.getSession().getServletContext().getRealPath("resources/upload/"+f_name);
		
			String r_path = URLEncoder.encode(f_name, "utf-8");
			
			String t_name = r_path.substring(r_path.indexOf("_")+1 , r_path.length());
			//브라우저 설정
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename="+ t_name);
			
			//byte[] in
			File file = new File(new String(path.getBytes(),"utf-8"));
			FileInputStream in = new FileInputStream(file);
			
			//File out
			OutputStream out = response.getOutputStream();
			FileCopyUtils.copy(in, out);

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	@RequestMapping("/config")
	public ModelAndView setSiteConfig(@ModelAttribute("updatechk") String updatechk ) {
		ModelAndView mv = new ModelAndView("admin_pages/config");
		
		try {
			AdmCfgVO acfvo = hospitalManageService.getConfigEdit();
			
			mv.addObject("acfvo", acfvo);
			return mv;
			
		} catch (Exception e) {
			System.out.println(e);
			
		}
		
		return null;
	}
	
	@PostMapping("/config_Ok")
	public ModelAndView setSiteConfigOk(AdmCfgVO acfvo) {
		System.out.println("/config_Ok");
		ModelAndView mv = new ModelAndView("redirect:/config");
		
		try {
			
			System.out.println( "config admin :" + acfvo.getCf_admin());
			int result = hospitalManageService.setConfigEdit(acfvo);
			
			if(result > 0) {
				
				mv.addObject("updatechk", "S");
				return mv;
			}
			
		} catch (Exception e) {
			System.out.println(e);
			
		}
		
		return null;
	}
}
