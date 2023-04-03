
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UPDATE USER</title>
<style type="text/css">
      div{
        padding-top: 20px;
        
      }
      span{
	color: red;
		text-align: le
	}
      input{
        width: 60%;
      }
      select{
        width: 61%;
      }
      a{
		text-decoration: none;
		font-weight: bold;
		
		}
		form{
			border: 1px solid black;
		}
		
    </style>
    
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>


</head>
<body>


<!-- 
	<a  data-toggle="modal" data-target="#myModalUpdate" style="margin-left:90px;  background-color: dodgerblue; color:white;border:1px solid dodgerblue;"><i class="fa-solid fa-user-plus" style="padding-right:6px; background-color: white; color:navy;"></i>Thêm mới</a>
 -->
	
	
<!-- Form Update   <h1>UPDATE FORM</h1> -->
	<div class="modal fade" id="myModalUpdate" role="dialog" style="margin-top: 60px;">
			
			
			<s:form action="update" onsubmit="return validateUpdateUser()"
			style="text-align: center; width: 500px; height: 450px; margin: 0 auto; ">
			
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: navy; margin-top: -40px;">
							
								 <s:a action="User">
								<button type="button" class="close" data-dismiss="modal"
								style="color: white; float: right;">&times;</button></s:a>
								<h4 class="modal-title" style="color: white; text-align: center;  margin-top: -20px;padding: 20px;">Update User</h4>
							
							
						</div>
						
						<div class="modal-body" style=" margin-bottom: 30px; margin-top: -30px">

							
								<div>
									<label style="padding-right: 44px;">Tên</label><input
										name="name"  placeholder="Nhập họ tên" id="nameupdate" value="${name }"> 
										<br>
									<span id="txtname"> </span>
								</div>

								<div>
									<label style="padding-right: 32px;">Email</label><input
										name="email"  placeholder="Nhập email 222" id="emailupdate" value="${email }">
										<br>
									<span id="txtTK"> </span>
								</div>

								<div>
									<label style="padding-right: 10px;">Mật khẩu</label><input
										name="password" placeholder="Nhập mật khẩu" id="passwordupdate" value="${password }">
										<br>
										 <span id="txtMK"> </span>
								</div>


								<div>
									<label style="padding-right: 10px;">Xác nhận</label><input
										name="passwordxacnhan" placeholder="Xác nhận mật khẩu" id="passwordxacnhan">
										<br>
										 <span id="txtpass"> </span>
								</div>


								<div>
									<label style="padding-right: 32px;">Nhóm</label><select
										name="group_role" id="group_roleupdate">
										<option value="none"> ${group_role }</option>
										<option value="Admin">Admin</option>
										<option value="Reivewer">Riviewer</option>
										<option value="Editor">Editor</option>
									</select> 
									<br>
									<span id="txtGroup"></span>
								</div>
								<div>
									<label style="padding-right: 7px;">Trạng thái</label><select
										name="is_active" id="is_activeupdate">
										  	
										  	 <option value="none" ><s:if test="is_active">
						   						 Dang hoat dong  
											</s:if> <s:else>
						    							Tam khoa
												</s:else></option>
           									 <option value="0">Tam khoa</option>
											<option value="1">Dang hoat dong</option>
									</select> 
									<br>
									<span id="txtActive"></span>
								</div>
							
							

						</div>
						
						<div class="modal-footer" align="right"><hr>
							<!-- <button type="reset" style="margin-right: 30px; padding: 5px;">
										<s:a action="huy" style=" color: blue; font-weight: bold;"> HUY</s:a>
									</button>  -->
									 <s:a action="User">
										<button type="button" style="padding: 5px; margin-right: 20px; margin-top: 10px;"> HUY</button>
									</s:a>
								
									 <button type="submit" 
										style="background-color: red; color: white; border: 2px solid red; padding: 5px; margin-right: 30px;">LUU</button>
									
						</div>
					
					</div>

				</div>
				</s:form>
			</div>
<script type="text/javascript">

function validateUpdateUser() {
	let none="";
	let name = document.getElementById('nameupdate').value;
	let pass= document.getElementById('passwordupdate').value;
	let xacnhanpass= document.getElementById('passwordxacnhan').value;
	let group= document.getElementById('group_roleupdate').value;
	let active= document.getElementById('is_activeupdate').value;
		//chua bat dc group active

	 if (name == none) {
		document.getElementById("txtname").innerHTML = "Không để họ tên trống ";
		return false;
	} 
	 if (name != none) {
		document.getElementById("txtname").innerHTML = "";
		
		} 
	
	 if (pass == none) {
			document.getElementById("txtMK").innerHTML = "Không để mật khẩu trống ";
			return false;
		} 
	if (pass != none) {
			document.getElementById("txtMK").innerHTML = "";
			
		} 
	 if (xacnhanpass == none) {
			document.getElementById("txtpass").innerHTML = "Vui lòng xác nhận mật khẩu ";
			return false;
		} 
	 if (xacnhanpass != pass) {
			document.getElementById("txtpass").innerHTML = "Mật khẩu nhập không giống nhau";
			return false;
		} 
	if (xacnhanpass != none) {
			document.getElementById("txtpass").innerHTML = "";
			
		} 
	 if (group == "none") {
			document.getElementById("txtGroup").innerHTML = "Vui lòng chọn group";
			return false;
		} 
	if (group != "none") {
			document.getElementById("txtGroup").innerHTML = "";
			
		} 
	 if (active == "none") {
			document.getElementById("txtActive").innerHTML = "Vui lòng chọn trạng thái";
			return false;
		} 
	if (active != "none") {
			document.getElementById("txtActive").innerHTML = "";
			
		} 
	
	return true;
	
	}
	
	</script>

<!-- 

	<s:form action="update" namespace="/update" style="text-align: center; width: 500px; height: 400px; margin: 0 auto; margin-top: 50px;">
        
        <div  style="background-color: antiquewhite; margin-bottom: 10px;"><label>Chinh sua user</label></div>
        <div><label style="padding-right: 46px;" >Ten</label><input type="text" name="name" placeholder="Nhập họ tên"  value="${name }"> </div>
        <div> <label style="padding-right: 31px;">Email</label><input type="text" name="email" placeholder="Nhập email" value="${email }"></div>
        <div><label style="padding-right: 10px;">Mat khau</label><input type="text" name="password" placeholder="Nhập mật khẩu" value="${password }"></div>
        <div><label style="padding-right: 10px;">Xac nhan</label><input type="text" name="remember_token" placeholder="Nhập lại mật khẩu"></div>
        <div> <label style="padding-right: 30px;" >Nhom</label><select name="group_role" >
            <option > ${group_role }  </option>
            <option value="Admin">Admin</option>
            <option value="Reivewer">Reivewer</option>
 			<option value="Editor">Editor</option>     
 			 </select>
        
        </div>
       
        <div> <label  style="padding-right:8px;" >Trang thai</label><select name="is_active" >
             	
            <option ><s:if test="is_active">
						    Dang hoat dong  
						</s:if> <s:else>
						    Tam khoa
						</s:else></td></option>
            <option value="0">Tam khoa</option>
            <option value="1">Dang hoat dong</option>
            </select>
        </div>
        <div style="text-align: right; padding-right: 60px;"> 
        
            <button  type="reset" style="margin-right: 30px; padding: 5px;"><s:a action="huy" style=" color: blue; font-weight: bold;"> HUY</s:a></button>
            <button type="submit" style="background-color: red; color: white; border: 2px solid red;  padding: 5px;">LUU</button>
        </div>
    </s:form>     -->
</body>
</html>