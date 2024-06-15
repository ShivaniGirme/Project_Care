package care.dto;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	public int sendemail(String recipientEmail) {
		String to = recipientEmail;
		String from = "";
		String host = "smtp.gmail.com";

		Properties properties = System.getProperties();
		

		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication();
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject("Your Care Account Recovery Request");
			message.setText("Account recovered successfully.\nIf you suspect you were locked out of your account because of changes made by someone else, you should review & protect your account.\nThanks and Regards,\nCare Team");
			System.out.println("Sent email");
			Transport.send(message);
			return 1;
			
		} catch (MessagingException mex) {
			mex.printStackTrace();
			return 0;
		}
	}
	
	public int sendWelcomeEmail(String recipientEmail) {
		String to = recipientEmail;
		String from = "7@gmail.com";
		String host = "smtp.gmail.com";

		Properties properties = System.getProperties();
		
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication();
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject("Welcome to Care!");
			message.setText("Thanks for starting your journey with us..\nMade for you with love from Care :)\nCare Team");
			System.out.println("Sent email");
			Transport.send(message);
			return 1;
			
		} catch (MessagingException mex) {
			mex.printStackTrace();
			return 0;
		}
	}
}
