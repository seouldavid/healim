package com.ict.healim.service;

import java.util.List;

import com.ict.healim.vo.HospitalVO;

public interface HospitalService {

	public List<HospitalVO> getHospitalList(int offset, int limit);
	public List<HospitalVO> getNursingList(int offset, int limit);
	public int getHospitalCount(String facilityType);
	public List<HospitalVO> getHospitalList(String h_id);
	public int getHospitalHit(String h_id);
	public HospitalVO getHospitalDetail(String h_id);
	public List<HospitalVO> getHospitalList2(String open_date);
	public List<HospitalVO> getHospitalList();
	public List<HospitalVO> getNursingHomes(int offset, int limit);  // ���� ����Ʈ �޼���
	public List<HospitalVO> getHospitals(int offset, int limit);     // ��纴�� ����Ʈ �޼���
	public int getHospitalCount2(String facility2);
	public int hospitalPick(String mber_id, String h_id);
	public int getPickCount(HospitalVO hvo);
	public List<HospitalVO> getHPickList();
	public List<HospitalVO> getNPickList();
	public List<HospitalVO> getHRankList();
	public List<HospitalVO> getNRankList();
	public List<String> getHospitalLocationList();


	
	

}
