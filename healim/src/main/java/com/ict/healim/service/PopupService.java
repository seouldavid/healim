package com.ict.healim.service;

import java.util.List;

import com.ict.healim.vo.PopupVO;

public interface PopupService {
	public List<PopupVO> getPopupList();
	public int getPopupInsert(PopupVO pvo); 
	public PopupVO getPopupDetail(String pu_id);
	public int getPopupEdit(PopupVO pvo);
	public int getPopupDelete(String pu_id);
}
