package com.ict.healim.service;

import java.util.List;

import com.ict.healim.vo.HospitalVO;
import com.ict.healim.vo.JoinVO;

public interface JoinService {
	//회원가입
	public int join(JoinVO jvo);
	
	// 이메일 중복여부 확인
	public boolean isEmailAvailable(String mberId);
	
	// 마이페이지 정보보기
	public JoinVO getMyPage(String mberid);
	
	// 마이페이지 수정
	public int MyPageUpdate(JoinVO jvo);
	
	// 회원가입 로그 저장
	public int joinLog(JoinVO jvo);
	
	// 요양병원 찜 목록 가져오기
	public List<HospitalVO> getHospitalPick(String mber_id);
	
	// 요양원 찜 목록 가져오기
	public List<HospitalVO> getNHPick(String mber_id);
	
	// 찜 목록 삭제
	public int removePick(String mber_id, String h_id);
	
	// 요양병원 찜 갯수 가져오기
	public int getHPickCount(String mber_id);
	
	// 요양원 찜 갯수 가져오기
	public int getNPickCount(String mber_id);
}
