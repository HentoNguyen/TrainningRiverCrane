
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UPDATE CUSTOMER</title>
<style type="text/css">
      div{
        padding-top: 18px;
        
      }
      span{
      	color: red;
      }
      input{
        width: 51%;
      }
      select{
        width: 51%;
      }
      a{
		text-decoration: none;
		font-weight: bold;
		
		}
		form{
			border: 1px solid black;
		}
		
    </style>
    
   


</head>
<body>


<!-- 
	<a  data-toggle="modal" data-target="#myModalUpdate" style="margin-left:90px;  background-color: dodgerblue; color:white;border:1px solid dodgerblue;"><i class="fa-solid fa-user-plus" style="padding-right:6px; background-color: white; color:navy;"></i>Thêm mới</a>
 -->
	<%-- 
	<s:set var="tempLink">
		 <s:param name="mail" value="mail"></s:param>
	</s:set> --%>
	
		<s:set var="customer" >		
			${param.email }	
		</s:set>
		
<!-- Form Update   <h1>UPDATE FORM</h1> -->
	<div class="modal fade" id="myCustomerUpdate" role="dialog" >
			
			
			<form action="updateCustomer" onsubmit="return validateUpdateCustomer()" 
			style="text-align: center; width: 500px; height: 450px; margin: 0 auto; margin-top: 50px; ">
			
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: navy; margin-top: -40px;">
							
								
								<button type="button" class="close" data-dismiss="modal"
								style="color: white; float: right;">&times;</button>
								<h4 class="modal-title" style="color: white; text-align: center;  margin-top: -20px;padding: 20px;">Update Customer</h4>
							
							
						</div>
						
						<div class="modal-body" >

							
								
								<div>
									<label style="padding-right: 50px;">Tên</label><input
										name="customer_name"  placeholder="Nhập họ tên" id="customer_name_update" value="${customer.customer_name }"> 
										<br>
									<span id="txtnameCus" > </span>
								</div>

								<div>
									<label style="padding-right: 38px;">Email</label><input
										name="email"  placeholder="Nhập email" id="emailUpdate" value="${customer.email }">
										<br>
									<span id="txtmailCus"> </span>
								</div>

								<div>
									<label style="padding-right: 10px;">Điện thoại</label><input
										name="tel_num" placeholder="Nhập số điện thoại" id="tel_num_update"  value="${tel_num }">
										<br>
										 <span id="txtphoneCus"> </span>
								</div>


								<div>
									<label style="padding-right: 30px;">Địa chỉ</label><input
										name="address" placeholder="Nhập địa chỉ" id="address_update"  value="${address }">
										<br>
										 <span id="txtdiachiCus"> </span>
								</div>


								<div>
									<label style="padding-right: 10px;">Trạng thái</label><select
										name="is_active" id="is_active_update">
										
										 <option value="none" ><s:if test="is_active">
						   						 Dang hoat dong  
											</s:if> <s:else>
						    							Tam khoa
												</s:else></option>
										<option value="0">Tạm khóa</option>
										<option value="1">Đang hoạt độnng</option>
									</select> 
									<br>
									<span id="txtActiveCus" ></span>
								</div>
							
							
							

						</div>
						
						<div class="modal-footer" align="right"><hr>
							<!-- <button type="reset" style="margin-right: 30px; padding: 5px;">
										<s:a action="huy" style=" color: blue; font-weight: bold;"> HUY</s:a>
									</button>  -->
									 <%-- <s:a action="Customer"> --%>
										<button type="button" data-dismiss="modal" style="padding: 5px; margin-right: 20px;"> HUY</button>
									<%-- </s:a> --%>
								
									 <button type="submit" 
										style="background-color: red; color: white; border: 2px solid red; padding: 5px; margin-right: 30px;">LUU</button>
									
						</div>
					
					</div>

				</div>
				</form>
			</div>
			
			
			
			<script type="text/javascript">

function validateUpdateCustomer() {
	let none="";
	let name = document.getElementById('customer_name_update').value;
	let tel= document.getElementById('tel_num_update').value;
	let address= document.getElementById('address_update').value;
	let active= document.getElementById('is_active_update').value;
		//chua bat dc group active

	 if (name == none) {
		document.getElementById("txtnameCus").innerHTML = "Không để họ tên trống ";
		return false;
	} 
	 if (name != none) {
		document.getElementById("txtnameCus").innerHTML = "";
		
		} 
	
	 if (tel == none) {
			document.getElementById("txtphoneCus").innerHTML = "Không để số điện thoại trống ";
			return false;
		} 
	if (tel != none) {
			document.getElementById("txtphoneCus").innerHTML = "";
			
		} 
	 if (address == none) {
			document.getElementById("txtdiachiCus").innerHTML = "Không để địa chỉ trống ";
			return false;
		} 
	if (address != none) {
			document.getElementById("txtdiachiCus").innerHTML = "";
			
		} 
	 if (active == "none") {
			document.getElementById("txtActiveCus").innerHTML = "Không để trạng thái trống";
			return false;
		} 
	if (active != "none") {
			document.getElementById("txtActiveCus").innerHTML = "";
			
		} 
	
	return true;
	
	}
	
	</script>

</body>
</html>