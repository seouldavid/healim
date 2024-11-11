package com.ict.healim.service;

import java.util.List;

import com.ict.healim.vo.AdminVO;
import com.ict.healim.vo.MemberVO;

public interface AdminService {
	public List<AdminVO> getAdminList();
	public int getAdminInsert(AdminVO avo);
	public int getAdminDelete(String admin_id);
	public AdminVO getAdminDetail(String admin_id);
	public int getPopupEdit(AdminVO avo);
	public int getAdminUpdate(AdminVO avo);
	
	public int updateMemberAuth(MemberVO mvo) throws Exception;
	public MemberVO getMemberAuthDetail(String mber_id) throws Exception;
	public int getMemberAuthDelete(String mber_id) throws Exception;
	public int getMemberAuthDelete(MemberVO mvo) throws Exception;

}
