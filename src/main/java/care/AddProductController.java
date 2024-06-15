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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import care.dao.ProductCRUD;
import care.dto.Product;


@WebServlet("/addProduct")
@MultipartConfig(maxFileSize = 16177215) // 16 MB
public class AddProductController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		double price = Double.parseDouble(req.getParameter("price"));
		String expDate = req.getParameter("expDate");
		String mgfDate = req.getParameter("mgfDate");
		String category = req.getParameter("productType");
		String discription = req.getParameter("discription");
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		int userId = Integer.parseInt(req.getParameter("userId"));
		
		Part filePart = req.getPart("file");
		InputStream inputStream = filePart.getInputStream();
		byte[] data = new byte[inputStream.available()];
		inputStream.read(data);

		Product product = new Product();

		product.setUserId(userId);
		product.setName(name);
		product.setPrice(price);
		product.setExpDate(expDate);
		product.setMgfDate(mgfDate);
		product.setCategory(category);
		product.setDiscription(discription);
		product.setProductimage(data);

//		System.out.println(userId);

		ProductCRUD crud = new ProductCRUD();
//		UserCRUD userCRUD = new UserCRUD();

		try {
			Product dbProduct = crud.getProductByName(name);
			RequestDispatcher dispatcher = null;

			System.out.println(dbProduct.getName());

			if (name.equals(dbProduct.getName())&&userId==dbProduct.getUserId()) {
				
				dbProduct.setQuantity(quantity + dbProduct.getQuantity());
				dbProduct.setExpDate(expDate);
				dbProduct.setMgfDate(mgfDate);
				dbProduct.setPrice(price);
				dbProduct.setDiscription(discription);
				int result = crud.UpdateAddedProduct(dbProduct);
				if (result != 0) {
					req.setAttribute("message", "Product Updated!");
					dispatcher = req.getRequestDispatcher("addProduct.jsp");
					dispatcher.forward(req, resp);
				}
			} else {
				//
				int result = crud.createProduct(product);
				if (result != 0) {
					req.setAttribute("message", "Product Added!");
					dispatcher = req.getRequestDispatcher("addProduct.jsp");
					dispatcher.forward(req, resp);
				}
			}

		} catch (Exception e) {
			// TODO: handle e.xception
			e.printStackTrace();
		}

	}

}
