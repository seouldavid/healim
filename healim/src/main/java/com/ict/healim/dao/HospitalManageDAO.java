package com.ict.healim.dao;

import java.util.List;

import com.ict.healim.vo.AdmCfgVO;
import com.ict.healim.vo.CityVO;
import com.ict.healim.vo.HosptVO;
import com.ict.healim.vo.SearchVO;


public interface HospitalManageDAO {

	public List<HosptVO> getBothList(SearchVO scvo ) throws Exception;
	
	public int getSearchResultCnt(SearchVO scvo) throws Exception;
	
    public HosptVO getHospitalDetail(String h_id) throws Exception;
    
    public int getHostpitalEdit(HosptVO hosptvo) throws Exception;
    
    public List<CityVO> getCityList(); 
    
    public int getHospitalDelete(String h_id , String user_id) throws Exception;
    
    public int getHospitalReg(HosptVO hosptvo) throws Exception;
    
    public int getNewRegNum(String h_name) throws Exception;
    
    public int getNewRegNum(String h_name, SearchVO scvo) throws Exception;
    
    public int setConfigEdit(AdmCfgVO acfvo) throws Exception;
    
    public AdmCfgVO getConfigEdit() throws Exception;
}
