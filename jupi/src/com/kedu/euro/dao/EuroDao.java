package com.kedu.euro.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kedu.euro.dto.EuroDto;
import com.kedu.util.DBManager;

public class EuroDao {
	private EuroDao(){
	}
	
	private static EuroDao instance = new EuroDao();
	
	public static EuroDao getInstance() {
		if(instance == null) {
			instance = new EuroDao();
		}
		return instance;
	}
	
	public List<EuroDto> selectAllEuro() {
		String sql = "select * from cproject";
		
		List<EuroDto> eurolist = new ArrayList<EuroDto>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				EuroDto euDto = new EuroDto();
				
				euDto.setProno(rs.getInt("prono"));
				euDto.setPname(rs.getString("pname"));
				euDto.setProsta(rs.getString("prosta"));
				euDto.setPenddate(rs.getString("penddate"));
				euDto.setPregdate(rs.getString("pregdate"));
				euDto.setPcontent(rs.getString("pcontent"));
				
				eurolist.add(euDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return eurolist;
	}
	
	public EuroDto selectOneByProno(int prono) {
		String sql = "select * from cproject where prono = ? ";
		EuroDto euDto = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prono);
			
			rs= pstmt.executeQuery();
			if(rs.next()) {
				euDto = new EuroDto();
				
				euDto.setProno(rs.getInt("prono"));
				euDto.setPname(rs.getString("pname"));
				euDto.setProsta(rs.getString("prono"));
				euDto.setPenddate(rs.getString("penddate"));
				euDto.setPregdate(rs.getString("pregdate"));
				euDto.setPcontent(rs.getString("pcontent"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return euDto;
	}
	
}
