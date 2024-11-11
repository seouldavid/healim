package com.ict.healim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.healim.dao.MemberAuthDAO;
import com.ict.healim.vo.MemberVO;
@Service
public class MemberAuthServiceImpl implements MemberAuthService {
	
	@Autowired
	private MemberAuthDAO memberAuthDAO;

	@Override
	public List<MemberVO> getMemberAuthList() throws Exception {

		return memberAuthDAO.getMemberAuthList();
	}


	@Override
	public String getMemberAuthDelete(String mber_id) throws Exception {
		return memberAuthDAO.getMemberAuthDelete(mber_id);
	}


	@Override
	public int deleteMembersByIds(List<String> mberIds) throws Exception {
		return memberAuthDAO.deleteMembersByIds(mberIds);
	}
	

}
