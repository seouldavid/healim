package com.ict.healim.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.healim.vo.LoginMemberVO;
import com.ict.healim.vo.PopupVO;

@Repository
public class SocialLoginMemberDAOImpl implements SocialLoginMemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public LoginMemberVO getDetail(String email) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("login.detail", email);
	}

}
