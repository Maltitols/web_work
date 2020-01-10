package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	private static UsersDao dao;
	private UsersDao() {}
	public static UsersDao getInstance() {
		if(dao==null) {
			dao=new UsersDao();
		}
		return dao;
	}
	//인자로 전달되는 UsersDto에 담긴 정보가 유효한 정보인지 여부를 리턴
	public boolean isValid(UsersDto dto) {
		boolean isValid=false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "select *"
					+ "	from users"
					+ "	where id=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			rs = pstmt.executeQuery();
			while (rs.next()) {//select된 row가 있으면 
				//아이디, 비번이 일치한다는거니까 true를 반환
				isValid=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				//connection pool 에 반납하기 
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return isValid;
	}
	
	//가입정보 저장 메소드
	public boolean insert(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "insert into users"
					+ "	(id, pwd, email, regdate)"
					+ " values(?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 하기
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
}
