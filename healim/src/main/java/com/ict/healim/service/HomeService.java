package com.ict.healim.service;

import java.util.List;

import com.ict.healim.vo.HospitalVO;
import com.ict.healim.vo.MapSearchVO;

public interface HomeService {

	public int getMapQueryCount(MapSearchVO msvo);
	public List<HospitalVO> getMapQueryResult(MapSearchVO msvo);
	
}
