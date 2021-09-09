package fvr;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FvrDAO {
	private Connection conn;
	private ResultSet rs;
	
	public FvrDAO() {
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
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs =pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}
	
	public int getNext() {
		String SQL = "SELECT f_NUM FROM freelist ORDER BY f_NUM DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs =pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int write(String f_Title, String user_ID, String f_Content) {
		String SQL = "INSERT INTO freelist VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, f_Title);
			pstmt.setString(3, user_ID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, f_Content);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public ArrayList<Fvr> getfreeList(int pageNumber) {
		String SQL = "SELECT * FROM freelist WHERE F_NUM < ? AND F_Available = 1 ORDER BY F_NUM DESC LIMIT 10";
		ArrayList<Fvr> freelist = new ArrayList<Fvr>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs =pstmt.executeQuery();
			while(rs.next()) {
				Fvr fvr = new Fvr();
				fvr.setF_NUM(rs.getInt(1));
				fvr.setF_Title(rs.getString(2));
				fvr.setUser_ID(rs.getString(3));
				fvr.setF_DATE(rs.getString(4));
				fvr.setF_Content(rs.getString(5));
				fvr.setF_Available(rs.getInt(6));
				freelist.add(fvr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return freelist;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM freelist WHERE f_NUM < ? AND f_Available = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs =pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Fvr getFvr(int F_NUM) {
		String SQL = "SELECT * FROM freelist WHERE F_NUM = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, F_NUM);
			rs =pstmt.executeQuery();
			if(rs.next()) {
				Fvr fvr = new Fvr();
				fvr.setF_NUM(rs.getInt(1));
				fvr.setF_Title(rs.getString(2));
				fvr.setUser_ID(rs.getString(3));
				fvr.setF_DATE(rs.getString(4));
				fvr.setF_Content(rs.getString(5));
				
				fvr.setF_Available(rs.getInt(6));
				return fvr;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}