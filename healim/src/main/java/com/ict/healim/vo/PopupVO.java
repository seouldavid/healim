package com.ict.healim.vo;

import org.springframework.web.multipart.MultipartFile;

public class PopupVO {
	private String pu_id, pu_title, pu_division, pu_device, pu_start_time, pu_end_time, pu_disable_hours, pu_x, pu_y,
			pu_height, pu_width, pu_subject, pu_content, pu_content_html, crt_by, crt_dt, upd_by, upd_dt, f_name;
	private MultipartFile file_name;
	private String old_f_name;
	
	public String getOld_f_name() {
		return old_f_name;
	}

	public void setOld_f_name(String old_f_name) {
		this.old_f_name = old_f_name;
	}

	public MultipartFile getFile_name() {
		return file_name;
	}

	public void setFile_name(MultipartFile file_name) {
		this.file_name = file_name;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getPu_x() {
		return pu_x;
	}

	public void setPu_x(String pu_x) {
		this.pu_x = pu_x;
	}

	public String getPu_y() {
		return pu_y;
	}

	public void setPu_y(String pu_y) {
		this.pu_y = pu_y;
	}

	public String getPu_id() {
		return pu_id;
	}

	public void setPu_id(String pu_id) {
		this.pu_id = pu_id;
	}

	public String getPu_title() {
		return pu_title;
	}

	public void setPu_title(String pu_title) {
		this.pu_title = pu_title;
	}

	public String getPu_division() {
		return pu_division;
	}

	public void setPu_division(String pu_division) {
		this.pu_division = pu_division;
	}

	public String getPu_device() {
		return pu_device;
	}

	public void setPu_device(String pu_device) {
		this.pu_device = pu_device;
	}

	public String getPu_start_time() {
		return pu_start_time;
	}

	public void setPu_start_time(String pu_start_time) {
		this.pu_start_time = pu_start_time;
	}

	public String getPu_end_time() {
		return pu_end_time;
	}

	public void setPu_end_time(String pu_end_time) {
		this.pu_end_time = pu_end_time;
	}

	public String getPu_disable_hours() {
		return pu_disable_hours;
	}

	public void setPu_disable_hours(String pu_disable_hours) {
		this.pu_disable_hours = pu_disable_hours;
	}

	public String getPu_height() {
		return pu_height;
	}

	public void setPu_height(String pu_height) {
		this.pu_height = pu_height;
	}

	public String getPu_width() {
		return pu_width;
	}

	public void setPu_width(String pu_width) {
		this.pu_width = pu_width;
	}

	public String getPu_subject() {
		return pu_subject;
	}

	public void setPu_subject(String pu_subject) {
		this.pu_subject = pu_subject;
	}

	public String getPu_content() {
		return pu_content;
	}

	public void setPu_content(String pu_content) {
		this.pu_content = pu_content;
	}

	public String getPu_content_html() {
		return pu_content_html;
	}

	public void setPu_content_html(String pu_content_html) {
		this.pu_content_html = pu_content_html;
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
