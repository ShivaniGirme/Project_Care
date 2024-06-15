package care;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import care.dao.UserCRUD;
import care.dto.User;


@WebServlet("/login")
public class LoginController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		UserCRUD crud = new UserCRUD();

		try {
			User user = crud.getAllUserInfoByEmail(email);
			RequestDispatcher dispatcher = null;

			if (user.getPassword() != null) {
				// Starting HTTP session
				HttpSession httpSession = req.getSession();
				httpSession.setAttribute("session", email);
				if (user.getPassword().equals(password) && user.getRole().equalsIgnoreCase("Owner")) {
					dispatcher = req.getRequestDispatcher("ownerHomePage.jsp");
					req.setAttribute("tempUserInfo", user);
					
//					dispatcher = req.getRequestDispatcher("addProduct.jsp");
				} else if (user.getPassword().equals(password) && user.getRole().equalsIgnoreCase("Buyer")) {
					req.setAttribute("tempUserInfo", user);
					dispatcher = req.getRequestDispatcher("buyerHomePage.jsp");
				} else {
					req.setAttribute("message", "invalid Password!");
					dispatcher = req.getRequestDispatcher("login.jsp");
				}

			} else {
				req.setAttribute("message", "User not Register..Please Register!");
				dispatcher = req.getRequestDispatcher("registration.jsp");
			}
			dispatcher.forward(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
