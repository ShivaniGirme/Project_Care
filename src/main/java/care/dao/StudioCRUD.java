package care.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import care.dto.Studio;


public class StudioCRUD {

	public Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/care", "root", "root");
		return connection;
	}
	
	public int createStudio(Studio studio) throws Exception {
		Connection connection=getConnection() ;
		PreparedStatement statement = connection.prepareStatement("INSERT INTO studio (name,contact,location,fees,userId) VALUES (?,?,?,?,?)") ;
		statement.setString(1, studio.getName());
		statement.setLong(2, studio.getContact());
		statement.setString(3, studio.getLocation());
		statement.setDouble(4, studio.getFees());
		statement.setInt(5,studio.getUserID());
		int count = statement.executeUpdate();

		connection.close();
		return count;
	}
	
	public List<Studio> getAllStudio() throws Exception{
		Connection connection =getConnection() ;
		PreparedStatement statement = connection.prepareStatement("SELECT * FROM studio");
		ResultSet resultSet= statement.executeQuery() ;
		List<Studio> list = new ArrayList<Studio>() ;
		while(resultSet.next()) {
			Studio studio = new Studio() ;
			studio.setStudioId(resultSet.getInt("studioId"));
			studio.setName(resultSet.getString("name"));
			studio.setContact(resultSet.getLong("contact"));
			studio.setLocation(resultSet.getString("location"));
			studio.setFees(resultSet.getDouble("fees"));
			studio.setUserID(resultSet.getInt("userID")) ;
			
			list.add(studio) ;
		}
		connection.close();
		return list ;
	}
	
	public Studio getStudioById(int studioId) throws Exception {
		Studio studio = new Studio() ;
		Connection connection = getConnection() ;
		PreparedStatement statement =connection.prepareStatement("SELECT * FROM studio WHERE studioId=?") ;
		statement.setInt(1, studioId);
		ResultSet resultSet =statement.executeQuery() ;
		while(resultSet.next()) {
			studio.setStudioId(resultSet.getInt("studioId"));
			studio.setName(resultSet.getString("name"));
			studio.setContact(resultSet.getLong("contact"));
			studio.setLocation(resultSet.getString("location"));
			studio.setFees(resultSet.getDouble("fees"));
			studio.setUserID(resultSet.getInt("userId"));
		}
		connection.close(); 
		return studio ;
	}
	
	
	public List<Studio> getStudioByUserId(int userId) throws Exception {
		
		Connection connection = getConnection() ;
		PreparedStatement statement =connection.prepareStatement("SELECT * FROM studio WHERE userId=?") ;
		statement.setInt(1, userId);
		ResultSet resultSet =statement.executeQuery() ;
		List<Studio>list=new ArrayList<Studio>();
		while(resultSet.next()) {
			Studio studio = new Studio() ;
			studio.setStudioId(resultSet.getInt("studioId"));
			studio.setName(resultSet.getString("name"));
			studio.setContact(resultSet.getLong("contact"));
			studio.setLocation(resultSet.getString("location"));
			studio.setFees(resultSet.getDouble("fees"));
			studio.setUserID(resultSet.getInt("userId"));
			list.add(studio);
		}
		connection.close(); 
		return list ;
	}
	
	public int updateStudio(Studio studio) throws Exception {
		Connection connection =getConnection() ;
		String sql ="UPDATE studio SET NAME=?,CONTACT=?,LOCATION=?,FEES=? WHERE studioId=?" ;
		PreparedStatement statement = connection.prepareStatement(sql) ;
		statement.setString(1, studio.getName());
		statement.setLong(2,studio.getContact());
		statement.setString(3, studio.getLocation());
		statement.setDouble(4,studio.getFees());
		statement.setInt(5, studio.getStudioId());
		
		int result =statement.executeUpdate() ;
		connection.close();
		return result ;
 	}
	
	public int deleteStudio(int id) throws Exception {
		Connection connection =getConnection() ;
		PreparedStatement statement = connection.prepareStatement("DELETE FROM studio WHERE studioId=?") ;
		statement.setInt(1, id);
		int result = statement.executeUpdate() ;
		connection.close();
		return result ;	
	}
	
	
}
