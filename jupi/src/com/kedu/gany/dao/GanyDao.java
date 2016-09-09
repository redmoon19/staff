package com.kedu.gany.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kedu.gany.dto.GanyDto;
import com.kedu.util.DBManager;

public class GanyDao {
	
	private GanyDao() {
	}
	
	private static GanyDao instance = new GanyDao();
	
	public static GanyDao getInstance() {
//		null 처리
		if(instance == null) {
			instance = new GanyDao();
		}
		return instance;
	}
	
	
//	사용자 인증시 사용하는 메소드
	public int userCheck(String id, String pswd) {
		int result = -1;
		String sql = "select pswd from emp where id=? ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("pswd") != null && rs.getString("pswd").equals(pswd)) {
					result = 1;
				} else {
					result = 0;
				}
			} else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	} 
	
//	아이디로 회원 정보 가져오는 메소드
	public GanyDto getGany(String id) {
		GanyDto gaDto = null;
		String sql = "select * from emp where id = ? ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				gaDto = new GanyDto();
				gaDto.setEmpno(rs.getString("empno"));
				gaDto.setId(rs.getString("id"));
				gaDto.setPswd(rs.getString("pswd"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return gaDto;
	}
	
//	아이디 중복 체크
	public int confirmID(String userid) {
		int result = -1;
		String sql = "select id from emp where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 1;
			} else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
	
	
//	모든 자료 리스트에 출력
	public List<GanyDto> selectAllGany() {
		String sql = "select * from emp order by empno ";
		
		List<GanyDto> ganylist = new ArrayList<GanyDto>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				GanyDto gnDto = new GanyDto();
				
				gnDto.setEmpno(rs.getString("empno"));
				gnDto.setDeptno(rs.getString("deptno"));
				gnDto.setJobno(rs.getString("jobno"));
				gnDto.setId(rs.getString("id"));
				gnDto.setPswd(rs.getString("pswd"));
				gnDto.setEname(rs.getString("ename"));
				gnDto.setFjumin(rs.getString("fjumin"));
				gnDto.setBjumin(rs.getString("bjumin"));
				gnDto.setHiredate(rs.getString("hiredate"));
				gnDto.setResigndate(rs.getString("resigndate"));
				gnDto.setEmail(rs.getString("email"));
				gnDto.setZipcode(rs.getString("zipcode"));
				gnDto.setAddr(rs.getString("addr"));
				gnDto.setDeaddr(rs.getString("deaddr"));
				gnDto.setSal(rs.getInt("sal"));
				gnDto.setEtc(rs.getString("etc"));
				gnDto.setEregdate(rs.getString("eregdate"));
				gnDto.setEpic(rs.getString("epic"));
				gnDto.setAdmin(rs.getString("admin"));
				
				ganylist.add(gnDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return ganylist;
	}
	
	public int insertGany(GanyDto gnDto) {
		int result = -1;
		
		//		String sql = "insert into emp values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//				+ "empno, deptno, jobno, id, pswd, ename, fjumin, bjumin, hiredate, resigndate, "
//				+ "email, zipcode, addr, deaddr, sal, etc, eregdate, epic, admin "
//				+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		
		sql.append("insert into emp");
		sql.append(" values( ?");
		sql.append(", ?");
		sql.append(", ?");
		sql.append(", ?");
		sql.append(", ?");
		sql.append(", ?");
		sql.append(", ?");
		sql.append(", ?");
		sql.append(", ?");
		sql.append(", ?");
		sql.append(", ?");
		sql.append(", ?");
		sql.append(", ?");
		sql.append(", ?");
		sql.append(", ?");
		sql.append(", ?");
		sql.append(", ?");
		sql.append(", ?");
		sql.append(", ? )");
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, gnDto.getEmpno());
			pstmt.setString(2, gnDto.getDeptno());
			pstmt.setString(3, gnDto.getJobno());
			pstmt.setString(4, gnDto.getId());
			pstmt.setString(5, gnDto.getPswd());
			pstmt.setString(6, gnDto.getEname());
			pstmt.setString(7, gnDto.getFjumin());
			pstmt.setString(8, gnDto.getBjumin());
			pstmt.setString(9, gnDto.getHiredate());
			pstmt.setString(10, gnDto.getResigndate());
			pstmt.setString(11, gnDto.getEmail());
			pstmt.setString(12, gnDto.getZipcode());
			pstmt.setString(13, gnDto.getAddr());
			pstmt.setString(14, gnDto.getDeaddr());
			pstmt.setInt(15, gnDto.getSal());
			pstmt.setString(16, gnDto.getEtc());
			pstmt.setString(17, gnDto.getEregdate());
			pstmt.setString(18, gnDto.getEpic());
			pstmt.setString(19, gnDto.getAdmin());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
		
//	정보 상세 보기 : 사원번호로 찾아온다. : 실패 null
	public GanyDto selectOneByEmpno(String empno) {
		String sql = "select * from emp where empno = ? ";
		GanyDto gnDto = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empno);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				gnDto = new GanyDto();
				
				gnDto.setEmpno(rs.getString("empno"));
				gnDto.setDeptno(rs.getString("deptno"));
				gnDto.setJobno(rs.getString("jobno"));
				gnDto.setId(rs.getString("id"));
				gnDto.setPswd(rs.getString("pswd"));
				gnDto.setEname(rs.getString("ename"));
				gnDto.setFjumin(rs.getString("fjumin"));
				gnDto.setBjumin(rs.getString("bjumin"));
				gnDto.setHiredate(rs.getString("hiredate"));
				gnDto.setResigndate(rs.getString("resigndate"));
				gnDto.setEmail(rs.getString("email"));
				gnDto.setZipcode(rs.getString("zipcode"));
				gnDto.setAddr(rs.getString("addr"));
				gnDto.setDeaddr(rs.getString("deaddr"));
				gnDto.setSal(rs.getInt("sal"));
				gnDto.setEtc(rs.getString("etc"));
				gnDto.setEregdate(rs.getString("eregdate"));
				gnDto.setEpic(rs.getString("epic"));
				gnDto.setAdmin(rs.getString("admin"));
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return gnDto;
	} 
	
//	정보 수정(관리자)
	public void updateGany(GanyDto gnDto) {
		String sql = "update emp set "
				+ "deptno=?, jobno=?, id=?, pswd=?, ename=?, fjumin=?, "
				+ "bjumin=?, hiredate=?, resigndate=?, "
				+ "email=?, zipcode=?, addr=?, deaddr=?, sal=?, etc=?, "
				+ "eregdate=?, epic=?, admin=?  "
				+ "where empno = ? ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, gnDto.getDeptno());
			pstmt.setString(2, gnDto.getJobno());
			pstmt.setString(3, gnDto.getId());
			pstmt.setString(4, gnDto.getPswd());
			pstmt.setString(5, gnDto.getEname());
			pstmt.setString(6, gnDto.getFjumin());
			pstmt.setString(7, gnDto.getBjumin());
			pstmt.setString(8, gnDto.getHiredate());
			pstmt.setString(9, gnDto.getResigndate());
			pstmt.setString(10, gnDto.getEmail());
			pstmt.setString(11, gnDto.getZipcode());
			pstmt.setString(12, gnDto.getAddr());
			pstmt.setString(13, gnDto.getDeaddr());
			pstmt.setInt(14, gnDto.getSal());
			pstmt.setString(15, gnDto.getEtc());
			pstmt.setString(16, gnDto.getEregdate());
			pstmt.setString(17, gnDto.getEpic());
			pstmt.setString(18, gnDto.getAdmin());
			
			pstmt.setString(19, gnDto.getEmpno());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
//	사원 삭제(관리자)
	public int deleteGany(int empno) {
		int result = -1;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		StringBuilder sql = new StringBuilder();
		
		sql.append("delete from emp		");
		sql.append("where empno = ? 	");
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, empno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
	public boolean checkPass(String empno, String pswd) {
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select pswd from emp	");
		sql.append("where 1 = 1				");
		sql.append("and empno = ?			");
		sql.append("and pswd = ?			");
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, empno);
			pstmt.setString(2, pswd);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			} else {
				result = false;
			} 
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
	public String GetEmno() {
		String ret="";
		Connection conn = null;
		CallableStatement cstmt = null;
		 
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall("{?= call Fn_GetEmno}");
			cstmt.registerOutParameter(1,  java.sql.Types.VARCHAR);
			cstmt.execute();
			ret = cstmt.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}
	

	public GanyDto lastInsert(String empno) {
		GanyDto gnDto = new GanyDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		String lastEno = "";
		System.out.println("LI :" + empno);
//		StringBuilder lastem = new StringBuilder();
//		lastem.append("select  					");
//		lastem.append("max(empno)				");
//		lastem.append("as Lasteno from emp		");

		StringBuilder em = new StringBuilder();
		em.append("select * from emp where empno= ?");
		
		try{
			conn = DBManager.getConnection();
//			pstmt = conn.prepareStatement(lastem.toString());
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				lastEno = rs.getString("lasteno");
//			}
			pstmt = conn.prepareStatement(em.toString());
			pstmt.setString(1, empno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				gnDto = new GanyDto();
				gnDto.setEmpno(rs.getString("empno"));
				gnDto.setDeptno(rs.getString("deptno"));
				gnDto.setJobno(rs.getString("jobno"));
				gnDto.setEname(rs.getString("ename"));
				gnDto.setId(rs.getString("id"));
				gnDto.setPswd(rs.getString("pswd"));
				gnDto.setFjumin(rs.getString("fjumin"));
				gnDto.setBjumin(rs.getString("bjumin"));
				gnDto.setHiredate(rs.getString("hiredate"));
				gnDto.setResigndate(rs.getString("resigndate"));
				gnDto.setEmail(rs.getString("email"));
				gnDto.setZipcode(rs.getString("zipcode"));
				gnDto.setAddr(rs.getString("addr"));
				gnDto.setDeaddr(rs.getString("deaddr"));
				gnDto.setSal(Integer.parseInt(rs.getString("sal")));
				gnDto.setEtc(rs.getString("etc"));
				gnDto.setEregdate(rs.getString("eregdate"));
				gnDto.setEpic(rs.getString("epic"));
				gnDto.setAdmin(rs.getString("admin"));
			System.out.println("gnDto :" + gnDto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return gnDto;
		
	}
	
}
