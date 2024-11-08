package com.example.SWPKoiContructor.services.functionalService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;

@Service
public class EmailService {

    
    private JavaMailSender mailSender;

    public EmailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }
    
    

    public void sendPasswordResetEmail(String toEmail, String resetUrl) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject("Password Reset Request");
        message.setText("Click the following link to reset your password: " + resetUrl);
        mailSender.send(message);
    }


    public void     sendThankYouEmail(String toEmail, String recipientName){
        String subject="HappiKoi recognized your payment! Thank You";
        String htmlContent= createThankYouEmailHtml(recipientName);

        MimeMessage mimeMessage= mailSender.createMimeMessage();
        MimeMessageHelper helper= new MimeMessageHelper(mimeMessage,"utf-8");

     try{
         helper.setTo(toEmail);
         helper.setSubject(subject);
         helper.setText(htmlContent,true);
         mailSender.send(mimeMessage);
         System.out.println("HTML THANK YOU SENT SUCCESSFULLY TO"+ toEmail);
     }catch(Exception e){
         System.out.println(e.getMessage());
     }
    }


    private String createThankYouEmailHtml(String recipientName) {
        if (recipientName == null) {
            recipientName = "Sir";
        }

        return "<html>" +
                "<head>" +
                "<link href='https://fonts.googleapis.com/css2?family=Exo:wght@400;600&display=swap' rel='stylesheet'>" + // Link to Exo font
                "<style>" +
                "    body { font-family: 'Exo', sans-serif; }" +
                "    .email-card { " +
                "        max-width: 600px; " +
                "        margin: 0 auto; " +
                "        padding: 20px; " +
                "        font-family: 'Exo', sans-serif; " + // Use Exo font
                "        background-color: #1b1b1b; " +
                "        border-radius: 8px; " +
                "        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); " +
                "        color: #ffffff; " +
                "        text-align: center; " +
                "    }" +
                "    .email-card h1 { " +
                "        color: #df2453; " +
                "        font-size: 24px; " +
                "        font-weight: 600; " + // Bold for header
                "        margin-bottom: 20px; " +
                "    }" +
                "    .email-card p { " +
                "        color: #f1f1f1; " +
                "        font-size: 16px; " +
                "        line-height: 1.6; " +
                "        margin-bottom: 15px; " +
                "    }" +
                "    .email-button { " +
                "        display: inline-block; " +
                "        padding: 10px 20px; " +
                "        margin-top: 20px; " +
                "        color: #ffffff; " +
                "        background-color: #df2453; " +
                "        text-decoration: none; " +
                "        border-radius: 5px; " +
                "        font-weight: 600;" + // Bold for button text
                "    }" +
                "    .email-button:hover { background-color: #c0392b; }" +
                "</style>" +
                "</head>" +
                "<body>" +
                "<div class='email-card'>" +
                "    <h1>Thank You, " + recipientName + "!</h1>" +
                "    <p>Your payment was successfully processed, and we are excited to help bring your koi pond vision to life with Happy Koi!</p>" +
                "    <p>We greatly appreciate your trust in us for your koi pond construction and services. Our team is committed to delivering excellence and ensuring your satisfaction every step of the way.</p>" +
                "    <p>If you have any questions or need further assistance, please feel free to reach out to our support team at any time.</p>" +
                "    <p>Warm regards,<br>Happy Koi Team</p>" +
                "</div>" +
                "</body>" +
                "</html>";
    }


}