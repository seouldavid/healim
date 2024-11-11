package com.ict.healim.dao;

import java.util.List;

import com.ict.healim.vo.HospitalVO;
import com.ict.healim.vo.MapSearchVO;

public interface HomeDAO {

	public int getMapQueryCount(MapSearchVO msvo);
	public List<HospitalVO> getMapQueryResult(MapSearchVO msvo);
}
