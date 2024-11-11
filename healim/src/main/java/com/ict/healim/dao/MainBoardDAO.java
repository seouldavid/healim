package com.ict.healim.dao;

import java.util.List;

import com.ict.healim.vo.MainBoardVO;
import com.ict.healim.vo.MemberVO;
import com.ict.healim.vo.SearchVO;

public interface MainBoardDAO {
	// 寃뚯떆�뙋 id濡� �젙蹂�(�젣紐�) �씫�뼱�삤湲� - mainBoard jsp�럹�씠吏��슜
	public List<MainBoardVO> getBbsList(SearchVO scvo, Integer limit);

	// 寃뚯떆臾� id濡� �젙蹂� �씫�뼱�삤湲� (vo�삎�떇�엫)
	public MainBoardVO getWrList(String wr_id, String bbs_id);

	// 寃뚯떆�뙋 �젣紐� �븣�븘�삤湲�
	public String getBbsName(String bbs_id);

	// 寃뚯떆臾� �옉�꽦
	public int setBoardVO(MainBoardVO boardVO);

	// 寃뚯떆臾� �닔�젙
	public int updateBoardVO(MainBoardVO boardVO);

	// 寃뚯떆臾� �궘�젣
	public int deleteBoardVO(MainBoardVO boardVO);

	// �뙎湲� �옉�꽦
	public int setComment(MainBoardVO boardVO);

	// �뙎湲� 遺덈윭�삤湲� (寃뚯떆臾쇰텋�윭�삱�븣 媛숈씠 吏꾪뻾�맆寃�)
	public List<MainBoardVO> getCommList(String wr_id);

	// �떟湲��떖湲곗쐞�빐�꽌 parentid媛뽯뒗 child(�엫�쓽�씠由�)list �뾽�뜲�씠�듃�븯湲�
	public int getChildSelect(String parent_id);
	
	// 게시판 아이디로 해당 게시판 게시물 갯수 알아내기
	public int getCountWrList(String bbs_id);

	public List<MainBoardVO> getConsList(String mber_id,int offset,int limit);

	public List<MainBoardVO> getAllList(String mber_id,int offset,int limit);
	
	public int getCountAll(String mber_id);
	
	public int getCountCons(String mber_id);
	
	
	
	
	
	
	

	// 寃뚯떆�뙋 �븘�씠�뵒濡� �빐�떦 寃뚯떆�뙋 寃뚯떆臾� 媛��닔 �븣�븘�궡湲�
	public int getCountWrList(SearchVO sc);

	// 議고쉶�닔利앷�
	public int updateViewNum(String wr_id);

	// 蹂묒썝�씠由꾩쑝濡� 蹂묒썝�븘�씠�뵒寃��깋
	public int getH_Id(String h_name);

	// 硫ㅻ쾭寃��깋
	public MemberVO getUserInfo(String mber_id);
	
	//蹂묒썝�븘�씠�뵒濡� �긽�떞�궗濡� 寃뚯떆臾� 寃��깋
	public List<MainBoardVO> getHospitalConsult(String h_id);
	
	//�긽�떞�궗濡�媛� �떟蹂��셿猷뚯씤吏� 泥댄겕�븯湲� 
	public int getCountHospitalConsultReple(String wr_id);
	//�긽�떞�궗濡�源� �엳�뒗吏� �뾾�뒗吏� 泥댄겕�븯�뀭�꽦
	public int getCheckConsultReple(String h_id);
	//蹂묒썝�븘�씠�뵒濡� �썑湲� 寃��깋�븯湲�
	public List<MainBoardVO> getReview(String h_id);
	/*
	 * //게시글 신고 public int issueUpdate(String wr_id,String issue_people,String
	 * issue_reason);
	 */

}
