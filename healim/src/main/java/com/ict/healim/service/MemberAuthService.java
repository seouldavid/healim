package com.ict.healim.service;

import java.util.List;

import com.ict.healim.vo.MemberVO;

public interface MemberAuthService {
	public List<MemberVO> getMemberAuthList() throws Exception;
    public String getMemberAuthDelete(String mber_id) throws Exception;
	public int deleteMembersByIds(List<String> mberIds) throws Exception;
    
}
