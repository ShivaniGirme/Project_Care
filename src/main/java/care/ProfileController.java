package care;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import care.dao.UserCRUD;
import care.dto.User;


@WebServlet("/DisplayProfile")
public class ProfileController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		UserCRUD crud=new UserCRUD();
		User user;
		try {
			user = crud.getAllUserInfoById(id);

			if (user != null) {
				response.setContentType("image/jpeg");
				response.setContentLength(user.getImageData().length);
				response.getOutputStream().write(user.getImageData());
			} else {
				response.getWriter().println("Image not found");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
