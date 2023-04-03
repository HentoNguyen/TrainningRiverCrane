<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
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
/* 
.popover-content {
  position: absolute;
  top: -60px;
  left: 50%;
  transform: translateX(-50%);
  z-index: 999;
}

.popover-img {
  width: 200px;
  height: 200px;
  border: 1px solid #ccc;
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0,0,0,0.3);
  position: relative;
  overflow: hidden;
}

.popover-img img {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  max-width: 100%;
  max-height: 100%;
}
 */

.popover {
    position: absolute;
    z-index: 999;
    display: none;
    padding: 10px;/* 
    background-color: #fff; */
    border: 1px solid #ccc;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
    opacity: 0.9;
	  transition: opacity 0.5s;
 	/*  right: 100%; /* Hiển thị popover bên tay phải */
  
    margin-left: 150px;
top:100%;
 */ 
  }

  /* Style cho hình ảnh nổi lên */
  .popover img {
    max-width: 150px;
    max-height: 150px; 
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
   
   <script src="//d3js.org/d3.v3.min.js"></script>
   
<script src="https://kit.fontawesome.com/4cc11dd4ca.js" crossorigin="anonymous"></script>

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

	<h3>Danh sách sản phẩm</h3>
	<hr style="border: 2px solid lightskyblue;">
	<s:form action="timkiemProduct" >
	<div style="display: flex; margin-left: 40px;"> 
	
		<div style="padding-right: 50px; width: 30%;">
			<label>Tên sản phẩm</label> <!-- <br> --> <input name="name_find" value="${name_find }"
				placeholder="Nhập tên cần tìm" style="width: 60%;">
		</div>
		
		
		<div style="padding-right: 50px; width: 30%;">
			<label>Trạng thái</label> <select name="is_safe_find" style="width: 60%;" >
				<option hidden="true">${is_safe_find }   </option>
				
				<option >Đang bán</option>
				<option >Ngừng bán</option>
				<option >Hết hàng</option>
			</select>
		</div>
		
		
		<div style="padding-right: 50px; width: 30%;">
			<label>Giá bán từ</label> <input name="price_first_find" value="${price_first_find }"
				placeholder="Nhập giá bán nhỏ nhất cần tìm" style="width: 60%;">
		</div>
		<div style="margin-left: -80px; margin-right: 10px; font-size: 20px;">~</div>
		<div style="padding-right: 50px; width: 30%;">
				<label>Giá bán đến</label> <!-- <br> --> <input name=price_end_find value="${price_end_find }"
				placeholder="Nhập giá bán lớn nhất cần tìm" style="width: 60%;">
			
		</div> 
		
		
	</div>
	<br>
	<div style="float: right; margin-right: 80px;">
			<button type="submit"  style="background-color: dodgerblue; color:white;border:1px solid dodgerblue;  margin-right: 5px;"><i class="fa-solid fa-magnifying-glass" style=" background-color: white; margin-left: -6px; color:navy;padding: 1px 6px;"></i>Tìm kiếm</button>
			 <button  type="reset" style="background-color: green; color:white;border:1px solid dodgerblue;" ><s:a action="xoatimPro" style="color:white;"><i class="fa-solid fa-x" style=" background-color: white;color:navy;margin-left: -6px; padding: 1px 6px;" ></i> Xóa tìm</s:a></button>
           	 
		</div>
	</s:form>
	
	<div style="display: flex;">
		<s:a action="themproduct" style="margin-left:80px;
		 background-color: dodgerblue; color:white;border:1px solid dodgerblue;">
		 <i class="fa-solid fa-user-plus" style="padding-right:6px; 
		 background-color: white; color:navy;"></i>Thêm mới</s:a>
		 <!-- 
		thêm sẽ qua 1 jsp mới -->

	</div>
	<br>
	<div style="text-align: right; margin-right: 80px;">
		<p >Hiển thị danh sách 2 sản phẩm trên <b>${countPro }</b> sản phẩm</p>
	</div>
	
	<table border="1" align="center" id="CustomerTable">
		<thead>
			<tr style="background-color: red; color: white; text-align: center;">
				<th style="width: 50px;">id</th>
				<th style="width: 150px;">Tên sản phẩm</th>
				<th style="width: 470px;">Mô tả</th>
				<th style="width: 180px;">Giá</th>
				<th style="width: 160px;">Tình trạng</th>
				<th style="width: 100px;">Action</th>
			</tr>
		</thead>

		<tbody style="text-align: center;">

			<s:iterator value="products" >

				<s:url var="tempLink" value="updateformProduct">		
					<s:param name="product_id" value="product_id"></s:param>
					<s:param name="product_name" value="product_name"></s:param>
					<s:param name="product_price" value="product_price"></s:param>
					<s:param name="description" value="description"></s:param>
					<s:param name="is_sales" value="is_sales"></s:param>
					<s:param name="product_image" value="product_image"></s:param>
				
				</s:url>
				
					<s:url var="deleteLink" value="delete">
					<s:param name="product_id" value="product_id"> </s:param>
							
				</s:url>

				<tr >

					 <td><s:property value="product_id" /></td> 
					 
					<td  data-img="${product_image}" > <s:property value="product_name" /></td>
					<td><s:property value="description" /></td>
					<td><s:property value="product_price" />$</td>
					
					
				<%-- 	<td>
       		 <a href="#" class="product-link" data-img="${product_image}"> <s:property value="product_name" /> </a>
        		<div class="product-img-container"></div>
      						</td> --%>
			
			
								
					
				 	 <%-- <td > <s:property value="product_image"/>  </td>   --%>
					<td ><s:set var="is_sales" value="is_sales"></s:set>
					
						<s:if test="%{#is_sales== 1}">
								Đang bán
						</s:if>
						<s:elseif test="%{#is_sales== 2}">
						 	  Hết hàng
						</s:elseif>
						<s:else>
						   	<span  style="color:red;" >Ngừng bán</span>
						</s:else>
						
						</td>
					
					

					<td style="text-align: center;">
						<!-- tạo ra 2 url tham chiếu đến 2 cái link tempLink, deleteLink, tạo sẵn ở trên, gọi đến
                			 Sau khi click dô cái này -> gọi đến serlet z``, có tham số z`` đc gửi đi -->
						 <a href="${tempLink}"><i class="fa-solid fa-pen"
						 style="padding-right: 5px;color: navy;"></i> </a> 
						 <a href="${deleteLink}"
						onclick="if (!(confirm('Are you sure you want to delete this user'))) return false">
						<i class="fa-solid fa-trash-can" style="padding-right: 5px;color: red;"></i></a>
					</td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	<p style="text-align: center;"> <span id="loi"></span> </p>
	
	<table border="1" align="center">
	 <thead>
		<tr>
			<th><a href="phantrangbackPro?i=${i}">«</a></th>
				<c:forEach begin="1" end="8" var="i" >
				<%-- 		<s:url var="phantranglink" value="trang1">
							<s:param name="i" value="#i"></s:param>
						</s:url> --%>
						
			
						<th style="border-style: groove;padding: 5px;"><a href="phantranglinkPro?i=${i}" >${i}</a></th>	
				</c:forEach>
			<th><a href="phantrangnextPro?i=${i}">»</a></th>
		</tr>
	  </thead>
	</table>
	
	
	<script type="text/javascript">
	/* $(function() {
		  $('#CustomerTable tbody tr').hover(
		    function() {
		      var imgSrc = $(this).find('img').attr('src');
		      $('#product-image').attr('src', imgSrc);
		    },
		    function() {
		      $('#product-image').attr('src', '');
		    }
		  );
		});
	 */
	
	/*  $(function() {
		  // Tạo popover cho sản phẩm khi hover vào tên sản phẩm
		  $('.product-link').hover(function() {
		   
		    var imgSrc = $(this).data('img');
		    
		    var imgHtml = '<img src="' + imgSrc + '">';
		    var imgContainer = $(this).siblings('.product-img-container');
		    imgContainer.html(imgHtml).show();
		  }, function() {
		    $(this).siblings('.product-img-container').hide().empty();
		  });
		});
 */
 
 // Lấy danh sách td chứa tên sản phẩm
 const tdElements = document.querySelectorAll('td[data-img]');

 // Lặp qua từng td để thêm sự kiện hover
 tdElements.forEach(td => {
   // Lấy đường dẫn ảnh từ thuộc tính data-img
   const imgPath = td.getAttribute('data-img');

   // Tạo div chứa popover
   const popover = document.createElement('div');
   popover.classList.add('popover');

   // Tạo thẻ img để hiển thị ảnh trong popover
   const imgElement = document.createElement('img');
   imgElement.src = imgPath;
   popover.appendChild(imgElement);

   // Thêm sự kiện hover để hiển thị popover và ảnh
   td.addEventListener('mouseover', () => {
     // Lấy vị trí của td
     const tdRect = td.getBoundingClientRect();

     // Hiển thị popover và ảnh
     popover.style.display = 'block';
     popover.style.top = tdRect.top - imgElement.offsetHeight + 'px';
     popover.style.left = tdRect.left + 'px';
   });

   // Thêm sự kiện mouseout để ẩn popover
   td.addEventListener('mouseout', () => {
     popover.style.display = 'none';
   });

   // Thêm div popover vào td
   td.appendChild(popover);
 });



	
	
	</script>
	

</body>
 
</html>