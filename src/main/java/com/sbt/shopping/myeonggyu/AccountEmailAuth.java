package com.sbt.shopping.myeonggyu;

import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

@Service
public class AccountEmailAuth {

    @Autowired
    private JavaMailSender mailSender;
    
    @ResponseBody
    public Map<String, String> sendVerificationEmail(String toEmail) {
        String verificationCode = generateVerificationCode(); // 인증번호 생성 로직 호출

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject("이메일 인증 코드");
        message.setText("인증 코드: " + verificationCode);
        mailSender.send(message);
        
        Map<String, String> response = new HashMap<>();
        response.put("verificationCode", verificationCode);
        System.out.println(response);
        return response; // 생성된 인증번호 반환
    }

    public String generateVerificationCode() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        SecureRandom random = new SecureRandom();
        int length = 8; 
        StringBuilder code = new StringBuilder();

        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(characters.length());
            code.append(characters.charAt(randomIndex));
        }
        return code.toString();
    }
}
