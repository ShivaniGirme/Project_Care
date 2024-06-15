package care.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import care.dto.Order;

public class OrderCRUD {
	
	public Connection getConnection() throws Exception {
		// 1.Load Driver
		Class.forName("com.mysql.cj.jdbc.Driver");

		// 2.Establish Connection
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/care", "root",
				"root");
		return connection;
	}
	
	public int createOrder(Order order)throws Exception {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(
				"INSERT INTO `ORDER` (ownerId, customerId, productId, productName, price, quantity, totalAmount,buyerName,billingAddress,paymentMode,status) VALUES (?, ?, ?, ?, ?, ?, ?,?,?,?,?);");

		preparedStatement.setInt(1,order.getOwnerId());
		preparedStatement.setInt(2, order.getCustomerId());
		preparedStatement.setInt(3, order.getProductId());
		
		preparedStatement.setString(4, order.getProductName());
		preparedStatement.setDouble(5, order.getPrice());
		preparedStatement.setInt(6, order.getQuantity());
		preparedStatement.setDouble(7, order.getTotalAmount());
		preparedStatement.setString(8, order.getBuyerName());
		preparedStatement.setString(9, order.getBillingAddress());
		preparedStatement.setString(10, order.getPaymentMode());
		preparedStatement.setString(11, order.getStatus());

		int count = preparedStatement.executeUpdate();

		connection.close();
		return count;
	}
	
	public List<Order> getAllOrder(int customerId) throws Exception {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(
			    "SELECT * FROM `ORDER` WHERE customerId = ?;");
			preparedStatement.setInt(1, customerId);
		ResultSet resultset = preparedStatement.executeQuery();
		List<Order> list = new ArrayList<Order>();
		while (resultset.next()) {
			Order order = new Order();
			order.setOrderId(resultset.getInt("orderId"));
			order.setOwnerId(resultset.getInt("ownerId"));
			order.setProductId(resultset.getInt("productId"));
			order.setCustomerId(resultset.getInt("customerId"));
			order.setProductName(resultset.getString("productName"));
			order.setPrice(resultset.getDouble("price"));
			order.setQuantity(resultset.getInt("quantity"));
			order.setTotalAmount(resultset.getDouble("totalAmount"));
			order.setBillingAddress(resultset.getString("billingAddress"));
			order.setBuyerName(resultset.getString("buyerName"));
			order.setPaymentMode(resultset.getString("paymentMode"));
			order.setStatus(resultset.getString("status"));

			list.add(order);
		}
		connection.close();
		return list;
	} 
	
	public List<Order> getAllMyOrder(int ownerId) throws Exception {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(
			    "SELECT * FROM `ORDER` WHERE status='not delivered' and ownerId = ?;");
			preparedStatement.setInt(1, ownerId);
		ResultSet resultset = preparedStatement.executeQuery();
		List<Order> list = new ArrayList<Order>();
		while (resultset.next()) {
			Order order = new Order();
			order.setOrderId(resultset.getInt("orderId"));
			order.setOwnerId(resultset.getInt("ownerId"));
			order.setProductId(resultset.getInt("productId"));
			order.setCustomerId(resultset.getInt("customerId"));
			order.setProductName(resultset.getString("productName"));
			order.setPrice(resultset.getDouble("price"));
			order.setQuantity(resultset.getInt("quantity"));
			order.setTotalAmount(resultset.getDouble("totalAmount"));
			order.setBillingAddress(resultset.getString("billingAddress"));
			order.setBuyerName(resultset.getString("buyerName"));
			order.setPaymentMode(resultset.getString("paymentMode"));
			order.setStatus(resultset.getString("status"));

			list.add(order);
		}
		connection.close();
		return list;
	} 
	
	
	public List<Order> getAllMyPastOrder(int ownerId) throws Exception {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(
			    "SELECT * FROM `ORDER` WHERE status='Delivered' and ownerId = ?;");
			preparedStatement.setInt(1, ownerId);
		ResultSet resultset = preparedStatement.executeQuery();
		List<Order> list = new ArrayList<Order>();
		while (resultset.next()) {
			Order order = new Order();
			order.setOrderId(resultset.getInt("orderId"));
			order.setOwnerId(resultset.getInt("ownerId"));
			order.setProductId(resultset.getInt("productId"));
			order.setCustomerId(resultset.getInt("customerId"));
			order.setProductName(resultset.getString("productName"));
			order.setPrice(resultset.getDouble("price"));
			order.setQuantity(resultset.getInt("quantity"));
			order.setTotalAmount(resultset.getDouble("totalAmount"));
			order.setBillingAddress(resultset.getString("billingAddress"));
			order.setBuyerName(resultset.getString("buyerName"));
			order.setPaymentMode(resultset.getString("paymentMode"));
			order.setStatus(resultset.getString("status"));

			list.add(order);
		}
		connection.close();
		return list;
	} 
	
	
	public Order getOrderById(int orderId) throws Exception {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(
			    "SELECT * FROM `ORDER` WHERE orderId = ?;");
			preparedStatement.setInt(1, orderId);
		ResultSet resultset = preparedStatement.executeQuery();
		Order order = new Order();
		while (resultset.next()) {
			
			order.setOrderId(resultset.getInt("orderId"));
			order.setOwnerId(resultset.getInt("ownerId"));
			order.setProductId(resultset.getInt("productId"));
			order.setCustomerId(resultset.getInt("customerId"));
			order.setProductName(resultset.getString("productName"));
			order.setPrice(resultset.getDouble("price"));
			order.setQuantity(resultset.getInt("quantity"));
			order.setTotalAmount(resultset.getDouble("totalAmount"));
			order.setBillingAddress(resultset.getString("billingAddress"));
			order.setBuyerName(resultset.getString("buyerName"));
			order.setPaymentMode(resultset.getString("paymentMode"));
			order.setStatus(resultset.getString("status"));
		}
		connection.close();
		return order;
	}
	
	public int deleteOrder(int id) throws Exception {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM `ORDER` WHERE orderId=?;");
		preparedStatement.setInt(1, id);
		int result = preparedStatement.executeUpdate();
		connection.close();
		return result;
	}
	
	public int acceptOrder(int id) throws Exception{
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("UPDATE `ORDER` set status='Delivered' WHERE orderId=?;");
		preparedStatement.setInt(1, id);
		int result = preparedStatement.executeUpdate();
		connection.close();
		return result;
	}

}
