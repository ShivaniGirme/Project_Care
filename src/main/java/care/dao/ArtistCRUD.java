package care.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import care.dto.Artist;
import care.dto.Product;


public class ArtistCRUD {
	public Connection getConnection() throws Exception {
		// 1.Load Driver
		Class.forName("com.mysql.cj.jdbc.Driver");

		// 2.Establish Connection
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/care", "root", "root");
		return connection;
	}
	
	public int createArtist(Artist  artist) throws Exception {
		Connection connection = getConnection() ;
		
		PreparedStatement statement = connection.prepareStatement("INSERT INTO artist (name,email,phone,education,specialization,fees,experience,userId) VALUES (?,?,?,?,?,?,?,?)") ;
		
		statement.setString(1, artist.getName());
		statement.setString(2, artist.getEmail());
		statement.setLong(3, artist.getPhone());
		statement.setString(4, artist.getEducation());
		statement.setString(5, artist.getSpecialization());
		statement.setDouble(6, artist.getFees());
		statement.setInt(7, artist.getExperience());
		statement.setInt(8, artist.getUserId());		
		int count =statement.executeUpdate() ;
		connection.close();
		return count ;
	}
	
	public List<Artist> getAllArtist() throws Exception{
		Connection connection = getConnection() ;
		PreparedStatement statement = connection.prepareStatement("SELECT * FROM Artist") ;
		ResultSet resultSet = statement.executeQuery() ;
		List<Artist> list = new ArrayList<Artist>() ;
		while(resultSet.next()) {
			Artist artist = new Artist() ;
			artist.setArtistId(resultSet.getInt("artistId"));
			artist.setName(resultSet.getString("name"));
			artist.setEmail(resultSet.getString("email"));
			artist.setPhone(resultSet.getLong("phone"));
			artist.setEducation(resultSet.getString("education"));
			artist.setSpecialization(resultSet.getString("specialization"));
			artist.setFees(resultSet.getDouble("fees"));
			artist.setExperience(resultSet.getInt("experience"));
			artist.setUserId(resultSet.getInt("userId"));
			list.add(artist);	
		}
		connection.close();
		return list ;
	}
	
	public int updateArtist(Artist artist) throws Exception {
		Connection connection =getConnection() ;
		String sql= "UPDATE Artist SET NAME=?,EMAIL=?,PHONE=?,EDUCATION=?,SPECIALIZATION=?,FEES=?,EXPERIENCE=?,userId=? WHERE artistId=?";
		PreparedStatement statement = connection.prepareStatement(sql) ;
		statement.setString(1, artist.getName());
		statement.setString(2, artist.getEmail());
		statement.setLong(3, artist.getPhone());
		statement.setString(4, artist.getEducation());
		statement.setString(5, artist.getSpecialization());
		statement.setDouble(6, artist.getFees());
		statement.setInt(7, artist.getExperience());
		statement.setInt(8, artist.getUserId());
		statement.setInt(9, artist.getArtistId());
		
		int result =statement.executeUpdate() ;
		connection.close(); 
		return result ;
	}
	
	public Artist getAllArtistById(int artistId) throws Exception {
		Artist artist= new Artist() ;
		Connection connection = getConnection() ;
		PreparedStatement statement =connection.prepareStatement("SELECT * FROM Artist WHERE artistId=?") ;
		statement.setInt(1, artistId);
		ResultSet  set = statement.executeQuery() ;
		while(set.next()) {
			artist.setArtistId(set.getInt("artistId"));
			artist.setName(set.getString("name"));
			artist.setEmail(set.getString("email"));
			artist.setPhone(set.getLong("phone"));
			artist.setEducation(set.getString("education"));
			artist.setSpecialization(set.getString("specialization"));
			artist.setFees(set.getDouble("fees"));
			artist.setExperience(set.getInt("experience"));	
			artist.setUserId(set.getInt("userId"));
		}
		connection.close();
		return artist;
	}
	
	
	public List<Artist> getAllArtistByUserId(int userId) throws Exception {
		
		Connection connection = getConnection() ;
		PreparedStatement statement =connection.prepareStatement("SELECT * FROM Artist WHERE userId=?") ;
		statement.setInt(1, userId);
		List<Artist> list = new ArrayList<Artist>();
		ResultSet  set = statement.executeQuery() ;
		while(set.next()) {
			Artist artist= new Artist() ;
			artist.setArtistId(set.getInt("artistId"));
			artist.setName(set.getString("name"));
			artist.setEmail(set.getString("email"));
			artist.setPhone(set.getLong("phone"));
			artist.setEducation(set.getString("education"));
			artist.setSpecialization(set.getString("specialization"));
			artist.setFees(set.getDouble("fees"));
			artist.setExperience(set.getInt("experience"));	
			artist.setUserId(set.getInt("userId"));
			list.add(artist);
		}
		connection.close();
		return list;
	}
	
	
	
	public Artist getAllArtistByEmail(String email) throws Exception {
		Artist artist= new Artist() ;
		Connection connection = getConnection() ;
		PreparedStatement statement =connection.prepareStatement("SELECT * FROM Artist WHERE EMAIL=?") ;
		statement.setString(1, email);
		ResultSet  set = statement.executeQuery() ;
		while(set.next()) {
			artist.setArtistId(set.getInt("artistId"));
			artist.setName(set.getString("name"));
			artist.setEmail(set.getString("email"));
			artist.setPhone(set.getLong("phone"));
			artist.setEducation(set.getString("education"));
			artist.setSpecialization(set.getString("specialization"));
			artist.setFees(set.getDouble("fees"));
			artist.setExperience(set.getInt("experience"));
			artist.setUserId(set.getInt("userId"));
		}
		connection.close();
		return artist;
	}
	
	public int deleteArtist(int id) throws Exception {
		Connection connection=getConnection() ;
		PreparedStatement preparedStatement=connection.prepareStatement("DELETE FROM Artist WHERE artistId=?") ;
		preparedStatement.setInt(1,id);
		int result = preparedStatement.executeUpdate();
		connection.close();
		return result;
	}


}
