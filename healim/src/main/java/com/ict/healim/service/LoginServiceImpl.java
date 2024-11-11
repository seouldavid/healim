package com.ict.healim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.healim.dao.LoginDAO;
import com.ict.healim.vo.MemberVO;
@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDAO loginDAO;
	
	@Override
	public MemberVO LoginChk(MemberVO lvo) throws Exception {
		System.out.println("여기는 서비스 : " + lvo);
		return loginDAO.LoginChk(lvo);
	}

	@Override
	public int updateLastLoginTime(MemberVO lvo) throws Exception {
		return loginDAO.updateLastLoginTime(lvo);
	}

}
