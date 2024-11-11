package com.ict.healim.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.healim.vo.HospitalVO;

@Repository
public class SearchLocationDAOImpl implements SearchLocationDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<HospitalVO> getHospitalList(List<String>  district,int offset,int limit,String type) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("district", district);
		map.put("offset", offset);
		map.put("limit", limit);
		map.put("type", String.valueOf(type));
		return sqlSessionTemplate.selectList("hospital.search", map);
	}

	@Override
	public int getHospitalCount(List<String> district, String type) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("district", district);
		map.put("type", type);
		return sqlSessionTemplate.selectOne("hospital.countAll", map);
	}


}
