package com.ict.healim.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.healim.vo.HospitalVO;
import com.ict.healim.vo.MapSearchVO;

@Repository
public class HomeDAOImpl implements HomeDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int getMapQueryCount(MapSearchVO msvo) {
		
		return sqlSessionTemplate.selectOne("HomeDAO.mapQueryCount", msvo);
	}

	@Override
	public List<HospitalVO> getMapQueryResult(MapSearchVO msvo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("HomeDAO.mapQueryResult", msvo);
	}
	
}
