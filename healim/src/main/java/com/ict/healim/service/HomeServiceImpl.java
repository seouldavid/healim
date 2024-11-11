package com.ict.healim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.healim.dao.HomeDAO;
import com.ict.healim.vo.HospitalVO;
import com.ict.healim.vo.MapSearchVO;

@Service
public class HomeServiceImpl implements HomeService{

	@Autowired
	private HomeDAO homeDAO;

	@Override
	public int getMapQueryCount(MapSearchVO msvo) {
		
		return homeDAO.getMapQueryCount(msvo);
	}

	@Override
	public List<HospitalVO> getMapQueryResult(MapSearchVO msvo) {
		
		return homeDAO.getMapQueryResult(msvo);
	}
}
