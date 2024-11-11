package com.ict.healim.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.healim.vo.PopupVO;
@Repository
public class PopupDAOImpl implements PopupDAO {
 @Autowired
 private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public List<PopupVO> getPopupList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("popup.select");
	}

	@Override
	public int getPopupInsert(PopupVO pvo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("popup.insert",pvo);
	}

	@Override
	public PopupVO getPopupDetail(String pu_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("popup.detail", pu_id);
	}

	@Override
	public int getPopupEdit(PopupVO pvo) {
		// TODO Auto-generated method stub
		System.out.println("--------update4------");
		return sqlSessionTemplate.update("popup.update", pvo);
	}

	@Override
	public int getPopupDelete(String pu_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("popup.delete", pu_id);
	}

}
