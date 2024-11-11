package com.ict.healim.service;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class EmailHandler {
	private JavaMailSender javaMailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;
	
	public EmailHandler (JavaMailSender javaMailSender) throws Exception {
		this.javaMailSender = javaMailSender;
		
		message = this.javaMailSender.createMimeMessage();
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	}
	
	// 제목
	public void setSubject(String subject) throws Exception{
		messageHelper.setSubject(subject);
	}
	// 내용
	public void setText(String text) throws Exception{
		messageHelper.setText(text, true);
	}
	// 보낸 사람의 이메일과 제목
	public void setForm(String email, String name) throws Exception{
		messageHelper.setFrom(email, name);
	}
	// 받는 이메일
	public void setTO(String email) throws Exception{
		messageHelper.setTo(email);
	}
	// 보내기
	public void send() {
		javaMailSender.send(message);
	}
}
