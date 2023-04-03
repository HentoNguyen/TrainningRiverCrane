<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User</title>
<style type="text/css">
.header1 a:hover {
	background-color: dodgerblue;
	color: white;
}

.header a {
	float: left;
	color: black;
	text-align: center;
	padding: 12px;
	text-decoration: none;
	font-size: 18px;
	line-height: 25px;
	border-radius: 4px;
}

a {
	text-decoration: none;
	font-weight: bold;
}
span{
	color: red;
}
.modal-body input {
		width: 51%;
	}

select {
		width: 51%;
	}

	
.pagination a {
   color: black;
   float: left;
   padding: 8px 16px;
   text-decoration: none;
   transition: background-color .3s;
 }
/* thiết lập style cho class active */
 .pagination a.active {
   background-color: dodgerblue;
   color: white;
 }
/* thêm màu nền khi người dùng hover vào class không active */
 .pagination a:hover:not(.active) {
   background-color: #ddd;
 }

</style>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
   <script type="text/javascript" src="./js/index.js"></script>
   
<script src="https://kit.fontawesome.com/4cc11dd4ca.js" crossorigin="anonymous"></script>
</head>
<body>

	Hello World,
	${sessionScope.email }--
	${sessionScope.pass }--
	${sessionScope.name }--
	${sessionScope.group_role }
	
	<s:a action="logout"> LOGOUT</s:a>
	
	<!-- <a href="<%= request.getContextPath() %>/Logout.action">Logout</a> -->

	<div class="header"
		style="overflow: hidden; background-color: #f1f1f1; padding: 10px 10px;">
		<div class="header1" style="float: left;">
			<s:a action="Product">Sản Phẩm</s:a>
			<s:a action="Customer">Khách hàng</s:a>
			<s:a action="User">Users</s:a>

		</div>


		<div class="header2" style="float: right;">
			<img src="./icon/login.png" alt="email" style="padding-top: 15px;"></img>
			<a style="float: right; font-weight: bold;"> ${sessionScope.group_role }</a>

		</div>

	</div>

	<h3>Users</h3>
	<hr style="border: 2px solid lightskyblue;">
	<s:form action="timkiem" onsubmit="return validateFind()">
	<div style="display: flex; margin-left: 40px;"> 
	
		<div style="padding-right: 50px; width: 30%;">
			<label>Tên</label> <!-- <br> --> <input name="name_find" value="${name_find }" id="name_find"
				placeholder="Nhập tên cần tìm" style="width: 60%;">
				<span id="txtNameFind" ></span>
		</div>
		<div style="padding-right: 50px; width: 30%;">
			<label>Email</label> <input name="email_find" value="${email_find }" id="email_find"
				placeholder="Nhập email cần tìm" style="width: 60%;">
				<span id="txtEmailFind"></span>
		</div>
		<div style="padding-right: 50px; width: 30%;">
			<label >Nhóm</label> <select name="group_role_find" id="group_role_find"  style="width: 60%;">
				<option hidden="true" >${group_role_find }</option>
				<option>Admin</option>
				<option>Reviewer</option>
				<option>Editor</option>
			</select>
			<span id="txtGroupFind"></span>
		</div> 
		<div style="padding-right: 50px; width: 30%;">
			<label>Trạng thái</label> <select name="is_active_find" id="is_active_find" style="width: 60%;" >
				<option hidden="true">${is_active_find }   </option>
				
				<option  >Đang hoạt động</option>
				<option >Tạm khóa</option>
			</select>
			<span id="txtActiveFind"></span>
		</div>
		
		
	</div>
		<br>
	<div style="float: right; margin-right: 90px;">
			<button type="submit"  style="background-color: dodgerblue; color:white;border:1px solid dodgerblue; margin-right: 5px;"><i class="fa-solid fa-magnifying-glass" style=" background-color: white; margin-left: -6px; color:navy;padding: 1px 6px;"></i>Tìm kiếm</button>
		
			 <button  type="reset" style="background-color: green; color:white;border:1px solid dodgerblue;" ><s:a action="xoatim" style="color:white;"><i class="fa-solid fa-x" style=" background-color: white;color:navy;margin-left: -6px; padding: 1px 6px;" ></i> Xóa tìm</s:a></button>
           	 
	</div>
	
	</s:form>

	<div >
		<a  data-toggle="modal" data-target="#myModal" style="margin-left:90px;  background-color: dodgerblue; color:white;border:1px solid dodgerblue;"><i class="fa-solid fa-user-plus" style="padding-right:6px; background-color: white; color:navy;"></i>Thêm mới</a>

						
			<div class="modal fade" id="myModal" role="dialog">
			
			
			<form action="add" method="post" onsubmit="return validate()"
			style="text-align: center; width: 500px; height: 450px; margin: 0 auto; margin-top: 50px;">
			
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: navy;">
							<button type="button" class="close" data-dismiss="modal"
								style="color: white;">&times;</button>
							<h4 class="modal-title" style="color: white; text-align: center;">Thêm
								User</h4>
						</div>
						
						<div class="modal-body">

							
								<div>
									<label style="padding-right: 44px;">Tên</label><input
										name="nameadd"  placeholder="Nhập họ tên" id="nameadd"> 
										<br>
									<span id="txtname"> </span>
								</div>

								<div>
									<label style="padding-right: 32px;">Email</label><input
										name="emailadd"  placeholder="Nhập email" id="emailadd">
										<br>
									<span id="txtTK"> </span>
								</div>

								<div>
									<label style="padding-right: 10px;">Mật khẩu</label><input
										name="passwordadd" placeholder="Nhập mật khẩu" id="passadd">
										 <span id="txtMK"> </span>
								</div>


								<div>
									<label style="padding-right: 10px;">Xác nhận</label><input
										name="passwordxacnhan" placeholder="Xác nhận mật khẩu" id="xacnhanpass">
										 <span id="txtpass"> </span>
								</div>


								<div>
									<label style="padding-right: 32px;">Nhóm</label><select
										name="group_roleadd" id="group_roleadd">
										<option value="none">Chọn nhóm</option>
										<option value="Admin">Admin</option>
										<option value="Reivewer">Riviewer</option>
										<option value="Editor">Editor</option>
									</select> 
									<span id="txtGroup"></span>
								</div>
								<div>
									<label style="padding-right: 7px;">Trạng thái</label><select
										name="is_activeadd" id="is_activeadd">
										<option value="none">Chọn trạng thái</option>
										<option value="0">Tạm khóa</option>
										<option value="1">Đang hoạt độnng</option>
									</select> 
									<span id="txtActive"></span>
								</div>
							
							

						</div>
						<div class="modal-footer">
							<!-- <button type="reset" style="margin-right: 30px; padding: 5px;">
										<s:a action="huy" style=" color: blue; font-weight: bold;"> HUY</s:a>
									</button>  -->
									<button type="button" class="btn btn-secondary" data-dismiss="modal">HUY</button>
									 <button type="submit" 
										style="background-color: red; color: white; border: 2px solid red; padding: 5px;">LUU</button>
									
						</div>
					
					</div>

				</div>
				</form>
			</div>			
	</div>
	
	
	
	<!-- Form Update
	<div class="modal fade" id="myModalUpdate" role="dialog" >
			
			
			<form action="update" onsubmit="return validate()" 
			style="text-align: center; width: 500px; height: 450px; margin: 0 auto; margin-top: 50px;">
			
				<div class="modal-dialog">

					<div class="modal-content">
						<div class="modal-header" style="background-color: navy;">
							<button type="button" class="close" data-dismiss="modal"
								style="color: white;">&times;</button>
							<h4 class="modal-title" style="color: white; text-align: center;">Update
								User</h4>
						</div>
						
						<div class="modal-body">

							
								<div>
									<label style="padding-right: 44px;">Tên</label><input
										name="nameupdate"  placeholder="Nhập họ tên" id="nameupdate" value="${name }"> 
										<br>
									<span id="txtname"> </span>
								</div>

								<div>
									<label style="padding-right: 32px;">Email</label><input
										name="emailupdate"  placeholder="Nhập email 222" id="emailupdate" value="${email }">
										<br>
									<span id="txtTK"> </span>
								</div>

								<div>
									<label style="padding-right: 10px;">Mật khẩu</label><input
										name="passwordupdate" placeholder="Nhập mật khẩu" id="passwordupdate" value="${password }">
										 <span id="txtMK"> </span>
								</div>


								<div>
									<label style="padding-right: 10px;">Xác nhận</label><input
										name="passwordxacnhan" placeholder="Xác nhận mật khẩu" id="passwordxacnhan">
										 <span id="txtpass"> </span>
								</div>


								<div>
									<label style="padding-right: 32px;">Nhóm</label><select
										name="group_roleupdate" id="group_roleupdate" value="${group_role }">
										<option value="none">Chọn nhóm</option>
										<option value="Admin">Admin</option>
										<option value="Reivewer">Riviewer</option>
										<option value="Editor">Editor</option>
									</select> 
									<span id="txtGroup"></span>
								</div>
								<div>
									<label style="padding-right: 7px;">Trạng thái</label><select
										name="is_activeupdate" id="is_activeupdate" value="${is_active }">
										<option value="none">Chọn trạng thái</option>
										<option value="0">Tạm khóa</option>
										<option value="1">Đang hoạt độnng</option>
									</select> 
									<span id="txtActive"></span>
								</div>
							
							

						</div>
						<div class="modal-footer">
							
									<button type="button" class="btn btn-secondary" data-dismiss="modal">HUY</button>
									 <button type="submit" 
										style="background-color: red; color: white; border: 2px solid red; padding: 5px;">LUU</button>
									
						</div>
					
					</div>

				</div>
				</form>
			</div>
 -->
<br>
	<div style="text-align: right; margin-right: 80px;">
		<p >Hiển thị danh sách 2 user trên <b>${countus }</b> user</p>
	</div>

	<table border="1" align="center">
		<thead>
			<tr style="background-color: red; color: white; text-align: center;">
				<th style="width: 50px;">#</th>
				<th style="width: 100px;">Ho ten</th>
				<th style="width: 150px;">Email</th>
				<th style="width: 100px;">Mat khau</th>
				<th style="width: 100px;">Nhom</th>
				<th style="width: 180px;">Trang Thai</th>
				<th style="width: 100px;">Hoat dong</th>
				<th style="width: 50px;">last_login</th>
				<th style="width: 50px;">Create</th>
				<th style="width: 50px;">Update</th>
				<th style="width: 200px;">Action</th>
			</tr>
		</thead>

		<tbody style="text-align: center;">

			<s:iterator value="users" var="i">

				<s:url var="tempLink" value="updateform">
					<s:param name="name" value="name"></s:param>
					<s:param name="email" value="email"></s:param>
					<s:param name="password" value="password"></s:param>
					<s:param name="group_role" value="group_role"></s:param>
					<s:param name="is_active" value="is_active"></s:param>

				</s:url>

				<s:url var="deleteLink" value="delete">
					<s:param name="email" value="email">
					</s:param>

				</s:url>
				
				<s:url var="activeLink" value="updateActivity">
					<s:param name="email" value="email">
					</s:param>

				</s:url>

				<tr>

					<td><s:property value="id" /></td>
					<td><s:property value="name" /></td>
					<td><s:property value="email" /></td>
					<td><s:property value="password" /></td>
					<td><s:property value="group_role" /></td>
					<td><s:if test="is_active">
						    Dang hoat dong  
						</s:if> <s:else>
						    Tam khoa
						</s:else></td>
					<td><s:if test="is_delete">
						    Da xoa
						</s:if> <s:else>
						    Binh thuong
						</s:else></td>
					<td><s:property value="last_login_at" /></td>
					<td><s:property value="created_at" /></td>
					<td><s:property value="updated_at" /></td>
					

					<td style="text-align: center;">
						<!-- tạo ra 2 url tham chiếu đến 2 cái link tempLink, deleteLink, tạo sẵn ở trên, gọi đến
                			 Sau khi click dô cái này -> gọi đến serlet z``, có tham số z`` đc gửi đi -->
						<s:include value="updateform">
						<a href="${tempLink}"  ><i class="fa-solid fa-pen" style="padding-right: 5px;color: navy;" 
						 data-toggle="modal" data-target="#myModalUpdate" ></i> </a> </s:include>
						
						<a href="${deleteLink}"
						onclick="if (!(confirm('Are you sure you want to delete this user'))) return false">
						<i class="fa-solid fa-trash-can" style="padding-right: 5px;color: red;"></i></a>
						<a href="${activeLink}" onclick="if (!(confirm('Are you sure you want to block/unblock this user'))) return false">
						 <i class="fa-solid fa-user-xmark" style="color: black;"></i> </a>
						 
						 
						
					</td>
				</tr>
				
			</s:iterator>
			
		</tbody>
		
	</table>
	<p style="text-align: center;"> <span id="loi"></span> </p>
	<table border="1"  align="center">
	 
	 <thead>
		<tr>
			<th><a href="phantrangback?i=${i}">«</a></th>
				<c:forEach begin="1" end="8" var="i" >
				<%-- 		<s:url var="phantranglink" value="trang1">
							<s:param name="i" value="#i"></s:param>
						</s:url> --%>
						
			
						<th style="border-style: groove;padding: 5px;"><a href="phantranglink?i=${i}" >${i}</a></th>	
				</c:forEach>
			<th><a href="phantrangnext?i=${i}">»</a></th>
		</tr>
	  </thead>
	</table>
	
	
	
	
	
	<!-- 
	
	<div class="pagination" accesskey="phantrang">
   		<a href="">«</a>
  		<a href="#">1</a>
  		
  		<s:url var="deleteLink" value="delete">
						<s:param name="trang1" value="1">
					</s:param>

		</s:url>
  		<a class="active" href="#">2</a>
 		<a href="">3</a>
   		<a href="#">4</a>
   		<a href="#">5</a>
  		<a href="#">6</a>
  		<a href="#">»</a>
 	</div> -->

	<script type="text/javascript">
		//function fetchOldRecord(this){		
	      // $("#name").val($(this).parent().prev().prev().prev().text());
		   //$("#email").val($(this).parent().prev().prev().prev().text());
		   //$("#passwordadd").val("");
		  // $("#passwordxacnhan").val("");
		   //$("#group_roleadd").val($(this).parent().prev().text());
		   //$("#is_activeadd").val($(this).parent().prev().text());
    	//}
	
	</script>

</body>
 
</html>