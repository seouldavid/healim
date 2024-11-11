package com.ict.healim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
	@Autowired
	private JavaMailSender javaMailSender;
	
	public void sendEmail(String randomNumber, String toMail) {
		try {
			EmailHandler sendMail = new EmailHandler(javaMailSender);
			
			// 메일 제목
			sendMail.setSubject("헤아림 인증 메일 입니다.");
			
			// 메일 내용
			sendMail.setText("<table style='width: 100%; max-width: 600px; margin: 0 auto; background-color: #ffffff; "
	                + "border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); font-family: Arial, sans-serif;'>"
	                + "<tbody>"
	                + "<tr><td style='background-color: #007bff; padding: 20px; text-align: center;'>"
	                + "<h2 style='color: white; margin: 0;'>헤아림 메일 인증</h2></td></tr>"
	                + "<tr><td style='padding: 20px; text-align: center;'>"
	                + "<h3 style='color: #233b6b; margin: 0;'>Healim</h3></td></tr>"
	                + "<tr><td style='padding: 10px 20px; text-align: center;'>"
	                + "<font size='5'>인증 번호 안내</font></td></tr>"
	                + "<tr><td style='padding: 10px 20px; text-align: center; background-color: #f4f4f4;'>"
	                + "<font size='6' style='font-weight: bold;'>확인 번호: " + randomNumber + "</font></td></tr>"
	                + "<tr><td style='padding: 20px; text-align: center;'>"
	                + "<p style='font-size: 14px; color: #666;'>이 확인 번호를 사이트에서 입력해 이메일 인증을 완료해 주세요.</p>"
	                + "</td></tr>"
	                + "</tbody></table>");
			
			// 보낸 사람의 이메일과 제목
			sendMail.setForm("healim@gmail.com", "헤아림");
			
			// 받는 사람 이메일
			sendMail.setTO(toMail);
			sendMail.send();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
