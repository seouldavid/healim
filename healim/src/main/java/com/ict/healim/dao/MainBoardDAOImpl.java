package com.ict.healim.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.healim.vo.MainBoardVO;
import com.ict.healim.vo.MemberVO;
import com.ict.healim.vo.SearchVO;
@Repository
public class MainBoardDAOImpl implements MainBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<MainBoardVO> getBbsList(SearchVO scvo,Integer limit) {
        // MyBatis에서 파라미터 자리가 없거나 하나만 존재한다.
        //그 그래서 두개 이상일때는 위에 처럼 vo를 사용하는 방법과 Map을 사용하는 방법
        Map<Object, Object> map = new HashMap<>();
        map.put("scvo",scvo);
        map.put("limit", limit);
        return sqlSessionTemplate.selectList("mainBoard.getBbsList", map);
	}

	@Override
	public MainBoardVO getWrList(String wr_id,String bbs_id) {
		 Map<String, String> map = new HashMap<>();
	        map.put("wr_id",wr_id);
	        map.put("bbs_id", bbs_id);
		return sqlSessionTemplate.selectOne("mainBoard.getWrList",map);
	}

	@Override
	public String getBbsName(String bbs_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("mainBoard.getBbsName", bbs_id);
	}

	@Override
	public int setBoardVO(MainBoardVO boardVO) {
		// TODO Auto-generated method stub
	
		return sqlSessionTemplate.insert("mainBoard.insert", boardVO);
		
	}

	@Override
	public int updateBoardVO(MainBoardVO boardVO) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("mainBoard.update", boardVO);
	}

	@Override
	public int deleteBoardVO(MainBoardVO boardVO) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("mainBoard.delete", boardVO);
	}

	@Override
	public int setComment(MainBoardVO boardVO) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("mainBoard.comminsert", boardVO);
	}

	@Override
	public List<MainBoardVO> getCommList(String wr_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("mainBoard.commselect", wr_id);
	}

	@Override
	public int getChildSelect(String parent_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("mainBoard.childselect",parent_id);
	}

	@Override
	public int getCountWrList(SearchVO sc) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("mainBoard.countwrlist", sc);
	}

	@Override
	public int updateViewNum(String wr_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("mainBoard.updateviewnum", wr_id);
	}

	@Override
	public int getH_Id(String h_name) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("mainBoard.gethid", h_name);
	}

	@Override
	public MemberVO getUserInfo(String mber_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("mainBoard.getuserinfo", mber_id);
	}

	@Override
	public List<MainBoardVO> getHospitalConsult(String h_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("mainBoard.gethospitalconsult", h_id);
	}

	@Override
	public int getCountHospitalConsultReple(String wr_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("mainBoard.getcounthospitalconsultreple", wr_id);
	}

	@Override
	public int getCheckConsultReple(String h_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("mainBoard.getcheckconsultreple", h_id);
	}

	@Override
	public List<MainBoardVO> getReview(String h_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("mainBoard.getreview", h_id);
	}

	/*
	 * @Override public int getCountWrList(String bbs_id) { // TODO Auto-generated
	 * method stub return 0; }
	 */

	@Override
	public List<MainBoardVO> getConsList(String mber_id,int offset,int limit) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mber_id", mber_id);
		map.put("offset", offset);
		map.put("limit", limit);
		return sqlSessionTemplate.selectList("mainBoard.cons", map);
	}

	@Override
	public List<MainBoardVO> getAllList(String mber_id, int offset, int limit) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mber_id", mber_id);
		map.put("offset", offset);
		map.put("limit", limit);
		return sqlSessionTemplate.selectList("mainBoard.all", map);
	}

	@Override
	public int getCountAll(String mber_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("mainBoard.countall", mber_id);
	}

	@Override
	public int getCountCons(String mber_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("mainBoard.countcons", mber_id);
	}

	@Override
	public int getCountWrList(String bbs_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	/*
	 * @Override public int issueUpdate(String wr_id, String issue_people, String
	 * issue_reason) { Map<Object, Object> map = new HashMap<>();
	 * map.put("scvo",scvo); map.put("limit", limit); return
	 * sqlSessionTemplate.update("mainBoard.issueupdate", map); }
	 */


}
