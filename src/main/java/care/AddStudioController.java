package care;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import care.dao.StudioCRUD;
import care.dto.Studio;



@WebServlet("/addStudio")
public class AddStudioController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name") ;
		String location = req.getParameter("location") ;
		long contact =Long.parseLong(req.getParameter("contact")) ;
		double fees = Double.parseDouble(req.getParameter("fees"));
		int userId = Integer.parseInt(req.getParameter("userId")) ;
		
		Studio studio =new Studio() ;
		
		studio.setName(name);
		studio.setLocation(location);
		studio.setContact(contact);
		studio.setFees(fees);
		studio.setUserID(userId);
		
		StudioCRUD crud = new StudioCRUD() ;
		try {

			int result = crud.createStudio(studio) ;
			RequestDispatcher dispatcher = null ;
		    if (result!=0) {
		        // Redirect to the same page with a success parameter
//		        resp.sendRedirect("ownerLab.jsp?labAdded=true");
		    	dispatcher=req.getRequestDispatcher("ownerStudio.jsp") ;
				dispatcher.forward(req, resp);
		    } else {
		        // Handle failure scenario, maybe redirect to an error page or display an error message
		    }

		} catch (Exception e) {
			// TODO: handle e.xception
			e.printStackTrace();
		}
	}

}
