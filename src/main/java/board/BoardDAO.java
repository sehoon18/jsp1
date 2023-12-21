package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

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
}
