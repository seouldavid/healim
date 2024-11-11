package com.ict.healim.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.healim.vo.BoardVO;

@Repository
public class AdminBoardDAOImpl implements AdminBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<BoardVO> getFreeBoardList(int offset, int limit) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("offset", offset);
		map.put("limit", limit);
		return sqlSessionTemplate.selectList("board.freeboard_list", map);
	}

	@Override
	public int getNoticeInsert(BoardVO bovo) throws Exception {
		return sqlSessionTemplate.insert("board.notice_insert", bovo);
	}

	@Override
	public BoardVO getFreeBoardDetail(String bo_idx) throws Exception {
		return sqlSessionTemplate.selectOne("board.freeboard_detail", bo_idx);
	}

	@Override
	public int getAnsInsert(BoardVO bovo) throws Exception {

		return sqlSessionTemplate.update("board.consultation_answer", bovo);
	}

	@Override
	public int getFreeBoardHide(BoardVO bovo) throws Exception {
		return sqlSessionTemplate.update("board.freeboard_hide", bovo);
	}

	@Override
	public int getFreeBoardDelete(String wr_id) throws Exception {
		return sqlSessionTemplate.update("board.freeboard_delete", wr_id);
	}

	@Override
	public int deleteWriteByIds(List<String> wrIds) throws Exception {
		return sqlSessionTemplate.delete("board.freeboard_delete_Write_ByIds", wrIds);
	}

	@Override
	public List<BoardVO> getConsultationList(int offset, int limit) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("offset", offset);
		map.put("limit", limit);
		return sqlSessionTemplate.selectList("board.consultation_list", map);
	}

	@Override
	public int getFreeBoardCount() {
		return sqlSessionTemplate.selectOne("board.freeboard_count");
	}

	@Override
	public int getConsultationCount() {
		return sqlSessionTemplate.selectOne("board.consultation_count");
	}

	@Override
	public BoardVO getConsultationDetail(String wr_id) throws Exception {

		return sqlSessionTemplate.selectOne("board.consultation_counselor", wr_id);
	}

	@Override
	public int getQuestionsCount() {
		return sqlSessionTemplate.selectOne("board.questions_count");
	}

	@Override
	public List<BoardVO> getQuestionsList(int offset, int limit) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("offset", offset);
		map.put("limit", limit);
		return sqlSessionTemplate.selectList("board.questions_list", map);
	}

	@Override
	public int getConsultationDelete(String wr_id) throws Exception {
		return sqlSessionTemplate.update("board.consultation_delete", wr_id);
	}

	@Override
	public int getQuestionsDelete(String wr_id) throws Exception {
		return sqlSessionTemplate.update("board.questions_delete", wr_id);
	}

	@Override
	public BoardVO getQuestionsDetail(String wr_id) throws Exception {
		return sqlSessionTemplate.selectOne("board.questions_qna", wr_id);
	}

	@Override
	public int getNoticeCount() {
		return sqlSessionTemplate.selectOne("board.notice_count");
	}

	@Override
	public List<BoardVO> getNoticeList(int offset, int limit) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("offset", offset);
		map.put("limit", limit);
		return sqlSessionTemplate.selectList("board.notice_list", map);
	}

	@Override
	public BoardVO getNoticeDetail(String wr_id) throws Exception {
		return sqlSessionTemplate.selectOne("board.notice_announcement", wr_id);
	}

	@Override
	public int getNoticeDelete(String wr_id) throws Exception {
		return sqlSessionTemplate.update("board.notice_delete", wr_id);
	}

	@Override
	public int getNoticeUpdate(BoardVO bovo) throws Exception {
		return sqlSessionTemplate.update("board.notice_update", bovo);
	}

	@Override
	public int getAdminBoardCount() {
		return sqlSessionTemplate.selectOne("board.admin_board_count");
	}

	@Override
	public List<BoardVO> getAdminBoardList(int offset, int limit) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("offset", offset);
		map.put("limit", limit);
		return sqlSessionTemplate.selectList("board.admin_board_list", map);
	}

	@Override
	public int getAdminBoardSleepCount() {
		return sqlSessionTemplate.selectOne("board.admin_board_sleep_count");
	}

	@Override
	public List<BoardVO> getAdminBoardSleepList(int offset, int limit) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("offset", offset);
		map.put("limit", limit);
		return sqlSessionTemplate.selectList("board.admin_board_sleep_list", map);
	}

	@Override
	public void restoreBoards(List<Long> wrIds) throws Exception {
	    // 복구할 게시물들의 wrId를 맵에 담아 Mapper로 전달
	    Map<String, Object> map = new HashMap<>();
	    map.put("wrIds", wrIds);

	    // 쿼리 호출
	    sqlSessionTemplate.update("board.restore_boards", map);
	}

	@Override
	public int getIssueCount() {
		return sqlSessionTemplate.selectOne("board.issue_count");
	}
	
	@Override
	public List<BoardVO> getIssueList(int offset, int limit) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("offset", offset);
		map.put("limit", limit);
		return sqlSessionTemplate.selectList("board.issue_list", map);
	}
	
	@Override
	public int getIssueDelete(String wr_id) throws Exception {
		return sqlSessionTemplate.update("board.issue_delete", wr_id);
	}

}