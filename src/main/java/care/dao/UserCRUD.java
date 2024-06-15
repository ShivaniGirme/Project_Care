package care.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import care.dto.User;

public class UserCRUD {
	public Connection getConnection() throws Exception {
		// 1.Load Driver
		Class.forName("com.mysql.cj.jdbc.Driver");

		// 2.Establish Connection
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/care", "root", "root");
		return connection;
	}
	
	public int signUp(User user) throws Exception {
		Connection connection=getConnection();

		// 3.Create Statements
		PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO USER(firstName, lastName, email, phone, address, password, role,imageData)VALUES(?,?,?,?,?,?,?,?)");
		preparedStatement.setString(1, user.getFirstName());
		preparedStatement.setString(2, user.getLastName());
		preparedStatement.setString(3, user.getEmail());
		preparedStatement.setLong(4,user.getPhone());
		
		preparedStatement.setString(5, user.getAddress());
		preparedStatement.setString(6, user.getPassword());
		preparedStatement.setString(7, user.getRole());
		preparedStatement.setBytes(8, user.getImageData());

		// 4.Execute Statement or Process the Result
		int count = preparedStatement.executeUpdate();

		connection.close();
		return count;
	}
	
	public User getAllUserInfoByEmail(String email) throws Exception {
		User user=new User();
		Connection connection=getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("Select * from user where email=?");
		preparedStatement.setString(1, email);
		ResultSet resultset = preparedStatement.executeQuery();
		while (resultset.next()) {
			user.setUserId(resultset.getInt("userId"));;
			user.setFirstName(resultset.getString("firstName"));
			user.setLastName(resultset.getString("lastName"));
			user.setPhone(resultset.getLong("phone"));
			user.setEmail(resultset.getString("email"));
			user.setAddress(resultset.getString("address"));
			user.setPassword(resultset.getString("password"));
			user.setRole(resultset.getString("role"));
			user.setImageData(resultset.getBytes("imageData"));
		}
		connection.close();
		return user;
	}
	
	public User getAllUserInfoByPhone(Long phone) throws Exception {
		User user=new User();
		Connection connection=getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("Select * from user where phone=?");
		preparedStatement.setLong(1, phone);
		ResultSet resultset = preparedStatement.executeQuery();
		while (resultset.next()) {
			user.setUserId(resultset.getInt("userId"));
			user.setFirstName(resultset.getString("firstName"));
			user.setLastName(resultset.getString("lastName"));
			user.setPhone(resultset.getLong("phone"));
			user.setEmail(resultset.getString("email"));
			user.setAddress(resultset.getString("address"));
			user.setPassword(resultset.getString("password"));
			user.setRole(resultset.getString("role"));
			user.setImageData(resultset.getBytes("imageData"));
		}
		connection.close();
		return user;
	}
	
	public User getAllUserInfoById(int id) throws Exception {
		User user=new User();
		Connection connection=getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("Select * from user where userId=?");
		preparedStatement.setInt(1, id);
		ResultSet resultset = preparedStatement.executeQuery();
		while (resultset.next()) {
			user.setUserId(resultset.getInt("userId"));
			user.setFirstName(resultset.getString("firstName"));
			user.setLastName(resultset.getString("lastName"));
			user.setPhone(resultset.getLong("phone"));
			user.setEmail(resultset.getString("email"));
			user.setAddress(resultset.getString("address"));
			user.setPassword(resultset.getString("password"));
			user.setRole(resultset.getString("role"));
			user.setImageData(resultset.getBytes("imageData"));
		}
		connection.close();
		return user;
	}
	
	public int updateUserInfo(User user) throws Exception {
		Connection connection = getConnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement("UPDATE USER SET firstName=?,lastName=?,email=?,phone=?,address=? WHERE userId=?");
		
		preparedStatement.setString(1, user.getFirstName());
		preparedStatement.setString(2, user.getLastName());
		preparedStatement.setString(3, user.getEmail());
		preparedStatement.setLong(4, user.getPhone());
		preparedStatement.setString(5, user.getAddress());
		preparedStatement.setInt(6, user.getUserId());
//		preparedStatement.setBytes(7, user.getImageData());
		
		int result = preparedStatement.executeUpdate();
		connection.close();
		return result;
	}
	
	public int updatePassword(String email,String password) throws Exception {
		Connection connection = getConnection();

		PreparedStatement preparedStatement = connection.prepareStatement("UPDATE USER SET PASSWORD=? WHERE email=?");
		preparedStatement.setString(1, password);
		preparedStatement.setString(2,email);
		
		
		int result = preparedStatement.executeUpdate();
		connection.close();
		return result;
	}

}
