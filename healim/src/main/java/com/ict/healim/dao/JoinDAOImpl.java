package com.ict.healim.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.healim.vo.HospitalVO;
import com.ict.healim.vo.JoinVO;
@Repository
public class JoinDAOImpl implements JoinDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 회원가입
	@Override
	public int join(JoinVO jvo) {
		return sqlSessionTemplate.insert("member.join", jvo);
	}
	
	// 이메일 중복여부 체크
	@Override
	public int countByEmail(String mberId) {
		return sqlSessionTemplate.selectOne("member.countByEmail", mberId);
	}
	
	// 마이페이지 정보보기
	@Override
	public JoinVO getMyPage(String mberid) {
		return sqlSessionTemplate.selectOne("member.myPage", mberid);
	}
	
	// 마이페이지 변경사항 저장
	@Override
	public int MyPageUpdate(JoinVO jvo) {
		return sqlSessionTemplate.update("member.update", jvo);
	}
	
	// 회원가입 로그 저장
	@Override
	public int joinLog(JoinVO jvo) {
		return sqlSessionTemplate.insert("member.logInsert", jvo);
	}
	
	// 요양병원 찜 목록 가져오기
	@Override
	public List<HospitalVO> getHospitalPick(String mber_id) {
		return sqlSessionTemplate.selectList("member.getHPick", mber_id);
	}

	// 요양원 찜 목록 가져오기
	@Override
	public List<HospitalVO> getNHPick(String mber_id) {
		return sqlSessionTemplate.selectList("member.getNPick", mber_id);
	}

	// 찜 목록 삭제
	@Override
	public int removePick(String mber_id, String h_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mber_id", mber_id);
		map.put("h_id", Integer.parseInt(h_id));
		return sqlSessionTemplate.delete("member.removePick", map);
	}

	// 요양병원 찜 갯수 가져오기
	@Override
	public int getHPickCount(String mber_id) {
		return sqlSessionTemplate.selectOne("member.getHPickCount", mber_id);
	}

	// 요양원 찜 갯수 가져오기
	@Override
	public int getNPickCount(String mber_id) {
		return sqlSessionTemplate.selectOne("member.getNPickCount", mber_id);
	}
	
	
	
	
}
