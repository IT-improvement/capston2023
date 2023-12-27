package com.codingtest.email;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmailController {
	@Autowired  
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "/mailCheck", method =  RequestMethod.GET )	
	@ResponseBody
	public String mailCheck(String email) throws Exception{ //��ȯ���� �ֱ⿡ �޼��� Ÿ�Ե� String
		System.out.println("�̸��� ������ ���� Ȯ��");  //Ȯ�ο�
		System.out.println("���� �̸��� : " + email);  
		
		
		//������ȣ ����
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("������ȣ :"+ checkNum);
		
		
		//�̸��� ���� ����
		String setFrom = "blackpin1927@gmail.com"; //�߽� �̸���
		String toMail = email;         //�޴� �̸���
		String title = "�ܹ��ڵ� ȸ������ ���� �̸��� �Դϴ�.";
		String content = 
						"���� ��ȣ�� " + checkNum + "�Դϴ�." + 
						"�ش� ������ȣ�� ������ȣ Ȯ�ζ��� �����Ͽ� �ּ���.";
		//�̸��� ���� �ڵ�
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum); // ajax�� ��� ��ȯ�� ������ Ÿ���� String Ÿ�Ը� ����
		return num; // String Ÿ������ ��ȯ �� ��ȯ
	}
	
	
}

