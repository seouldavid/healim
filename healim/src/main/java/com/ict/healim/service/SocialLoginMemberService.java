package com.ict.healim.service;

import java.util.List;

import com.ict.healim.vo.LoginMemberVO;
import com.ict.healim.vo.PopupVO;


public interface SocialLoginMemberService {
	public LoginMemberVO getDetail(String email);

}
