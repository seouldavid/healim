package com.ict.healim.dao;

import java.util.List;

import com.ict.healim.vo.HospitalVO;
import com.ict.healim.vo.RecentlyViewVo;

public interface RecentlyViewDAO {

	
	public List<HospitalVO> getRecentlyViewList(String mber_id);

	
    // 새로 추가한 최근 본 시설 추가 메서드
    public int insertRecentlyView(String h_id, String mber_id);

}
