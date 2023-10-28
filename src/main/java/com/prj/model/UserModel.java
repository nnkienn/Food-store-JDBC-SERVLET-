package com.prj.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.protocol.Resultset;
import com.prj.main.User;

public class UserModel {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	public UserModel(Connection con) {
		super();
		this.con = con;
	}
	public User userLogin(String email , String password) {
		User user = null;
		try {
			query = "Select * from user where email = ? and password = ?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return user;
	}
	public boolean checkemailexist(String email) {
		String query = "SELECT COUNT(*) FROM user WHERE email = ? ";
		try {
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			rs = pst.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0; // Trả về true nếu có bất kỳ bản ghi nào chứa email này

            }


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return false; // Mặc định trả về false nếu có lỗi xảy ra


	}
	
	public User userRegister(String name , String email , String password) {
		User user = null;
		try {
			query = "Insert Into user (name ,email , password) values (? ,? ,?) ";
			pst = this.con.prepareStatement(query);
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, password);
			int up = pst.executeUpdate();
			if(up >  0) {
				user = new User();
				user.setId(rs.getInt("id"));
	            user.setName(rs.getString("name"));
	            user.setEmail(rs.getString("email"));		
	            }
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return user;
		
	}
	
}
