package care;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import care.dao.ArtistCRUD;
import care.dto.Artist;

@WebServlet("/addArtist")
public class AddArtistController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name =req.getParameter("name") ;
		String email = req.getParameter("email") ;
		long  phone =Long.parseLong(req.getParameter("phone")) ;
		String education = req.getParameter("education") ;
		String specialization = req.getParameter("specialization") ;
		double fees = Double.parseDouble(req.getParameter("fees"));
		int experience =Integer.parseInt(req.getParameter("experience")) ;
		int userId=Integer.parseInt(req.getParameter("userId"));
		
		Artist artist = new Artist() ;
		
		artist.setName(name);
		artist.setEmail(email);
		artist.setPhone(phone);
		artist.setEducation(education);
		artist.setSpecialization(specialization);
		artist.setFees(fees);
		artist.setExperience(experience); ;
		artist.setUserId(userId);
		
		ArtistCRUD crud = new ArtistCRUD() ;
		try {
			int result = crud.createArtist(artist) ;
			RequestDispatcher dispatcher = null ;
			if(result !=0) {
				dispatcher=req.getRequestDispatcher("ownerArtist.jsp") ;
				dispatcher.forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
