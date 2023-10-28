package com.prj.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.prj.main.Cart;
import com.prj.main.Product;

public class ProductModel {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public ProductModel(Connection con) {
		this.con = con;
	}

	public List<Product> getAllProduct() {
		List<Product> products = new ArrayList<Product>();
		try {
			query = "select * from products";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setTitle(rs.getString("title"));
				row.setType(rs.getString("type"));
				row.setRegular(rs.getDouble("regular"));
				row.setDiscount(rs.getDouble("discount"));
				products.add(row);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}

	public Product getProductById(String productId) {
		try {
			String query = "SELECT * FROM products WHERE id = ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, productId);

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setType(rs.getString("type"));
				row.setTitle(rs.getString("title"));
				row.setDiscount(rs.getDouble("discount"));
				row.setRegular(rs.getDouble("regular"));
				row.setOverview(rs.getString("overview"));
				row.setStock(rs.getInt("stock"));
				row.setQuantity(rs.getInt("quantity"));
				row.setImage(rs.getString("image"));
				return row;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null; // Trả về null nếu không tìm thấy sản phẩm
	}
	
	public List<Cart> getcartproduct(ArrayList<Cart> cartlist){
		List<Cart> products = new ArrayList<Cart>();
		try {
			if(cartlist.size()> 0) {
				for(Cart item:cartlist) {
					query = "select *from products where id = ?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs=pst.executeQuery();
					while(rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("id"));
						row.setTitle(rs.getString("title"));
						row.getQuantity(rs.getInt("quantity"));
						row.setRegular(rs.getDouble("regular"));
						products.add(row);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return products;
	}
}
