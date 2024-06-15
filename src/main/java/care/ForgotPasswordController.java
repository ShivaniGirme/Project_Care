package care;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import care.dao.UserCRUD;
import care.dto.SendMail;

@WebServlet("/forgotPassword")
public class ForgotPasswordController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String confirmPassword = req.getParameter("confirmpassword");

		try {
			UserCRUD curd = new UserCRUD();
			RequestDispatcher dispatcher = null;
			if (password.equals(confirmPassword)) {
				int result = curd.updatePassword(email, password);
				if (result != 0) {
					req.setAttribute("message", "Password Changed!Please Login!");
					dispatcher = req.getRequestDispatcher("login.jsp");
					doPost(req, resp);
				} else {
					req.setAttribute("usermessage", "Enter Registered mail id !!");
					dispatcher = req.getRequestDispatcher("forgotPassword.jsp");
				}
			} else {

				req.setAttribute("usermessage", "Password and Confirm Password not same !!");
				dispatcher = req.getRequestDispatcher("forgotPassword.jsp");
			}
			dispatcher.forward(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get recipient email from the request parameter
        String to = request.getParameter("email");
        SendMail mail=new SendMail();
        int result=mail.sendemail(to);
        
        if (result!=0) {
        	System.out.println("email Sent to"+to);
		}
        else {
        	 System.out.println("Something Wrong happens");
        }
    }
}
