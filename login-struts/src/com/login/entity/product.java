package com.login.entity;

import java.util.Date;

public class product {
	private String product_id;
	private String product_name;
	private String product_image;
	private String product_price;
	private int is_sales;
	private String description;
	private Date created_at;
	private Date updated_at;
	
	
	
	
	public product() {
		super();
	}
	public product(String product_id, String product_name, String product_image, String product_price, int is_sales,
			String description, Date created_at, Date updated_at) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_image = product_image;
		this.product_price = product_price;
		this.is_sales = is_sales;
		this.description = description;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public int getIs_sales() {
		return is_sales;
	}
	public void setIs_sales(int is_sales) {
		this.is_sales = is_sales;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}
	
	
	
}
