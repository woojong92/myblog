package member;

import java.sql.*;
import java.util.ArrayList;

import member.member;

public class member_DAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public member_DAO() {
		try {
			String dbURL = "jdbc:mysql://203.230.193.204:3306/201521644";
			String dbID ="201521644";
			String dbPassword="201521644";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate()
	{
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //db error
	}
	
	public member getInfo(String UID) {
		String SQL = "select * from Member where uid = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, UID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member info = new member();
				info.setUid(rs.getString(1) );
				info.setPasswd(rs.getString(2));
				info.setEmail(rs.getString(3));
				info.setName(rs.getString(4));
				info.setDate(rs.getString(5));
				info.setAvailable(rs.getInt(6));				
				return info;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	


	
	public int login(String userID, String userPassword)
	{
		String SQL = "select passwd, available From Member where uid =?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			
			
			if( rs.next())
			{	
				if(rs.getInt(2)==0) return -3;
				if(rs.getString(1).equals(userPassword))
					return 1; //login success
				else
					return 0; //password error
			}
			return -1; //id not exist
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -2; //db error
	}
	
	public int join(member member)
	{
		String SQL = "insert into Member values (?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,member.getUid());
			pstmt.setString(2,member.getPasswd());
			pstmt.setString(3,member.getName());
			pstmt.setString(4,member.getEmail());
			pstmt.setString(5, getDate());
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
	
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int update(String uid, String passwd, String name, String email)
	{
		String SQL = "update Member set passwd=?, name=?, email=? where uid=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, passwd );
			pstmt.setString(2, name );
			pstmt.setString(3, email );
			pstmt.setString(4, uid );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int delete(String UID)
	{
		String SQL = "update Member set available=0 where uid=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, UID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	
}