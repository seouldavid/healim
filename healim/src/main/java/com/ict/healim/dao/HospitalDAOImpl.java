package com.ict.healim.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.healim.vo.HospitalVO;

@Repository
public class HospitalDAOImpl implements HospitalDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<HospitalVO> getHospitalList(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("offset", offset);
		map.put("limit", limit);
		
		return sqlSessionTemplate.selectList("hospital.selectH",map);
	}
	@Override
	public List<HospitalVO> getNursingList(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("offset", offset);
		map.put("limit", limit);
		
		return sqlSessionTemplate.selectList("hospital.selectN",map);
	}
	@Override
	public int getHospitalCount(String facilityType) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("facilityType", facilityType);
		return sqlSessionTemplate.selectOne("hospital.count", map);
	}
	
	@Override
	public int getHospitalHit(String h_id) {
		return sqlSessionTemplate.update("hospital.hit", h_id);
	}
	@Override
	public HospitalVO getHospitalDetail(String h_id) {
		return sqlSessionTemplate.selectOne("hospital.hDetail", h_id);
	}
	@Override
	public List<HospitalVO> getHospitalList2(String open_date) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<HospitalVO> getHospitalList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("hospital.select");
	}
	
	
	
	
	
	
	@Override
	public List<HospitalVO> getNursingHomes(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("offset", offset);
		map.put("limit", limit);
		return sqlSessionTemplate.selectList("hospital.selectN2",map);
	}
	@Override
	public List<HospitalVO> getHospitals(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("offset", offset);
		map.put("limit", limit);
		
		return sqlSessionTemplate.selectList("hospital.selectH2",map);
	}
	@Override
	public int getHospitalCount2(String facility2) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("facility2", facility2);
		return sqlSessionTemplate.selectOne("hospital.count2", map);
	}
	
	
	
	
	
	
	@Override
	public List<String> getHospitalLocationList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("hospital.location");
	}
	@Override
	public int hospitalPick(String mber_id, String h_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mber_id", mber_id);
		map.put("h_id", Integer.parseInt(h_id));
		return sqlSessionTemplate.insert("hospital.addpick", map);
	}
	@Override
	public int getPickCount(HospitalVO hvo) {
		return sqlSessionTemplate.selectOne("hospital.getPickCount", hvo);
	}
	@Override
	public List<HospitalVO> getHPickList() {
		return sqlSessionTemplate.selectList("hospital.getHPickList");
	}
	@Override
	public List<HospitalVO> getNPickList() {
		return sqlSessionTemplate.selectList("hospital.getNPickList");
	}
	@Override
	public List<HospitalVO> getHRankList() {
		return sqlSessionTemplate.selectList("hospital.getHRankList");
	}
	@Override
	public List<HospitalVO> getNRankList() {
		return sqlSessionTemplate.selectList("hospital.getNRankList");
	}


}
