package com.ict.healim.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.healim.service.PopupService;
import com.ict.healim.vo.PopupVO;

@Controller
public class PopupController {

	@Autowired
	private PopupService popupService;

	@PostMapping("/popup_add")
	public ModelAndView insertPopup(PopupVO pvo, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView();
			String path = request.getSession().getServletContext().getRealPath("resources/img");
			MultipartFile file = pvo.getFile_name();

			UUID uuid = UUID.randomUUID();
			String f_name = uuid.toString() + "_" + file.getOriginalFilename();
			pvo.setF_name(f_name);

			file.transferTo(new File(path, f_name));

			int result = popupService.getPopupInsert(pvo);
			System.out.println("result: " + result);
			mv.setViewName("redirect:/index");
			return mv;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	@PostMapping("/popup_edit_ok")
	public ModelAndView editPopup(PopupVO pvo,HttpServletRequest request) {
	try {
		
		ModelAndView mv = new ModelAndView();
		String path = request.getSession().getServletContext().getRealPath("resources/img");
		MultipartFile file = pvo.getFile_name();
		if(!file.isEmpty()) {
			UUID uuid = UUID.randomUUID();
			String f_name = uuid.toString() + "_" + file.getOriginalFilename();
			System.out.println(f_name);
			pvo.setF_name(f_name);			
			file.transferTo(new File(path,f_name));
			
		} else {
			if (pvo.getOld_f_name() != null) {
				pvo.setF_name(pvo.getOld_f_name());
			} else {
				pvo.setF_name("");
			}
		}
		int result = popupService.getPopupEdit(pvo);
		System.out.println("updateeditok:" + result);
		mv.setViewName("redirect:/index");
		return mv;
	} catch (Exception e) {
		
	}
		return null;
	}

	@GetMapping("/popup_show")
	public ModelAndView showPopup(@RequestParam("f_name") String f_name, @RequestParam("pu_id") String pu_id ) {
		ModelAndView mv = new ModelAndView("popup_page");
		f_
		mv.addObject("f_name", f_name);
		mv.addObject("pu_id", pu_id);
		return mv;
	}
	@GetMapping("/popup_delete")
	public ModelAndView deletepopup(@ModelAttribute("pu_id")String pu_id) {
		int result = popupService.getPopupDelete(pu_id);
		return new ModelAndView("redirect:/index");
		
	}

}
