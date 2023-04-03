
	function validate() {
		let none="";
		let name = document.getElementById('nameadd').value;
		let email = document.getElementById('emailadd').value;
		let pass= document.getElementById('passadd').value;
		let xacnhanpass= document.getElementById('xacnhanpass').value;
		let group= document.getElementById('group_roleadd').value;
		let active= document.getElementById('is_activeadd').value;
			//chua bat dc group active

			
		 var pattern = /^[a-zA-Z0-9\-_]+(\.[a-zA-Z0-9\-_]+)*@[a-z0-9]+(\-[a-z0-9]+)*(\.[a-z0-9]+(\-[a-z0-9]+)*)*\.[a-z]{2,4}$/;
		
		 if (name == none) {
			document.getElementById("txtname").innerHTML = "Khong de ho ten trong";
			return false;
		} 
		 if (name != none) {
			document.getElementById("txtname").innerHTML = "";
			
			} 

		 if (email == none) {
			document.getElementById("txtTK").innerHTML = "Khoong de email trong ";
			return false;
			}  
		 if (email != none) {
				document.getElementById("txtTK").innerHTML = "";
				
				} 
		 if (!pattern.test(email)) {
	         document.getElementById("txtTK").innerHTML = "Email khong dung dinh dang ";
	        return false;
	    }
		 
		 if (pattern.test(email)) {
	         document.getElementById("txtTK").innerHTML = "";
	      
	    }
		
		 if (pass == none) {
				document.getElementById("txtMK").innerHTML = "Khong de mat khau trong";
				return false;
			} 
		if (pass != none) {
				document.getElementById("txtMK").innerHTML = "";
				
			} 
		 if (xacnhanpass == none) {
				document.getElementById("txtpass").innerHTML = "Khong de pass khong dung";
				return false;
			} 
		 if (xacnhanpass != pass) {
				document.getElementById("txtpass").innerHTML = "xac nhan pass khong dung";
				return false;
			} 
		if (xacnhanpass != none) {
				document.getElementById("txtpass").innerHTML = "";
				
			} 
		 if (group == "none") {
				document.getElementById("txtGroup").innerHTML = "Khong de nhom trong";
				return false;
			} 
		if (group != "none") {
				document.getElementById("txtGroup").innerHTML = "";
				
			} 
		 if (active == "none") {
				document.getElementById("txtActive").innerHTML = "Khong de trang thai trong";
				return false;
			} 
		if (active != "none") {
				document.getElementById("txtActive").innerHTML = "";
				
			} 
		
		return true;
		
		}
	
	
		
	
	
	
	
	
	function validateCustomer() {
		var none="";
		var name = document.getElementById('nameaddCus').value;
		var email = document.getElementById('emailaddCus').value;
		var phone= document.getElementById('phoneCus').value;
		var diachi= document.getElementById('diachi').value;
		var actived= document.getElementById('is_activeaddCus').value;
			//chua bat dc group active
	
			
		 var pattern = /^[a-zA-Z0-9\-_]+(\.[a-zA-Z0-9\-_]+)*@[a-z0-9]+(\-[a-z0-9]+)*(\.[a-z0-9]+(\-[a-z0-9]+)*)*\.[a-z]{2,4}$/;
		
		 if (name == none) {
			document.getElementById("txtnameCus").innerHTML = "Họ và tên không được để trống";
			return false;
		} 
		 if (name != none) {
			document.getElementById("txtnameCus").innerHTML = "";
			
			} 
	
		 if (email == none) {
			document.getElementById("txtmailCus").innerHTML = "Email không được để trống";
			return false;
			}  
		 if (email != none) {
				document.getElementById("txtmailCus").innerHTML = "";
				
				} 
		 if (!pattern.test(email)) {
	         document.getElementById("txtmailCus").innerHTML = "Email không đúng định dạng ";
	        return false;
	    }
		 
		 if (pattern.test(email)) {
	         document.getElementById("txtmailCus").innerHTML = "";
	      
	    }
		
		 if (phone == none) {
				document.getElementById("txtphoneCus").innerHTML = "Số điện thoại không được để trống";
				return false;
			} 
		if (phone != none) {
				document.getElementById("txtphoneCus").innerHTML = "";
				
			} 
		 if (diachi == none) {
				document.getElementById("txtdiachiCus").innerHTML = "Địa chỉ không được để trống";
				return false;
			} 
		 if (diachi != none) {
				document.getElementById("txtdiachiCus").innerHTML = "";
			} 
	
		 if (actived == "none") {
				document.getElementById("txtActiveCus").innerHTML = "Trạng thái không được để trống";
				return false;
			} 
		if (actived != "none") {
				document.getElementById("txtActiveCus").innerHTML = "";
				
			} 
		
		return true;
	
	}
	
	
	
	
	
	


	
	
	
		
