package com.ict.healim.vo;

public class MemberVO {
	private String mber_id, password, password_hint, password_cnsr, phone_chk, post_cnt, reply_cnt, violation_count,
			mber_nm, mber_status, detail_adres, mbtlnum, group_id, mber_level, mber_email_adres, sbscrb_de, crt_by,
			crt_dt, upd_by, upd_dt, email_status, adv_status, mber_auth;
	// 추가 tb_member_log 테이블 항목
	private String login_dt, login_ip;

	private String member_delete_reason, deleted_by_admin;
	private int active;

	public String getMember_delete_reason() {
		return member_delete_reason;
	}

	public void setMember_delete_reason(String member_delete_reason) {
		this.member_delete_reason = member_delete_reason;
	}

	public String getDeleted_by_admin() {
		return deleted_by_admin;
	}

	public void setDeleted_by_admin(String deleted_by_admin) {
		this.deleted_by_admin = deleted_by_admin;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public String getPhone_chk() {
		return phone_chk;
	}

	public void setPhone_chk(String phone_chk) {
		this.phone_chk = phone_chk;
	}

	public String getPost_cnt() {
		return post_cnt;
	}

	public void setPost_cnt(String post_cnt) {
		this.post_cnt = post_cnt;
	}

	public String getReply_cnt() {
		return reply_cnt;
	}

	public void setReply_cnt(String reply_cnt) {
		this.reply_cnt = reply_cnt;
	}

	public String getViolation_count() {
		return violation_count;
	}

	public void setViolation_count(String violation_count) {
		this.violation_count = violation_count;
	}

	public String getLogin_dt() {
		return login_dt;
	}

	public void setLogin_dt(String login_dt) {
		this.login_dt = login_dt;
	}

	public String getLogin_ip() {
		return login_ip;
	}

	public void setLogin_ip(String login_ip) {
		this.login_ip = login_ip;
	}

	public String getMber_id() {
		return mber_id;
	}

	public void setMber_id(String mber_id) {
		this.mber_id = mber_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword_hint() {
		return password_hint;
	}

	public void setPassword_hint(String password_hint) {
		this.password_hint = password_hint;
	}

	public String getPassword_cnsr() {
		return password_cnsr;
	}

	public void setPassword_cnsr(String password_cnsr) {
		this.password_cnsr = password_cnsr;
	}

	public String getMber_nm() {
		return mber_nm;
	}

	public void setMber_nm(String mber_nm) {
		this.mber_nm = mber_nm;
	}

	public String getMber_status() {
		return mber_status;
	}

	public void setMber_status(String mber_status) {
		this.mber_status = mber_status;
	}

	public String getDetail_adres() {
		return detail_adres;
	}

	public void setDetail_adres(String detail_adres) {
		this.detail_adres = detail_adres;
	}

	public String getMbtlnum() {
		return mbtlnum;
	}

	public void setMbtlnum(String mbtlnum) {
		this.mbtlnum = mbtlnum;
	}

	public String getGroup_id() {
		return group_id;
	}

	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}

	public String getMber_level() {
		return mber_level;
	}

	public void setMber_level(String mber_level) {
		this.mber_level = mber_level;
	}

	public String getMber_email_adres() {
		return mber_email_adres;
	}

	public void setMber_email_adres(String mber_email_adres) {
		this.mber_email_adres = mber_email_adres;
	}

	public String getSbscrb_de() {
		return sbscrb_de;
	}

	public void setSbscrb_de(String sbscrb_de) {
		this.sbscrb_de = sbscrb_de;
	}

	public String getCrt_by() {
		return crt_by;
	}

	public void setCrt_by(String crt_by) {
		this.crt_by = crt_by;
	}

	public String getCrt_dt() {
		return crt_dt;
	}

	public void setCrt_dt(String crt_dt) {
		this.crt_dt = crt_dt;
	}

	public String getUpd_by() {
		return upd_by;
	}

	public void setUpd_by(String upd_by) {
		this.upd_by = upd_by;
	}

	public String getUpd_dt() {
		return upd_dt;
	}

	public void setUpd_dt(String upd_dt) {
		this.upd_dt = upd_dt;
	}

	public String getEmail_status() {
		return email_status;
	}

	public void setEmail_status(String email_status) {
		this.email_status = email_status;
	}

	public String getAdv_status() {
		return adv_status;
	}

	public void setAdv_status(String adv_status) {
		this.adv_status = adv_status;
	}

	public String getMber_auth() {
		return mber_auth;
	}

	public void setMber_auth(String mber_auth) {
		this.mber_auth = mber_auth;
	}

}