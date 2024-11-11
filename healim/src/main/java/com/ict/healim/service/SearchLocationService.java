package com.ict.healim.service;

import java.util.List;

import com.ict.healim.vo.HospitalVO;

public interface SearchLocationService {
	public List<HospitalVO> getHospitalList(List<String> district,int offset,int limit,String type);
	public int getHospitalCount(List<String> district,String type);
}
