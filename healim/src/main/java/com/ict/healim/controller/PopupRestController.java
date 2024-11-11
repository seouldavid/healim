package com.ict.healim.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ict.healim.service.PopupService;
import com.ict.healim.vo.PopupVO;

@RestController
public class PopupRestController {
	@Autowired
	private PopupService popupService;
	
	@GetMapping(value = "/popup_upload", produces = "application/json")
	public List<PopupVO> getPopupInfo(HttpServletRequest request){
		List<PopupVO> list = popupService.getPopupList();			
		return list;
	}
	
}
