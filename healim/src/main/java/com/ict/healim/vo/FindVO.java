package com.ict.healim.vo;

public class FindVO {
	private String searchType , keyword ;  // 검색 조건, 검색어
	private Long pageNum1, pageNum2 ;// 페이지Num 1, 2
	private Long page1, page2  ; // 페이지 1, 2
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Long getPageNum1() {
		return pageNum1;
	}
	public void setPageNum1(Long pageNum1) {
		this.pageNum1 = pageNum1;
	}
	public Long getPageNum2() {
		return pageNum2;
	}
	public void setPageNum2(Long pageNum2) {
		this.pageNum2 = pageNum2;
	}
	public Long getPage1() {
		return page1;
	}
	public void setPage1(Long page1) {
		this.page1 = page1;
	}
	public Long getPage2() {
		return page2;
	}
	public void setPage2(Long page2) {
		this.page2 = page2;
	}
	
}
