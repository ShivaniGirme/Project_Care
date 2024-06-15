package care;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import care.dao.UserCRUD;
import care.dto.SendMail;
import care.dto.User;

@WebServlet("/register")
@MultipartConfig(maxFileSize = 16177215) // 16 MB
public class RegisterController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String email = req.getParameter("email");
		long phone = Long.parseLong(req.getParameter("phone"));
		String address = req.getParameter("address");
		String password = req.getParameter("password");
		String confirmPassword = req.getParameter("confirmpassword");
		String role = req.getParameter("inlineRadioOptions");

		int phoneLength = Long.toString(phone).length();

		Part filePart = req.getPart("file");
		InputStream inputStream = filePart.getInputStream();
		byte[] data = new byte[inputStream.available()];
		inputStream.read(data);

		User user = new User();
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setEmail(email);
		user.setPhone(phone);
		user.setAddress(address);
		user.setPassword(password);
		user.setConfirmPassword(confirmPassword);
		user.setRole(role);
		user.setImageData(data);

		UserCRUD crud = new UserCRUD();

		try {
			User dbUser1 = crud.getAllUserInfoByEmail(email);
			User dbUser2 = crud.getAllUserInfoByPhone(phone);

			RequestDispatcher dispatcher = null;
			if (password.equals(confirmPassword)) {
				if (dbUser1.getEmail() == null && dbUser2.getPhone() == 0 && phoneLength == 10) {
					int count = crud.signUp(user);
					if (count != 0) {
						req.setAttribute("message", "Registration is Done..Please Login!");
						dispatcher = req.getRequestDispatcher("login.jsp");
						
						SendMail mail=new SendMail();
				        int result=mail.sendWelcomeEmail(email);
				        
				        if (result!=0) {
				        	System.out.println("email Sent to"+email);
						}
				        else {
				        	 System.out.println("Something Wrong happens");
				        }
						
						dispatcher.forward(req, resp);
					}
				} else if (dbUser1.getEmail() != null) {
					req.setAttribute("message", "Email address already exist !");
					dispatcher = req.getRequestDispatcher("registration.jsp");
					dispatcher.forward(req, resp);

				} else if (phoneLength != 10) {
					req.setAttribute("message", "Phone number must be 10 digit!");
					dispatcher = req.getRequestDispatcher("registration.jsp");
					dispatcher.forward(req, resp);
				} else {
					req.setAttribute("message", "Phone number address already exist !");
					dispatcher = req.getRequestDispatcher("registration.jsp");
					dispatcher.forward(req, resp);
				}
			} else {
				req.setAttribute("message", "Password and Confirm Password not same !");
				dispatcher = req.getRequestDispatcher("registration.jsp");
				dispatcher.forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
