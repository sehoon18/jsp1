import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

public class MemberDAO {
	// 멤버 변수
	// 생성자 => 생략시 기본생성자 만듬
	// 멤버 함수(메서드) method
	
	// insertMember() 메서드 정의
	public void insertMember(String id, String pass, String name, Timestamp date) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String dbUrl = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
			String dbUser = "root";
			String dbPass = "1234";
			Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

			String sql = "insert into members(id, pass, name, date) values(?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(3, name);
			pstmt.setTimestamp(4, date);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
		
	}

}
