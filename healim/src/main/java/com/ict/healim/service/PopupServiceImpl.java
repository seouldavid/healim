package com.ict.healim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.healim.dao.PopupDAO;
import com.ict.healim.dao.SocialLoginMemberDAO;
import com.ict.healim.vo.PopupVO;
@Service
public class PopupServiceImpl implements PopupService{
	@Autowired
	private PopupDAO popupDAO;
	@Override
	public List<PopupVO> getPopupList() {
		// TODO Auto-generated method stub
		return popupDAO.getPopupList();
	}

	@Override
	public int getPopupInsert(PopupVO pvo) {
		// TODO Auto-generated method stub
		return popupDAO.getPopupInsert(pvo);
	}

	@Override
	public PopupVO getPopupDetail(String pu_id) {
		// TODO Auto-generated method stub
		return popupDAO.getPopupDetail(pu_id);
	}

	@Override
	public int getPopupEdit(PopupVO pvo) {
		// TODO Auto-generated method stub
		System.out.println("----------update3-------");
		return popupDAO.getPopupEdit(pvo);
	}

	@Override
	public int getPopupDelete(String pu_id) {
		// TODO Auto-generated method stub
		return popupDAO.getPopupDelete(pu_id);
	}

}
