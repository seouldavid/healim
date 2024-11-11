package com.ict.healim.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.healim.vo.HospitalVO;

@Repository
public class RecentlyViewDAOImpl implements RecentlyViewDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public List<HospitalVO> getRecentlyViewList(String mber_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("recentlyview.select", mber_id);
	}


	  @Override
	    public int insertRecentlyView(String h_id, String mber_id) {
	        Map<String, String> params = new HashMap<>();
	        params.put("h_id", h_id);
	        params.put("mber_id", mber_id);
	        System.out.println("mber_id:"+mber_id);
	        return sqlSessionTemplate.insert("recentlyview.insert", params);
	    }
}

