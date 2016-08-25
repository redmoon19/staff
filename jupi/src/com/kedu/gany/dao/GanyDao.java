package com.kedu.gany.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kedu.gany.dto.GanyDto;
import com.kedu.gany.util.DBManager;

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
	
//	모든 자료 리스트에 출력
	public List<GanyDto> selectAllGany() {
		String sql = "select * from emp order by empno desc";
		
		List<GanyDto> list = new ArrayList<GanyDto>();
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
				
				list.add(gnDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
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
		sql.append(" values(?");
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
	public GanyDto selectOneGanyByEmpno(String empno) {
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
				+ "eregdate=?, epic=?, admin=?) "
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
	public void deleteGany(String empno) {
		String sql = "delete emp where empno = ? ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, empno);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("resource")
	public GanyDto lastInsert() {
		GanyDto gnDto = new GanyDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int lastSeq = 0;
		
		StringBuilder lastsql = new StringBuilder();
		lastsql.append("select mem_no_seq.currval as Lastseq from dual"	);
		
		StringBuilder sql = new StringBuilder();
		sql.append("select * from emp where empno= ?");
		
		try{
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(lastsql.toString());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				lastSeq = rs.getInt("lastseq");
			}
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, lastSeq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				gnDto = new GanyDto();
				gnDto.setEmpno(rs.getString("empno"));
				gnDto.setDeptno(rs.getString("deptno"));
				gnDto.setJobno(rs.getString("jobno"));
				gnDto.setEname(rs.getString("ename"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return gnDto;
		
	}
	
}
