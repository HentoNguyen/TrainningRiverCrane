<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <script src="https://kit.fontawesome.com/a076d05399.js"></script> --%>
<script src="https://kit.fontawesome.com/4cc11dd4ca.js" crossorigin="anonymous"></script>
<style type="text/css">
	
	 
	body {
  	 background-color: #9f9da7;
  font-size: 1.6rem;
  font-family: "Open Sans", sans-serif;
  color: #2b3e51;
	}
	
	.formdiv{
	background-color: #fff;
  width: 45%;
  height: 250px;
  margin: 70px auto;
  text-align: center;
  padding: 20px 0 20px 0;
  border-radius: 4px;
  box-shadow: 0px 30px 50px 0px rgba(0, 0, 0, 0.2);
  		
	}
	
	.input{
		width: 65%;	
	}
	i{
		margin-right: 8px;
	}
	
	span{
		color: red; 
		text-align: left;
	}
	

</style>
	
</head>

<body>
 <h1 align="center">Hello World From Login Struts2</h1>


   	<div class="formdiv"  >
  	 <s:form action="loginaction" method="post" style=" margin: 70px 0 0 90px; text-align: center;">
		<div style="display: flex;  margin-top: 20px;padding: 0 60px; ">
		  	<i class="fa-solid fa-user"></i>
	    	<input name="email" value="${email}" class="input" placeholder="Nhập email" >
	    	
	    	
		</div>
		<span  >
			<s:fielderror fieldName="txtTK" style="list-style: none;margin-top:-0px;margin-left:50px;height: 2px; font-size: 15px; " />
			</span>
		
					
		<div style="display: flex; padding: 0 60px; margin-top:20px;">
		 	<!--  <img src="./icon/pass.png" alt="pass"></img>-->
		 	<i class="fa-solid fa-lock"></i>
		    <input name="password" type="password" value="${password}" class="input" placeholder="Nhập mật khẩu">
		</div>
		<span  >
			<s:fielderror fieldName="txtMK"  style="list-style: none;margin-top:-0px;margin-left:50px;height: 2px; font-size: 15px; " />
		</span>
		
		<span >
			<s:fielderror fieldName="Notification"  style="list-style: none;margin-top:-0px;margin-left:50px;height: 2px; font-size: 15px; " > </s:fielderror>
    	</span>
			
			<div style="padding: 0 60px; display: inline-flex;">
			
			<input type="checkbox" name="remember"><label style="font-size: 20px; padding-right: 84px;">Remeber</label>
			
			<button type="submit"  style="margin-right: 76px;" >Dang Nhap</button>
			
		</div>
	</s:form>
		</div>
		
		<!-- 
			<s:a action="remember"><input type="checkbox" name="remember" >f </s:a>
			 -->
		
</body>
</html>