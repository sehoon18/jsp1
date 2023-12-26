package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	
	public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String dbUrl = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
			String dbUser = "root";
			String dbPass = "1234";
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}return con;
	}
	
	public void insertBoard(BoardDTO bdto) {
		try {
			Connection con = getConnection();

			String sql = "insert into board(num, name, subject, content, readcount, date) values(?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bdto.getNum());
			pstmt.setString(2, bdto.getName());
			pstmt.setString(3, bdto.getSubject());
			pstmt.setString(4, bdto.getContent());
			pstmt.setInt(5, bdto.getReadCount());
			pstmt.setTimestamp(6, bdto.getDate());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getBoardNum() {
		int num = 0;
		try {
			Connection con = getConnection();
			
			String sql = "select max(num) from board";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				num = rs.getInt("max(num)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}return num;
	}
	
	public ArrayList<BoardDTO> getBoardList() {
		ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
		try {
			Connection con = getConnection();
			
			String sql = "select* from board";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO bdto = new BoardDTO();
				bdto.setNum(rs.getInt("num"));
				bdto.setName(rs.getString("name"));
				bdto.setSubject(rs.getString("subject"));
				bdto.setContent(rs.getString("content"));
				bdto.setReadCount(rs.getInt("readcount"));
				bdto.setDate(rs.getTimestamp("date"));
				blist.add(bdto);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}return blist;
		
	} 
	
	public BoardDTO getBoardContent(int num) {
		BoardDTO bdto = new BoardDTO();
		try {
			Connection con = getConnection();
			
			String sql = "select * from board where num = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				bdto.setNum(rs.getInt("num"));
				bdto.setName(rs.getString("name"));
				bdto.setSubject(rs.getString("subject"));
				bdto.setContent(rs.getString("content"));
				bdto.setReadCount(rs.getInt("readcount"));
				bdto.setDate(rs.getTimestamp("date"));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		} return bdto;
	}
	
}
