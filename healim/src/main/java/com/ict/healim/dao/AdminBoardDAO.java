package com.ict.healim.dao;

import java.util.List;
import java.util.Map;

import com.ict.healim.vo.BoardVO;

public interface AdminBoardDAO {
	public int getFreeBoardCount();
	public int getConsultationCount();
	public int getQuestionsCount();
	public int getNoticeCount();
	public int getAdminBoardCount();
	public int getAdminBoardSleepCount();
	public int getIssueCount();

	public List<BoardVO> getFreeBoardList(int offset, int limit) throws Exception;
	public List<BoardVO> getConsultationList(int offset, int limit) throws Exception;
	public List<BoardVO> getQuestionsList(int offset, int limit) throws Exception;
	public List<BoardVO> getNoticeList(int offset, int limit) throws Exception;
	public List<BoardVO> getAdminBoardList(int offset, int limit) throws Exception;
	public List<BoardVO> getAdminBoardSleepList(int offset, int limit) throws Exception;
	public List<BoardVO> getIssueList(int offset, int limit) throws Exception;
	
	public int getNoticeInsert(BoardVO bovo) throws Exception;

	public BoardVO getFreeBoardDetail(String bo_idx) throws Exception;
	public BoardVO getConsultationDetail(String wr_id) throws Exception;
	public BoardVO getQuestionsDetail(String wr_id) throws Exception;
	public BoardVO getNoticeDetail(String wr_id) throws Exception;

	public int getAnsInsert(BoardVO bovo) throws Exception;

	public int getFreeBoardDelete(String wr_id) throws Exception;
	public int getConsultationDelete(String wr_id) throws Exception;
	public int getQuestionsDelete(String wr_id) throws Exception;
	public int getNoticeDelete(String wr_id) throws Exception;
	public int getIssueDelete(String wr_id) throws Exception;

	public int getNoticeUpdate(BoardVO bovo) throws Exception;
	
	public int getFreeBoardHide(BoardVO bovo) throws Exception;
	
	public int deleteWriteByIds(List<String> wrIds) throws Exception;
	
	public void restoreBoards(List<Long> wrIds) throws Exception;
}