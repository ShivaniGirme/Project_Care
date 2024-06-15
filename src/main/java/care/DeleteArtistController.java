package care;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import care.dao.ArtistCRUD;

@WebServlet("/deleteartist")
public class DeleteArtistController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("mee");
		int id =Integer.parseInt(req.getParameter("id")) ;
		
		ArtistCRUD crud = new ArtistCRUD() ;
		try {
			int result =crud.deleteArtist(id) ;
			if(result !=0) {
				System.out.println("Shivani");
				req.setAttribute("message","Artist Deleted!");
				RequestDispatcher dispatcher = req.getRequestDispatcher("ownerArtist.jsp");
				dispatcher.forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
