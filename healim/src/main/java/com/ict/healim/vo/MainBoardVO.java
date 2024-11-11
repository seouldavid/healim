package com.ict.healim.vo;

import org.springframework.web.multipart.MultipartFile;

public class MainBoardVO {
	private String wr_id, bbs_id, wr_subject, wr_content, answer_at, parent_id, 
	answer_lc, sort_ordr, rdcnt, use_at, start_dt, end_dt, mber_id, mber_nm, password,h_score, 
	atch_file_id,old_atch_file_id,upd_by,crt_dt, upd_dt,group_id,wr_active, issue, issue_option,issue_post,issue_people;
	private int h_id,childCount;
	public long daysDifference;
	private MultipartFile file_name;
	
	

	public String getIssue() {
		return issue;
	}
	public void setIssue(String issue) {
		this.issue = issue;
	}
	public String getIssue_option() {
		return issue_option;
	}
	public void setIssue_option(String issue_option) {
		this.issue_option = issue_option;
	}
	public String getIssue_post() {
		return issue_post;
	}
	public void setIssue_post(String issue_post) {
		this.issue_post = issue_post;
	}
	public String getIssue_people() {
		return issue_people;
	}
	public void setIssue_people(String issue_people) {
		this.issue_people = issue_people;
	}
	public String getH_score() {
		return h_score;
	}
	public void setH_score(String h_score) {
		this.h_score = h_score;
	}
	public long getDaysDifference() {
		return daysDifference;
	}
	public void setDaysDifference(long daysDifference) {
		this.daysDifference = daysDifference;
	}
	public int getChildCount() {
		return childCount;
	}
	public void setChildCount(int childCount) {
		this.childCount = childCount;
	}
	public String getWr_active() {
		return wr_active;
	}
	public void setWr_active(String wr_active) {
		this.wr_active = wr_active;
	}
	public String getWr_id() {
		return wr_id;
	}
	public void setWr_id(String wr_id) {
		this.wr_id = wr_id;
	}
	public String getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(String bbs_id) {
		this.bbs_id = bbs_id;
	}
	public String getWr_subject() {
		return wr_subject;
	}
	public void setWr_subject(String wr_subject) {
		this.wr_subject = wr_subject;
	}
	public String getWr_content() {
		return wr_content;
	}
	public void setWr_content(String wr_content) {
		this.wr_content = wr_content;
	}
	public String getAnswer_at() {
		return answer_at;
	}
	public void setAnswer_at(String answer_at) {
		this.answer_at = answer_at;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public String getAnswer_lc() {
		return answer_lc;
	}
	public void setAnswer_lc(String answer_lc) {
		this.answer_lc = answer_lc;
	}
	public String getSort_ordr() {
		return sort_ordr;
	}
	public void setSort_ordr(String sort_ordr) {
		this.sort_ordr = sort_ordr;
	}
	public String getRdcnt() {
		return rdcnt;
	}
	public void setRdcnt(String rdcnt) {
		this.rdcnt = rdcnt;
	}
	public String getUse_at() {
		return use_at;
	}
	public void setUse_at(String use_at) {
		this.use_at = use_at;
	}
	public String getStart_dt() {
		return start_dt;
	}
	public void setStart_dt(String start_dt) {
		this.start_dt = start_dt;
	}
	public String getEnd_dt() {
		return end_dt;
	}
	public void setEnd_dt(String end_dt) {
		this.end_dt = end_dt;
	}
	public String getMber_id() {
		return mber_id;
	}
	public void setMber_id(String mber_id) {
		this.mber_id = mber_id;
	}
	public String getMber_nm() {
		return mber_nm;
	}
	public void setMber_nm(String mber_nm) {
		this.mber_nm = mber_nm;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAtch_file_id() {
		return atch_file_id;
	}
	public void setAtch_file_id(String atch_file_id) {
		this.atch_file_id = atch_file_id;
	}
	public String getOld_atch_file_id() {
		return old_atch_file_id;
	}
	public void setOld_atch_file_id(String old_atch_file_id) {
		this.old_atch_file_id = old_atch_file_id;
	}
	public int getH_id() {
		return h_id;
	}
	public void setH_id(int h_id) {
		this.h_id = h_id;
	}
	public String getUpd_by() {
		return upd_by;
	}
	public void setUpd_by(String upd_by) {
		this.upd_by = upd_by;
	}
	public String getCrt_dt() {
		return crt_dt;
	}
	public void setCrt_dt(String crt_dt) {
		this.crt_dt = crt_dt;
	}
	public String getUpd_dt() {
		return upd_dt;
	}
	public void setUpd_dt(String upd_dt) {
		this.upd_dt = upd_dt;
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public MultipartFile getFile_name() {
		return file_name;
	}
	public void setFile_name(MultipartFile file_name) {
		this.file_name = file_name;
	}
	
	
	

	
	
	
	
	
	
}
