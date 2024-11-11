package com.ict.healim.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.healim.vo.MemberVO;

@Repository
public class MemberAuthDAOImpl implements MemberAuthDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<MemberVO> getMemberAuthList() throws Exception {

		return sqlSessionTemplate.selectList("loginDAO.getMemberList");
	}


	@Override
	public String getMemberAuthDelete(String mber_id) throws Exception {
		// 자동커밋이다.
		int result = sqlSessionTemplate.delete("loginDAO.getMemberDelete", mber_id);
		return String.valueOf(result);
	}


	@Override
	public int deleteMembersByIds(List<String> mberIds) {
		return sqlSessionTemplate.delete("loginDAO.deleteMembersByIds", mberIds);
	}

}
