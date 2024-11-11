package com.ict.healim.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.ict.healim.service.MainBoardService;
import com.ict.healim.vo.HospitalVO;
import com.ict.healim.vo.MainBoardPagingVO;
import com.ict.healim.vo.MainBoardVO;
import com.ict.healim.vo.MemberVO;
import com.ict.healim.vo.SearchVO;
import com.ict.healim.vo.SessionUserVO;

@Controller
public class MainBoardController {
	@Autowired
	private MainBoardService mainBoardService;
	



	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("/mainBoard")
	public ModelAndView mainBoard(Model model,SearchVO scvo) {
		ModelAndView mv = new ModelAndView("mainBoard/mainBoard");
		
		int limit = 10;
		
		
		
		scvo.setBbs_id("NOTI");
		List<MainBoardVO> list1 = mainBoardService.getBbsList(scvo, limit);
		scvo.setBbs_id("INQU");
		List<MainBoardVO> list2 = mainBoardService.getBbsList(scvo, limit);
		scvo.setBbs_id("CONS");
		List<MainBoardVO> list3 = mainBoardService.getBbsList(scvo, limit);
		scvo.setBbs_id("FREE");	
		List<MainBoardVO> list4 = mainBoardService.getBbsList(scvo, limit);

		mv.addObject("list1", list1);
		mv.addObject("list2", list2);
		mv.addObject("list3", list3);
		mv.addObject("list4", list4);

		return mv;
	}

	@RequestMapping("/boardListAll")
	public ModelAndView getBoardList(@RequestParam("bbs_id") String bbs_id, SearchVO sc) {
		ModelAndView mv = new ModelAndView("mainBoard/boardListAll");
		String bbsName = mainBoardService.getBbsName(bbs_id);
		
		sc.setBbs_id(bbs_id);
		
		//�럹�씠吏� �슜 �쟾泥� 寃뚯떆臾� 媛��닔 援ы븯湲�(�솢�꽦�솕, �뙎湲� x , �떟湲��룷�븿)
		int totalCnt = mainBoardService.getCountWrList(sc);
		//�샊�떆紐⑤Ⅴ�땲 totalcnt �꽔�뼱�몢湲�(寃��깋 珥� 紐� 嫄� �슜..?)
		mv.addObject("totalCnt", totalCnt);
		
		MainBoardPagingVO pgvo = new MainBoardPagingVO(totalCnt,sc);
		List<MainBoardVO> list = mainBoardService.getBbsList(sc, null);
		System.out.println("sc �럹�씠吏��궗�씠利� : "+sc.getPageSize());
		System.out.println("sc �샃�뀑 : "+sc.getOffset());
		System.out.println("sc �궎�썙�뱶 : "+sc.getKeyword());
			
		
		mv.addObject("pg", pgvo);
		mv.addObject("sc", sc);
		mv.addObject("list", list);
		mv.addObject("bbsName", bbsName);
		mv.addObject("bbs_id", bbs_id);
		System.out.println("boardListAll bbsid �솗�씤" + bbs_id);

		return mv;
	}

	@RequestMapping("/boardOneList")
	public ModelAndView boardOneList(HttpServletRequest request,HttpSession session) {
		String wr_id = request.getParameter("wr_id"); //�뙎湲�湲곗��뿉�꽌�뒗 parentid
		String bbs_id = request.getParameter("bbs_id");

		ModelAndView mv = new ModelAndView("mainBoard/boardOneList");
		
		//議고쉶�닔 利앷��떆�궎湲�
		 mainBoardService.updateViewNum(wr_id);
		

		System.out.println("wrid,bbsid �솗�씤(boardOneList) :" + wr_id + "," + bbs_id);
		
		try {
			//�꽭�뀡 vo �궗�슜�븯湲� ( 湲��궘�젣,�닔�젙踰꾪듉 �벑 �슜�룄)
			SessionUserVO suvo = (SessionUserVO) session.getAttribute("sessionUser");
			String sessionUserId = (suvo != null) ? suvo.getUser_id() : null;
			
			String mber_nm = null;
			 if (sessionUserId != null) {
		            // �꽭�뀡 ID瑜� �씠�슜�빐 �궗�슜�옄 �젙蹂대�� 媛��졇�샂 (�뙎湲��슜 �땳�꽕�엫 �벑)
					//�꽭�뀡�븘�씠�뵒濡� �꽭�뀡 �땳�꽕�엫 二쇨린 ( �뙎湲��슜)
		            MemberVO mbvo = mainBoardService.getUserInfo(sessionUserId);
		    		/* String password = mbvo.getPassword(); */
		        	mber_nm = mbvo.getMber_nm();
		        } else {
		            System.out.println("濡쒓렇�씤 �젙蹂닿� �뾾�뒿�땲�떎.");
		        }
			
	
	
		
		 	// �긽�꽭蹂닿린
				MainBoardVO mvo = mainBoardService.getWrList(wr_id, bbs_id);
				//�뙎湲��룄 遺덈윭�삤湲�
				List<MainBoardVO> list = mainBoardService.getCommList(wr_id); //�썝湲� wr_id瑜�  parent_id濡� 媛뽯뒗 '�뙎湲�' 寃��깋.
				
				mv.addObject("list", list);

				mv.addObject("mvo", mvo);
				mv.addObject("sessionUserId", sessionUserId);
				mv.addObject("mber_nm", mber_nm);

				return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("mainBoard/boardError");
		
	}

	@RequestMapping("/boardOneListWrite")
	public ModelAndView boardOneListWrite(@RequestParam("bbs_id") String bbs_id,HttpSession session) {
		ModelAndView mv = new ModelAndView("mainBoard/writePage");
		
		//�꽭�뀡 vo �궗�슜�븯湲� ( 湲��궘�젣,�닔�젙踰꾪듉 �벑 �슜�룄)
		SessionUserVO suvo = (SessionUserVO) session.getAttribute("sessionUser");
		String sessionUserId = (suvo != null) ? suvo.getUser_id() : null;
		
		
		mv.addObject("bbs_id", bbs_id);
		mv.addObject("sessionUserId", sessionUserId);
		
		if (sessionUserId == null) {
			return new ModelAndView("login&join/login");
		}
		
		System.out.println("/boardOneListWrite�뿉�꽌 bbs_id �쟾�떖�맖: " + bbs_id);
		return mv;
		
		
	
		
	}

	@RequestMapping("/boardOneListWriteOK")
	public ModelAndView boardOneListWriteOK(MainBoardVO mvo, HttpServletRequest request) {
		String bbs_id = request.getParameter("bbs_id");
		String mber_id = request.getParameter("mber_id");
		String parent_id = request.getParameter("parent_id");
		String sort_ordr = request.getParameter("sort_ordr");
		//蹂묒썝�씠由� 寃��깋�븳嫄곕줈 蹂묒썝 id 寃��깋�븯湲�
		 String h_name = request.getParameter("h_name");
		    Integer h_id = null;

		    
		    
		
		    try {
		        h_id = mainBoardService.getH_Id(h_name);
		    } catch (Exception e) {
		        System.out.println("Error fetching h_id for h_name: " + e.getMessage());
		    }
		    
		    // h_id媛� null�씠嫄곕굹 0�씪 寃쎌슦 湲곕낯媛� �꽕�젙
		    mvo.setH_id(h_id != null && h_id != 0 ? h_id : 0); 
		
		try {
			ModelAndView mv = new ModelAndView("redirect:/boardListAll");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			

			
			
			
			
			MultipartFile file = mvo.getFile_name();
			if (file.isEmpty()) {
				mvo.setAtch_file_id("");
			} else {
				UUID uuid = UUID.randomUUID();
				String atch_file_id = uuid.toString() + "_" + file.getOriginalFilename();
				mvo.setAtch_file_id(atch_file_id);

				// �뾽濡쒕뱶
				file.transferTo(new File(path,atch_file_id));
			}

			System.out.println("writeOK�쟾�슜泥댄겕"+bbs_id+parent_id+sort_ordr);
			mv.addObject("bbs_id", bbs_id);  //由щ떎�씠�젆�듃�슜
			mv.addObject("parent_id", parent_id); //由щ떎�씠�젆�듃�슜
			
			//mber_id濡�  �뙣�뒪�썙�뱶, 鍮꾨쾲 �뵲�궡湲�.
			MemberVO mbvo = mainBoardService.getUserInfo(mber_id);
			
			String password = mbvo.getPassword();
			String mber_nm = mbvo.getMber_nm();
			
			mvo.setMber_nm(mber_nm);
			mvo.setPassword(password);
			
		
			
			int result = mainBoardService.setBoardVO(mvo);
			if (result > 0) {
			

				return mv;
			}

			return new ModelAndView("mainboard/boardError");
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("mainboard/boardError");
		}
	}

	// �씠誘몄����옣 �벑
	@RequestMapping(value = "/boardSaveImg", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> saveImg(@RequestParam("s_file") MultipartFile file, HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			String fname = null;
			if (file.getSize() > 0) {
				String path = request.getSession().getServletContext().getRealPath("/resources/upload");
				UUID uuid = UUID.randomUUID();
				fname = uuid.toString() + "_" + file.getOriginalFilename();
				// �뾽濡쒕뱶
				file.transferTo(new File(path, fname));
			}

			map.put("path", "resources/upload");
			map.put("fname", fname);
			return map;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	@GetMapping("/boardDownloadFile")
	public void fileDown(HttpServletRequest request, HttpServletResponse response) {
		try {
			String f_name = request.getParameter("atch_file_id");
			System.out.println(f_name);
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/" + f_name);
			String r_path = URLEncoder.encode(path, "UTF-8");

			String tname = f_name.substring(f_name.indexOf("_") + 1, f_name.length());
			// 釉뚮씪�슦�� �꽕�젙
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename=" + tname);

			// �떎�젣 媛��졇�삤湲�
			File file = new File(new String(path.getBytes(), "UTF-8"));
			FileInputStream in = new FileInputStream(file);
			OutputStream out = response.getOutputStream();

			FileCopyUtils.copy(in, out);

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	// �뾽�뜲�씠�듃�럹�씠吏� �씠�룞
	@RequestMapping("/boardOneListUpdate")
	public ModelAndView boardOneListUpdate(@ModelAttribute("wr_id") String wr_id,
			@ModelAttribute("bbs_id") String bbs_id) {
		ModelAndView mv = new ModelAndView("mainBoard/updatePage");
		// DB �뿉�꽌 b_idx瑜� �씠�슜�빐�꽌 �젙蹂� 媛��졇�삤湲�. �쟾�뿉 留뚮뱾�뿀�뜕 getWr 洹몃�濡� �궗�슜. �떎�젣 �닔�젙�� UpdateOK�뿉�꽌 吏꾪뻾
		MainBoardVO mvo = mainBoardService.getWrList(wr_id, bbs_id);
		if (mvo != null) {
			mv.addObject("mvo", mvo);
			System.out.println("wrid �솗�씤 : " + wr_id);
			System.out.println("bbsid �솗�씤 :" + bbs_id);
			return mv;
		}

		return null;
	}

	// �떎�젣 �뾽�뜲�씠�듃 �븯�뒗 怨�
	@PostMapping("/boardOneListUpdateOK")
	public ModelAndView boardOneListUpdateOK(MainBoardVO mvo, HttpServletRequest request) {
		String bbs_id = request.getParameter("bbs_id");
		String wr_id = request.getParameter("wr_id");
		ModelAndView mv = new ModelAndView("redirect:/boardOneList");

		
		
		
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = mvo.getFile_name();
			String old_atch_file = mvo.getOld_atch_file_id();

			if (file.isEmpty()) {
				mvo.setAtch_file_id(old_atch_file);
			} else {
				UUID uuid = UUID.randomUUID();
				String atch_file_id = uuid.toString() + "_" + file.getOriginalFilename();
				mvo.setAtch_file_id(atch_file_id);

				// �떎�젣�뾽濡쒕뱶
				file.transferTo(new File(path, atch_file_id));
			}
			// 由щ떎�씠�젆�듃�슜 寃뚯떆�뙋id, 湲�id 二쇨린
			mv.addObject("bbs_id", bbs_id);
			mv.addObject("wr_id", wr_id);

			int result = mainBoardService.updateBoardVO(mvo); 
			if (result > 0) {
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		/*
		 * } else { // 鍮꾨�踰덊샇媛� ��由щ떎. mv.setViewName("bbs/update"); mv.addObject("password chk",
		 * "fail"); mv.addObject("bvo", bvo); return mv; }
		 */

		return new ModelAndView("mainBoard/error");

	}

	// �궘�젣�럹�씠吏� �씠�룞
	@RequestMapping("/boardOneListDelete")
	public ModelAndView boardOneListDelete(HttpServletRequest request) {

		String wr_id = request.getParameter("wr_id");
		String bbs_id = request.getParameter("bbs_id");

		ModelAndView mv = new ModelAndView("mainBoard/deletePage");
		MainBoardVO mvo = mainBoardService.getWrList(wr_id, bbs_id);
		mv.addObject("mvo", mvo);

		return mv;
	}

	@RequestMapping("/boardOneListDeleteOk")
	public ModelAndView boardOneListDeleteOk(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String wr_id = request.getParameter("wr_id");
		String bbs_id = request.getParameter("bbs_id");
		// �궘�젣李쎌뿉�꽌 �엯�젰�븳 鍮꾨�踰덊샇媛� 諛쏆븘�삤湲�.
		String passwordInput = request.getParameter("passwordInput");
		// 湲��젣紐�, 寃뚯떆�뙋�젣紐⑹쑝濡� 湲� 寃��깋
		MainBoardVO mvo = mainBoardService.getWrList(wr_id, bbs_id);
		// 寃뚯떆臾쇱쓽 �궗�슜�옄 �뙣�뒪�썙�뱶 DB�뿉�꽌 戮묒븘�궡�샂
		System.out.println(wr_id);
		System.out.println(bbs_id);
		String password  = mvo.getPassword();
		System.out.println(password);
		// 鍮꾨�踰덊샇 泥댄겕
		 if (passwordEncoder.matches(passwordInput,password )) {
	            // 맞으면 삭제 진행.
	            int result = mainBoardService.deleteBoardVO(mvo);
	            if (result > 0) {
	                mv.setViewName("redirect:/boardListAll");
	                mv.addObject("bbs_id",bbs_id);
	                return mv;
	            }
	        } else {
	            // 비밀번호가 틀리다.
	            mv.setViewName("mainBoard/deletePage");
	            mv.addObject("passwordchk", "fail");
	            mv.addObject("mvo", mvo); //재시도할떄도 password  비교해야함
	            return mv;
	        }

		return new ModelAndView("mainBoard/boardError");
	}

	
	@RequestMapping("/comment_insert")
	public ModelAndView comment_insert(MainBoardVO mvo,HttpServletRequest request, HttpSession session) {
		//由щ떎�씠�젆�듃�븷 �럹�씠吏� �슦�꽑 �젙�븿.
		ModelAndView mv = new ModelAndView("redirect:/boardOneList");
		String parent_id = request.getParameter("parent_id"); //遺�紐④��쓽 wr_id 由щ떎�씠�젆�듃�슜. �뿬湲곗꽌 wr_id= 遺�紐④� id.
		String bbs_id = request.getParameter("bbs_id"); //遺�紐④��쓽 寃뚯떆�뙋. bbs_id 由щ떎�씠�젆�듃�슜
		//�꽭�뀡�븘�씠�뵒濡� 怨꾩젙�쓽 鍮꾨�踰덊샇, �쑀���꽕�엫 �븘�슂�븿.
		String mber_id = request.getParameter("mber_id");
	
		
		
		//硫ㅻ쾭�뿉�꽌 �븘�씠�뵒濡� �쑀���꽕�엫, 鍮꾨�踰덊샇 寃��깋
		try {
			MemberVO mbvo = mainBoardService.getUserInfo(mber_id);
			
			String password = mbvo.getPassword();
			String mber_nm = mbvo.getMber_nm();
			
			System.out.println("commentinsert�뿉�꽌 redirect boardonelist �솗�씤�슜 "+parent_id+bbs_id); //由щ떎�씠�젆�듃 �솗�씤�슜
			
			//mvo�뿉  setComment瑜� �쐞�빐�꽌 �꽔�뼱�빞�븿 
			mvo.setMber_nm(mber_nm);
			mvo.setPassword(password);
			
			int result = mainBoardService.setComment(mvo); // �뙎湲��꽔湲�. 怨듯넻 紐낅졊�뼱�� 
			mv.addObject("bbs_id", bbs_id);		//由щ떎�씠�젆�듃�슜
			mv.addObject("wr_id", parent_id);	//二쇱쓽-由щ떎�씠�젆�듃�슜. parent_id�뒗 �썝湲��쓽 wr_id�떎.
		
	            return mv;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ModelAndView("login&join/login");
	
		
		
		
	
	}
	
	@RequestMapping("/comment_delete")
	public ModelAndView comment_delete(HttpServletRequest request) {

		String wr_id = request.getParameter("wr_id");
		String bbs_id = request.getParameter("bbs_id");
		String h_id = request.getParameter("h_id");


		ModelAndView mv = new ModelAndView("mainBoard/commentDeletePage");
		MainBoardVO mvo = mainBoardService.getWrList(wr_id, bbs_id);

		mv.addObject("mvo", mvo);
		mv.addObject("h_id", h_id);

		return mv;
	}
	@RequestMapping("/comment_deleteOk")
	public ModelAndView comment_deleteOk(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		//由щ럭 援щ텇 ( 由щ럭�뒗  h_id媛� �엳�쓬)
		String parent_id = request.getParameter("parent_id"); //�뙎湲��쓽 �썝寃뚯떆臾� 寃뚯떆臾쇱븘�씠�뵒
		String wr_id = request.getParameter("wr_id"); //�뙎湲� 寃뚯떆臾쇱븘�씠�뵒
		String bbs_id = request.getParameter("bbs_id"); // �뙎湲�寃뚯떆�뙋�븘�씠�뵒
		// �궘�젣李쎌뿉�꽌 �엯�젰�븳 鍮꾨�踰덊샇媛� 諛쏆븘�삤湲�.
		String passwordInput = request.getParameter("passwordInput");
		// 湲��젣紐�, 寃뚯떆�뙋�젣紐⑹쑝濡� 湲�愿��젴 mvo 寃��깋
		MainBoardVO mvo = mainBoardService.getWrList(wr_id, bbs_id); //�뙎湲��궘�젣�떆 �뙎湲�鍮꾧탳�슜�쑝濡� db 媛볥떎�샂.
		// 寃뚯떆臾쇱쓽 �궗�슜�옄 �뙣�뒪�썙�뱶 DB�뿉�꽌 戮묒븘�궡�샂
		System.out.println("�뙎湲��궘�젣�슜"+wr_id);
		System.out.println("�뙎湲��궘�젣�슜"+bbs_id);
		String password  = mvo.getPassword(); //�뙎湲�鍮꾧탳�슜 db�쓽 pw. 
		// 鍮꾨�踰덊샇 泥댄겕
		if (passwordEncoder.matches(passwordInput,password )) {
			// 留욎쑝硫� �궘�젣 吏꾪뻾.
			int result = mainBoardService.deleteBoardVO(mvo);
			if (result > 0) {
					mv.setViewName("redirect:/boardOneList");
					mv.addObject("bbs_id",bbs_id);
					mv.addObject("wr_id",parent_id);  //�궘�젣�릺�뿀�쑝硫� �썝 寃뚯떆臾쇰줈 �씠�룞�빐�빞�븿.
					return mv;
				}
			
			}
		 else {
			// 鍮꾨�踰덊샇媛� ��由щ떎.
			System.out.println("�뙎湲��궘�젣�떎�뙣�슜parent_id"+parent_id);
			System.out.println("�뙎湲��궘�젣�떎�뙣�슜wr_id"+wr_id);
			System.out.println("�뙎湲��궘�젣�떎�뙣�슜bbs_id"+bbs_id);
		
			
				mv.setViewName("mainBoard/commentDeletePage");
				mv.addObject("passwordchk", "fail");
				mv.addObject("mvo", mvo); //�옱�떆�룄�븷�뻹�룄 password  鍮꾧탳�빐�빞�븿
				return mv;
			
			
		}

		return new ModelAndView("mainBoard/boardError");
	}
	
	@RequestMapping("/boardOneListWrite2")
	public ModelAndView boardOneListWrite2(HttpServletRequest request,HttpSession session) {
		String parent_id = request.getParameter("parent_id");
		String bbs_id = request.getParameter("bbs_id");
		//�럹�씠吏�遺덈윭�삤湲� 
		ModelAndView mv = new ModelAndView("mainBoard/writePage2");
		
		//�꽭�뀡�뿉�꽌 �븘�씠�뵒寃��깋�븯怨�, ���옣�빐�빞�븿
		//�꽭�뀡 vo �궗�슜�븯湲� ( 湲��궘�젣,�닔�젙踰꾪듉 �벑 �슜�룄)
		SessionUserVO suvo = (SessionUserVO) session.getAttribute("sessionUser");
		String sessionUserId = (suvo != null) ? suvo.getUser_id() : null;
		
		// �꽭�뀡 �븘�씠�뵒媛� �뾾�쑝硫� 濡쒓렇�씤 �럹�씠吏�濡� 由щ떎�씠�젆�듃
	    if (sessionUserId == null) {
	        return new ModelAndView("login&join/login");  // 濡쒓렇�씤 �럹�씠吏� URL�뿉 留욊쾶 �닔�젙
	    }
		
		
		//�꽭�뀡�븘�씠�뵒濡� �꽭�뀡 �땳�꽕�엫 二쇨린 ( �뙎湲��슜)
		MemberVO mbvo;
		try {
			mbvo = mainBoardService.getUserInfo(sessionUserId);
			/* String password = mbvo.getPassword(); */
			String mber_nm = mbvo.getMber_nm();
			
			
			//parent_id瑜� 媛뽯뒗 湲� 寃��깋�빐�꽌 媛��옣�넂�� sortordr 寃��깋�븯湲�(�굹以묒뿉異붽��븯湲�)
			Integer maxSort_ordr= mainBoardService.getChildSelect(parent_id); //null�씠 �맆�닔�룄 �엳湲곕븣臾몄뿉 Integer �벖�떎 
			int sort_ordr = (maxSort_ordr == null ? 1 : maxSort_ordr + 1);

			
			
			
			//遺�紐④� bbs id wrid  二쇨린 ... 
			mv.addObject("sessionUserId", sessionUserId);
			mv.addObject("bbs_id", bbs_id);
			mv.addObject("parent_id", parent_id);
			mv.addObject("sort_ordr", sort_ordr);
			System.out.println("write2�쟾�슜maxSort_ordr"+maxSort_ordr);
			System.out.println("write2�쟾�슜bbsid"+bbs_id);
			System.out.println("write2�쟾�슜parent_id"+parent_id);
			System.out.println("write2�쟾�슜sort_ordr"+sort_ordr);
			
			
			//湲곗〈 �떟湲��뱾 1�뵫  update �븯湲� 
			
			
			
			
			
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return new ModelAndView("mainBoard/boardError");
	}
	//�긽�떞�궗濡�( hospital�씠湲� �븯�굹 mainboard db�씪�꽌  �뿬湲곗꽌�븯湲곕줈 �븿.  
	
	@RequestMapping("/hospitalConsult")
	public ModelAndView hospitalConsult(Model model, HttpSession session) {
	    ModelAndView mv = new ModelAndView("hospitalClick/hospitalConsult");
	    HospitalVO hvo = (HospitalVO) session.getAttribute("hvo");

	        String h_id = hvo.getH_id();
	        

	        // 蹂묒썝�븘�씠�뵒濡� 寃뚯떆臾� 由ъ뒪�듃 寃��깋
	        int totalCount = mainBoardService.getCheckConsultReple(h_id);
	        	System.out.println("�넗�깉移댁슫�듃"+totalCount);
	        if (totalCount != 0) {
	            List<MainBoardVO> list = mainBoardService.getHospitalConsult(h_id);
	            System.out.println("�떆�뒪�븘�썐 由ъ뒪�듃 " + list);
	            LocalDate now = LocalDate.now();  // �쁽�옱 �궇吏쒕�� LocalDate濡� �꽕�젙
	            long daysDifference;
	            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	            for (MainBoardVO k : list) {
	                // wr_id瑜� parent id濡� 媛뽯뒗 寃뚯떆臾쇱씠 �엳�뒗吏� 寃��깋
	                int childCount = mainBoardService.getCountHospitalConsultReple(k.getWr_id());
	                k.setChildCount(childCount);

	                // start_dt瑜� LocalDate濡� 蹂��솚
	                LocalDate startDate = LocalDate.parse(k.getStart_dt(), formatter);

	                // start_dt�� �쁽�옱 �궇吏�(now)�쓽 �씪�옄 李⑥씠瑜� 怨꾩궛
	                daysDifference = ChronoUnit.DAYS.between(startDate, now);
	                k.setDaysDifference(daysDifference);
	            }

	            mv.addObject("list", list);
	            return mv;
	        }
	    

	    return mv;
	}
	//�긽�떞�궗濡��뵒�뀒�씪
			@RequestMapping("/hospitalConsultDetail")
			public ModelAndView hospitalConsultDetail(Model model, HttpSession session,String wr_id) {
			    ModelAndView mv = new ModelAndView("hospitalClick/hospitalConsultDetail");
			    HospitalVO hvo = (HospitalVO) session.getAttribute("hvo");
			    
		        String h_id = hvo.getH_id();
		        //�긽�떞�궗濡�媛� �엳�뒗寃쎌슦�뿉留� �씠 �꺆�씠 蹂댁씠誘�濡�  �삁�쇅泥섎━ �깮�왂.
		        //�슦�꽑 hid瑜� �넻�븳 湲� �쟾泥� �떎 媛��졇�샂. (�떟湲�, �썝湲��룷�븿) �썝湲� �젣�쇅 �븘�슂�븿. �긽�떞�궗濡��땲源� 寃뚯떆�뙋�븘�씠�뵒 CONS 怨좎젙
		        MainBoardVO mvo = mainBoardService.getWrList(wr_id, "CONS");
		        
		        mv.addObject("mvo", mvo);
			    
			    return mv;
			}
			
			
	//�썑湲� 
	@RequestMapping("/hospitalReview")
	public ModelAndView hospitalReview(Model model, HttpSession session,String wr_id) {
		ModelAndView mv = new ModelAndView("hospitalClick/hospitalReview");
		
		HospitalVO hvo = (HospitalVO) session.getAttribute("hvo");
		
		String h_id = hvo.getH_id();
			
		  // 蹂묒썝�븘�씠�뵒濡� 寃뚯떆臾�(由щ럭) 由ъ뒪�듃 寃��깋
        	 try {
        		 List<MainBoardVO> list = mainBoardService.getReview(h_id);
  	            LocalDate now = LocalDate.now();  // �쁽�옱 �궇吏쒕�� LocalDate濡� �꽕�젙
  	            long daysDifference;
  	            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

  	            for (MainBoardVO k : list) {

  	                // start_dt瑜� LocalDate濡� 蹂��솚
  	                LocalDate startDate = LocalDate.parse(k.getStart_dt(), formatter);

  	                // start_dt�� �쁽�옱 �궇吏�(now)�쓽 �씪�옄 李⑥씠瑜� 怨꾩궛
  	                daysDifference = ChronoUnit.DAYS.between(startDate, now);
  	                k.setDaysDifference(daysDifference);
  	            }
  	            
  	          //�꽭�뀡 vo �궗�슜�븯湲� ( 湲��궘�젣,�닔�젙踰꾪듉 �벑 �슜�룄) 
  	  	  		SessionUserVO suvo = (SessionUserVO) session.getAttribute("sessionUser");
  	  	  		String sessionUserId = (suvo != null) ? suvo.getUser_id() : null;
  	  	  		//�쑀���땳�꽕�엫 以�鍮� 
  	  	  		MemberVO mbvo = mainBoardService.getUserInfo(sessionUserId);
  	  	  		String h_name = hvo.getH_name();
  	  	  		
  	  	  		mv.addObject("list", list);  //蹂묒썝�뿉 ���븳 由щ럭由ъ뒪�듃.  議고쉶�슜 由ъ뒪�듃�뒗 var k�뜥�빞�븿~~ 
  	  	  		mv.addObject("hvo", hvo); // 蹂묒썝�븘�씠�뵒 . 由щ럭議고쉶�슜, 由щ럭 �벝�뻹�슜
  	  	  		mv.addObject("mbvo", mbvo); //硫ㅻ쾭�젙蹂�. 由щ럭 �벝�뻹 �슜
  	  	  		
  	  	  		if (sessionUserId == null) {
  	  	  			return new ModelAndView("login&join/login");
  	  	  		}
  	  	  		
  	  	  	
  	        
  	            return mv;
 
			} catch (Exception e) {
				// TODO: handle exception
			}
 	           
	
		return null; 
	}
	@RequestMapping("/reviewWrite")
	public ModelAndView reviewWrite(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/hospitalDetail");
		String bbs_id = request.getParameter("bbs_id");
		int h_id = Integer.valueOf(request.getParameter("h_id"));
		String sort_ordr = request.getParameter("sort_ordr");
		String mber_id = request.getParameter("mber_id");
		String mber_nm = request.getParameter("mber_nm");
		String password = request.getParameter("password");
		String wr_content = request.getParameter("wr_content");
		String h_score = request.getParameter("h_score");
		
		MainBoardVO mvo = new MainBoardVO();
		mvo.setBbs_id(bbs_id);
		mvo.setH_id(h_id);
		mvo.setWr_content(wr_content);
		mvo.setSort_ordr(sort_ordr);
		mvo.setMber_id(mber_id);
		mvo.setMber_nm(mber_nm);
		mvo.setPassword(password);
		mvo.setH_score(h_score);
		
		mainBoardService.setBoardVO(mvo);
		
		
		
		mv.addObject("h_id", h_id);
		
		return mv;
		
	}
	

	@RequestMapping("/reviewDelete")
	public ModelAndView reviewDelete(HttpServletRequest request) {

		String wr_id = request.getParameter("wr_id");
		String bbs_id = request.getParameter("bbs_id");
		String h_id = request.getParameter("h_id");


		ModelAndView mv = new ModelAndView("mainBoard/reviewDeletePage");
		MainBoardVO mvo = mainBoardService.getWrList(wr_id, bbs_id);

		mv.addObject("mvo", mvo);
		mv.addObject("h_id", h_id);

		return mv;
	}
	@RequestMapping("/reviewDeleteOk")
	public ModelAndView reviewDeleteOk(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		//由щ럭 援щ텇 ( 由щ럭�뒗  h_id媛� �엳�쓬)
		String h_id = request.getParameter("h_id");
		String parent_id = request.getParameter("parent_id"); //�뙎湲��쓽 �썝寃뚯떆臾� 寃뚯떆臾쇱븘�씠�뵒
		String wr_id = request.getParameter("wr_id"); //�뙎湲� 寃뚯떆臾쇱븘�씠�뵒
		String bbs_id = request.getParameter("bbs_id"); // �뙎湲�寃뚯떆�뙋�븘�씠�뵒
		// �궘�젣李쎌뿉�꽌 �엯�젰�븳 鍮꾨�踰덊샇媛� 諛쏆븘�삤湲�.
		String passwordInput = request.getParameter("passwordInput");
		// 湲��젣紐�, 寃뚯떆�뙋�젣紐⑹쑝濡� 湲�愿��젴 mvo 寃��깋
		MainBoardVO mvo = mainBoardService.getWrList(wr_id, bbs_id); //�뙎湲��궘�젣�떆 �뙎湲�鍮꾧탳�슜�쑝濡� db 媛볥떎�샂.
		// 寃뚯떆臾쇱쓽 �궗�슜�옄 �뙣�뒪�썙�뱶 DB�뿉�꽌 戮묒븘�궡�샂
		System.out.println("�뙎湲��궘�젣�슜"+wr_id);
		System.out.println("�뙎湲��궘�젣�슜"+bbs_id);
		String password  = mvo.getPassword(); //�뙎湲�鍮꾧탳�슜 db�쓽 pw. 
		// 鍮꾨�踰덊샇 泥댄겕
		if (passwordEncoder.matches(passwordInput,password )) {
			// 留욎쑝硫� �궘�젣 吏꾪뻾.
			int result = mainBoardService.deleteBoardVO(mvo);
			if (result > 0) {
					mv.setViewName("redirect:/hospitalDetail?h_id="+h_id);
					mv.addObject("bbs_id",bbs_id);
					mv.addObject("wr_id",parent_id);  //�궘�젣�릺�뿀�쑝硫� �썝 寃뚯떆臾쇰줈 �씠�룞�빐�빞�븿.
					return mv;
				}
			
			}
		 else {
			// 鍮꾨�踰덊샇媛� ��由щ떎.
			System.out.println("由щ럭�궘�젣�떎�뙣�슜parent_id"+parent_id);
			System.out.println("由щ럭�궘�젣�떎�뙣�슜wr_id"+wr_id);
			System.out.println("由щ럭�궘�젣�떎�뙣�슜bbs_id"+bbs_id);
		
			
				mv.setViewName("mainBoard/reviewDeletePage");
				mv.addObject("passwordchk", "fail");
				mv.addObject("mvo", mvo); //�옱�떆�룄�븷�뻹�룄 password  鍮꾧탳�빐�빞�븿
				mv.addObject("h_id", h_id); //�옱�떆�룄�븷�뻹�룄 h_id �엳�뼱�빞�븿
				return mv;
			
			
		}

		return new ModelAndView("mainBoard/boardError");
	}

	
	@RequestMapping("/boardOneListIssue")
	public ModelAndView boardOneListIssue(HttpServletRequest request) {

		String wr_id = request.getParameter("wr_id");
		String bbs_id = request.getParameter("bbs_id");
		String sessionUserId = request.getParameter("sessionUserId");


		ModelAndView mv = new ModelAndView("mainBoard/boardOneListIssue");
		MainBoardVO mvo = mainBoardService.getWrList(wr_id, bbs_id);

		mv.addObject("mvo", mvo);
		mv.addObject("sessionUserId", sessionUserId);
		

		return mv;
	}
	@RequestMapping("/boardOneListIssueOk")
	public ModelAndView boardOneListIssueOk(HttpServletRequest request) {

		String wr_id = request.getParameter("wr_id");
		String bbs_id = request.getParameter("bbs_id");
		//占쏙옙占쏙옙占싶곤옙 占쌓댐옙占� 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占실몌옙占쏙옙占쌔쇽옙...
		String issue_people = request.getParameter("sessionUserId");
		String issue_option = request.getParameter("issue_option");
		String issue_post = request.getParameter("issue_post");


		ModelAndView mv = new ModelAndView("redirect:/boardOneList");
		
		//�떊怨좊맂 寃뚯떆臾� �븣�븘�삤湲� 
		MainBoardVO mvo = mainBoardService.getWrList(wr_id, bbs_id);
		//�떊怨좊맂 寃뚯떆臾쇱뿉 �젙蹂� 異붽��븯湲� 
		mvo.setIssue_people(issue_people);
		mvo.setIssue_option(issue_option);
		mvo.setIssue_post(issue_post);
		
		int result = mainBoardService.updateBoardVO(mvo); 
		if (result > 0) {
			mv.addObject("bbs_id",bbs_id);
			mv.addObject("wr_id",wr_id);
			return mv;
		}
		mv.addObject("bbs_id",bbs_id);
		mv.addObject("wr_id",wr_id);
		

		
		return mv;
	}
	

	
}