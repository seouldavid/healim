package com.ict.healim.dao;

import com.ict.healim.vo.LoginMemberVO;


public interface SocialLoginMemberDAO {
	public LoginMemberVO getDetail(String email);


}
