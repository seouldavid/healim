package com.ict.healim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.healim.dao.SearchLocationDAO;
import com.ict.healim.vo.HospitalVO;

@Service
public class SearchLocationServiceImpl implements SearchLocationService {
	
	@Autowired
	private SearchLocationDAO searchLocationDAO;
	
	@Override
	public List<HospitalVO> getHospitalList(List<String>  district,int offset,int limit,String type) {
		return searchLocationDAO.getHospitalList(district,offset,limit,type);
	}

	@Override
	public int getHospitalCount(List<String> district, String type) {
		// TODO Auto-generated method stub
		return searchLocationDAO.getHospitalCount(district, type);
	}

}
