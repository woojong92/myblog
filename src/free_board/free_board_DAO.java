package free_board;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import free_board.free_board;


public class free_board_DAO {
	private Connection conn;

	private ResultSet rs;
	
	public free_board_DAO() {
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
		String SQL = "select bbsID from free_board order by bbsID desc";
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
	
	public int write(String userID, String bbsTitle,  String bbsContent, String bbsFileName)
	{
	
		File imgFile = new File(bbsFileName);
		String realFileName = imgFile.getName();
		FileInputStream fin = null;
		try {
			fin = new FileInputStream(imgFile);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String SQL = "insert into free_board values (?, ?, ?, ?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setString(2, userID );
			pstmt.setString(3, bbsTitle );
			pstmt.setString(4, bbsContent );
			pstmt.setString(5, getDate() );
			if( fin != null ) pstmt.setBinaryStream(6, fin, (int)imgFile.length() ); //파일 데이터
			pstmt.setString(7, realFileName );
			pstmt.setInt(8,  1 );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int write(String userID, String bbsTitle,  String bbsContent)
	{
	
		String SQL = "insert into free_board values (?, ?, ?, ?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setString(2, userID );
			pstmt.setString(3, bbsTitle );
			pstmt.setString(4, bbsContent );
			pstmt.setString(5, getDate() );
			pstmt.setBinaryStream(6, null); //파일 데이터
			pstmt.setString(7, null );
			pstmt.setInt(8,  1 );

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	

	public ArrayList<free_board> getList(int pageNumber)
	{
		String SQL = "select * from free_board where bbsID < ? AND bbsAvailable = 1 order by bbsID desc limit 10";
		ArrayList<free_board> list = new ArrayList<free_board>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				free_board bbs = new free_board();
				bbs.setBbsID(rs.getInt(1) );
				bbs.setBbsUserID(rs.getString(2));
				bbs.setBbsTitle(rs.getString(3));
				bbs.setBbsContent(rs.getString(4));
				bbs.setBbsDate(rs.getString(5));
				
				bbs.setBbsFileData(rs.getBinaryStream(6));
				bbs.setBbsFileName(rs.getString(7));
				
				bbs.setBbsAvailable(rs.getInt(8));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public boolean nextPage(int pageNumber)
	{
		String SQL = "select * from free_board where bbsID < ? AND bbsAvailable = 1 order by bbsID desc limit 10";
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
	
	public free_board getBbs(int bbsID)
	{
		String SQL = "select * from free_board where bbsID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				free_board bbs = new free_board();
				bbs.setBbsID(rs.getInt(1) );
				bbs.setBbsUserID(rs.getString(2));
				bbs.setBbsTitle(rs.getString(3));
				bbs.setBbsContent(rs.getString(4));
				bbs.setBbsDate(rs.getString(5));
				
				bbs.setBbsFileData(rs.getBinaryStream(6));
				bbs.setBbsFileName(rs.getString(7));
				
				bbs.setBbsAvailable(rs.getInt(8));
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	
	public int update(int bbsID, String bbsTitle, String bbsContent)
	{
		String SQL = "update free_board set bbsTitle=?, bbsContent=? where bbsID=?";
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
	
	public int delete(int bbsID)
	{
		String SQL = "update free_board set bbsAvailable=0 where bbsID=?";
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
