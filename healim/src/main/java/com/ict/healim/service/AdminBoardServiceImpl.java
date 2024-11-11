package com.ict.healim.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ict.healim.dao.AdminBoardDAO;
import com.ict.healim.vo.BoardVO;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {

	@Autowired
	private AdminBoardDAO adminBoardDAO;

	@Override
	public List<BoardVO> getFreeBoardList(int offset, int limit) throws Exception {
		return adminBoardDAO.getFreeBoardList(offset, limit);
	}

	@Override
	public int getNoticeInsert(BoardVO bovo) throws Exception {
		
		return adminBoardDAO.getNoticeInsert(bovo);
	}

	@Override
	public BoardVO getFreeBoardDetail(String bo_idx) throws Exception {
		return adminBoardDAO.getFreeBoardDetail(bo_idx);
	}


	@Override
	public int getAnsInsert(BoardVO bovo) throws Exception {
		return adminBoardDAO.getAnsInsert(bovo);
	}

	@Override
	public int getFreeBoardDelete(String wr_id) throws Exception {
		return adminBoardDAO.getFreeBoardDelete(wr_id);
	}

	@Override
	public int getFreeBoardHide(BoardVO bovo) throws Exception {
		return adminBoardDAO.getFreeBoardHide(bovo);
	}

	@Override
	public int deleteWriteByIds(List<String> wrIds) throws Exception {
		return adminBoardDAO.deleteWriteByIds(wrIds);

	}

	@Override
	public List<BoardVO> getConsultationList(int offset, int limit) throws Exception {
		return adminBoardDAO.getConsultationList(offset, limit);
	}

	@Override
	public int getFreeBoardCount() {
		return adminBoardDAO.getFreeBoardCount();
	}

	@Override
	public int getConsultationCount() {
		return adminBoardDAO.getConsultationCount();
	}

	@Override
	public BoardVO getConsultationDetail(String wr_id) throws Exception {
		
		return adminBoardDAO.getConsultationDetail(wr_id);
	}

	@Override
	public int getQuestionsCount() {
		return adminBoardDAO.getQuestionsCount();
	}

	@Override
	public List<BoardVO> getQuestionsList(int offset, int limit) throws Exception {
		return adminBoardDAO.getQuestionsList(offset, limit);
	}

	@Override
	public int getConsultationDelete(String wr_id) throws Exception {
		return adminBoardDAO.getConsultationDelete(wr_id);
	}

	@Override
	public int getQuestionsDelete(String wr_id) throws Exception {
		return adminBoardDAO.getQuestionsDelete(wr_id);
	}

	@Override
	public BoardVO getQuestionsDetail(String wr_id) throws Exception {
		return adminBoardDAO.getQuestionsDetail(wr_id);
	}

	@Override
	public int getNoticeCount() {
		return adminBoardDAO.getNoticeCount();
	}

	@Override
	public List<BoardVO> getNoticeList(int offset, int limit) throws Exception {
		return adminBoardDAO.getNoticeList(offset, limit);
	}

	@Override  
	public BoardVO getNoticeDetail(String wr_id) throws Exception {
		return adminBoardDAO.getNoticeDetail(wr_id);
	}

	@Override
	public int getNoticeDelete(String wr_id) throws Exception {
		return adminBoardDAO.getNoticeDelete(wr_id);
	}

	@Override
	public int getNoticeUpdate(BoardVO bovo) throws Exception {
		return adminBoardDAO.getNoticeUpdate(bovo);
	}

	@Override
	public int getAdminBoardCount() {
		return adminBoardDAO.getAdminBoardCount();
	}

	@Override
	public List<BoardVO> getAdminBoardList(int offset, int limit) throws Exception {
		return adminBoardDAO.getAdminBoardList(offset, limit);
	}

	@Override
	public int getAdminBoardSleepCount() {
		return adminBoardDAO.getAdminBoardSleepCount();
	}

	@Override
	public List<BoardVO> getAdminBoardSleepList(int offset, int limit) throws Exception {
		return adminBoardDAO.getAdminBoardSleepList(offset, limit);
	}

	@Override
	public void restoreBoards(List<Long> wrIds) throws Exception {
		adminBoardDAO.restoreBoards(wrIds);
		
	}

	@Override
	public int getIssueCount() {
		return adminBoardDAO.getIssueCount();
	}

	@Override
	public int getIssueDelete(String wr_id) throws Exception {
		return adminBoardDAO.getIssueDelete(wr_id);
	}

	@Override
	public List<BoardVO> getIssueList(int offset, int limit) throws Exception {
		return adminBoardDAO.getIssueList(offset, limit);
	}

}