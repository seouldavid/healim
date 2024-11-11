package com.ict.healim.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ict.healim.service.MemberAuthService;
import com.ict.healim.vo.MemberVO;

@RestController
public class MemberAuthController {

	@Autowired
	private MemberAuthService memberAuthService;

	@RequestMapping(value = "/member_auth_list", produces = "application/xml; charset=UTF-8")
	@ResponseBody
	public String getMemberAuthList() {
		try {

			List<MemberVO> list = memberAuthService.getMemberAuthList();

			if (list != null) {
				StringBuffer sb = new StringBuffer();
				sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
				sb.append("<members>");
				for (MemberVO k : list) {
					sb.append("<member>");
					sb.append("<mber_id>" + k.getMber_id() + "</mber_id>");
					sb.append("<phone_chk>" + k.getPhone_chk() + "</phone_chk>");
					sb.append("<post_cnt>" + k.getPost_cnt() + "</post_cnt>");
					sb.append("<violation_count>" + k.getViolation_count() + "</violation_count>");
					sb.append("<email_status>" + k.getEmail_status() + "</email_status>");
					sb.append("<mber_status>" + k.getMber_status() + "</mber_status>");
					sb.append("<mbtlnum>" + k.getMbtlnum() + "</mbtlnum>");
					sb.append("<login_dt>" + k.getLogin_dt() + "</login_dt>");
					sb.append("<mber_nm>" + k.getMber_nm() + "</mber_nm>");
					sb.append("<reply_cnt>" + k.getReply_cnt() + "</reply_cnt>");
					sb.append("<adv_status>" + k.getAdv_status() + "</adv_status>");
					sb.append("<mber_auth>" + k.getMber_auth() + "</mber_auth>");
					sb.append("<sbscrb_de>" + k.getSbscrb_de() + "</sbscrb_de>");
					sb.append("<active>" + k.getActive() + "</active>");
					sb.append("</member>");
				}
				sb.append("</members>");
				
				
				System.out.println("sb : " + sb.toString());
				
				return sb.toString();
				
			}
			
			return "<error>데이터를 가져오는 데 실패했습니다.</error>";

		} catch (Exception e) {
			System.out.println(e);
			return "<error>데이터를 가져오는 데 실패했습니다.</error>";
		}
	}
	
	@RequestMapping(value = "/member_delete", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String getAjaxMemberDelete(@RequestParam("mber_id") String mber_id) {
		// String mber_id = request.getParameter("mber_id"); => @RequestParam("mber_id") String mber_id
		try {
			String result = memberAuthService.getMemberAuthDelete(mber_id);
			return result ;
			
		} catch (Exception e) {
			System.out.println(e);
			return "데이터 삭제 실패";
		}
	}
	
    @PostMapping("/member_delete_multiple")
    public Map<String, Object> deleteMultipleMembers(@RequestBody List<String> mberIds) {
        Map<String, Object> response = new HashMap<>();
        try {
            // 삭제 로직 수행 (예: 서비스에서 mberIds를 사용해 일괄 삭제)
            int deleteCount = memberAuthService.deleteMembersByIds(mberIds);
            response.put("success", deleteCount == mberIds.size()); // 삭제된 개수 확인
        } catch (Exception e) {
            response.put("success", false);
            e.printStackTrace();
        }
        return response;
    }
    
}	
	
	

