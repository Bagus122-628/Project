package org.spring.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class EmailService {

	@Autowired
	private JavaMailSender mailSender;

	public void sendMail(String to, String subject, String body) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("gusnanda0703@gmail.com");
		message.setTo(to);
		message.setSubject(subject);
		message.setText(body);
		System.out.println("send message to:" + to);
		mailSender.send(message);
	}

	public void sendPasswordReset(String to, String link) throws MessagingException, UnsupportedEncodingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		String text = "<h3>Reset password link</h3>" + "<p>click link below to change your password</p>" + "<a href= "
				+ link + "><buttom>Change Password</buttom></a>" + "<p>ignore it if its not your request<p>";

		helper.setFrom("gusnanda0703@gmail.com");
		helper.setTo(to);
		helper.setSubject("important");
		helper.setText(text, true);

		mailSender.send(message);
	}
}
