package care;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import care.dao.StudioCRUD;


@WebServlet("/deleteStudio")
public class DeleteStudioController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("studioId"));
		
		StudioCRUD crud = new  StudioCRUD() ;
		try {
			int result =crud.deleteStudio(id) ;
			if(result!=0) {
				req.setAttribute("message","Studio Deleted!");
				RequestDispatcher dispatcher = req.getRequestDispatcher("ownerStudio.jsp");
				dispatcher.forward(req, resp);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
