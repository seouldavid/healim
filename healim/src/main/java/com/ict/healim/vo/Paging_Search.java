package com.ict.healim.vo;

import org.springframework.stereotype.Component;

@Component
public class Paging_Search {
	private int nowPage =1;
	private int nowBlock =1 ;
	
	// �븳 �럹�씠吏��떦 6以�
	private int numPerPage = 10;
	
	// �븳 釉붾줉�떦 3媛�
	private int pagePerBlock = 5;
	
	// DB�쓽 寃뚯떆臾쇱쓽 �닔
	private int totalRecord = 0;
	
	// 寃뚯떆臾쇱쓽 �닔瑜� �씠�슜�빐�꽌 �쟾泥� �럹�씠吏��쓽 �닔
	private int totalPage = 0;
	
	private int totalBlock = 0;
	
	// �븳踰덉뿉 媛��졇�삱 寃뚯떆臾쇱쓽 �떆�옉踰덊샇�� �걹踰덊샇
	private int begin = 0;
	private int end = 0;
	
	private int beginBlock = 0;
	private int endBlock = 0;
	
	private int offset = 0;

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getBeginBlock() {
		return beginBlock;
	}

	public void setBeginBlock(int beginBlock) {
		this.beginBlock = beginBlock;
	}

	public int getEndBlock() {
		return endBlock;
	}

	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}
	
	
}
