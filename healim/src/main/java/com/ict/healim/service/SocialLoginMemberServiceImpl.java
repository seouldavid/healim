package com.ict.healim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.healim.dao.SocialLoginMemberDAO;
import com.ict.healim.vo.LoginMemberVO;
import com.ict.healim.vo.PopupVO;

@Service
public class SocialLoginMemberServiceImpl implements SocialLoginMemberService {

	@Autowired
	private SocialLoginMemberDAO socialLoginMemberDAO;

	@Override
	public LoginMemberVO getDetail(String email) {
		// TODO Auto-generated method stub
		return socialLoginMemberDAO.getDetail(email);
	}


}
