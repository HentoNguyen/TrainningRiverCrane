<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer</title>
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

	<h3>Customers</h3>
	<hr style="border: 2px solid lightskyblue;">
	<s:form action="timkiemCustomer" >
	<div style="display: flex; margin-left: 40px;"> 
	
		<div style="padding-right: 50px; width: 30%;">
			<label>Họ và tên</label> <!-- <br> --> <input name="name_find" value="${name_find }"
				placeholder="Nhập tên cần tìm" style="width: 60%;">
		</div>
		<div style="padding-right: 50px; width: 30%;">
			<label>Email</label> <input name="email_find" value="${email_find }"
				placeholder="Nhập email cần tìm" style="width: 60%;">
		</div>
		
		<div style="padding-right: 50px; width: 30%;">
			<label>Trạng thái</label> <select name="is_active_find" style="width: 60%;" >
				<option hidden="true">${is_active_find }   </option>
				
				<option  >Đang hoạt động</option>
				<option >Tạm khóa</option>
			</select>
		</div>
		<div style="padding-right: 50px; width: 30%;">
				<label>Địa chỉ</label> <!-- <br> --> <input name=address_find value="${address_find }"
				placeholder="Nhập tên cần tìm" style="width: 60%;">
			
		</div> 
		
		
	</div>
	<br>
	<div style="float: right; margin-right: 80px;">
			<button type="submit"  style="background-color: dodgerblue; color:white;border:1px solid dodgerblue;  margin-right: 5px;"><i class="fa-solid fa-magnifying-glass" style=" background-color: white; margin-left: -6px; color:navy;padding: 1px 6px;"></i>Tìm kiếm</button>
		
			 <button  type="reset" style="background-color: green; color:white;border:1px solid dodgerblue;" ><s:a action="xoatimCus" style="color:white;"><i class="fa-solid fa-x" style=" background-color: white;color:navy;margin-left: -6px; padding: 1px 6px;" ></i> Xóa tìm</s:a></button>
           	 
		</div>
	</s:form>
	
	<div style="display: flex;">
		<a data-toggle="modal" data-target="#myModal" style="margin-left:80px;
		 background-color: dodgerblue; color:white;border:1px solid dodgerblue;">
		 <i class="fa-solid fa-user-plus" style="padding-right:6px; 
		 background-color: white; color:navy;"></i>Thêm mới</a>
		 
		 <input type="file" id="fileUpload" style="margin-left: 90px;"  />
		<i class="fa-solid fa-upload" onclick="Upload()" style=" margin-top: 5px; margin-left: -280px;"></i>
		
		<a style="margin-left: 90px; "><i class="fa-solid fa-download" onclick="exportTableToCSV('customer.csv')" style=" width: 15px;"></i>Export_CSV</a>

		<div class="modal fade" id="myModal" role="dialog">
			
			
			<form action="addCustomer" method="post" onsubmit="return validateCustomer()"
			style="text-align: center; width: 500px; height: 450px; margin: 0 auto; margin-top: 50px;">
			
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: navy;">
							<button type="button" class="close" data-dismiss="modal"
								style="color: white;">&times;</button>
							<h4 class="modal-title" style="color: white; text-align: center;">Thêm
								Customer</h4>
						</div>
						
						<div class="modal-body">

							
								<div>
									<label style="padding-right: 50px;">Tên</label><input
										name="nameadd"  placeholder="Nhập họ tên" id="nameaddCus"> 
										<br>
									<span id="txtnameCus" style="margin-left:-15px;"> </span>
								</div>

								<div>
									<label style="padding-right: 38px;">Email</label><input
										name="emailadd"  placeholder="Nhập email" id="emailaddCus">
										<br>
									<span id="txtmailCus" style="margin-left:-40px;"> </span>
								</div>

								<div>
									<label style="padding-right: 10px;">Điện thoại</label><input
										name="phoneadd" placeholder="Nhập số điện thoại" id="phoneCus">
										<br>
										 <span id="txtphoneCus" style="margin-left:5px;"> </span>
								</div>


								<div>
									<label style="padding-right: 30px;">Địa chỉ</label><input
										name="diachiadd" placeholder="Nhập địa chỉ" id="diachi">
										<br>
										 <span id="txtdiachiCus" style="margin-left:-30px;"> </span>
								</div>


								<div>
									<label style="padding-right: 10px;">Trạng thái</label><select
										name="is_activeadd" id="is_activeaddCus">
										<option value="none">Chọn trạng thái</option>
										<option value="0">Tạm khóa</option>
										<option value="1">Đang hoạt độnng</option>
									</select> 
									<br>
									<span id="txtActiveCus" style="margin-left:-10px;"></span>
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
	<br>
	<div style="text-align: right; margin-right: 80px;">
		<p >Hiển thị danh sách 2 khách hàng trên <b>${count }</b> khách hàng</p>
	</div>
	
	<table border="1" align="center" id="CustomerTable">
		<thead>
			<tr style="background-color: red; color: white; text-align: center;">
				<th style="width: 50px;">#</th>
				<th style="width: 150px;">Ho ten</th>
				<th style="width: 180px;">Email</th>
				<th style="width: 470px;">Địa chỉ</th>
				<th style="width: 100px;">Điện thoại</th>
				<th style="width: 160px;">Trạng thái</th>
				<th style="width: 100px;">Action</th>
			</tr>
		</thead>

		<tbody style="text-align: center;">

			<s:iterator var="customer" value="customers" >

				<s:url var="tempLink" value="updateformCustomer">		
					<s:param name="email" value="email"></s:param>
					<s:param name="customer_name" value="customer_name"></s:param>
					<s:param name="address" value="address"></s:param>
					<s:param name="tel_num" value="tel_num"></s:param>
					<s:param name="is_active" value="is_active"></s:param>
				
				</s:url>

				<tr>

					<td><s:property value="customer_id" /></td>
					<td><s:property value="customer_name" /></td>
					<td><s:property value="email" /></td>
					<td><s:property value="address" /></td>
					<td><s:property value="tel_num" /></td>
					<td><s:if test="is_active">
						    Dang hoat dong  
						</s:if> <s:else>
						    Tam khoa
						</s:else></td>
					
					

					<td style="text-align: center;">
						<!-- tạo ra 2 url tham chiếu đến 2 cái link tempLink, deleteLink, tạo sẵn ở trên, gọi đến
                			 Sau khi click dô cái này -> gọi đến serlet z``, có tham số z`` đc gửi đi -->
                		<s:include value="updateCustomer.jsp"> 
                			<%--  <s:param name="email" value="email"></s:param> --%>
                				
								<s:param name="customer" value="customers"></s:param>
						
                			
                			<i class="fa-solid fa-pen" style="padding-right: 5px;color: navy;"
						 data-toggle="modal" data-target="#myCustomerUpdate" ></i>
                		</s:include>
                		
						<%-- <a href="${tempLink}"><i class="fa-solid fa-pen" style="padding-right: 5px;color: navy;"
						 data-toggle="modal" data-target="#myCustomerUpdate"></i> </a> </s:include>
						 --%>
					</td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	<p style="text-align: center;"> <span id="loi"></span> </p>
	
	<table border="1" align="center">
	 <thead>
		<tr>
			<th><a href="phantrangbackCus?i=${i}">«</a></th>
				<c:forEach begin="1" end="8" var="i" >
				<%-- 		<s:url var="phantranglink" value="trang1">
							<s:param name="i" value="#i"></s:param>
						</s:url> --%>
						
			
						<th style="border-style: groove;padding: 5px;"><a href="phantranglinkCus?i=${i}" >${i}</a></th>	
				</c:forEach>
			<th><a href="phantrangnextCus?i=${i}">»</a></th>
		</tr>
	  </thead>
	</table>
	
	<!--  
	<script type="text/javascript" >
	document.getElementById("upload").addEventListener("change", upload, false);
	document.getElementById("download").addEventListener("click", download, false);
	
	function upload(e) {
	    var data = null;
	    var file = e.target.files[0];
	
	    var reader = new FileReader();
	    reader.readAsText(file);
	    reader.onload = function (event) {
	        var csvData = event.target.result;
	
	        var parsedCSV = d3.csv.parseRows(csvData);
	
	        parsedCSV.forEach(function (d, i) {
	            if (i == 0) return true; // skip the header
	            document.getElementById(d[0]).value = d[1];
	        });
	    }
	}
	
	function download(e) {
	    data = [["customer_id", "customer_name", "email", "tel_num", "address", "is_active", "created_at", "updated_at"]];
	
	    var f = d3.selectAll("#csvForm > input")[0];
	    f.forEach(function(d,i){
	        data.push([d.customer_id, d.customer_name, d.email, d.tel_num, d.address, d.is_active, d.created_at, d.updated_at]);
	    });
	
	    var csvContent = "data:text/csv;charset=utf-8,";
	    data.forEach(function (d, i) {
	        dataString = d.join(",");
	        csvContent += i < data.length ? dataString + "\n" : dataString;
	    });
	
	    var encodedUri = encodeURI(csvContent);
	    var link = document.createElement("a");
	    link.setAttribute("href", encodedUri);
	    link.setAttribute("download", "FormData.csv");
	    link.click(); 
	}
		</script>
   -->
   <!--
   <script src="js/TableCSVExport.js"></script>  -->
   <script type="text/javascript">
    function Upload() {
    	var fileUpload = document.getElementById("fileUpload");
        var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.csv|.txt)$/;
        if (regex.test(fileUpload.value.toLowerCase())) {
            if (typeof (FileReader) != "undefined") {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var table = document.getElementById("CustomerTable");
                    var rows = e.target.result.split("\n");
                    for (var i = 1; i < rows.length; i++) {
                        var cells = rows[i].split(",");
                        if (cells.length > 1) {
                            var row = table.insertRow(-1);
                            for (var j = 0; j < cells.length; j++) {
                                var cell = row.insertCell(-1);
                                cell.innerHTML = cells[j];
                            }
                        }
                    }
//                     var dvCSV = document.getElementById("CustomerTable");
//                     dvCSV.innerHTML = "";
//                     dvCSV.appendChild(table);
                }
                reader.readAsText(fileUpload.files[0]);
            } else {
                alert("This browser does not support HTML5.");
            }
        } else {
            alert("Please upload a valid CSV file.");
        }
    }
    
    function downloadCSV(csv, filename) {
        var csvFile;
        var downloadLink;

        // CSV file
        csvFile = new Blob([csv], {type: "text/csv"});

        // Download link
        downloadLink = document.createElement("a");

        // File name
        downloadLink.download = filename;

        // Create a link to the file
        downloadLink.href = window.URL.createObjectURL(csvFile);

        // Hide download link
        downloadLink.style.display = "none";

        // Add the link to DOM
        document.body.appendChild(downloadLink);

        // Click download link
        downloadLink.click();
    }
    
    function exportTableToCSV(filename) {
        var csv = [];
        var rows = document.querySelectorAll("#CustomerTable tr");
        
        for (var i = 0; i < rows.length; i++) {
            var row = [];
            cols = rows[i].querySelectorAll("td, th");
            
            for (var j = 0; j < cols.length; j++) 
                row.push(cols[j].innerText);
            	
            
            csv.push(row.join(","));        
        }

        // Download CSV file
        downloadCSV(csv.join("\n"), filename);
    }
    
    
    
 // Lấy danh sách tất cả các phần tử có thuộc tính ID trên bảng
 /*    var elements = document.getElementById('CustomerTable').getElementsByTagName('*');

    // Đếm số lượng phần tử có thuộc tính ID trên bảng
    var count = 0;
    for (var i = 0; i < elements.length; i++) {
      if (elements[i].id) {
        count++;
      }
    }

    // Hiển thị số lượng thuộc tính ID trên bảng
    console.log("Số lượng thuộc tính ID trên bảng là: " + count);
 */
 
    
    var elements = document.querySelectorAll('#CustomerTable th[id="customer_id"]');

 	// Hiển thị số lượng cột có tên là "name" trên bảng
 	console.log("Số lượng cột có tên là 'name' trên bảng là: " + elements.length);

 	
 </script> 


<hr />


<!-- function exportTableToCSV(html, filename) {
        var csv = [];
        var rows = document.querySelectorAll("table tr");

        for(var i = 0; i < rows.length; i++){
            var row = [], cols = rows[i].querySelectorAll("td, th");
            for(var j = 0; j < cols.length; j++){
                row.push(cols[j].innerText);
            }
            csv.push(row.join(","));
        }

        // download csv file
        downloadCSV(csv.join("\n"), filename);
    }

    function downloadCSV(csv, filename) {
       	    var csvFile;
    	var downloadLink;

    	csvFile = new Blob([csv], {type:"text/csv"});
    	downloadLink = document.createElement("a");
    	downloadLink.download = filename;
    	downloadLink.href = window.URL.createObjectURL(csvFile);
    	downloadLink.style.display = "none";
    	document.body.appendChild(downloadLink);
    	downloadLink.click();
    } -->
   
</body>
 
</html>