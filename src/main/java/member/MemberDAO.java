package member;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

public class MemberDAO {
	// 멤버 변수
	// 생성자 => 생략시 기본생성자 만듬
	// 멤버 함수(메서드) method
	
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
	
	// insertMember() 메서드 정의
	public void insertMember(String id, String pass, String name, Timestamp date) {
		try {
			Connection con = getConnection();

			String sql = "insert into members(id, pass, name, date) values(?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(3, name);
			pstmt.setTimestamp(4, date);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("아이디 중복");
		}finally {
			
		}
		
	}
	public boolean userCheck(String id, String pass) {
		boolean result = false;
		try {
			Connection con = getConnection();

			String sql = "select * from members where id = ? and pass = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);

			ResultSet rs = pstmt.executeQuery();
			
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
			
		} return result;
	}
	
	public MemberDTO getInfo(String id) {
		MemberDTO mdto = new MemberDTO();
		try {
			Connection con = getConnection();

			String sql = "select * from members where id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);

			ResultSet rs = pstmt.executeQuery();
			
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
			
		} return mdto;
		
	}
	
	public void updateMember(MemberDTO mdto) {
		try {
			Connection con = getConnection();
			String sql = "update members set name = ? where id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getName());
			pstmt.setString(2, mdto.getId());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
	}
	public void deleteMember(MemberDTO mdto) {
		try {
			Connection con = getConnection();
			String sql = "delete from members where id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getId());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
	}
	
	public ArrayList<MemberDTO> getMemberList() {
		ArrayList<MemberDTO> mlist = new ArrayList<MemberDTO>();
		try {
			Connection con = getConnection();
			
			Class.forName("com.mysql.cj.jdbc.Driver");

			String sql = "select * from members";
			PreparedStatement pstmt = con.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();
			
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
			
		}return mlist;
	}
	

}
