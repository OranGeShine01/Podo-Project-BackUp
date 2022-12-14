package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.WishDTO;

public class WishDAO {
	private static WishDAO instance = null;
	
	public static WishDAO getInstance() {
		if (instance==null) {
			instance = new WishDAO();
		}
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int addWish(WishDTO dto) throws Exception {
		String sql = "insert into wishList values(?, ?)";
		
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getWishEmail());
			pstat.setInt(2, dto.getParentMusicSeq());
						
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public boolean isExist(WishDTO dto) throws Exception {
		String sql = "select * from wishList where wishEmail = ? and parentMusicSeq = ?";
		
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getWishEmail());
			pstat.setInt(2, dto.getParentMusicSeq());
			
			ResultSet rs = pstat.executeQuery();
			return rs.next();
		}
	}
	
	public int delWish(WishDTO dto) throws Exception {
		String sql = "delete from wishList where wishEmail = ? and parentMusicSeq = ?";
		
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getWishEmail());
			pstat.setInt(2, dto.getParentMusicSeq());
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
}
