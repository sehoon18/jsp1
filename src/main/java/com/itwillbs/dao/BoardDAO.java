package com.itwillbs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.itwillbs.domain.BoardDTO;

public class BoardDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection getConnection() {
		try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
//
//			String dbUrl = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
//			String dbUser = "root";
//			String dbPass = "1234";
//			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
			con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}return con;
	}
	
	public void dbClose() {
		if(con != null) {
			
		try {
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		if(pstmt != null) {
			
		try {
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		if(rs != null) {
			
		try {
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	}
	
	public void insertBoard(BoardDTO bdto) {
		try {

			String sql = "insert into board(num, name, subject, content, date) values(?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bdto.getNum());
			pstmt.setString(2, bdto.getName());
			pstmt.setString(3, bdto.getSubject());
			pstmt.setString(4, bdto.getContent());
			pstmt.setTimestamp(5, bdto.getDate());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
	public int getBoardNum() {
		int num = 0;
		try {
			
			String sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				num = rs.getInt("max(num)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}return num;
	}
	
	public ArrayList<BoardDTO> getBoardList() {
		ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
		try {
			con = getConnection();
			String sql = "select* from board";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
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
			dbClose();
		}return blist;
		
	} 
	
	public BoardDTO getBoardContent(int num) {
		BoardDTO bdto = new BoardDTO();
		try {	
			String sql = "select * from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
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
			dbClose();
		} return bdto;
	}
	
	public void updateReadcount(int num) {
		try {
		
			String sql = "update board set readcount = readcount + 1 where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
	public void updateBoard(BoardDTO bDTO) {
		try {
		
			String sql = "update board set subject = ?, content = ? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bDTO.getSubject());
			pstmt.setString(2, bDTO.getContent());
			pstmt.setInt(3, bDTO.getNum());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	public void deleteBoard(int num) {
		try {
		
			String sql = "delete from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
	
}
