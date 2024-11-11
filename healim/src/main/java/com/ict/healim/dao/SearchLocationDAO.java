package com.ict.healim.dao;

import java.util.List;

import com.ict.healim.vo.HospitalVO;

public interface SearchLocationDAO {
	public List<HospitalVO> getHospitalList(List<String> district,int offset,int limit,String type);
	public int getHospitalCount(List<String> district,String type);
}
