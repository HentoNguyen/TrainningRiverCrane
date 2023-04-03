package com.login.entity;

import java.util.Date;

public class customer {
	private int customer_id;
	private String customer_name;
	private String email;
	private String tel_num;
	private String address;
	private int is_active;
	private Date created_at;
	private Date updated_at;
	
	public customer(int customer_id, String customer_name, String email, String tel_num, String address, int is_active,
			Date created_at, Date updated_at) {
		super();
		this.customer_id = customer_id;
		this.customer_name = customer_name;
		this.email = email;
		this.tel_num = tel_num;
		this.address = address;
		this.is_active = is_active;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}
	public customer() {
		super();
	}
	
	
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel_num() {
		return tel_num;
	}
	public void setTel_num(String tel_num) {
		this.tel_num = tel_num;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getIs_active() {
		return is_active;
	}
	public void setIs_active(int is_active) {
		this.is_active = is_active;
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
