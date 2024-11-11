package com.ict.healim.dao;

import java.util.List;

import com.ict.healim.vo.MemberVO;

public interface MemberAuthDAO {
	public List<MemberVO> getMemberAuthList() throws Exception;
    public String getMemberAuthDelete(String mber_id) throws Exception;
	public int deleteMembersByIds(List<String> mberIds);
}
