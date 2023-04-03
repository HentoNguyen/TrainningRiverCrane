
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THÊM PRODUCT</title>
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
	margin-left: 140px;
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
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
   <script type="text/javascript" src="./js/index.js"></script>
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
	<hr style="border: 2px solid lightskyblue; margin-bottom: 50px;">
  
	<s:form action="addProduct" enctype="multipart/form-data" method="post" onsubmit="return validateProduct()">
		<div style="display: flex;">
		
	
		<div style=" width:600px; margin-left: 50px;">

	
		<div style="margin-bottom: 20px;">
			<label style="padding-right: 44px;">Tên Sản phẩm</label><input name="nameadd"
				value="${nameadd}" placeholder="Nhập tên sản phẩm" id="nameProduct">
			<br>
				<span id="txtnameProduct"> </span>
		</div>

		<div style="margin-bottom: 20px;">
			<label style="padding-right: 90px;">Giá bán</label><input
				name="priceadd" value="${priceadd}" placeholder="Nhập giá bán" id="priceProduct">
			<br>
				<span id="txtpriceProduct"> </span>
		</div>
		
		
		<div style="margin-bottom: 20px; display: flex;">
			<label style="padding-right: 105px; ">Mô tả</label>
				
				<textarea rows="10" cols="40" placeholder="Mô tả sản phẩm" name="descriptionadd" id="desProduct"></textarea>
		
		</div>
				<span id="txtdesProduct"  > </span>

		<div style="margin-bottom: 20px;">
			<label style="padding-right: 75px;">Trạng thái</label><select
				name="is_saleadd" id="is_saleProduct">
				<option value="none">Chọn trạng thái</option>
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
			
			<img alt="mau" src="img/product_mau.png" id="image" width="300" height="300">
			<br>
				<span id="txtImage" style="margin-left:10px;"> </span>
			
			<input type="file" name="imageFile" id="file" onchange="previewFile()" 	
				accept="image/gif, image/jpeg, image/png"  style="width: 100%;" > 
				
		<!-- 	<input type="file"  name="" id="imageadd"
					accept="image/gif, image/jpeg, image/png" onchange="chooseFile(this)">  -->
			<!-- <input type="submit" value="Upload">  -->
			<%-- <s:file id=""  name="imageadd"  label="Image">${imageadd}</s:file> --%>
			
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
		/* function chooseFile(fileInput){
			if(fileInput.files && fileInput.files[0]){
				var reader = new FileReader();
				
				reader.onload = function(e){
					$('#image').attr('src', e.target.result);
				}
				reader.readAsDataURL(fileInput.files[0]);
			}
		} */
		
		  function previewFile() {
		        var fileInput = document.getElementById("file");
		        var preview = document.getElementById("image");
		        
		        // Nếu người dùng đã chọn file hình
		        if (fileInput.files && fileInput.files[0]) {
		            var reader = new FileReader();
		            reader.onload = function(e) {
		                // Thay đổi thuộc tính src của thẻ img để hiển thị ảnh mới
		                preview.src = e.target.result;
		            }
		            reader.readAsDataURL(fileInput.files[0]);
		        } else {
		            // Nếu người dùng chưa chọn file hình, hiển thị ảnh mặc định
		            preview.src = "img/product_mau.png"; // Thay đổi ảnh mặc định ở đây
		        }
		    }
		
		function validateProduct() {
			var none="";
			var name = document.getElementById('nameProduct').value;
			var price = document.getElementById('priceProduct').value;
			var mota= document.getElementById('desProduct').value;
			var issale= document.getElementById('is_saleProduct').value;
			var preview= document.getElementById('image');
			
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
				
			if (preview.src.endsWith("img/product_mau.png")) {
				document.getElementById("txtImage").innerHTML = "Hình ảnh sản phẩm không được để trống";
					return false;
				}
			
			if (!preview.src.endsWith("img/product_mau.png")) {
				document.getElementById("txtImage").innerHTML = "";
			}
			
			
			return true;
		
		}
		

		
	</script>
</body> 
</html>