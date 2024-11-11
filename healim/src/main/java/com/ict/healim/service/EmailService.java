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
			
			// ���� ����
			sendMail.setSubject("��Ƹ� ���� ���� �Դϴ�.");
			
			// ���� ����
			sendMail.setText("<table style='width: 100%; max-width: 600px; margin: 0 auto; background-color: #ffffff; "
	                + "border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); font-family: Arial, sans-serif;'>"
	                + "<tbody>"
	                + "<tr><td style='background-color: #007bff; padding: 20px; text-align: center;'>"
	                + "<h2 style='color: white; margin: 0;'>��Ƹ� ���� ����</h2></td></tr>"
	                + "<tr><td style='padding: 20px; text-align: center;'>"
	                + "<h3 style='color: #233b6b; margin: 0;'>Healim</h3></td></tr>"
	                + "<tr><td style='padding: 10px 20px; text-align: center;'>"
	                + "<font size='5'>���� ��ȣ �ȳ�</font></td></tr>"
	                + "<tr><td style='padding: 10px 20px; text-align: center; background-color: #f4f4f4;'>"
	                + "<font size='6' style='font-weight: bold;'>Ȯ�� ��ȣ: " + randomNumber + "</font></td></tr>"
	                + "<tr><td style='padding: 20px; text-align: center;'>"
	                + "<p style='font-size: 14px; color: #666;'>�� Ȯ�� ��ȣ�� ����Ʈ���� �Է��� �̸��� ������ �Ϸ��� �ּ���.</p>"
	                + "</td></tr>"
	                + "</tbody></table>");
			
			// ���� ����� �̸��ϰ� ����
			sendMail.setForm("healim@gmail.com", "��Ƹ�");
			
			// �޴� ��� �̸���
			sendMail.setTO(toMail);
			sendMail.send();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
