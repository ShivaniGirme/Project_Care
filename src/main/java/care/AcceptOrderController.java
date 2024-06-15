package care;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import care.dao.OrderCRUD;
import care.dao.ProductCRUD;
import care.dto.Order;
import care.dto.Product;

@WebServlet("/acceptit")
public class AcceptOrderController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int Orderid=Integer.parseInt(req.getParameter("id"));
		try {
			RequestDispatcher dispatcher = null;
			OrderCRUD crud=new OrderCRUD();
			Order order=crud.getOrderById(Orderid);
			System.out.println(order.getProductId()+"pid");
			
			ProductCRUD productCRUD=new ProductCRUD();
			Product product=productCRUD.getProductById(order.getProductId());
			if (product!=null) {
				if (product.getQuantity()>=order.getQuantity()) {
					int result =productCRUD.UpdateProductItem(product.getProductId(), product.getQuantity()-order.getQuantity());
					
						if (result2!=0) {
							req.setAttribute("message", "OrderAccept");
							 dispatcher = req.getRequestDispatcher("ownerOrders.jsp");
				             dispatcher.forward(req, resp);
						}
				}else {
					req.setAttribute("message", "Order not Accept because of less quantity");
					 dispatcher = req.getRequestDispatcher("ownerOrders.jsp");
		             dispatcher.forward(req, resp);
				}
				
				
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
