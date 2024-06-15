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

@WebServlet("/updateStudio")
public class UpdateStudioController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int studioId = Integer.parseInt(req.getParameter("studioId")) ;
		StudioCRUD crud = new StudioCRUD() ;
		try {
			Studio studio =crud.getStudioById(studioId) ;
			if(studio==null) {
				resp.getWriter().println("Lab not Found") ;
				return ;
			}
			req.setAttribute("studio", studio);
			RequestDispatcher dispatcher= req.getRequestDispatcher("editStudio.jsp") ;
			dispatcher.forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int studioId =Integer.parseInt(req.getParameter("studioId")) ;
		String name =req.getParameter("name") ;
		long contact =Long.parseLong(req.getParameter("contact")) ;
		String location =req.getParameter("location") ;
		double fees= Double.parseDouble(req.getParameter("fees")) ;
		int userId =Integer.parseInt(req.getParameter("userId")) ;
		
		Studio studio = new Studio() ;
		studio.setStudioId(studioId);
		studio.setName(name);
		studio.setContact(contact);
		studio.setLocation(location);
		studio.setFees(fees);
		studio.setUserID(userId);
		
		StudioCRUD crud = new StudioCRUD() ;
		try {
			int result = crud.updateStudio(studio) ;
			if(result!=0) {
				req.setAttribute("message", "Studio details update Succesfully");
				RequestDispatcher dispatcher =req.getRequestDispatcher("ownerStudio.jsp") ;
				dispatcher.forward(req, resp);
			}
			
		} catch (Exception e) {
			req.setAttribute("message", "An error occured: " + e.getMessage());
			e.printStackTrace();
		}
	}
}
