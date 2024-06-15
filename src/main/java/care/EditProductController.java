package care;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import care.dao.ProductCRUD;
import care.dto.Product;

@WebServlet("/editProduct")
public class EditProductController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		double price = Double.parseDouble(req.getParameter("price"));
		String expDate = req.getParameter("exp");
		String mgfDate = req.getParameter("mfg");
		String category = req.getParameter("productType");
		String discription = req.getParameter("discription");
		int quantity = Integer.parseInt(req.getParameter("qty"));
		int userId = Integer.parseInt(req.getParameter("uid"));

		Product product = new Product();
		product.setProductId(id);
		product.setName(name);
		product.setPrice(price);
		product.setExpDate(expDate);
		product.setMgfDate(mgfDate);
		product.setCategory(category);
		product.setDiscription(discription);
		product.setQuantity(quantity);
		product.setUserId(userId);

		ProductCRUD crud = new ProductCRUD();
		try {
			int result = crud.UpdateAddedProduct(product);
			if (result != 0) {
//				req.setAttribute("message", "Product Updated!");
				RequestDispatcher dispatcher = req.getRequestDispatcher("ownerProductFunctionality.jsp");
				dispatcher.forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
