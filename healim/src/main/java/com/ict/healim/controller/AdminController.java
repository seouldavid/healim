package com.ict.healim.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ict.healim.service.AdminService;
import com.ict.healim.vo.AdminVO;
import com.ict.healim.vo.MemberVO;
import com.ict.healim.vo.SessionUserVO;

@Controller
public class AdminController {

	@Autowired
	@Qualifier("adminServiceImpl")
	private AdminService adminService;
	
	@GetMapping("/member_detail")
	public ModelAndView getMemberAuthDetail(@RequestParam("mber_id") String mber_id) {
		ModelAndView mv = new ModelAndView("admin_pages/member_detail");
		try {
			MemberVO mvo = adminService.getMemberAuthDetail(mber_id);
			if (mvo != null) {
				mv.addObject("mvo", mvo);
				return mv;
			}
			mv.addObject("error", " ý            ߻  ߽  ϴ .");
			return mv;

		} catch (Exception e) {
			System.out.println(e);
			mv.addObject("error", " ý            ߻  ߽  ϴ .");
			return mv;
		}
	}

	@PostMapping("/setMemberAuthUpdate")
	public String setMemberAuthUpdate(MemberVO mvo, RedirectAttributes redirectAttributes) {
		try {
			int result = adminService.updateMemberAuth(mvo);
			if (result > 0) {
				redirectAttributes.addFlashAttribute("update", "ȸ                              Ǿ    ϴ .");
				return "redirect:/member_detail?mber_id=" + mvo.getMber_id();
			}
			redirectAttributes.addFlashAttribute("error", " ý            ߻  ߽  ϴ .");
			return "redirect:/member_detail?mber_id=" + mvo.getMber_id();
		} catch (Exception e) {
			System.out.println(e);
			redirectAttributes.addFlashAttribute("error", " ý            ߻  ߽  ϴ .");
			return "redirect:/member_detail?mber_id=" + mvo.getMber_id();
		}
	}

	@RequestMapping("/member_list")
	public String getMemberList(RedirectAttributes redirectAttributes) {
		return "redirect:/member";
	}

	@RequestMapping("/delete_member")
	public ModelAndView memberDelete(@ModelAttribute("mber_id") String mber_id) {
		return new ModelAndView("admin_pages/member_delete");
	}

	@PostMapping("/member_delete_ok")
	public ModelAndView memberDeleteOK(MemberVO mvo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		try {
			SessionUserVO suvo = (SessionUserVO) session.getAttribute("sessionUser");
			System.out.println("--------------");
			String mber_id = suvo.getUser_id();
			// 비밀번호 체크
			mvo.setDeleted_by_admin(mber_id);
			System.out.println("세션 아이디 : " + mvo.getDeleted_by_admin());
			int result = adminService.getMemberAuthDelete(mvo);

			if (result > 0) {
				mv.setViewName("redirect:/member_list");
				return mv;
			}

		} catch (Exception e) {
			System.out.println(e);
			mv.addObject("error", "시스템 오류가 발생했습니다.");
			return mv;
		}
		mv.addObject("error", "시스템 오류가 발생했습니다.");
		return mv;
	}

	@RequestMapping("/admin")
	public ModelAndView getAdminList() {
		ModelAndView mv = new ModelAndView("admin_pages/admin");
		List<AdminVO> list = adminService.getAdminList();
		System.out.println("-------------");
		mv.addObject("list", list);

		return mv;
	}

	@GetMapping("/admin_create")
	public ModelAndView goToAdmin() {
		// `/admin` 요청 시 `admin_create` 페이지로 이동
		return new ModelAndView("admin_pages/admin_create");
	}

	@PostMapping("/admin_add")
	public ModelAndView insertAdmin(AdminVO avo) {
		ModelAndView mv = new ModelAndView();
		int result = adminService.getAdminInsert(avo);
		System.out.println("result: " + result);
		mv.setViewName("redirect:/index");
		return mv;
	}

	@GetMapping("/admin_delete")
	public ModelAndView deleteAdmin(@ModelAttribute("admin_id") String admin_id) {
		int result = adminService.getAdminDelete(admin_id);
		return new ModelAndView("redirect:/admin");

	}

	@PostMapping("/admin_detail_ok")
	public ModelAndView editAdmin(AdminVO avo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		System.out.println("avo.getChat_auth()" + avo.getChat_auth());
		int result = adminService.getAdminUpdate(avo);

		System.out.println("result:" + result);
		mv.setViewName("redirect:/index");
		return mv;

	}

	
	
	
	
}
