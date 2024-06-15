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
import care.dto.User;


@WebServlet("/update")
@MultipartConfig(maxFileSize = 16177215) // 16 MB

public class UpdateProfileController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		String firstName=req.getParameter("fName");
		String lastName=req.getParameter("lName");
		String email=req.getParameter("email");
		long phone=Long.parseLong(req.getParameter("phone"));
		String address=req.getParameter("address");
		
		
		User user=new User();
		user.setUserId(id);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setEmail(email);
		user.setPhone(phone);
		user.setAddress(address);
		
		UserCRUD crud=new UserCRUD();
		try {
			User dbUser=crud.getAllUserInfoByEmail(email);
			int result=crud.updateUserInfo(user);
			if(result!=0 && dbUser.getRole().equalsIgnoreCase("Buyer"))
				
			{
				req.setAttribute("message", "Profile Updated");
				RequestDispatcher dispatcher = req.getRequestDispatcher("profile.jsp");
				dispatcher.forward(req, resp);
			}
			else if(result!=0 && dbUser.getRole().equalsIgnoreCase("Owner")) {
				req.setAttribute("message", "Profile Updated");
				RequestDispatcher dispatcher = req.getRequestDispatcher("ownerProfile.jsp");
				dispatcher.forward(req, resp);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
