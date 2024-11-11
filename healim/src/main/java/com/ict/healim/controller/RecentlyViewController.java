package com.ict.healim.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.healim.service.HospitalService;
import com.ict.healim.service.RecentlyViewService;
import com.ict.healim.vo.HospitalVO;
import com.ict.healim.vo.RecentlyViewVo;
import com.ict.healim.vo.SessionUserVO;

@Controller
public class RecentlyViewController {

	@Autowired
	private RecentlyViewService recentlyViewService;
	
	@Autowired
	private HospitalService hospitalService;
	
	
	@GetMapping("/recent")
	 public ModelAndView getRecentlyViewedList(HttpSession session) {
		SessionUserVO svo = (SessionUserVO) session.getAttribute("sessionUser");
        System.out.println("세션에 저장된 mber_id: " + svo.getUser_id());
        
        if (svo.getUser_id() == null) {
            throw new RuntimeException("아이디를 찾을 수 없습니다.");
        }
      
        List<HospitalVO> recentlyViewedList = recentlyViewService.getRecentlyViewList(svo.getUser_id());

        ModelAndView mv = new ModelAndView("myPage/recent");
        mv.addObject("recentlyViewedList", recentlyViewedList);
        return mv;
    }
	
	/*
	 * @GetMapping("/hospitalhistory") public ModelAndView
	 * getHospitalDetail(@RequestParam("h_id") String h_id, HttpSession session) {
	 * 
	 * SessionUserVO svo = (SessionUserVO) session.getAttribute("sessionUser");
	 * System.out.println("세션에 저장된 mber_id: " + svo.getUser_id());
	 * 
	 * int result = recentlyViewService.insertRecentlyView(h_id, svo.getUser_id());
	 * 
	 * 
	 * ModelAndView mv = new ModelAndView("hospitalClick/hospitalDetail");
	 * mv.addObject("hospital", hospitalService.getHospitalList(h_id)); return mv; }
	 */

	
}
