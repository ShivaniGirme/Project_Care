package care;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import care.dao.ProductCRUD;


@WebServlet("/delete")
public class ProductDeleteController  extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		System.out.println(id);
		ProductCRUD crud=new ProductCRUD();
		try {
			int count=crud.deleteProduct(id);
			if(count!=0) {
				System.out.println("hi");
				
				req.setAttribute("message", "Product Deleted");
				RequestDispatcher dispatcher = req.getRequestDispatcher("ownerProductFunctionality.jsp");
				dispatcher.forward(req, resp);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	} 	
}
