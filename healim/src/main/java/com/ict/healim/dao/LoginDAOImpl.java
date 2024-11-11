package com.ict.healim.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.healim.vo.MemberVO;
@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public MemberVO LoginChk(MemberVO lvo) throws Exception {
		return sqlSessionTemplate.selectOne("loginDAO.loginchk", lvo);
	}

	@Override
	public int updateLastLoginTime(MemberVO lvo) throws Exception {

		return sqlSessionTemplate.update("loginDAO.loginTimeUpdate", lvo);
	}

}
