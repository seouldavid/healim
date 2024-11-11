package com.ict.healim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.healim.dao.RecentlyViewDAO;
import com.ict.healim.vo.HospitalVO;

@Service
public class RecentlyViewServiceImpl implements RecentlyViewService {

	@Autowired
	private RecentlyViewDAO recentlyViewDAO;

	@Override
	public List<HospitalVO> getRecentlyViewList(String mber_Id) {
		// TODO Auto-generated method stub
		return recentlyViewDAO.getRecentlyViewList(mber_Id);
	}

	@Override
	public int insertRecentlyView(String h_Id, String mber_Id) {
		// TODO Auto-generated method stub
		return recentlyViewDAO.insertRecentlyView(h_Id, mber_Id);
	}

	
	
	
}
