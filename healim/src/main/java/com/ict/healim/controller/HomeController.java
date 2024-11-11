package com.ict.healim.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.healim.service.AdminService;
import com.ict.healim.service.HomeService;
import com.ict.healim.service.HospitalService;
import com.ict.healim.service.JoinService;
import com.ict.healim.service.MainBoardService;
import com.ict.healim.service.PopupService;
import com.ict.healim.service.RecentlyViewService;
import com.ict.healim.service.SearchLocationService;
import com.ict.healim.vo.AdminVO;
import com.ict.healim.vo.HospitalVO;
import com.ict.healim.vo.MainBoardVO;
import com.ict.healim.vo.MapSearchVO;
import com.ict.healim.vo.Paging;
import com.ict.healim.vo.PopupVO;
import com.ict.healim.vo.SessionUserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private PopupService popupService;
	@Autowired
	private SearchLocationService searchLocationService;
	@Autowired
	private Paging paging;
	@Autowired
	private HospitalService hospitalService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private MainBoardService mainBoardService;
	@Autowired
	private RecentlyViewService recentlyViewService;
	@Autowired
	private HomeService homeService;
	@Autowired
	private JoinService joinService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("home");
		return mv;
	}

	@RequestMapping("/admin_index")
	public ModelAndView click() {
		ModelAndView mv = new ModelAndView("admin_pages/index");

		return mv;
	}

	@RequestMapping("/join")
	public ModelAndView join() {
		ModelAndView mv = new ModelAndView("login&join/join");

		return mv;
	}

	@RequestMapping("/hospitalDetail")
	public ModelAndView hospital(@RequestParam("h_id") String h_id, @ModelAttribute("cPage") String cPage,
			HttpSession session) {
		ModelAndView mv = new ModelAndView("hospitalClick/hospitalDetail");

		SessionUserVO svo = (SessionUserVO) session.getAttribute("sessionUser");
		if (svo.getUser_id() != null) {
			int result = recentlyViewService.insertRecentlyView(h_id, svo.getUser_id());
		}

		// hit 업데이트
		int result = hospitalService.getHospitalHit(h_id);
		// 상세 보기
		HospitalVO hvo = hospitalService.getHospitalDetail(h_id);

		session.setAttribute("hvo", hvo);

		if (hvo != null) {
			mv.addObject("hvo", hvo);
			return mv;
		}

		return null;
	}

	// 시설 상세보기 찜 데이터베이스 저장
	@RequestMapping("/hospitalDetailZzim")
	public ModelAndView hospitalZzim(@RequestParam("h_id") String h_id, HttpSession session) {
		ModelAndView mv = new ModelAndView("hospitalClick/hospitalDetail");
		session.setAttribute("zh_id", h_id);
		SessionUserVO sessionUser = (SessionUserVO) session.getAttribute("sessionUser");
		String mber_id = sessionUser.getUser_id();
		try {
			int Result = hospitalService.hospitalPick(mber_id, h_id);

		} catch (DuplicateKeyException e) {
			// 중복된 항목 예외 발생 시 에러 메시지 추가
			mv.addObject("errorMessage", "이미 찜한 항목입니다.");

		} catch (Exception e) {
			System.out.println(e);
			// 기타 예외 처리 시 기본 에러 메시지 추가
			mv.addObject("errorMessage", "예기치 않은 오류가 발생했습니다.");
		}
		// 상세 보기
		HospitalVO hvo = hospitalService.getHospitalDetail(h_id);

		session.setAttribute("hvo", hvo);

		if (hvo != null) {
			mv.addObject("hvo", hvo);
			return mv;
		}

		return null;
	}

	@RequestMapping("/hospitalIntro")
	public ModelAndView hospitalIntro(HttpSession session) {
		ModelAndView mv = new ModelAndView("hospitalClick/hospitalIntro");
		HospitalVO hvo = (HospitalVO) session.getAttribute("hvo");
		System.out.println();
		int result = hospitalService.getPickCount(hvo);
		mv.addObject("pick_count", result);
		mv.addObject("hvo", hvo);
		return mv; // 蹂묒? 긽 꽭 럹 씠吏
	}

	@RequestMapping("/hospitalGuide")
	public ModelAndView hospitalGuide(Model model) {
		ModelAndView mv = new ModelAndView("hospitalClick/hospitalGuide");

		return mv; // 蹂묒?�� �긽�꽭 �럹�씠吏�
	}

	@RequestMapping("/honey1")
	public ModelAndView honey1() {
		ModelAndView mv = new ModelAndView("honey/honey1");

		return mv;
	}

	@RequestMapping("/honey2")
	public ModelAndView honey2() {
		ModelAndView mv = new ModelAndView("honey/honey2");

		return mv;
	}

	@RequestMapping("/honey3")
	public ModelAndView honey3() {
		ModelAndView mv = new ModelAndView("honey/honey3");

		return mv;
	}

	@RequestMapping("/zzim")
	public ModelAndView zzim(HttpSession session) {
		ModelAndView mv = new ModelAndView("myPage/zzim");
		SessionUserVO sessionUser = (SessionUserVO) session.getAttribute("sessionUser");
		String mber_id = sessionUser.getUser_id();
		List<HospitalVO> list = joinService.getHospitalPick(mber_id);
		List<HospitalVO> list2 = joinService.getNHPick(mber_id);

		mv.addObject("pickList", list);
		mv.addObject("nPickList", list2);
		return mv;
	}

	@RequestMapping("/recent")
	public ModelAndView recent() {
		ModelAndView mv = new ModelAndView("myPage/recent");

		return mv;
	}

	@RequestMapping("/inq")
	public ModelAndView inq(HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("myPage/inq");
		SessionUserVO svo = (SessionUserVO) session.getAttribute("sessionUser");
		String user_id = svo.getUser_id();
		List<MainBoardVO> list = null;

		int countTotal = mainBoardService.getCountCons(user_id);
		paging.setTotalRecord(countTotal);
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		String cPage = request.getParameter("cPage");

		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}
		System.out.println("paging.getNowPage() : " + paging.getNowPage());
		System.out.println("cPage : " + cPage);
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		paging.setBeginBlock(
				(int) (((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1));
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		List<MainBoardVO> mvo_list = mainBoardService.getConsList(user_id, paging.getOffset(), paging.getNumPerPage());

		// end

		mv.addObject("mvo_list", mvo_list);
		mv.addObject("cPage", cPage);
		mv.addObject("paging", paging);
		return mv;
	}

	@RequestMapping("/myPost")
	public ModelAndView myPost(HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("myPage/myPost");
		SessionUserVO svo = (SessionUserVO) session.getAttribute("sessionUser");
		String user_id = svo.getUser_id();

		// start
		List<MainBoardVO> list = null;

		int countTotal = mainBoardService.getCountAll(user_id);
		paging.setTotalRecord(countTotal);
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		String cPage = request.getParameter("cPage");

		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}
		System.out.println("paging.getNowPage() : " + paging.getNowPage());
		System.out.println("cPage : " + cPage);
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		paging.setBeginBlock(
				(int) (((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1));
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		List<MainBoardVO> mvo_list = mainBoardService.getAllList(user_id, paging.getOffset(), paging.getNumPerPage());

		// end

		mv.addObject("mvo_list", mvo_list);
		mv.addObject("cPage", cPage);
		mv.addObject("paging", paging);
		return mv;
	}

	@RequestMapping("/region_select")
	public ModelAndView region_select() {
		ModelAndView mv = new ModelAndView("region/region_select");
		List<String> list = hospitalService.getHospitalLocationList();
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping("/hospitalList")
	public ModelAndView recommend(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("hospitalList");
		List<HospitalVO> hospitalList = null;
		String facility2 = request.getParameter("facility2");
		System.out.println("facility2" + facility2);
		if (facility2 == null) {
			facility2 = "H2";
		}

		int countTotal = hospitalService.getHospitalCount2(facility2);

		paging.setTotalRecord(countTotal);
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		String cPage = request.getParameter("cPage");

		if (cPage == null) {
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
		if (facility2.equals("N2")) {
			hospitalList = hospitalService.getNursingHomes(paging.getOffset(), paging.getNumPerPage());
		} else {
			hospitalList = hospitalService.getHospitals(paging.getOffset(), paging.getNumPerPage());
		}

		mv.addObject("facility2", facility2);
		mv.addObject("hospitalList", hospitalList);
		mv.addObject("paging", paging);
		return mv;
	}

	@RequestMapping("/region_selected")
	public ModelAndView region_selected(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("region/region_selected");
		List<HospitalVO> list3 = null;
		String facilityType = request.getParameter("facilityType");
		System.out.println("facilityType"+facilityType);
		if (facilityType == null) {
			facilityType = "H";
		}
		System.out.println("facilityType"+facilityType);
		int countTotal = hospitalService.getHospitalCount(facilityType);

		paging.setTotalRecord(countTotal);
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		String cPage = request.getParameter("cPage");

		if (cPage == null) {
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

		if (facilityType.equals("H")) {
			list3 = hospitalService.getHospitalList(paging.getOffset(), paging.getNumPerPage());
		} else {
			list3 = hospitalService.getNursingList(paging.getOffset(), paging.getNumPerPage());
		}

		mv.addObject("list3", list3);
		mv.addObject("facilityType", facilityType);
		mv.addObject("paging", paging);

		return mv;
	}

	@RequestMapping("/map")
	public ModelAndView map(MapSearchVO msvo) {
		ModelAndView mv = new ModelAndView("region/map");

		System.out.println("city : " + msvo.getCity());
		System.out.println("keyword : " + msvo.getKeyword());

		int result = homeService.getMapQueryCount(msvo);

		if (result == 0) {
			mv.addObject("message","해당하는 요양기관이 없습니다." );
			mv.setViewName("home");
			return mv;

		} else {

			System.out.println("QueryCount :" + result);

			List<HospitalVO> h_list = homeService.getMapQueryResult(msvo);

			//System.out.println(hid_list.toString());
			mv.addObject("h_list",h_list);
			return mv;

		}

	}


	@RequestMapping("/introduce")
	public ModelAndView introduce() {
		ModelAndView mv = new ModelAndView("footer/introduce");

		return mv;
	}

	@RequestMapping("/termsOfService")
	public ModelAndView termsOfService() {
		ModelAndView mv = new ModelAndView("footer/termsOfService");

		return mv;
	}

	@RequestMapping("/privacyPolicy")
	public ModelAndView privacyPolicy() {
		ModelAndView mv = new ModelAndView("footer/privacyPolicy");
		return mv;
	}

	@RequestMapping("/locationPolicy")
	public ModelAndView locationPolicy() {
		ModelAndView mv = new ModelAndView("footer/locationPolicy");

		return mv;
	}

	@RequestMapping("/search_location")
	public ModelAndView searchByLocation(@RequestParam("district") List<String> district_list,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("region/search_by_location");

		String facilityType = request.getParameter("facilityType");
		if (facilityType == null) {
			facilityType = "A";
		}

		int countTotal = searchLocationService.getHospitalCount(district_list, facilityType);
		paging.setTotalRecord(countTotal);

		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		String cPage = request.getParameter("cPage");

		if (cPage == null) {
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

		List<HospitalVO> hospital_list = searchLocationService.getHospitalList(district_list, paging.getOffset(),
				paging.getNumPerPage(), facilityType);// (지역 리스트,offset,limit,"N" or "H")
		mv.addObject("facilityType", facilityType);
		mv.addObject("hospital_list", hospital_list);
		mv.addObject("paging", paging);

		return mv;
	}

// ********************* �?리자 ?��?��?���? �??�� 컨트롤러 **********************************

	@GetMapping("/announcement")
	public ModelAndView directToAnnouncement() {
		return new ModelAndView("admin_pages/announcement");
	}

	@GetMapping("/member")
	public ModelAndView directToMember() {
		return new ModelAndView("admin_pages/member");
	}

	@GetMapping("/popup")
	public ModelAndView directToPopup() {
		return new ModelAndView("admin_pages/popup");
	}

	@GetMapping("/qna")
	public ModelAndView directToQna() {
		return new ModelAndView("admin_pages/qna");
	}

	@GetMapping("/index")
	public ModelAndView directToIndex() {
		ModelAndView mv = new ModelAndView("admin_pages/index");
		List<PopupVO> list = popupService.getPopupList();
		List<AdminVO> list2 = adminService.getAdminList();
		mv.addObject("list", list);
		mv.addObject("list2", list2);
		return mv;
	}

	@GetMapping("/nursing_reg")
	public ModelAndView directToNursingReg() {
		return new ModelAndView("admin_pages/nursing_reg");
	}

	@GetMapping("/admin_reg")
	public ModelAndView directToAdminReg(@RequestParam String admin_id, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin_pages/admin_reg");
		AdminVO avo = adminService.getAdminDetail(admin_id);

		String chatAuth = request.getParameter("chat_auth");
		if (chatAuth == null) {
			chatAuth = "x"; // 체크가 해제된 경우 'x'로 설정
		} else {
			chatAuth = "o"; // 체크가 된 경우 'o'
		}
		avo.setChat_auth(chatAuth);

		String popupAuth = request.getParameter("popup_auth");
		if (popupAuth == null) {
			popupAuth = "x"; // 체크가 해제된 경우 'x'로 설정
		} else {
			popupAuth = "o"; // 체크가 된 경우 'o'
		}
		avo.setPopup_auth(popupAuth);

		String boardAuth = request.getParameter("board_auth");
		if (boardAuth == null) {
			boardAuth = "x"; // 체크가 해제된 경우 'x'로 설정
		} else {
			boardAuth = "o"; // 체크가 된 경우 'o'
		}
		avo.setBoard_auth(boardAuth);

		System.out.println("avo.getBoard_auth()" + avo.getBoard_auth());
		System.out.println("avo.getPopup_auth()" + avo.getPopup_auth());
		mv.addObject("avo", avo);

		return mv;
	}

	@GetMapping("/nursing_edit")
	public ModelAndView directToNursingEdit() {
		return new ModelAndView("admin_pages/nursing_edit");
	}

	@GetMapping("/popup_edit")
	public ModelAndView directToPopupEdit(@RequestParam("pu_id") String pu_id) {
		ModelAndView mv = new ModelAndView("admin_pages/popup_edit");
		PopupVO pvo = popupService.getPopupDetail(pu_id);
		mv.addObject("pvo", pvo);
		return mv;
	}

	@GetMapping("/test")
	public ModelAndView directToTest() {
		return new ModelAndView("new_home");
	}

	@GetMapping("/popupmembership")
	public String pop() {
		return "membership/popupmembership";
	}

}
