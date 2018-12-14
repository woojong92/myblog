package QnA;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import QnA.QnA;

public class QnA_DAO {
	
	private Connection conn;

	private ResultSet rs;
	
	public QnA_DAO() {
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
	
	public int getNext()
	{
		String SQL = "select bbsID from QnA order by bbsID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int write(String userID, String bbsTitle, String bbsContent)
	{
	
		
		String SQL = "insert into QnA values (?, ?, ?, ?, ?, ?,?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setString(2, userID );
			pstmt.setString(3, bbsTitle );
			pstmt.setString(4, bbsContent );
			pstmt.setString(5, getDate() );
			pstmt.setInt(6,  1 );
			pstmt.setString(7, null );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	

	public ArrayList<QnA> getList(int pageNumber)
	{
		String SQL = "select * from QnA where bbsID < ? AND bbsAvailable = 1 order by bbsID desc limit 10";
		ArrayList<QnA> list = new ArrayList<QnA>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QnA bbs = new QnA();
				bbs.setBbsID(rs.getInt(1) );
				bbs.setBbsUserID(rs.getString(2));
				bbs.setBbsTitle(rs.getString(3));
				bbs.setBbsContent(rs.getString(4));
				bbs.setBbsDate(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public boolean nextPage(int pageNumber)
	{
		String SQL = "select * from QnA where bbsID < ? AND bbsAvailable = 1 order by bbsID desc limit 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; 
	}
	
	public QnA getBbs(int bbsID)
	{
		String SQL = "select * from QnA where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				QnA bbs = new QnA();
				bbs.setBbsID(rs.getInt(1) );
				bbs.setBbsUserID(rs.getString(2));
				bbs.setBbsTitle(rs.getString(3));
				bbs.setBbsContent(rs.getString(4));
				bbs.setBbsDate(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setComment(rs.getString(7));
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	
	public int update(int bbsID, String bbsTitle, String bbsContent)
	{
		String SQL = "update QnA set bbsTitle=?, bbsContent=? where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle );
			pstmt.setString(2, bbsContent );
			pstmt.setInt(3, bbsID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int comment(int bbsID, String comment)
	{
		String SQL = "update QnA set comment=? where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, comment );
			pstmt.setInt(2, bbsID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int delete(int bbsID)
	{
		String SQL = "update QnA set bbsAvailable=0 where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
}
