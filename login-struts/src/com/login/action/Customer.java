package com.login.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.login.entity.customer;
import com.login.entity.user;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Customer  extends ActionSupport implements SessionAware {
	private static final String conf = "application.xml";
	Reader reader;
	SqlSessionFactoryBuilder builder;
	SqlSessionFactory sessionFactory;
	SqlSession sessionsql;
//	user user= new user();
	customer customerFind= new customer();
	customer customerAdd;
	customer customerUpdate= new customer();

	List<customer> customercount=new ArrayList();
	List<customer> customers = new ArrayList();
	private Map<String, Object> sessionMap;
	private int  phantrang, i;
	private String mail_out;
	private Date created_at, updated_at;

	private String customer_name, email, tel_num, address;
	private String  customer_name_find, email_find, address_find, name_find, is_active_find;
	private String nameadd,emailadd,phoneadd,diachiadd;
	private int customer_id, is_activeadd, is_active;
	

    private File file;
	
	public void load() throws IOException {
		reader = Resources.getResourceAsReader(conf);
		builder = new SqlSessionFactoryBuilder();
		sessionFactory = builder.build(reader);
		sessionsql = sessionFactory.openSession();
	}
	
	
//	public String checklogin() throws IOException {
//		load();
//		
//		String loggedUserName = null;
//		
//		
//		
//		//khi chưa đăng nhập mà cố zo trong sẽ bị bắt quay lại trang đăng nhập
//		HttpSession session=ServletActionContext.getRequest().getSession(true);  
////		if(session==null || session.getAttribute("fail")==null){  
////			return "fail";  
////		} 
//		
////		String regex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
//
//		
//
//		
//        
//		System.out.println("----------" + email);
//		System.out.println("----------" + loggedUserName);
//		user = sessionsql.selectOne("LoginMapper.findByEmail", email);
//
//		if (email != null) {
//			if (vadilate()) {
//				if (user != null && user.getPassword().equals(password)) {
//					name = user.getName();
//					group_role = user.getGroup_role();
//					
////		   			  user.setIs_active(is_active?"Dang hoat dong": "Tam khoa");
//					System.out.println("tim thanh cong nha.  checklogin--" + email);
//					System.out.println("tim thanh cong nha.  checklogin--" + is_active);
//					sessionMap.put("id", id);
//					sessionMap.put("email", email);
//					sessionMap.put("password", password);
//					sessionMap.put("name", name);
//					sessionMap.put("group_role", group_role);
//					
//					
//					System.out.println("phan trang la:------"+phantrang);
////					phantrang=0;
//					customers = sessionsql.selectList("LoginMapper.GetAllPageCustomer", phantrang);
////					users = sessionsql.selectList("LoginMapper.GetAll");
//					sessionsql.commit();
//					sessionsql.close();
//					return SUCCESS;
//				} else
//					Note();
//			}
//		}else{
//			String getSessionAttr = (String) session.getAttribute("email");
//			
//			if (getSessionAttr != null) {
//				id=  (int) sessionMap.get("id");
//				email = (String) sessionMap.get("email");
//				password = (String) sessionMap.get("password");
//				name = (String) sessionMap.get("name");
//				group_role = (String) sessionMap.get("group_role");
//	
//				System.out.println("---- tai khoan da dang nhap   " + email);
//
//				System.out.println("---- tai khoan da dang nhap   " + id);
////		        	logins = session.selectList("LoginMapper.GetAll");
//
//				customers = sessionsql.selectList("LoginMapper.GetAllPageCustomer", phantrang);
////				users = sessionsql.selectList("LoginMapper.GetAll");
//				return SUCCESS;
//
//			} else {
//				return INPUT;
//			}
//		}
//
////		   in other cases, return login page
//		return INPUT;
//	}
//	
	
//	public user checklogins() {
//		return user;
//	}

	public List<customer> getCustomers() {
		return customers;
	}
	
	
	//chuyển đến trang reditCustomer
	public String reditCustomer() throws IOException {
		load();	

		sessionMap = ActionContext.getContext().getSession();
		int count= sessionsql.selectOne("LoginMapper.countCustomer");
		System.out.println("số lượng id là--"+count);
		sessionMap.put("count",count);
//		customers = sessionsql.selectList("LoginMapper.GetAllPageCustomer", phantrang);
		customers = sessionsql.selectList("LoginMapper.GetAllCustomer");
		return SUCCESS;
	}
	
	
	
	// Thêm user

		public String AddCustomer() throws IOException {
			load();
					

//				last_login_at = new Date();
//				System.out.println("Date hien tai: " + last_login_at);

					created_at = new Date();
					System.out.println("Date hien tai: " + created_at);
					System.out.println("active them: " + is_activeadd);
					customerAdd = new customer();
					
					customerAdd.setCustomer_name(nameadd);
					customerAdd.setEmail(emailadd);
					customerAdd.setTel_num(phoneadd);
					customerAdd.setAddress(diachiadd);
					customerAdd.setIs_active(is_activeadd);
					customerAdd.setCreated_at(created_at);
					customerAdd.setUpdated_at(updated_at);
					customerAdd.setCustomer_id(customer_id);
					
					
					sessionsql.insert("LoginMapper.addCustomer", customerAdd);
					customers = sessionsql.selectList("LoginMapper.GetAllCustomer");
					System.out.println("inserted customer successfully");
					sessionsql.commit();
					sessionsql.close();
				
//			System.out.println("group---------" + group_roleadd);

			System.out.println("active------" + is_activeadd);
			// Insert student data
			System.out.println("name la: "+nameadd);
			
			
			return SUCCESS;
		}

		public customer AddCustomers() {
			return customerAdd;
		}
	
		
		
		//update customer
		public String UpdateCustomer() throws IOException {
			 load();
			 customerUpdate.setEmail(email);
			 updated_at = new Date();
			 System.out.println("vừa sửa vào lúc: ------" + updated_at);
			 
//			 userUpdate = (user) sessionsql.selectOne("LoginMapper.findByEmail", email);
			 System.out.println("---mail can sửa do la----  " + email );
			  
			 
//			 int is_active=0;
//			 if(is_activeupdate == "Đang hoạt động") {
//				 is_active= 1;
//			 }
//			 
			 customerUpdate.setCustomer_name(customer_name);
			System.out.println("name can sua ---"+customer_name);
			 customerUpdate.setTel_num(tel_num);
			 customerUpdate.setAddress(address);
			 customerUpdate.setIs_active(is_active);
			 customerUpdate.setUpdated_at(updated_at);
			 customerUpdate.setEmail(email);
				// Update the student record
			 
			 sessionsql.update("LoginMapper.updateCustomer", customerUpdate);

			 customers = sessionsql.selectList("LoginMapper.GetAllCustomer");
			 System.out.println(" update customer successfully");
			 sessionsql.commit();
			 sessionsql.close();
			return SUCCESS;
		}

		public customer updateCustomers() {
			return customerUpdate;
		}
		
		
		
		public String getName_find() {
			return name_find;
		}


		public void setName_find(String name_find) {
			this.name_find = name_find;
		}


		//find email
		public String timkiemCustomer() throws IOException {
			load();
			
//			
//			if (email_find.equals("") || name_find.equals("") || group_role_find.equals("")|| is_active==0) {
//				return SUCCESS;
//			}
			
			 if(!name_find.isEmpty()) {
				customerFind.setCustomer_name(name_find);
				System.out.println("---ten cần tìm đó là----  " + name_find );
				customers = sessionsql.selectList("LoginMapper.findByNameCustomer", name_find);
				sessionsql.commit();
				sessionsql.close();
				return SUCCESS;
			}
			 else if (!email_find.isEmpty()) {
				customerFind.setEmail(email_find);
				 
//				userFind = (user) sessionsql.selectOne("LoginMapper.findByEmail", email_find);
				System.out.println("---mail cần tìm đó là----  " + email_find );
				customers = sessionsql.selectList("LoginMapper.findByEmailFindCustomer", email_find);
				sessionsql.commit();
				sessionsql.close();
				return SUCCESS;
			}else if(!address_find.isEmpty()) {
				customerFind.setAddress(address_find);
				System.out.println("---ten cần tìm đó là----  " + address_find );
				customers = sessionsql.selectList("LoginMapper.findByAddressCustomer", address_find);
				sessionsql.commit();
				sessionsql.close();
				return SUCCESS;
			}
			else {
				customerFind.setCustomer_name(is_active_find);
				int active = 0;
				if (is_active_find.equals("Đang hoạt động") ) {
					 active =1;
					 System.out.println("is active --" +active);
				}
				
				System.out.println("---trạng thái cần tìm đó là----  " + active);
				customers = sessionsql.selectList("LoginMapper.findByActiveCustomer", active);
				sessionsql.commit();
				sessionsql.close();
				return SUCCESS;
			}
		}
	
//	public void Note() {
//
//		if (!email.equals("") && !password.equals("")) {
//			addFieldError("Notification", "Thông tin tài khoản hoặc mật khẩu không đúng");
//		}
//
//	}
	
	// phantrang load lại trang data
			public String phantrangCus() throws IOException {
				load();
				int index=0;
				
				index= (i-1)*2;
				
				System.out.println("index hien tai: ---"+i);

				
				System.out.println("index khi click là: ---"+index);
				customers = sessionsql.selectList("LoginMapper.GetAllPageCustomer", index);
				// return welcome page

				return SUCCESS;
			}
			
			// phantrang next load trang data
			public String phantrangnextCus() throws IOException {
				load();
				int index = 0;
				System.out.println("i hien tai là: " +i);
				for (int k = 0; k < i; k++) {
					i++;
					k++;
				}
				System.out.println("i sau khi next là: " +i);
				System.out.println("k sau khi next là: " +i);
				index = (i - 1) * 2;

				System.out.println("phan trang next khi click là: ---" + i);

				System.out.println("index của next khi click là: ---" + index);
				customers = sessionsql.selectList("LoginMapper.GetAllPageCustomer", index);
				// return welcome page

				return SUCCESS;
			}
			
			// phantrang back load trang data
			public String phantrangbackCus() throws IOException {
				load();
				int index = 0;
				System.out.println("i hien tai là: " + i);
				for (int k = 1; k < i; k++) {
					i--;
					k++;
				}
				System.out.println("i sau khi back là: " + i);
				System.out.println("k sau khi back là: " + i);
				index = (i - 1) * 2;

				System.out.println("phan trang back khi click là: ---" + i);

				System.out.println("index của back khi click là: ---" + index);
				customers = sessionsql.selectList("LoginMapper.GetAllPageCustomer", index);
				// return welcome page

				return SUCCESS;
			}
			
			
			//xóa tìm kiếm load lại trang data
			public String xoatim() throws IOException {
				load();
			
				customers = sessionsql.selectList("LoginMapper.GetAllCustomer");
				// return welcome page

				return SUCCESS;
			}

	
			// bắt lỗi
//			public boolean vadilate() {
////				   String regex = "^[0-9]+$";
//				String regex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
//
//				if (email.equals("")) {
//					addFieldError("txtTK", "Email không được trống");
//				}
//
//				if (password.equals("")) {
//					addFieldError("txtMK", "Mật khẩu không được trống");
//				}
//				
//				if (!email.equals("") && email.matches(regex) == false) {
//					addFieldError("txtTK", "Email không hợp lệ.");
//					return false;
//				}
//			
//				return true;
//			}

			// hủy đăng nhập
//			public String logout() throws IOException {
//				load();
////				userDelete.setEmail(email);
////				 
////				 userDelete = (user) sessionsql.selectOne("LoginMapper.findByEmail", email);
////				 System.out.println("---mail can xoa do la----  " + email );
////				  
////				 is_delete= 1;
////				 userDelete.setIs_delete(is_delete);
////				
//				mail_out=(String) sessionMap.get("email");
//				user userout= new user();
//				
//				userout.setEmail(mail_out);
//				userout = (user) sessionsql.selectOne("LoginMapper.findByEmail", mail_out);
//				
////				 last_login_at = new Date();
////				 userout.setLast_login_at(last_login_at);
//				 System.out.println("mail lan cuoi--"+mail_out);
//					
//					// Update the student record
//				 
//				 sessionsql.update("LoginMapper.updateLogin_at", userout);
//				 
////				System.out.println("landang cuoi la:----"+last_login_at);
//				sessionsql.commit();
//				sessionsql.close();
//				
//				
//				sessionMap.remove("email");
//				sessionMap.remove("password");
//					
//				return SUCCESS;
//			}
//	
	
	
	public String getEmail_find() {
				return email_find;
			}


			public void setEmail_find(String email_find) {
				this.email_find = email_find;
			}


			public String getCustomer_name_find() {
				return customer_name_find;
			}


			public void setCustomer_name_find(String customer_name_find) {
				this.customer_name_find = customer_name_find;
			}


			public String getAddress_find() {
				return address_find;
			}


			public void setAddress_find(String address_find) {
				this.address_find = address_find;
			}


			public String getIs_active_find() {
				return is_active_find;
			}


			public void setIs_active_find(String is_active_find) {
				this.is_active_find = is_active_find;
			}
			
			//..
			
			
			
			


			
			//get set
	public String getNameadd() {
				return nameadd;
			}


			public void setNameadd(String nameadd) {
				this.nameadd = nameadd;
			}


			public String getEmailadd() {
				return emailadd;
			}


			public void setEmailadd(String emailadd) {
				this.emailadd = emailadd;
			}


			public String getPhoneadd() {
				return phoneadd;
			}


			public void setPhoneadd(String phoneadd) {
				this.phoneadd = phoneadd;
			}


			public String getDiachiadd() {
				return diachiadd;
			}


			public void setDiachiadd(String diachiadd) {
				this.diachiadd = diachiadd;
			}


			public int getIs_activeadd() {
				return is_activeadd;
			}


			public void setIs_activeadd(int is_activeadd) {
				this.is_activeadd = is_activeadd;
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
			


	public int getCustomer_id() {
				return customer_id;
			}


			public void setCustomer_id(int customer_id) {
				this.customer_id = customer_id;
			}
			
			///
			
			
			


	@Override
	public void setSession(Map<String, Object> sessionMap) {
		// TODO Auto-generated method stub
		this.sessionMap = sessionMap;
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


	public int getI() {
		return i;
	}


	public void setI(int i) {
		this.i = i;
	}
	
	

}
