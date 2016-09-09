package com.kedu.call.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kedu.call.dto.CallDto;
import com.kedu.util.DBManager;

public class CallDao {
	
	private CallDao(){
	}
	
	private static CallDao instance = new CallDao();
	
	public static CallDao getInstance() {
		if(instance == null) {
			instance = new CallDao();
		}
		return instance;
	}
	
//	모든 자료 리스트에 출력
	public List<CallDto> selectAllGany() {
		String sql = "select * from notice order by notno ";
		
		List<CallDto> calllist = new ArrayList<CallDto>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				CallDto caDto = new CallDto();
				
				caDto.setNotno(rs.getInt("notno"));
				caDto.setEmpno(rs.getString("empno"));
				caDto.setNotname(rs.getString("notname"));
				caDto.setNotdate(rs.getString("notdate"));
				caDto.setNothits(rs.getInt("nothits"));
				caDto.setNotcon(rs.getString("notcon"));
				caDto.setNotdel(rs.getString("notdel"));
				
				calllist.add(caDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return calllist;
	}
	
	public void insertCall(CallDto caDto) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into notice(				"
				+ "notno, empno, notname, notcon)		"
				+ "values (notice_notno_seq.nextval,	"
				+ "?, ?, ? ) 							";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, caDto.getEmpno());
			pstmt.setString(2, caDto.getNotname());
			pstmt.setString(3, caDto.getNotcon());
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		
	}
	
	public int insertCallCom(CallDto caDto) {
		int result = -1;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder(); 
				
		sql.append("insert into nocomment");
		sql.append(" values (");
		sql.append(" ?");
		sql.append(" , nocomment_comno_seq.nextval");
		sql.append(" , ?");
		sql.append(" , ?");
		sql.append(" , sysdate");
		sql.append(" , '0' )");
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setInt(1, caDto.getNotno());
			pstmt.setString(2, caDto.getEmpno());
			pstmt.setString(3, caDto.getComcon());

			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
	public CallDto selectOneByNotno(String notno) {
		String sql = "select * from notice where notno = ? ";
		
		CallDto caDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notno);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				caDto = new CallDto();
				
				caDto.setNotno(rs.getInt("notno"));
				caDto.setEmpno(rs.getString("empno"));
				caDto.setNotname(rs.getString("notname"));
				caDto.setNotdate(rs.getString("notdate"));
				caDto.setNothits(rs.getInt("nothits"));
				caDto.setNotcon(rs.getString("notcon"));
				caDto.setNotdel(rs.getString("notdel"));
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return caDto;
	}
	
	public List<CallDto> selectOneByCom(int notno){
		String sql = "SELECT * FROM NOCOMMENT no WHERE no.notno = ?  ORDER BY notno desc ";
		
//		JSONArray jsonList = new JSONArray();
		
		List<CallDto> calllist = new ArrayList<CallDto>(); 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notno);
			
			rs = pstmt.executeQuery();
			
//			jsonList.add("jsonList");
			
			while (rs.next()) {
				CallDto caDto = new CallDto();
//				JSONObject jsonOb = new JSONObject();
				
//				jsonOb.put("notno", rs.getString("notno"));
//				jsonOb.put("comno", rs.getString("comno"));
//				jsonOb.put("empno", rs.getString("empno"));
//				jsonOb.put("comcon", rs.getString("comcon"));
//				jsonOb.put("comdate", rs.getString("comdate"));
//				jsonOb.put("comdel", rs.getString("comdel"));
				
//				jsonList.add(jsonOb);
				
				caDto.setNotno(rs.getInt("notno"));
				caDto.setComno(rs.getInt("comno"));
				caDto.setEmpno(rs.getString("empno"));
				caDto.setComcon(rs.getString("comcon"));
				caDto.setComdate(rs.getString("comdate"));
				caDto.setComdel(rs.getString("comdel"));
				
				calllist.add(caDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		System.out.println("Dto : " + calllist);
		return calllist;
	}
	
	public void updateCall(CallDto caDto) {
		String sql = "update notice set 					 " 
				+ "empno=?, notname=?,	notdate= sysdate,	 "
				+ "nothits=?, notcon=?, notdel=?			 "
				+ "where notno = ? 	";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, caDto.getEmpno());
			pstmt.setString(2, caDto.getNotname());
			pstmt.setInt(3, caDto.getNothits());
			pstmt.setString(4, caDto.getNotcon());
			pstmt.setString(5, caDto.getNotdel());
			pstmt.setInt(6, caDto.getNotno());
			
			pstmt.executeUpdate(); 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	public void updateReadCount(String notno) {
		String sql = "update notice set nothits = nothits + 1	"
				+ "where notno = ? 	";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notno);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	public int deleteCall(int notno) {
		int result = -1;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		sql.append("delete from notice 	");
		sql.append("where notno = ?		");
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, notno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
		
	@SuppressWarnings("resource")
	public CallDto lastInsert() {
		CallDto caDto = new CallDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int lastSeq = 0;
		
		StringBuilder lastsql = new StringBuilder();
		lastsql.append("select nocomment_comno_seq.currval as Lastseq from dual");
		
		StringBuilder sql = new StringBuilder();
		sql.append("select * from nocomment where comno= ? ");
		
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
				caDto = new CallDto();
				
				caDto.setNotno(rs.getInt("notno"));
				caDto.setComno(rs.getInt("comno"));
				caDto.setEmpno(rs.getString("empno"));
				caDto.setComcon(rs.getString("comcon"));
				caDto.setComdate(rs.getString("comdate"));
				caDto.setComdel(rs.getString("comdel"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return caDto;
		
	}
	
		//		String sql = "delete notice where notno = ? ";
//		
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		try {
//			conn = DBManager.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			
//			pstmt.setString(1, notno);
//			
//			pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}

}
