package com.itwillbs.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.itwillbs.domain.MemberDTO;

public class MemberDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;


	// 멤버 변수
	// 생성자 => 생략시 기본생성자 만듬
	// 멤버 함수(메서드) method
	
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
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e3) {
				e3.printStackTrace();
			}
		}
	}
	
	
	// insertMember() 메서드 정의
	public void insertMember(MemberDTO mDTO) {
		try {
			con = getConnection();

			String sql = "insert into members(id, pass, name, date) values(?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mDTO.getId());
			pstmt.setString(2, mDTO.getPass());
			pstmt.setString(3, mDTO.getName());
			pstmt.setTimestamp(4, mDTO.getDate());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("아이디 중복");
		}finally {
			dbClose();
		}
		
	}
	public boolean userCheck(String id, String pass) {
		boolean result = false;
		try {
			con = getConnection();

			String sql = "select * from members where id = ? and pass = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = true;
				System.out.println("로그인 성공");
			} else {
				result = false;
				System.out.println("로그인 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return result;
	}
	
	public MemberDTO getInfo(String id) {
		MemberDTO mdto = new MemberDTO();
		try {
			con = getConnection();

			String sql = "select * from members where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				mdto.setId(rs.getString("id"));
				mdto.setPass(rs.getString("pass"));
				mdto.setName(rs.getString("name"));
				mdto.setDate(rs.getTimestamp("date"));
			} else {
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return mdto;
		
	}
	
	public void updateMember(MemberDTO mdto) {
		try {
			con = getConnection();
			String sql = "update members set name = ? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getName());
			pstmt.setString(2, mdto.getId());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	public void deleteMember(MemberDTO mdto) {
		try {
			con = getConnection();
			String sql = "delete from members where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getId());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
	public ArrayList<MemberDTO> getMemberList() {
		ArrayList<MemberDTO> mlist = new ArrayList<MemberDTO>();
		try {
			con = getConnection();
			
			Class.forName("com.mysql.cj.jdbc.Driver");

			String sql = "select * from members";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO mdto = new MemberDTO();
				mdto.setId(rs.getString("id"));
				mdto.setPass(rs.getString("pass"));
				mdto.setName(rs.getString("name"));
				mdto.setDate(rs.getTimestamp("date"));
				mlist.add(mdto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}return mlist;
	}
	

}
