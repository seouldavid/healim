package com.ict.healim.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.healim.vo.CityVO;
import com.ict.healim.vo.HosptVO;
import com.ict.healim.vo.AdmCfgVO;
import com.ict.healim.vo.AdmHosPagingVO;
import com.ict.healim.vo.SearchVO;


@Repository
public class HospitalManageDAOImpl implements HospitalManageDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<HosptVO> getBothList(SearchVO scvo) throws Exception {
		
		return sqlSessionTemplate.selectList("HospitalManageDAO.getBothList", scvo) ;
	}

	@Override
	public int getSearchResultCnt(SearchVO scvo) throws Exception {
		
		return sqlSessionTemplate.selectOne("HospitalManageDAO.searchResultCnt", scvo);
	}

	@Override
	public HosptVO getHospitalDetail(String h_id) throws Exception {
		
		return sqlSessionTemplate.selectOne( "HospitalManageDAO.hospitalDetail",h_id);
	}

	@Override
	public int getHostpitalEdit(HosptVO hosptvo) throws Exception {
		
		return sqlSessionTemplate.update("HospitalManageDAO.hospitalEdit", hosptvo);
		
		
	}

	@Override
	public List<CityVO> getCityList() {
		
		return sqlSessionTemplate.selectList("HospitalManageDAO.cityList");
	}
	
	

	

	@Override
	public int getHospitalReg(HosptVO hosptvo) throws Exception {
		
		return sqlSessionTemplate.insert("HospitalManageDAO.hospitalReg", hosptvo);
		
	}

	@Override
	public int getNewRegNum(String h_name) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getNewRegNum(String h_name, SearchVO scvo) throws Exception {
		Map<String, Object> map = new HashMap<>();
        map.put("h_name",h_name);
        map.put("scvo", scvo);
		return sqlSessionTemplate.selectOne("HospitalManageDAO.newRegNum", map);
	}

	@Override
	public int setConfigEdit(AdmCfgVO acfvo) throws Exception {
		
		return sqlSessionTemplate.update("HospitalManageDAO.configEdit", acfvo);
	}

	@Override
	public AdmCfgVO getConfigEdit() throws Exception {
		
		return sqlSessionTemplate.selectOne("HospitalManageDAO.configSelect");
	}

	@Override
	public int getHospitalDelete(String h_id, String user_id) throws Exception {
		Map<String, String> map = new HashMap<>();
        map.put("h_id", h_id);
        map.put("user_id", user_id);
		return sqlSessionTemplate.update("HospitalManageDAO.hospitalDelete", map);
	}

	
	


}
