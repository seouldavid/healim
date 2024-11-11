package com.ict.healim.controller;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.healim.service.HospitalService;
import com.ict.healim.vo.HospitalVO;
@Controller
public class RecommendController {
	
	@Autowired
	HospitalService hospitalService;
	
	@RequestMapping("/recommend")
	public ModelAndView recommend(@RequestParam("value") String value) {
		ModelAndView mv = new ModelAndView("recommend");
		List<HospitalVO> h_list = hospitalService.getHPickList();
		List<HospitalVO> n_list = hospitalService.getNPickList();
		
		mv.addObject("h_list", h_list);
		mv.addObject("n_list", n_list);
		mv.addObject("value", value);
		return mv;
	}
	
	@RequestMapping("/recommendRank")
	public ModelAndView recommendRank(@RequestParam("value") String value) {
		ModelAndView mv = new ModelAndView("recommend_rank");
		List<HospitalVO> h_list = hospitalService.getHRankList();
		List<HospitalVO> n_list = hospitalService.getNRankList();
		
		mv.addObject("h_list", h_list);
		mv.addObject("n_list", n_list);
		mv.addObject("value", value);
		return mv;
	}
}
