package com.login.entity;

import java.util.Date;

//import java.util.Date;

public class user {
	private int id;
	private String name;
	private String email;
	private String password;
	private String remember_token;
	private String verify_email;
	private int is_active;
	private int is_delete;
	private String group_role;
	private Date last_login_at;
	private String last_login_ip;
	private Date created_at;
	private Date updated_at;


	public user() {
		super();
	}
	public user(int id, String name, String email, String password, String remember_token, String verify_email,
			int is_active, int is_delete, String group_role, Date last_login_at, String last_login_ip, Date created_at,
			Date updated_at) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.remember_token = remember_token;
		this.verify_email = verify_email;
		this.is_active = is_active;
		this.is_delete = is_delete;
		this.group_role = group_role;
		this.last_login_at = last_login_at;
		this.last_login_ip = last_login_ip;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRemember_token() {
		return remember_token;
	}
	public void setRemember_token(String remember_token) {
		this.remember_token = remember_token;
	}
	public String getVerify_email() {
		return verify_email;
	}
	public void setVerify_email(String verify_email) {
		this.verify_email = verify_email;
	}
	
	

	public int getIs_active() {
		return is_active;
	}
	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}
	public int getIs_delete() {
		return is_delete;
	}
	public void setIs_delete(int is_delete) {
		this.is_delete = is_delete;
	}
	public String getGroup_role() {
		return group_role;
	}
	public void setGroup_role(String group_role) {
		this.group_role = group_role;
	}
	public Date getLast_login_at() {
		return last_login_at;
	}
	public void setLast_login_at(Date last_login_at) {
		this.last_login_at = last_login_at;
	}
	public String getLast_login_ip() {
		return last_login_ip;
	}
	public void setLast_login_ip(String last_login_ip) {
		this.last_login_ip = last_login_ip;
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
