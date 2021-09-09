package mvr;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MvrDAO {
	private Connection conn;
	private ResultSet rs;
	
	public MvrDAO() {
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
		String SQL = "SELECT r_NUM FROM mvrlist ORDER BY r_NUM DESC";
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
	
	public int write(String r_Title, String user_ID, String r_Content, String m_Name, float m_Score) {
		String SQL = "INSERT INTO mvrlist VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, r_Title);
			pstmt.setString(3, user_ID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, r_Content);
			pstmt.setString(6, m_Name);
			pstmt.setFloat(7, m_Score);
			pstmt.setInt(8, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public ArrayList<Mvr> getList(int pageNumber) {
		String SQL = "SELECT * FROM mvrlist WHERE R_NUM < ? AND R_Available = 1 ORDER BY R_NUM DESC LIMIT 10";
		ArrayList<Mvr> list = new ArrayList<Mvr>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs =pstmt.executeQuery();
			while(rs.next()) {
				Mvr mvr = new Mvr();
				mvr.setR_NUM(rs.getInt(1));
				mvr.setR_Title(rs.getString(2));
				mvr.setUser_ID(rs.getString(3));
				mvr.setR_DATE(rs.getString(4));
				mvr.setR_Content(rs.getString(5));
				mvr.setM_Name(rs.getString(6));
				mvr.setM_Score(rs.getFloat(7));
				mvr.setR_Available(rs.getInt(8));
				list.add(mvr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Mvr> getList01() {
		String SQL = "SELECT * FROM mvrlist WHERE M_Name='조커' AND R_Available = 1 ORDER BY R_NUM DESC";
		ArrayList<Mvr> list01 = new ArrayList<Mvr>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs =pstmt.executeQuery();
			while(rs.next()) {
				Mvr mvr = new Mvr();
				mvr.setR_NUM(rs.getInt(1));
				mvr.setR_Title(rs.getString(2));
				mvr.setUser_ID(rs.getString(3));
				mvr.setR_DATE(rs.getString(4));
				mvr.setR_Content(rs.getString(5));
				mvr.setM_Name(rs.getString(6));
				mvr.setM_Score(rs.getFloat(7));
				mvr.setR_Available(rs.getInt(8));
				list01.add(mvr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list01;
	}
	
	public ArrayList<Mvr> getList02() {
		String SQL = "SELECT * FROM mvrlist WHERE M_Name='어벤져스' AND R_Available = 1 ORDER BY R_NUM DESC";
		ArrayList<Mvr> list02 = new ArrayList<Mvr>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs =pstmt.executeQuery();
			while(rs.next()) {
				Mvr mvr = new Mvr();
				mvr.setR_NUM(rs.getInt(1));
				mvr.setR_Title(rs.getString(2));
				mvr.setUser_ID(rs.getString(3));
				mvr.setR_DATE(rs.getString(4));
				mvr.setR_Content(rs.getString(5));
				mvr.setM_Name(rs.getString(6));
				mvr.setM_Score(rs.getFloat(7));
				mvr.setR_Available(rs.getInt(8));
				list02.add(mvr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list02;
	}
	
	public ArrayList<Mvr> getList03() {
		String SQL = "SELECT * FROM mvrlist WHERE M_Name='봉오동전투' AND R_Available = 1 ORDER BY R_NUM DESC";
		ArrayList<Mvr> list03 = new ArrayList<Mvr>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs =pstmt.executeQuery();
			while(rs.next()) {
				Mvr mvr = new Mvr();
				mvr.setR_NUM(rs.getInt(1));
				mvr.setR_Title(rs.getString(2));
				mvr.setUser_ID(rs.getString(3));
				mvr.setR_DATE(rs.getString(4));
				mvr.setR_Content(rs.getString(5));
				mvr.setM_Name(rs.getString(6));
				mvr.setM_Score(rs.getFloat(7));
				mvr.setR_Available(rs.getInt(8));
				list03.add(mvr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list03;
	}
	
	public ArrayList<Mvr> getList04() {
		String SQL = "SELECT * FROM mvrlist WHERE M_Name='기생충' AND R_Available = 1 ORDER BY R_NUM DESC";
		ArrayList<Mvr> list04 = new ArrayList<Mvr>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs =pstmt.executeQuery();
			while(rs.next()) {
				Mvr mvr = new Mvr();
				mvr.setR_NUM(rs.getInt(1));
				mvr.setR_Title(rs.getString(2));
				mvr.setUser_ID(rs.getString(3));
				mvr.setR_DATE(rs.getString(4));
				mvr.setR_Content(rs.getString(5));
				mvr.setM_Name(rs.getString(6));
				mvr.setM_Score(rs.getFloat(7));
				mvr.setR_Available(rs.getInt(8));
				list04.add(mvr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list04;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM mvrlist WHERE R_NUM < ? AND R_Available = 1";
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
	
	public Mvr getMvr(int R_NUM) {
		String SQL = "SELECT * FROM mvrlist WHERE R_NUM = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, R_NUM);
			rs =pstmt.executeQuery();
			if(rs.next()) {
				Mvr mvr = new Mvr();
				mvr.setR_NUM(rs.getInt(1));
				mvr.setR_Title(rs.getString(2));
				mvr.setUser_ID(rs.getString(3));
				mvr.setR_DATE(rs.getString(4));
				mvr.setR_Content(rs.getString(5));
				mvr.setM_Name(rs.getString(6));
				mvr.setM_Score(rs.getFloat(7));
				mvr.setR_Available(rs.getInt(8));
				return mvr;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int R_NUM, String R_Title, String R_Content) {
		String SQL = "UPDATE mvrlist SET R_Title = ?, R_Content = ? WHERE R_NUM = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, R_Title);
			pstmt.setString(2, R_Content);
			pstmt.setInt(3, R_NUM);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int delete(int R_NUM) {
		String SQL = "UPDATE mvrlist SET R_Available=0 WHERE R_NUM = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, R_NUM);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}