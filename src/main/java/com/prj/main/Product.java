package com.prj.main;

public class Product {
	private int id;
	private String type;
	private String title;
	private double discount;
	private double regular;
	private String overview;
	private int stock;
	private int quantity;
	private String image;

	public Product() {
		super();
	}

	public Product(int id, String type, String title, double discount, double regular, String overview, int stock,
			int quantity, String image) {
		super();
		this.id = id;
		this.type = type;
		this.title = title;
		this.discount = discount;
		this.regular = regular;
		this.overview = overview;
		this.stock = stock;
		this.quantity = quantity;
		this.image = image;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public double getRegular() {
		return regular;
	}

	public void setRegular(double regular) {
		this.regular = regular;
	}

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	

}
