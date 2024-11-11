package com.ict.healim.vo;

import org.springframework.web.multipart.MultipartFile;

public class HosptVO {
	private String h_id , h_name , h_type , zipcode , city_code , city_name , open_date , addr , latitude , longitude , grade , 
	  type_code , type_name , bed_cnt , room_cnt , treatment , area , doc_cnt, operator , reg_cnt , curr_cnt , care_cnt , 
	  social_cnt , nurse_cnt , nutri_cnt , recommend,  hit_cnt, crt_by , crt_dt, upd_by , upd_dt , tel_no, remarks, f_name1, f_name2, ori_f_name1, ori_f_name2 , file_cnt, email , extraAddress;

	public String getExtraAddress() {
		return extraAddress;
	}

	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFile_cnt() {
		return file_cnt;
	}

	public void setFile_cnt(String file_cnt) {
		this.file_cnt = file_cnt;
	}

	public String getOri_f_name1() {
		return ori_f_name1;
	}

	public void setOri_f_name1(String ori_f_name1) {
		this.ori_f_name1 = ori_f_name1;
	}

	public String getOri_f_name2() {
		return ori_f_name2;
	}

	public void setOri_f_name2(String ori_f_name2) {
		this.ori_f_name2 = ori_f_name2;
	}

	public String getF_name1() {
		return f_name1;
	}

	public void setF_name1(String f_name1) {
		this.f_name1 = f_name1;
	}

	public String getF_name2() {
		return f_name2;
	}

	public void setF_name2(String f_name2) {
		this.f_name2 = f_name2;
	}

	private MultipartFile file_1, file_2;
	
	public MultipartFile getFile_1() {
		return file_1;
	}

	public void setFile_1(MultipartFile file_1) {
		this.file_1 = file_1;
	}

	public MultipartFile getFile_2() {
		return file_2;
	}

	public void setFile_2(MultipartFile file_2) {
		this.file_2 = file_2;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getTel_no() {
		return tel_no;
	}

	public void setTel_no(String tel_no) {
		this.tel_no = tel_no;
	}

	public String getH_id() {
		return h_id;
	}

	public void setH_id(String h_id) {
		this.h_id = h_id;
	}

	public String getH_name() {
		return h_name;
	}

	public void setH_name(String h_name) {
		this.h_name = h_name;
	}

	public String getH_type() {
		return h_type;
	}

	public void setH_type(String h_type) {
		this.h_type = h_type;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getCity_code() {
		return city_code;
	}

	public void setCity_code(String city_code) {
		this.city_code = city_code;
	}

	public String getCity_name() {
		return city_name;
	}

	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}

	public String getOpen_date() {
		return open_date;
	}

	public void setOpen_date(String open_date) {
		this.open_date = open_date;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getType_code() {
		return type_code;
	}

	public void setType_code(String type_code) {
		this.type_code = type_code;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public String getBed_cnt() {
		return bed_cnt;
	}

	public void setBed_cnt(String bed_cnt) {
		this.bed_cnt = bed_cnt;
	}

	public String getRoom_cnt() {
		return room_cnt;
	}

	public void setRoom_cnt(String room_cnt) {
		this.room_cnt = room_cnt;
	}

	public String getTreatment() {
		return treatment;
	}

	public void setTreatment(String treatment) {
		this.treatment = treatment;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getDoc_cnt() {
		return doc_cnt;
	}

	public void setDoc_cnt(String doc_cnt) {
		this.doc_cnt = doc_cnt;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getReg_cnt() {
		return reg_cnt;
	}

	public void setReg_cnt(String reg_cnt) {
		this.reg_cnt = reg_cnt;
	}

	public String getCurr_cnt() {
		return curr_cnt;
	}

	public void setCurr_cnt(String curr_cnt) {
		this.curr_cnt = curr_cnt;
	}

	public String getCare_cnt() {
		return care_cnt;
	}

	public void setCare_cnt(String care_cnt) {
		this.care_cnt = care_cnt;
	}

	public String getSocial_cnt() {
		return social_cnt;
	}

	public void setSocial_cnt(String social_cnt) {
		this.social_cnt = social_cnt;
	}

	public String getNurse_cnt() {
		return nurse_cnt;
	}

	public void setNurse_cnt(String nurse_cnt) {
		this.nurse_cnt = nurse_cnt;
	}

	public String getNutri_cnt() {
		return nutri_cnt;
	}

	public void setNutri_cnt(String nutri_cnt) {
		this.nutri_cnt = nutri_cnt;
	}

	public String getRecommend() {
		return recommend;
	}

	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}

	public String getHit_cnt() {
		return hit_cnt;
	}

	public void setHit_cnt(String hit_cnt) {
		this.hit_cnt = hit_cnt;
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
	
	

}
