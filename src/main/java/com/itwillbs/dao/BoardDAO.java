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
			
			con = getConnection();
			String sql = "insert into board(num, name, subject, content, readcount, date) values(?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bdto.getNum());
			pstmt.setString(2, bdto.getName());
			pstmt.setString(3, bdto.getSubject());
			pstmt.setString(4, bdto.getContent());
			pstmt.setInt(5, bdto.getReadcount());
			pstmt.setTimestamp(6, bdto.getDate());

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
			con = getConnection();	

			String sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt("max(num)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}return num;
	}
	
	public ArrayList<BoardDTO> getBoardList(PageDTO pDTO) {
		System.out.println("BoardDAO getBoardList()");

		ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
		try {
			con = getConnection();
			String sql = "select* from board order by num desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pDTO.getStartRow() - 1);
			pstmt.setInt(2, pDTO.getPageSize());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO bdto = new BoardDTO();
				bdto.setNum(rs.getInt("num"));
				bdto.setName(rs.getString("name"));
				bdto.setSubject(rs.getString("subject"));
				bdto.setContent(rs.getString("content"));
				bdto.setReadcount(rs.getInt("readcount"));
				bdto.setDate(rs.getTimestamp("date"));
				blist.add(bdto);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return blist;
		
	} 
	
	public BoardDTO getBoardContent(int num) {
		System.out.println("BoardDAO getBoardContent()");

		BoardDTO bdto = new BoardDTO();
		try {
			con = getConnection();
			String sql = "select * from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bdto.setNum(rs.getInt("num"));
				bdto.setName(rs.getString("name"));
				bdto.setSubject(rs.getString("subject"));
				bdto.setContent(rs.getString("content"));
				bdto.setReadcount(rs.getInt("readcount"));
				bdto.setDate(rs.getTimestamp("date"));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return bdto;
	}
	
	public void updateReadcount(int num) {
		System.out.println("BoardDAO updateReadcount()");

		try {
			con = getConnection();	
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
			con = getConnection();	

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
			con = getConnection();	

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

	public int getBoardcount() {
		int count = 0;
		try {
			con = getConnection();	

			String sql = "select count(*) from board";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}return count;
	}
	
	
}
