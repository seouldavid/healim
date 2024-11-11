package com.ict.healim.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.healim.service.AdminBoardService;
import com.ict.healim.vo.BoardVO;
import com.ict.healim.vo.Paging_Search;
import com.ict.healim.vo.SessionUserVO;

@Controller
public class AdminBoardController {

	@Autowired
	private AdminBoardService adminBoardService;

	@Autowired
	private Paging_Search paging;

	@GetMapping("/admin_board")
	public ModelAndView directToBoard() {
		return new ModelAndView("admin_pages/admin_board");
	}

	//      Խ        
	@RequestMapping("/freeboard_list")
	public ModelAndView freeboardList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin_pages/freeboard");

		//     ¡    
		System.out.println("  Ʈ ѷ     Գ ?");
		int count = adminBoardService.getFreeBoardCount();
		paging.setTotalRecord(count);

		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		String cPage = request.getParameter("cPage");
		System.out.println("cPage : " + cPage);
		if (cPage == null || "undefined".equals(cPage)) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		paging.setBeginBlock(
				(int) (((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1));
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		try {
			// DBó  
			List<BoardVO> freeboard_list = adminBoardService.getFreeBoardList(paging.getOffset(),
					paging.getNumPerPage());
			if (freeboard_list != null) {

				mv.addObject("freeboard_list", freeboard_list);
				mv.addObject("paging", paging);
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
			mv.addObject("error", " ý            ߻  ߽  ϴ .");
			return mv;
		}
		mv.addObject("error", " ý            ߻  ߽  ϴ .");
		return mv;
	}

	@PostMapping("/delete_freeboard")
	public ModelAndView freeboardDelete(@ModelAttribute("cPage") String cPage, @ModelAttribute("wr_id") String wr_id) {
		ModelAndView mv = new ModelAndView("admin_pages/freeboard");
		System.out.println("wr_id : " + wr_id);
		try {
			int result = adminBoardService.getFreeBoardDelete(wr_id);
			if (result > 0) {
				mv.setViewName("redirect:/freeboard_list");
				return mv;
			} else {
				mv.addObject("error", " ý            ߻  ߽  ϴ .");
				return mv;
			}

		} catch (Exception e) {
			System.out.println(e);
			mv.addObject("error", " ý            ߻  ߽  ϴ .");
			return mv;
		}

	}
	//      Խ      

	//   㳻       
	@GetMapping("/consultation")
	public ModelAndView directToConsultation() {
		return new ModelAndView("admin_pages/consultation");
	}

	@RequestMapping("/consultation_list")
	public ModelAndView consultationList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin_pages/consultation");

		//     ¡    
		System.out.println("  Ʈ ѷ     Գ ?-   ");
		int count = adminBoardService.getConsultationCount();
		System.out.println("    ī  Ʈ"+count);
		paging.setTotalRecord(count);

		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		String cPage = request.getParameter("cPage");
		System.out.println("cPage : " + cPage);
		if (cPage == null || "undefined".equals(cPage)) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		paging.setBeginBlock(
				(int) (((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1));
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		try {
			// DBó  
			List<BoardVO> consultation_list = adminBoardService.getConsultationList(paging.getOffset(),
					paging.getNumPerPage());
			if (consultation_list != null) {

				mv.addObject("consultation_list", consultation_list);
				mv.addObject("paging", paging);
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
			mv.addObject("error", " ý            ߻  ߽  ϴ .");
			return mv;
		}
		mv.addObject("error", " ý            ߻  ߽  ϴ .");
		return mv;
	}

	@GetMapping("/consultation_select_one")
	public ModelAndView consultationDetail(@ModelAttribute("cPage") String cPage, @RequestParam("wr_id") String wr_id) {
		ModelAndView mv = new ModelAndView("admin_pages/counselor");
		try {
			//  󼼺   
			BoardVO bovo = adminBoardService.getConsultationDetail(wr_id);

			if (bovo != null) {
				mv.addObject("bovo", bovo);
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

	@PostMapping("/consultation_ans_ok")
	public ModelAndView consultationAnswerOK(BoardVO bovo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/consultation_list");
		System.out.println("dmdkdkdkdkdkdk + " + bovo.getWr_id());
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = bovo.getFile_name();
			if (file.isEmpty()) {
				bovo.setAtch_file_id("");
			} else {
				UUID uuid = UUID.randomUUID();
				String atch_file_id = uuid.toString() + "_" + file.getOriginalFilename();
				bovo.setAtch_file_id(atch_file_id);

				//    ε 
				file.transferTo(new File(path, atch_file_id));
			}

			int result = adminBoardService.getAnsInsert(bovo);
			if (result > 0) {
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

	//        ư         
	@GetMapping("/consultation_update")
	public ModelAndView consultationAnswerUpdate(@ModelAttribute("cPage") String cPage,
			@RequestParam("wr_id") String wr_id) {
		ModelAndView mv = new ModelAndView("admin_pages/counselor_update");
		try {
			//  󼼺   
			BoardVO bovo = adminBoardService.getConsultationDetail(wr_id);

			if (bovo != null) {
				mv.addObject("bovo", bovo);
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

	@PostMapping("/consultation_ans_update")
	public ModelAndView consultationAnswerUpdate(BoardVO bovo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/consultation_list");
		System.out.println("dmdkdkdkdkdkdk + " + bovo.getWr_id());
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = bovo.getFile_name();
			if (file.isEmpty()) {
				bovo.setAtch_file_id("");
			} else {
				UUID uuid = UUID.randomUUID();
				String atch_file_id = uuid.toString() + "_" + file.getOriginalFilename();
				bovo.setAtch_file_id(atch_file_id);

				//    ε 
				file.transferTo(new File(path, atch_file_id));
			}

			int result = adminBoardService.getAnsInsert(bovo);
			if (result > 0) {
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

	@GetMapping("/consultation_delete")
	public ModelAndView consultationDelete(@ModelAttribute("cPage") String cPage,
			@ModelAttribute("wr_id") String wr_id) {
		ModelAndView mv = new ModelAndView("admin_pages/consultation");
		System.out.println("wr_id : " + wr_id);
		try {
			int result = adminBoardService.getConsultationDelete(wr_id);
			if (result > 0) {
				mv.setViewName("redirect:/consultation_list");
				return mv;
			} else {
				mv.addObject("error", " ý            ߻  ߽  ϴ .");
				return mv;
			}

		} catch (Exception e) {
			System.out.println(e);
			mv.addObject("error", " ý            ߻  ߽  ϴ .");
			return mv;
		}

	}
	//   㳻     

	//    ǻ        
	@GetMapping("/questions")
	public ModelAndView directToQuestions() {
		return new ModelAndView("admin_pages/questions");
	}

	@RequestMapping("/questions_list")
	public ModelAndView questionsList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin_pages/questions");

		//     ¡    
		System.out.println("  Ʈ ѷ     Գ ?");
		int count = adminBoardService.getQuestionsCount();
		paging.setTotalRecord(count);

		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		String cPage = request.getParameter("cPage");
		System.out.println("cPage : " + cPage);
		if (cPage == null || "undefined".equals(cPage)) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		paging.setBeginBlock(
				(int) (((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1));
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		try {
			// DBó  
			List<BoardVO> questions_list = adminBoardService.getQuestionsList(paging.getOffset(),
					paging.getNumPerPage());
			if (questions_list != null) {

				mv.addObject("questions_list", questions_list);
				mv.addObject("paging", paging);
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
			mv.addObject("error", " ý            ߻  ߽  ϴ .");
			return mv;
		}
		mv.addObject("error", " ý            ߻  ߽  ϴ .");
		return mv;
	}

	@GetMapping("/questions_select_one")
	public ModelAndView questionsDetail(@ModelAttribute("cPage") String cPage, @RequestParam("wr_id") String wr_id) {
		ModelAndView mv = new ModelAndView("admin_pages/qna");
		try {
			//  󼼺   
			BoardVO bovo = adminBoardService.getQuestionsDetail(wr_id);

			if (bovo != null) {
				mv.addObject("bovo", bovo);
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

	@PostMapping("/questions_ans_ok")
	public ModelAndView questionsAnswerOK(BoardVO bovo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/questions_list");
		System.out.println("dmdkdkdkdkdkdk + " + bovo.getWr_id());
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = bovo.getFile_name();
			if (file.isEmpty()) {
				bovo.setAtch_file_id("");
			} else {
				UUID uuid = UUID.randomUUID();
				String atch_file_id = uuid.toString() + "_" + file.getOriginalFilename();
				bovo.setAtch_file_id(atch_file_id);

				//    ε 
				file.transferTo(new File(path, atch_file_id));
			}

			int result = adminBoardService.getAnsInsert(bovo);
			if (result > 0) {
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

	//        ư         
	@GetMapping("/questions_update")
	public ModelAndView questionsAnswerUpdate(@ModelAttribute("cPage") String cPage,
			@RequestParam("wr_id") String wr_id) {
		ModelAndView mv = new ModelAndView("admin_pages/qna_update");
		try {
			//  󼼺   
			BoardVO bovo = adminBoardService.getQuestionsDetail(wr_id);

			if (bovo != null) {
				mv.addObject("bovo", bovo);
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

	@PostMapping("/questions_ans_update")
	public ModelAndView questionsAnswerUpdate(BoardVO bovo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/questions_list");
		System.out.println("dmdkdkdkdkdkdk + " + bovo.getWr_id());
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = bovo.getFile_name();
			if (file.isEmpty()) {
				bovo.setAtch_file_id("");
			} else {
				UUID uuid = UUID.randomUUID();
				String atch_file_id = uuid.toString() + "_" + file.getOriginalFilename();
				bovo.setAtch_file_id(atch_file_id);

				//    ε 
				file.transferTo(new File(path, atch_file_id));
			}

			int result = adminBoardService.getAnsInsert(bovo);
			if (result > 0) {
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

	@GetMapping("/questions_delete")
	public ModelAndView questionsDelete(@ModelAttribute("cPage") String cPage, @ModelAttribute("wr_id") String wr_id) {
		ModelAndView mv = new ModelAndView("admin_pages/questions");
		System.out.println("wr_id : " + wr_id);
		try {
			int result = adminBoardService.getQuestionsDelete(wr_id);
			if (result > 0) {
				mv.setViewName("redirect:/questions_list");
				return mv;
			} else {
				mv.addObject("error", " ý            ߻  ߽  ϴ .");
				return mv;
			}

		} catch (Exception e) {
			System.out.println(e);
			mv.addObject("error", " ý            ߻  ߽  ϴ .");
			return mv;
		}

	}
	//    ǳ      

	//              
	@GetMapping("/notice")
	public ModelAndView directToNotice() {
		return new ModelAndView("admin_pages/notice");
	}

	@RequestMapping("/notice_list")
	public ModelAndView noticeList(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView("admin_pages/notice");

	    //     ¡    
	    System.out.println("  Ʈ ѷ     Գ ?");
	    int count = adminBoardService.getNoticeCount();
	    paging.setTotalRecord(count);

	    if (paging.getTotalRecord() <= paging.getNumPerPage()) {
	        paging.setTotalPage(1);
	    } else {
	        paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
	        if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
	            paging.setTotalPage(paging.getTotalPage() + 1);
	        }
	    }

	    String cPage = request.getParameter("cPage");
	    System.out.println("cPage : " + cPage);

	    // cPage   null,       ڿ , "undefined"        ⺻  (1)       
	    if (cPage == null || cPage.trim().isEmpty() || "undefined".equals(cPage)) {
	        paging.setNowPage(1);
	    } else {
	        try {
	            // cPage      ڷ    ȯ          Ȯ  
	            paging.setNowPage(Integer.parseInt(cPage));
	        } catch (NumberFormatException e) {
	            //    ڰ   ƴ               ⺻  (1)     
	            paging.setNowPage(1);
	        }
	    }

	    paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

	    paging.setBeginBlock(
	            (int) (((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1));
	    paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

	    if (paging.getEndBlock() > paging.getTotalPage()) {
	        paging.setEndBlock(paging.getTotalPage());
	    }

	    try {
	        // DBó  
	        List<BoardVO> notice_list = adminBoardService.getNoticeList(paging.getOffset(), paging.getNumPerPage());
	        if (notice_list != null) {
	            mv.addObject("notice_list", notice_list);
	            mv.addObject("paging", paging);
	            return mv;
	        }
	    } catch (Exception e) {
	        System.out.println(e);
	        mv.addObject("error", " ý            ߻  ߽  ϴ .");
	        return mv;
	    }
	    mv.addObject("error", " ý            ߻  ߽  ϴ .");
	    return mv;
	}

	@RequestMapping("/notice_detail")
	public ModelAndView noticeDetail(@ModelAttribute("cPage") String cPage, @RequestParam("wr_id") String wr_id) {
		ModelAndView mv = new ModelAndView("admin_pages/announcement");
		try {
			System.out.println("wr_id: " + wr_id);
			//  󼼺   
			BoardVO bovo = adminBoardService.getNoticeDetail(wr_id);

			if (bovo != null) {
				mv.addObject("bovo", bovo);
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

	//  ٿ ε 
	@GetMapping("/notice_down")
	public void noticeDown(HttpServletRequest request, HttpServletResponse response) {
		try {
			String f_name = request.getParameter("atch_file_id");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/" + f_name);
			String r_path = URLEncoder.encode(path, "UTF-8");

			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename=" + r_path);

			File file = new File(new String(path.getBytes(), "UTF-8"));
			FileInputStream in = new FileInputStream(file);
			OutputStream out = response.getOutputStream();

			FileCopyUtils.copy(in, out);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	//        ư         
	@RequestMapping("/notice_update")
	public ModelAndView noticeUpdate(@ModelAttribute("cPage") String cPage, @RequestParam("wr_id") String wr_id) {
		ModelAndView mv = new ModelAndView("admin_pages/announcement_update");
		try {
			//  󼼺   
			BoardVO bovo = adminBoardService.getNoticeDetail(wr_id);

			if (bovo != null) {
				mv.addObject("bovo", bovo);
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

	//                      
	@PostMapping("/notice_update_ok")
	public ModelAndView noticeUpdateOK(@ModelAttribute("cPage") String cPage, @ModelAttribute("wr_id") String wr_id,
			BoardVO bovo, HttpServletRequest request) {

		ModelAndView mv = new ModelAndView();
		
			try {
				BoardVO bovo2 = adminBoardService.getNoticeDetail(wr_id);
				mv.setViewName("redirect:/notice_list");
				String path = request.getSession().getServletContext().getRealPath("/resources/upload");
				MultipartFile file = bovo.getFile_name();
				if (file.isEmpty()) {
					bovo.setAtch_file_id(bovo.getOld_atch_file_id());
				} else {
					UUID uuid = UUID.randomUUID();
					String atch_file_id = uuid.toString() + "_" + file.getOriginalFilename();
					bovo.setAtch_file_id(atch_file_id);

					//    ε 
					file.transferTo(new File(path, atch_file_id));
				}


				int result = adminBoardService.getNoticeUpdate(bovo);
				if (result > 0) {
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

	//              
	@RequestMapping("/notice_delete")
	public ModelAndView noticeDelete(@ModelAttribute("cPage") String cPage, @ModelAttribute("wr_id") String wr_id) {
		ModelAndView mv = new ModelAndView("admin_pages/notice");
		System.out.println("wr_id : " + wr_id);
		try {
			int result = adminBoardService.getNoticeDelete(wr_id);
			if (result > 0) {
				mv.setViewName("redirect:/notice_list");
				return mv;
			} else {
				mv.addObject("error", " ý            ߻  ߽  ϴ .");
				return mv;
			}

		} catch (Exception e) {
			System.out.println(e);
			mv.addObject("error", " ý            ߻  ߽  ϴ .");
			return mv;
		}

	}

	//             
	@GetMapping("/notice_write")
	public ModelAndView noticeInsert() {
		return new ModelAndView("admin_pages/announcement_write");
	}

	//       ۼ                  
	@PostMapping("/notice_write_ok")
	public ModelAndView noticeInsertOK(BoardVO bovo, HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/notice_list");
		try {
			//    ǿ   ִ          ̵  bovo         Ʈ           ̵   ִ´ . ("          ߾ "      ˷  ִ   뵵)
			SessionUserVO suvo = (SessionUserVO) session.getAttribute("sessionUser");
			String update_by_id = suvo.getUser_id();
			bovo.setUpd_by(update_by_id);
			
			
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = bovo.getFile_name();
			if (file.isEmpty()) {
				bovo.setAtch_file_id("");
			} else {
				UUID uuid = UUID.randomUUID();
				String atch_file_id = uuid.toString() + "_" + file.getOriginalFilename();
				bovo.setAtch_file_id(atch_file_id);

				//    ε 
				file.transferTo(new File(path, atch_file_id));
			}

			int result = adminBoardService.getNoticeInsert(bovo);

			if (result > 0) {
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

	//            
	
	//               
	@GetMapping(value = "/admin_board_list", produces = "application/json")
	@ResponseBody
	public Map<String, Object> adminBoardList(@RequestParam(value = "cPage", defaultValue = "1") int cPage) {
	    Map<String, Object> result = new HashMap<>();
	    try {
	        //     Խñ       ȸ
	        int count = adminBoardService.getAdminBoardCount();
	        
	        // Paging   ü     
	        paging.setTotalRecord(count);
	        paging.setTotalPage((int) Math.ceil((double) count / paging.getNumPerPage())); //                  
	        
	        //     ¡         
	        paging.setNowPage(cPage);
	        paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));  //        ġ
	        paging.setBeginBlock(((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);  //                
	        paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);  //              

	        if (paging.getEndBlock() > paging.getTotalPage()) {
	            paging.setEndBlock(paging.getTotalPage());  //                           Ŭ                        
	        }

	        //         ε 
	        List<BoardVO> adminBoardList = adminBoardService.getAdminBoardList(paging.getOffset(), paging.getNumPerPage());
	        
	        //              
	        result.put("adminBoardList", adminBoardList);
	        result.put("paging", paging);

	    } catch (Exception e) {
	        result.put("error", " ý            ߻  ߽  ϴ .");
	        e.printStackTrace();
	    }
	    
	    return result;
	}
	
	//       Խñ 
	@GetMapping(value = "/admin_board_sleep_list", produces = "application/json")
	@ResponseBody
	public Map<String, Object> adminBoardSleepList(@RequestParam(value = "cPage", defaultValue = "1") int cPage) {
		Map<String, Object> result = new HashMap<>();
		try {
			//     Խñ       ȸ
			int count = adminBoardService.getAdminBoardSleepCount();
			
			// Paging   ü     
			paging.setTotalRecord(count);
			paging.setTotalPage((int) Math.ceil((double) count / paging.getNumPerPage())); //                  
			
			//     ¡         
			paging.setNowPage(cPage);
			paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));  //        ġ
			paging.setBeginBlock(((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);  //                
			paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);  //              
			
			if (paging.getEndBlock() > paging.getTotalPage()) {
				paging.setEndBlock(paging.getTotalPage());  //                           Ŭ                        
			}
			
			//         ε 
			List<BoardVO> adminBoardSleepList = adminBoardService.getAdminBoardSleepList(paging.getOffset(), paging.getNumPerPage());
			
			//              
			result.put("adminBoardSleepList", adminBoardSleepList);
			result.put("paging", paging);
			
		} catch (Exception e) {
			result.put("error", " ý            ߻  ߽  ϴ .");
			e.printStackTrace();
		}
		
		return result;
	}
	
	@PostMapping("/admin_board_sleep_wake")
	@ResponseBody
	public Map<String, Object> restoreBoard(@RequestBody Map<String, List<Long>> request) {
	    List<Long> wrIds = request.get("wr_id");
	    Map<String, Object> response = new HashMap<>();

	    try {
	        //      ó  :    õ   Խù      wr_active      0         
	        adminBoardService.restoreBoards(wrIds);

	        //                 Ǿ          
	        response.put("success", true);
	    } catch (Exception e) {
	        response.put("success", false);
	        e.printStackTrace(); //      ó    α 
	    }
	    return response;
	}
	
	//  Ű   Խù      
	@RequestMapping("/issue_list")
	public ModelAndView issueList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin_pages/issue");

		//     ¡    
		System.out.println("  Ʈ ѷ     Գ ?");
		int count = adminBoardService.getIssueCount();
		System.out.println("ī  Ʈ:"+ count);
		paging.setTotalRecord(count);

		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		String cPage = request.getParameter("cPage");
		System.out.println("cPage : " + cPage);
		if (cPage == null || "undefined".equals(cPage)) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		paging.setBeginBlock(
				(int) (((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1));
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		try {
			// DBó  
			List<BoardVO> issue_list = adminBoardService.getIssueList(paging.getOffset(),
					paging.getNumPerPage());
			if (issue_list != null) {

				mv.addObject("issue_list", issue_list);
				mv.addObject("paging", paging);
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
			mv.addObject("error", " ý            ߻  ߽  ϴ .");
			return mv;
		}
		mv.addObject("error", " ý            ߻  ߽  ϴ .");
		return mv;
	}

	@PostMapping("/delete_issue")
	public ModelAndView issuelistDelete(@ModelAttribute("cPage") String cPage, @ModelAttribute("wr_id") String wr_id) {
		ModelAndView mv = new ModelAndView("admin_pages/issue");
		System.out.println("delete_issue wr_id : " + wr_id);
		try {
			int result = adminBoardService.getIssueDelete(wr_id);
			System.out.println("   :"+result);
			if (result > 0) {
				mv.setViewName("redirect:/issue_list");
				System.out.println("-----------------");
				return mv;
			} else {
				mv.addObject("error", " ý            ߻  ߽  ϴ .");
				return mv;
			}

		} catch (Exception e) {
			System.out.println(e);
			mv.addObject("error", " ý            ߻  ߽  ϴ .");
			return mv;
		}

	}
	//  Ű Խù    
	
	
	
	
/*	
	@RequestMapping("/admin_board_list")
	public ModelAndView adminBoardList(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView("admin_pages/admin_board");

	    //     ¡    
	    System.out.println("  Ʈ ѷ     Գ ?");
	    int count = adminBoardService.getAdminBoardCount();
	    paging.setTotalRecord(count);

	    if (paging.getTotalRecord() <= paging.getNumPerPage()) {
	        paging.setTotalPage(1);
	    } else {
	        paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
	        if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
	            paging.setTotalPage(paging.getTotalPage() + 1);
	        }
	    }

	    String cPage = request.getParameter("cPage");
	    System.out.println("cPage : " + cPage);

	    // cPage   null,       ڿ , "undefined"        ⺻  (1)       
	    if (cPage == null || cPage.trim().isEmpty() || "undefined".equals(cPage)) {
	        paging.setNowPage(1);
	    } else {
	        try {
	            // cPage      ڷ    ȯ          Ȯ  
	            paging.setNowPage(Integer.parseInt(cPage));
	        } catch (NumberFormatException e) {
	            //    ڰ   ƴ               ⺻  (1)     
	            paging.setNowPage(1);
	        }
	    }

	    paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

	    paging.setBeginBlock(
	            (int) (((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1));
	    paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

	    if (paging.getEndBlock() > paging.getTotalPage()) {
	        paging.setEndBlock(paging.getTotalPage());
	    }

	    try {
	        // DBó  
	        List<BoardVO> admin_board_list = adminBoardService.getAdminBoardList(paging.getOffset(), paging.getNumPerPage());
	        if (admin_board_list != null) {
	            mv.addObject("admin_board_list", admin_board_list);
	            mv.addObject("paging", paging);
	            return mv;
	        }
	    } catch (Exception e) {
	        System.out.println(e);
	        mv.addObject("error", " ý            ߻  ߽  ϴ .");
	        return mv;
	    }
	    mv.addObject("error", " ý            ߻  ߽  ϴ .");
	    return mv;
	}
*/	
	
	
	//             
}
