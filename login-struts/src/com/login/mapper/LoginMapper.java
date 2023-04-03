package com.login.mapper;

import java.util.List;

import com.login.entity.customer;
import com.login.entity.product;
import com.login.entity.user;

public interface LoginMapper {
	List<user> GetAll();
	List<user> GetAllPage(long i);
	int countUser();
	user findByEmail(String email);
	user findByEmailFind(String email);
	user findByName(String name);
	user findByGroup(String group);
	user findByActive(int active);
	user addUser(user user);
	user updateUser(long id);
	user deleteUser(long id);
	user updateLogin_at(String email);
	user updateActive(String email);
	
	//customer
	List<customer> GetAllCustomer();
	String countCustomer();
	List<customer> GetAllPageCustomer(long i);
	customer findByEmailCustomer(String email);
	customer findByEmailFindCustomer(String email);
	customer findByNameCustomer(String name);
	customer findByAddressCustomer(String group);
	customer addCustomer(customer customer);
	customer updateCustomer(long id);
	
	//product
		List<product> GetAllProduct();
		int countPro();
		product findByProductId(String product_id);
		String idMax();
		List<product> GetAllPageproduct(long i);
		product addProduct(product product);
		product updateProduct(String id);
		product deleteProduct(String id);
}
