
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CẬP NHẬT PRODUCT</title>
<style>
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
 input {
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
</head>

<body>

	Hello World,
	${sessionScope.email }--
	${sessionScope.pass }--
	${sessionScope.name }--
	${sessionScope.group_role }--
	
	<s:a action="logout"> LOGOUT</s:a>
	
	<!-- <a href="<%= request.getContextPath() %>/Logout.action">Logout</a> -->

	<div class="header"
		style="overflow: hidden; background-color: #f1f1f1; padding: 10px 10px;">
		<div class="header1" style="float: left;">
			<s:a action="Product">San Pham</s:a>
			<s:a action="Customer">Khach hang</s:a>
			<s:a action="User">Users</s:a>

		</div>


		<div class="header2" style="float: right;">
			<img src="./icon/login.png" alt="email" style="padding-top: 15px;"></img>
			<a style="float: right; font-weight: bold;"> ${sessionScope.group_role }</a>

		</div>

	</div>

	<h3>Chi tiết sản phẩm</h3>
	<hr style="border: 2px solid lightskyblue;">
	 
 
  
  
<s:form action="updateProduct" enctype="multipart/form-data" method="post" onsubmit="return validateProduct()">
	<div style="display: flex;">
		
	
		<div style=" width:600px; margin-left: 50px;">
	
			<input name="product_id" type="hidden"
				value="${product_id}" placeholder="Nhập id sản phẩm">
		<div style="margin-bottom: 20px;">
			<label style="padding-right: 44px;">Tên Sản phẩm</label><input name="product_name"
				value="${product_name}" placeholder="Nhập tên sản phẩm" id="nameProduct">
			<br>
				<span id="txtnameProduct"> </span>
		</div>

		<div style="margin-bottom: 20px;">
			<label style="padding-right: 90px;">Giá bán</label><input
				name="product_price" value="${product_price}" placeholder="Nhập giá bán" id="priceProduct">
			<br>
				<span id="txtpriceProduct"> </span>
		</div>
		
		
		<div style="margin-bottom: 20px; display: flex;">
			<label style="padding-right: 105px; ">Mô tả</label>
				
				<textarea rows="10" cols="40" placeholder="Mô tả sản phẩm" name="description" id="desProduct" >${description }</textarea>
		 </div>
				<span id="txtdesProduct"  > </span>
		
		

	


		<div style="margin-bottom: 20px;">
			<label style="padding-right: 75px;">Trạng thái</label><select
				name="is_sales" id="is_saleProduct">
			 <option value="none" ><s:set var="is_sales" value="is_sales"></s:set>
					
						<s:if test="%{#is_sales== 1}">
								Đang bán
						</s:if>
						<s:elseif test="%{#is_sales== 2}">
						 	  Hết hàng
						</s:elseif>
						<s:else>
						   	<span  style="color:red;" >Ngừng bán</span>
						</s:else>
					</option>
				<option value="1">Đang bán</option>
				<option value="0">Ngừng bán</option>
				<option value="2">Hết hàng</option>
			</select> 
			<br>
				<span id="txtis_saleProduct" > </span>
		</div>
		
		
	
	
	</div>
	
	
	<div style="margin-left: 100px;">
			<div> <label>Hình ảnh</label> </div>
			<!-- <img alt="img-product" src="img/product_mau.png"> -->
			<%-- <img  src="${product_image }" id="image" width="200" height="200">
			 --%>
			
			
			<!-- Kiểm tra xem đã có ảnh được chọn hay chưa -->
			<c:choose>
			  <c:when test="${not empty product_image}">
			    <!-- Nếu đã có ảnh được chọn thì hiển thị ảnh đó -->
			    <img src="${product_image}" alt="Selected image" id="image" width="200" height="200">
			  </c:when>
			  <c:otherwise>
			    <!-- Nếu chưa có ảnh được chọn thì hiển thị ảnh mặc định -->
			    <img src="img/product_mau.png" alt="Default image"  id="image" width="200" height="200">
			  </c:otherwise>
			</c:choose>
			
			<%-- <c:if test="${not empty product_image}">
  			<button type="button" onclick="deleteFile()">Xóa ảnh</button>
</c:if> --%>

			<br>
				<span id="txtImage" style="margin-left:10px;"> </span>
		
			<!--  <input type="file"  name="imageFile"  style="width: 100%;"
					accept="image/gif, image/jpeg, image/png" onchange="chooseFile(this)" > 
				 -->	  
		
		<!-- 	<input type="file"  name="" id="imageadd"
					accept="image/gif, image/jpeg, image/png" onchange="chooseFile(this)">  -->
					
			<div style="display: flex;">
				<input type="file" name="imageFile" id="file" onchange="showFileName(this)" 	
				accept="image/gif, image/jpeg, image/png"  style="width: 100%;" > 
    			<div id="fileInfo" ></div>
    			
    			
			</div>
			<%-- <input id="fileInfoImage" type="text" value="${product_image }" >
		 --%>
		</div>
	
	
	
	
	
</div>

<div style="text-align: right; padding-right: 60px;">

			<button type="reset" style="margin-right: 30px; padding: 5px;">
				<s:a action="huy" style=" color: blue; font-weight: bold;"> HUY</s:a>
			</button>
			<button type="submit"
				style="background-color: red; color: white; border: 2px solid red; padding: 5px;">LUU</button>
		</div>
</s:form>
	
	<script type="text/javascript">
	/* 	hàm để hiển thị ảnh khi chọn đc đường dẫn
	function chooseFile(fileInput){
			if(fileInput.files && fileInput.files[0]){
				var reader = new FileReader();
				
				reader.onload = function(e){
					$('#image').attr('src', e.target.result);
				}
				reader.readAsDataURL(fileInput.files[0]);
			}
		} */
		
		 function showFileName(fileInput) {
			 if(fileInput.files && fileInput.files[0]){
					var reader = new FileReader();
					
					reader.onload = function(e){
						$('#image').attr('src', e.target.result);
					}
					reader.readAsDataURL(fileInput.files[0]);
				}
		        var fileInput = document.getElementById("file");
		        var fileInfo = document.getElementById("fileInfo");
		      
		        fileInfo.innerHTML =' <button type="button" onclick="deleteFile()">Xóa</button>';
		       
		    }

		    function deleteFile() {
		        var fileInput = document.getElementById("file");
		        var fileInfo = document.getElementById("fileInfo");
		        
		        // Gửi yêu cầu xóa file đến server
		        var xhr = new XMLHttpRequest();
		        xhr.onreadystatechange = function() {
		            if (this.readyState == 4 && this.status == 200) {
		                // Nếu xóa thành công, thay đổi nội dung của thẻ HTML để bỏ thông tin file đã chọn
		                fileInfo.innerHTML = "";
		                fileInput.value = "";
		                document.getElementById("image").src = "img/product_mau.png"; // Thay đổi ảnh mặc định ở đây
		            }
		        };
		        xhr.open("POST", "deleteFile", true);
		        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		        xhr.send("path=" + fileInput.value);
		    }
	

			function validateProduct() {
				var none="";
				var name = document.getElementById('nameProduct').value;
				var price = document.getElementById('priceProduct').value;
				var mota= document.getElementById('desProduct').value;
				var issale= document.getElementById('is_saleProduct').value;
				var preview= document.getElementById('image');

				var testemail= document.getElementById('fileInfoImage'); 
				
				 if (name == none) {
					document.getElementById("txtnameProduct").innerHTML = "Tên sản phẩm không được để trống";
					return false;
				} 
				 if (name != none) {
					document.getElementById("txtnameProduct").innerHTML = "";
					
					} 
			
				 if (price == none) {
					document.getElementById("txtpriceProduct").innerHTML = "Giá sản phẩm không được để trống";
					return false;
					}  
				 if (price != none) {
						document.getElementById("txtpriceProduct").innerHTML = "";
						
						} 
				
				 if (mota == none) {
						document.getElementById("txtdesProduct").innerHTML = "Mô tả sản phẩm không được để trống";
						return false;
					} 
				if (mota != none) {
						document.getElementById("txtdesProduct").innerHTML = "";
						
					} 
				
				 if (issale == "none") {
						document.getElementById("txtis_saleProduct").innerHTML = "Trạng thái không được để trống";
						return false;
					} 
				if (issale != "none") {
						document.getElementById("txtis_saleProduct").innerHTML = "";
						
					} 
					
				if (preview.src.endsWith("testemail")) {
					document.getElementById("txtImage").innerHTML = "Hình ảnh sản phẩm không được để trống";
						return false;
					}
				
				if (!preview.src.endsWith("testemail")) {
					document.getElementById("txtImage").innerHTML = "";
				}
				
				
				return true;
			
			}




		
	</script>
</body> 
</html>