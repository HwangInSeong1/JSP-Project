package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/movie?serverTimezone=UTC";
			String dbID = "root";
			String dbPW = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPW);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String user_ID, String user_PW) {
		String SQL = "SELECT user_PW FROM USER WHERE user_ID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user_ID);
			rs = pstmt.executeQuery();
			if(rs.next()) { //아이디가 있으면
				if(rs.getString(1).equals(user_PW)) { //비밀번호가 동일하다면
					return 1; //로그인 성공
					}
				else
					return 0;
			}
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUser_ID());
			pstmt.setString(2, user.getUser_PW());
			pstmt.setString(3, user.getUser_NAME());
			pstmt.setString(4, user.getUser_BIRTH());
			pstmt.setString(5, user.getUser_EMAIL());
			pstmt.setString(6, user.getUser_PHONE());
			pstmt.setString(7, user.getUser_GENDER());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}
