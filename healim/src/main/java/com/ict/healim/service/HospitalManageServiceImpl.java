package com.ict.healim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.healim.dao.HospitalManageDAO;
import com.ict.healim.vo.CityVO;
import com.ict.healim.vo.HosptVO;
import com.ict.healim.vo.AdmCfgVO;
import com.ict.healim.vo.AdmHosPagingVO;
import com.ict.healim.vo.SearchVO;

@Service
public class HospitalManageServiceImpl implements HospitalManageService{

	@Autowired
	private HospitalManageDAO hospitalManageDAO;

	@Override
	public List<HosptVO> getBothList(SearchVO scvo) throws Exception {
		
		return hospitalManageDAO.getBothList(scvo);
	}

	@Override
	public int getSearchResultCnt(SearchVO scvo) throws Exception {
		
		return hospitalManageDAO.getSearchResultCnt(scvo);
		
	}

	@Override
	public HosptVO getHospitalDetail(String h_id) throws Exception {
		
		return hospitalManageDAO.getHospitalDetail(h_id);
	}

	// 병원 데이터 수정
	@Override
	public int getHostpitalEdit(HosptVO hosptvo) throws Exception {
		
		return hospitalManageDAO.getHostpitalEdit(hosptvo);
	}

	@Override
	public List<CityVO> getCityList() {
		
		return hospitalManageDAO.getCityList();
	}



	@Override
	public int getHospitalReg(HosptVO hosptvo) throws Exception {
		
		return hospitalManageDAO.getHospitalReg(hosptvo);
	}

	@Override
	public int getNewRegNum(String h_name, SearchVO scvo) throws Exception {
		return hospitalManageDAO.getNewRegNum(h_name, scvo);
	}

	@Override
	public int setConfigEdit(AdmCfgVO acfvo) throws Exception {
		
		return hospitalManageDAO.setConfigEdit(acfvo);
	}

	@Override
	public AdmCfgVO getConfigEdit() throws Exception {
		
		return hospitalManageDAO.getConfigEdit();
	}

	@Override
	public int getHospitalDelete(String h_id, String user_id) throws Exception {
		
		return hospitalManageDAO.getHospitalDelete(h_id, user_id);
	}



}
