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



@WebServlet("/updateartist")
public class UpdateArtistController extends HttpServlet{

	 @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        int id = Integer.parseInt(req.getParameter("id"));
	        ArtistCRUD artistCRUD = new ArtistCRUD();
	        try {
	        Artist artist = artistCRUD.getAllArtistById(id);
	        
	        if(artist == null) {
	            resp.getWriter().println("Artist not found");
	            return;
	        }
	        
	        req.setAttribute("artist", artist);
	        RequestDispatcher dispatcher = req.getRequestDispatcher("editArtits.jsp"); 
	        dispatcher.forward(req, resp);
	        }catch (Exception e) {
				e.printStackTrace();
			}
	    }
	 
	 @Override
	 protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	     int id = Integer.parseInt(req.getParameter("id"));
	     String name = req.getParameter("name");
	     String email = req.getParameter("email");
	     long phone = Long.parseLong(req.getParameter("phone"));
	     String education = req.getParameter("education");
	     String specialization = req.getParameter("specialization");
	     double fees = Double.parseDouble(req.getParameter("fees"));
	     int experience = Integer.parseInt(req.getParameter("experience"));
	     int userId=Integer.parseInt(req.getParameter("userId"));

	     Artist updatedArtist = new Artist();
	     updatedArtist.setArtistId(id);;
	     updatedArtist.setName(name);
	     updatedArtist.setEmail(email);
	     updatedArtist.setPhone(phone);
	     updatedArtist.setEducation(education);
	     updatedArtist.setSpecialization(specialization);
	     updatedArtist.setFees(fees);
	     updatedArtist.setExperience(experience);
	     updatedArtist.setUserId(userId);;

	     ArtistCRUD artistCRUD = new ArtistCRUD();
	     try {
	         int result = artistCRUD.updateArtist(updatedArtist);
	         if (result != 0) {
	             req.setAttribute("message", "Artits details updated successfully");
	             RequestDispatcher dispatcher = req.getRequestDispatcher("ownerArtist.jsp");
	    	     dispatcher.forward(req, resp);
         }
//	    	     else {
//	             req.setAttribute("message", "Failed to update doctor details");
//	         }
	     } catch (Exception e) {
	         req.setAttribute("message", "An error occurred: " + e.getMessage());
	     }

//	     RequestDispatcher dispatcher = req.getRequestDispatcher("OwnerDoctor.jsp");
//	     dispatcher.forward(req, resp);
	 }

}
