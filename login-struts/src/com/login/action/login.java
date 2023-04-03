package com.login.action;

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

import com.login.entity.user;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class login extends ActionSupport implements SessionAware {

	private static final String conf = "application.xml";
	Reader reader;
	SqlSessionFactoryBuilder builder;
	SqlSessionFactory sessionFactory;
	SqlSession sessionsql;
	user user = new user();
	user userAdd;
	user userDelete= new user();
	user userUpdate= new user();
	user userFind= new user();
	List<user> users = new ArrayList();
	List<user> listusers = new ArrayList();

	private String txtTK, txtMK;
	private Map<String, Object> sessionMap;
	private int id, is_active, is_delete, phantrang, i;
	private String email, password, name, group_role, mail_out;
	private String name_find, email_find, group_role_find, is_active_find;
	
	
	private String remember_token, verify_email, last_login_ip;
	private Date last_login_at, created_at, updated_at;
	
	private String remember, is_activeupdate;
	private String nameadd,passwordadd,emailadd,group_roleadd, passwordxacnhan;
	private int is_activeadd;
	


	public void load() throws IOException {
		reader = Resources.getResourceAsReader(conf);
		builder = new SqlSessionFactoryBuilder();
		sessionFactory = builder.build(reader);
		sessionsql = sessionFactory.openSession();
	}
	
	
	public String checklogin() throws IOException {
		load();
		
		String loggedUserName = null;
		sessionMap = ActionContext.getContext().getSession();
		

		// check if the userName is already stored in the session
//		sessionMap.containsKey("password_pass");
//		loggedPass = (String) sessionMap.get("password_pass");
//
//		sessionMap.containsKey("name");
//		loggedName = (String) sessionMap.get("name");
//		sessionMap.containsKey("is_active");
//		loggedActive =  (int) sessionMap.get("is_active");
//		sessionMap.containsKey("is_delete");
//		loggedDelete = (int) sessionMap.get("is_delete");
//		sessionMap.containsKey("group_role_pass");
//		loggedGrouprole = (String) sessionMap.get("group_role_pass");
		
		
		

//		if (sessionMap.containsKey("email")) {
//			loggedUserName = (String) sessionMap.get("email");
//
//		} // khi đã đăng nhập và load lại trang ở tab mới thì dữ liệu sẽ vẫn load lên lại
//			// không bị mất đi
//		
//        	if (loggedUserName != null ) {
////			setActionMessagee(user.getMessage(currentSession.put("actionMessage",getActionMessages())));
//			id=  (int) sessionMap.get("id");
//			email = (String) sessionMap.get("email");
//			password = (String) sessionMap.get("password");
//			name = (String) sessionMap.get("name");
////			is_active = (int) sessionMap.get("is_active");
////			is_delete =  (int) sessionMap.get("is_delete");
//			group_role = (String) sessionMap.get("group_role");
//
////			System.out.println("---- la gi   " + loggedUserName);
////
////			System.out.println("---- la gi   " + loggedPass);
////			System.out.println("---- la gi   " + loggedName);
//
//			System.out.println("---- tai khoan la gi   " + email);
////	        	logins = session.selectList("LoginMapper.GetAll");
//		
//			users = sessionsql.selectList("LoginMapper.GetAll");
//			return SUCCESS; // return welcome page
//		}
		
		
		//khi chưa đăng nhập mà cố zo trong sẽ bị bắt quay lại trang đăng nhập
		HttpSession session=ServletActionContext.getRequest().getSession(true);  
//		if(session==null || session.getAttribute("fail")==null){  
//			return "fail";  
//		} 
		
//		String regex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";

		

		
        
		System.out.println("----------" + email);
		System.out.println("----------" + loggedUserName);
		user = sessionsql.selectOne("LoginMapper.findByEmail", email);

		if (email != null) {
			if (vadilate()) {
				if (user != null && user.getPassword().equals(password)) {
					name = user.getName();
					is_active = user.getIs_active();
					is_delete = user.getIs_delete();
					group_role = user.getGroup_role();
					
//		   			  user.setIs_active(is_active?"Dang hoat dong": "Tam khoa");
					System.out.println("tim thanh cong nha.  checklogin--" + email);
					System.out.println("tim thanh cong nha.  checklogin--" + is_active);
					sessionMap.put("id", id);
					sessionMap.put("email", email);
					sessionMap.put("password", password);
					sessionMap.put("name", name);
					sessionMap.put("group_role", group_role);
					
					
					System.out.println("phan trang la:------"+phantrang);
//					phantrang=0;
					users = sessionsql.selectList("LoginMapper.GetAllPage", phantrang);
//					users = sessionsql.selectList("LoginMapper.GetAll");
					sessionsql.commit();
					sessionsql.close();
					return SUCCESS;
				} else
					Note();
			}
		}else{
			String getSessionAttr = (String) session.getAttribute("email");
			
			if (getSessionAttr != null) {
				id=  (int) sessionMap.get("id");
				email = (String) sessionMap.get("email");
				password = (String) sessionMap.get("password");
				name = (String) sessionMap.get("name");
//				is_active = (int) sessionMap.get("is_active");
//				is_delete =  (int) sessionMap.get("is_delete");
				group_role = (String) sessionMap.get("group_role");
	
//				System.out.println("---- la gi   " + loggedUserName);
	//
//				System.out.println("---- la gi   " + loggedPass);
//				System.out.println("---- la gi   " + loggedName);
	
				System.out.println("---- tai khoan da dang nhap   " + email);

				System.out.println("---- tai khoan da dang nhap   " + id);
//		        	logins = session.selectList("LoginMapper.GetAll");
//				int countus= sessionsql.selectOne("LoginMapper.countUser");
//				System.out.println("số lượng id us là--"+countus);
//				
//				int countuser= sessionsql.selectOne("LoginMapper.countUser");
//				System.out.println("số lượng id user là--"+countuser);
				users = sessionsql.selectList("LoginMapper.GetAllPage", phantrang);
//				users = sessionsql.selectList("LoginMapper.GetAll");
				return SUCCESS;

			} else {
				return INPUT;
			}
		}

//		   in other cases, return login page
		return INPUT;
	}
	
	
	public user checklogins() {
		return user;
	}

	public List<user> getUsers() {
		return users;
	}
	//cap nhat is_active
	public String updateActive() throws IOException {
//		email=(String) sessionMap.get("email");
//		user userout= new user();
		load();
		
		userUpdate.setEmail(email);
		userUpdate = (user) sessionsql.selectOne("LoginMapper.findByEmail", email);
		int active=0;
		if(userUpdate.getIs_active() == 0) {
			active=1;
		}
		userUpdate.setIs_active(active);
		userUpdate.setEmail(email);
		

		 sessionsql.update("LoginMapper.updateActive", userUpdate);
		 System.out.println("active la--"+is_active);
		 System.out.println("active la--"+active);
		 users = sessionsql.selectList("LoginMapper.GetAll");
		 sessionsql.commit();
		 sessionsql.close();
			// Update the student record
		 
		return SUCCESS;
	}

	public void Note() {

		if (!email.equals("") && !password.equals("")) {
			addFieldError("Notification", "Thông tin tài khoản hoặc mật khẩu không đúng");
		}

	}

	
	// Thêm user

	public String AddUser() throws IOException {
		load();
				is_delete = 0;

//			last_login_at = new Date();
//			System.out.println("Date hien tai: " + last_login_at);

				InetAddress myIP = InetAddress.getLocalHost();
				System.out.println("Địa chỉ IP của tôi là:");
				System.out.println(myIP.getHostAddress());
				last_login_ip = myIP.getHostAddress();
				created_at = new Date();
				System.out.println("Date hien tai: " + created_at);
				System.out.println("group them: " + group_role);
				System.out.println("active them: " + is_activeadd);
				userAdd = new user();
				
				userAdd.setName(nameadd);
				userAdd.setEmail(emailadd);
				userAdd.setPassword(passwordadd);
				userAdd.setRemember_token(remember_token);
				userAdd.setVerify_email(verify_email);
				userAdd.setIs_active(is_activeadd);
				userAdd.setIs_delete(is_delete);
				userAdd.setGroup_role(group_roleadd);
				userAdd.setLast_login_at(last_login_at);
				userAdd.setLast_login_ip(last_login_ip);
				userAdd.setCreated_at(created_at);
				userAdd.setUpdated_at(updated_at);
				userAdd.setId(id);
				sessionsql.insert("LoginMapper.addUser", userAdd);
				users = sessionsql.selectList("LoginMapper.GetAll");
				System.out.println("inserted successfully");
				sessionsql.commit();
				sessionsql.close();
			
		System.out.println("group---------" + group_roleadd);

		System.out.println("active------" + is_activeadd);
		// Insert student data
		System.out.println("name la: "+name);
		
		
		return SUCCESS;
	}

	public user AddUsers() {
		return userAdd;
	}
	

	public String getIs_activeupdate() {
		return is_activeupdate;
	}


	public void setIs_activeupdate(String is_activeupdate) {
		this.is_activeupdate = is_activeupdate;
	}


	public String UpdateUser() throws IOException {
		 load();
		 userUpdate.setEmail(email);
		 updated_at = new Date();
		 System.out.println("vừa sửa vào lúc: ------" + updated_at);
		 
//		 userUpdate = (user) sessionsql.selectOne("LoginMapper.findByEmail", email);
		 System.out.println("---mail can sửa do la----  " + email );
		  
		 
//		 int is_active=0;
//		 if(is_activeupdate == "Đang hoạt động") {
//			 is_active= 1;
//		 }
//		 
		 userUpdate.setName(name);
		System.out.println("name can sua ---"+name);
		 userUpdate.setPassword(password);
		 userUpdate.setIs_active(is_active);
		 userUpdate.setIs_delete(is_delete);
		 userUpdate.setGroup_role(group_role);
		 userUpdate.setUpdated_at(updated_at);
		 userUpdate.setEmail(email);
			// Update the student record
		 
		 sessionsql.update("LoginMapper.updateUser", userUpdate);

		 users = sessionsql.selectList("LoginMapper.GetAll");
		 System.out.println(" delete successfully");
		 sessionsql.commit();
		 sessionsql.close();
		return SUCCESS;
	}

	public user UpdateUsers() {
		return userUpdate;
	}
	
	
	public String deleteUser() throws IOException {
		 load();
		 userDelete.setEmail(email);
		 
		 userDelete = (user) sessionsql.selectOne("LoginMapper.findByEmail", email);
		 System.out.println("---mail can xoa do la----  " + email );
		  
		 is_delete= 1;
		 userDelete.setIs_delete(is_delete);
			
			// Update the student record
		 
		 sessionsql.update("LoginMapper.deleteUser", userDelete);

		 users = sessionsql.selectList("LoginMapper.GetAll");
		 System.out.println(" delete successfully");
		 sessionsql.commit();
		 sessionsql.close();
		return SUCCESS;
	}

	public user deleteUsers() {
		return userDelete;
	}
	
	//find email
	public String timkiem() throws IOException {
		load();
		
//		
//		if (email_find.equals("") || name_find.equals("") || group_role_find.equals("")|| is_active==0) {
//			return SUCCESS;
//		}
		
		if (!email_find.isEmpty()) {
			userFind.setEmail(email_find);
			 
//			userFind = (user) sessionsql.selectOne("LoginMapper.findByEmail", email_find);
			System.out.println("---mail cần tìm đó là----  " + email_find );
			users = sessionsql.selectList("LoginMapper.findByEmailFind", email_find);
			sessionsql.commit();
			sessionsql.close();
			return SUCCESS;
		}else if(!name_find.isEmpty()) {
			userFind.setName(name_find);
			System.out.println("---ten cần tìm đó là----  " + name_find );
			users = sessionsql.selectList("LoginMapper.findByName", name_find);
			sessionsql.commit();
			sessionsql.close();
			return SUCCESS;
		}else if(!group_role_find.isEmpty()) {
			userFind.setName(group_role_find);
			System.out.println("---group cần tìm đó là----  " + group_role_find );
			users = sessionsql.selectList("LoginMapper.findByGroup", group_role_find);
			sessionsql.commit();
			sessionsql.close();
			return SUCCESS;
		}else {
			userFind.setName(is_active_find);
			int active = 0;
			if (is_active_find.equals("Đang hoạt động") ) {
				 active =1;
				 System.out.println("is active --" +active);
			}
			
			System.out.println("---trạng thái cần tìm đó là----  " + active);
			users = sessionsql.selectList("LoginMapper.findByActive", active);
			sessionsql.commit();
			sessionsql.close();
			return SUCCESS;
		}
	}
	
	// phantrang load lại trang data
		public String phantrang() throws IOException {
			load();
			int index=0;
			
			index= (i-1)*2;
			
			System.out.println("index hien tai: ---"+i);

			
			System.out.println("index khi click là: ---"+index);
			users = sessionsql.selectList("LoginMapper.GetAllPage", index);
			// return welcome page

			return SUCCESS;
		}
		
		// phantrang next load trang data
		public String phantrangnext() throws IOException {
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
			users = sessionsql.selectList("LoginMapper.GetAllPage", index);
			// return welcome page

			return SUCCESS;
		}
		
		// phantrang back load trang data
		public String phantrangback() throws IOException {
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
			users = sessionsql.selectList("LoginMapper.GetAllPage", index);
			// return welcome page

			return SUCCESS;
		}
	
	//xóa tìm kiếm load lại trang data
	public String xoatim() throws IOException {
		load();
	
		users = sessionsql.selectList("LoginMapper.GetAll");
		// return welcome page

		return SUCCESS;
	}

	
	public String remember() {
		
		if (remember.isEmpty()) {
			return ERROR;
		}
		System.out.println("remember:  "+remember);
		return SUCCESS;
	}

	// bắt lỗi
	public boolean vadilate() {
//		   String regex = "^[0-9]+$";
		String regex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";

		if (email.equals("")) {
			addFieldError("txtTK", "Email không được trống");
		}

		if (password.equals("")) {
			addFieldError("txtMK", "Mật khẩu không được trống");
		}
		
		if (!email.equals("") && email.matches(regex) == false) {
			addFieldError("txtTK", "Email không hợp lệ.");
			return false;
		}
	
		return true;
	}

	// hủy đăng nhập
	public String logout() throws IOException {
		load();
//		userDelete.setEmail(email);
//		 
//		 userDelete = (user) sessionsql.selectOne("LoginMapper.findByEmail", email);
//		 System.out.println("---mail can xoa do la----  " + email );
//		  
//		 is_delete= 1;
//		 userDelete.setIs_delete(is_delete);
//		
		mail_out=(String) sessionMap.get("email");
		user userout= new user();
		
		userout.setEmail(mail_out);
		userout = (user) sessionsql.selectOne("LoginMapper.findByEmail", mail_out);
		
		 last_login_at = new Date();
		 userout.setLast_login_at(last_login_at);
		 System.out.println("mail lan cuoi--"+mail_out);
			
			// Update the student record
		 
		 sessionsql.update("LoginMapper.updateLogin_at", userout);
		 
		System.out.println("landang cuoi la:----"+last_login_at);
		sessionsql.commit();
		sessionsql.close();
		
		
		sessionMap.remove("email");
		sessionMap.remove("password");
			
		return SUCCESS;
	}
	
	//hủy thêm
	public String huyadd() throws IOException {
		load();
		users = sessionsql.selectList("LoginMapper.GetAll");
		// return welcome page

		return SUCCESS;
	}

//chuyển đến trang user
	public String reditUser() throws IOException {
		load();	
		email = (String) sessionMap.get("email");
		System.out.println("email"+email);
		user = sessionsql.selectOne("LoginMapper.findByEmail", email);
		password = (String) sessionMap.get("password");
		name = (String) sessionMap.get("name");
		group_role = (String) sessionMap.get("group_role");
		
		
		
		int countus= sessionsql.selectOne("LoginMapper.countUser");
		System.out.println("số lượng id là--"+countus);
		sessionMap.put("countus",countus);
		
		users = sessionsql.selectList("LoginMapper.GetAll");
		return SUCCESS;
	}
	
	
//	   get set
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGroup_role() {
		return group_role;
	}

	public void setGroup_role(String group_role) {
		this.group_role = group_role;
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

	public String getLast_login_ip() {
		return last_login_ip;
	}

	public void setLast_login_ip(String last_login_ip) {
		this.last_login_ip = last_login_ip;
	}

	public Date getLast_login_at() {
		return last_login_at;
	}

	public void setLast_login_at(Date last_login_at) {
		this.last_login_at = last_login_at;
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

	public String getTxtTK() {
		return txtTK;
	}

	public void setTxtTK(String txtTK) {
		this.txtTK = txtTK;
	}

	public String getTxtMK() {
		return txtMK;
	}
	public void setTxtMK(String txtMK) {
		this.txtMK = txtMK;
	}
	
	public String getRemember() {
		return remember;
	}
	public void setRemember(String remember) {
		this.remember = remember;
	}

	public String getName_find() {
		return name_find;
	}
	public void setName_find(String name_find) {
		this.name_find = name_find;
	}

	public String getEmail_find() {
		return email_find;
	}
	public void setEmail_find(String email_find) {
		this.email_find = email_find;
	}
	
	public String getGroup_role_find() {
		return group_role_find;
	}
	public void setGroup_role_find(String group_role_find) {
		this.group_role_find = group_role_find;
	}

	public String getIs_active_find() {
		return is_active_find;
	}
	public void setIs_active_find(String is_active_find) {
		this.is_active_find = is_active_find;
	}
	
	public int getPhantrang() {
		return phantrang;
	}
	public void setPhantrang(int phantrang) {
		this.phantrang = phantrang;
	}
	
	
	public int getI() {
		return i;
	}
	public void setI(int i) {
		this.i = i;
	}
	
	public String getMail_out() {
		return mail_out;
	}
	public void setMail_out(String mail_out) {
		this.mail_out = mail_out;
	}

	public String getNameadd() {
		return nameadd;
	}
	public void setNameadd(String nameadd) {
		this.nameadd = nameadd;
	}

	public String getPasswordadd() {
		return passwordadd;
	}
	public void setPasswordadd(String passwordadd) {
		this.passwordadd = passwordadd;
	}


	public String getEmailadd() {
		return emailadd;
	}
	public void setEmailadd(String emailadd) {
		this.emailadd = emailadd;
	}


	public String getGroup_roleadd() {
		return group_roleadd;
	}
	public void setGroup_roleadd(String group_roleadd) {
		this.group_roleadd = group_roleadd;
	}

	public int getIs_activeadd() {
		return is_activeadd;
	}
	public void setIs_activeadd(int is_activeadd) {
		this.is_activeadd = is_activeadd;
	}


	public String getPasswordxacnhan() {
		return passwordxacnhan;
	}
	public void setPasswordxacnhan(String passwordxacnhan) {
		this.passwordxacnhan = passwordxacnhan;
	}
	

	@Override
	public void setSession(Map<String, Object> sessionMap) {
		// TODO Auto-generated method stub
		this.sessionMap = sessionMap;
	}


	
	
}
