package com.ict.healim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.healim.dao.MainBoardDAO;
import com.ict.healim.vo.MainBoardVO;
import com.ict.healim.vo.MemberVO;
import com.ict.healim.vo.SearchVO;
@Service
public class MainBoardServiceImpl implements MainBoardService {

	@Autowired
	private MainBoardDAO mainBoardDAO;
	
	
	@Override
	public List<MainBoardVO> getBbsList(SearchVO scvo, Integer limit) {
		// TODO Auto-generated method stub
		return mainBoardDAO.getBbsList(scvo, limit);
	}

	@Override
	public MainBoardVO getWrList(String wr_id, String bbs_id) {
		// TODO Auto-generated method stub
		return mainBoardDAO.getWrList(wr_id,bbs_id);
	}

	@Override
	public String getBbsName(String bbs_id) {
		// TODO Auto-generated method stub
		return mainBoardDAO.getBbsName(bbs_id);
	}

	@Override
	public int setBoardVO(MainBoardVO boardVO) {
		// TODO Auto-generated method stub
		return mainBoardDAO.setBoardVO(boardVO);
	}

	@Override
	public int updateBoardVO(MainBoardVO boardVO) {
		// TODO Auto-generated method stub
		return mainBoardDAO.updateBoardVO(boardVO);
	}

	@Override
	public int deleteBoardVO(MainBoardVO boardVO) {
		// TODO Auto-generated method stub
		return mainBoardDAO.deleteBoardVO(boardVO);
	}

	@Override
	public int setComment(MainBoardVO boardVO) {
		// TODO Auto-generated method stub
		return mainBoardDAO.setComment(boardVO);
	}

	@Override
	public List<MainBoardVO> getCommList(String wr_id) {
		// TODO Auto-generated method stub
		return mainBoardDAO.getCommList(wr_id);
	}

	@Override
	public int getChildSelect(String parent_id) {
		// TODO Auto-generated method stub
		return mainBoardDAO.getChildSelect(parent_id);
	}

	@Override
	public int getCountWrList(SearchVO sc) {
		// TODO Auto-generated method stub
		return mainBoardDAO.getCountWrList(sc);
	}

	@Override
	public int updateViewNum(String wr_id) {
		// TODO Auto-generated method stub
		return mainBoardDAO.updateViewNum(wr_id);
	}

	@Override
	public int getH_Id(String h_name) {
		// TODO Auto-generated method stub
		return mainBoardDAO.getH_Id(h_name);
	}

	@Override
	public MemberVO getUserInfo(String mber_id) {
		// TODO Auto-generated method stub
		return mainBoardDAO.getUserInfo(mber_id);
	}

	@Override
	public List<MainBoardVO> getHospitalConsult(String h_id) {
		// TODO Auto-generated method stub
		return mainBoardDAO.getHospitalConsult(h_id);
	}

	@Override
	public int getCountHospitalConsultReple(String wr_id) {
		// TODO Auto-generated method stub
		return mainBoardDAO.getCountHospitalConsultReple(wr_id);
	}

	@Override
	public int getCheckConsultReple(String h_id) {
		// TODO Auto-generated method stub
		return mainBoardDAO.getCheckConsultReple(h_id);
	}

	@Override
	public List<MainBoardVO> getReview(String h_id) {
		// TODO Auto-generated method stub
		return mainBoardDAO.getReview(h_id);
	}
	
	
	
	@Override
	public int getCountWrList(String bbs_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MainBoardVO> getConsList(String mber_id,int offset,int limit) {
		// TODO Auto-generated method stub
		return mainBoardDAO.getConsList(mber_id,offset,limit);
	}

	@Override
	public List<MainBoardVO> getAllList(String mber_id, int offest, int limit) {
		// TODO Auto-generated method stub
		return mainBoardDAO.getAllList(mber_id,offest,limit);
	}

	@Override
	public int getCountAll(String mber_id) {
		// TODO Auto-generated method stub
		return mainBoardDAO.getCountAll(mber_id);
	}

	@Override
	public int getCountCons(String mber_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	
	

	/*
	 * @Override public int issueUpdate(String wr_id, String issue_people, String
	 * issue_reason) { // TODO Auto-generated method stub return
	 * mainBoardDAO.issueUpdate(wr_id, issue_people, issue_reason); }
	 */

}
