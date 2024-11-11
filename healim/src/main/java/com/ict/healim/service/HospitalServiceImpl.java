package com.ict.healim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.healim.dao.HospitalDAO;
import com.ict.healim.vo.HospitalVO;

@Service
public class HospitalServiceImpl implements HospitalService {

	@Autowired
	private HospitalDAO hospitalDAO;
	
	@Override
	public List<HospitalVO> getHospitalList(int offset, int limit) {
		// TODO Auto-generated method stub
		return hospitalDAO.getHospitalList(offset, limit);
	}
	@Override
	public List<HospitalVO> getNursingList(int offset, int limit) {
		// TODO Auto-generated method stub
		return hospitalDAO.getNursingList(offset, limit);
	}
	@Override
	public int getHospitalCount(String facilityType) {
		// TODO Auto-generated method stub
		return hospitalDAO.getHospitalCount(facilityType);
	}
	@Override
	public int getHospitalHit(String h_id) {
		return hospitalDAO.getHospitalHit(h_id);
	}
	
	@Override
	public HospitalVO getHospitalDetail(String h_id) {
		return hospitalDAO.getHospitalDetail(h_id);
	}
	@Override
	public List<HospitalVO> getHospitalList(String h_id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<HospitalVO> getHospitalList2(String open_date) {
		// TODO Auto-generated method stub
		return hospitalDAO.getHospitalList2(open_date);
	}
	@Override
	public List<HospitalVO> getHospitalList() {
		// TODO Auto-generated method stub
		return hospitalDAO.getHospitalList();
	}
	
	
	
	
	
	
	
	@Override
	public List<HospitalVO> getNursingHomes(int offset, int limit) {
		// TODO Auto-generated method stub
		return hospitalDAO.getNursingHomes(offset, limit);
	}
	@Override
	public List<HospitalVO> getHospitals(int offset, int limit) {
		// TODO Auto-generated method stub
		return hospitalDAO.getHospitals(offset, limit);
	}
	@Override
	public int getHospitalCount2(String facility2) {
		// TODO Auto-generated method stub
		return hospitalDAO.getHospitalCount2(facility2);
	}
	
	
	
	@Override
	public List<String> getHospitalLocationList() {
		// TODO Auto-generated method stub
		return hospitalDAO.getHospitalLocationList();
	}
	@Override
	public int hospitalPick(String mber_id, String h_id) {
		return hospitalDAO.hospitalPick(mber_id, h_id);
	}
	@Override
	public int getPickCount(HospitalVO hvo) {
		return hospitalDAO.getPickCount(hvo);
	}
	@Override
	public List<HospitalVO> getHPickList() {
		return hospitalDAO.getHPickList();
	}
	@Override
	public List<HospitalVO> getNPickList() {
		return hospitalDAO.getNPickList();
	}
	@Override
	public List<HospitalVO> getHRankList() {
		return hospitalDAO.getHRankList();
	}
	@Override
	public List<HospitalVO> getNRankList() {
		return hospitalDAO.getNRankList();
	}

}
