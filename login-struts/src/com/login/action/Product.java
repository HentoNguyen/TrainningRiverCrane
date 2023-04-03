package com.login.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.login.entity.customer;
import com.login.entity.product;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


//import jdk.internal.math.FloatingDecimal;

public class Product extends ActionSupport implements SessionAware {
	
	private static final String conf = "application.xml";
	Reader reader;
	SqlSessionFactoryBuilder builder;
	SqlSessionFactory sessionFactory;
	SqlSession sessionsql;
	
	product product= new product();
	product productAdd;
	product productFind= new product();
	product productUpdate= new product();
	product productDelete= new product();
	
	List<product> productcount=new ArrayList();
	List<product> products = new ArrayList();

	private Map<String, Object> sessionMap;
	
	private String product_id, product_name, product_image, description, product_priceUp, product_price;
	private int is_sales, is_saleadd, i;
	private Date created_at, updated_at;
	
	private String name_find, is_safe_find;
	private String price_first_find, price_end_find;
	private String nameadd, descriptionadd, priceadd;
	
	private File imageFile; 
	private String imageFileContentType,imageFileFileName;

	
	
	public void load() throws IOException {
		reader = Resources.getResourceAsReader(conf);
		builder = new SqlSessionFactoryBuilder();
		sessionFactory = builder.build(reader);
		sessionsql = sessionFactory.openSession();
		
	}
	
	
	public List<product> getProducts() throws IOException {
		load();	
		
		sessionMap = ActionContext.getContext().getSession();
		int count= sessionsql.selectOne("LoginMapper.countPro");
		System.out.println("số lượng id là--"+count);
		sessionMap.put("countPro",count);
		return products;
	}
	
	public String AddProduct() throws Exception {
		load();
//		HttpServletRequest request = null;
			created_at = new Date();
			System.out.println("Date hien tai: " + created_at);
			System.out.println("active them: " + is_saleadd);
			
			/*
			 * String filePath=
			 * ServletActionContext.getServletContext().getRealPath("/").concat("img/");
			 * File fileToCreate = new File(filePath, this.productImageFileName);
			 * FileUtils.copyFile(this.imageadd, fileToCreate);
			 * 
			 * product_image= "img/"+productImageFileName;
			 */
			/* String filePath=ServletActionContext.getServletContext().getRealPath("/"); */
			/*
			 * String filePath=
			 * ServletActionContext.getServletContext().getRealPath("/uploads"); File
			 * fileToCreate = new File(filePath, productImageFileName);
			 * FileUtils.copyFile(imageadd, fileToCreate);
			 */

			 
			   // Lưu file ảnh vào thư mục trên server
//			String imagePath = "";
//	        DiskFileItemFactory factory = new DiskFileItemFactory();
//	        ServletFileUpload upload = new ServletFileUpload(factory);
//	        List<FileItem> items = upload.parseRequest(request);
//	        for (FileItem item : items) {
//	            if (!item.isFormField()) {
//	                String fileName = new File(item.getName()).getName();
//	                String filePath = "path/to/your/uploaded/files/" + fileName;
//	                File storeFile = new File(filePath);
//	                item.write(storeFile);
//	                imagePath = filePath;
//	            } else {
//	                // Lấy giá trị của các trường khác nếu có
//	            }
//	        }
		
			
			
			 
		        // Tạo một đối tượng Product từ dữ liệu được submit từ form
//		        product.setImage(fileName);
				/*
				 * String uploadPath =
				 * servletRequest.getSession().getServletContext().getRealPath("/uploads"); File
				 * uploadFile = new File(uploadPath, uploadImageFileName);
				 * FileUtils.copyFile(uploadImage, uploadFile);
				 * 
				 * // Lưu thông tin vào cơ sở dữ liệu
				 * product.setImageUrl(uploadFile.getAbsolutePath());
				 * productDAO.insertProduct(product);
				 */
			
			//lấy link ảnh
			 String filePath=
				 ServletActionContext.getServletContext().getRealPath("/img");
			 File fileToCreate = new File(filePath, imageFileFileName);
				 FileUtils.copyFile(imageFile, fileToCreate);

				 System.out.println("filePath--" +filePath);
				 System.out.println("file--" +fileToCreate);
			   // Lấy đường dẫn của file ảnh
//	        String imagePath = "";
	        product_image= "img/"+imageFileFileName;
			 
	        
	         String lastMaSP = sessionsql.selectOne("LoginMapper.idMax"); // Lấy mã sản phẩm cuối cùng trong database
	         int nextID = Integer.parseInt(lastMaSP.substring(2)) + 1; // Tách số từ mã sản phẩm cuối cùng và cộng thêm 1 để tạo ra số kế tiếp
	         String nextMaSP = "SP" + String.format("%02d", nextID); // Định dạng lại mã sản phẩm mới
	         System.out.println("id lớn nhất sản phẩm là--"+nextMaSP);

//	        String idmax= sessionsql.selectOne("LoginMapper.idMax");
//			idmax +=1;
			product_id= nextMaSP;

			System.out.println("id lớn nhất sản phẩm productIdlà--"+product_id);
			productAdd = new product();
			
			productAdd.setProduct_id(product_id);
			productAdd.setProduct_name(nameadd);
			productAdd.setProduct_price(priceadd);
			productAdd.setDescription(descriptionadd);
			productAdd.setIs_sales(is_saleadd);
			productAdd.setProduct_image(product_image);
			productAdd.setCreated_at(created_at);
			productAdd.setUpdated_at(updated_at);
			
			sessionsql.insert("LoginMapper.addProduct", productAdd);

			System.out.println("id lớn nhất sản phẩm sau them của produtId là--"+product_id);
		    System.out.println("id lớn nhất sản phẩm sau them next là--"+nextMaSP);
			products = sessionsql.selectList("LoginMapper.GetAllProduct");
			System.out.println("inserted product successfully");
			sessionsql.commit();
			sessionsql.close();
		
		//	System.out.println("group---------" + group_roleadd);
		
			System.out.println("active------" + is_saleadd);
			// Insert student data
			System.out.println("name la: "+nameadd);
			
			
		
		return SUCCESS;
	}


	//update product
	public String UpdateProduct() throws IOException {
		 load();
		 productUpdate.setProduct_id(product_id);
		 updated_at = new Date();
		 System.out.println("vừa sửa vào lúc: ------" + updated_at);

		 System.out.println("vừa sửa vào lúc: ------" + product_id);
		 
		 productUpdate = (product) sessionsql.selectOne("LoginMapper.findByProductId", productUpdate);
		 System.out.println("---id product can sửa do la----  " + product_id );
		 
		 String filePath=
				 ServletActionContext.getServletContext().getRealPath("/img");
			 File fileToCreate = new File(filePath, imageFileFileName);
				 FileUtils.copyFile(imageFile, fileToCreate);
		 product_image= "img/"+imageFileFileName;
//		 BigDecimal decimalValue = resultSet.getBigDecimal(columnName);
		 
		 productUpdate.setProduct_id(product_id);
		 productUpdate.setProduct_name(product_name);
		 productUpdate.setProduct_image(product_image);
		 productUpdate.setProduct_price( product_price);
		 productUpdate.setIs_sales(is_sales);
		 productUpdate.setDescription(description);
		 productUpdate.setUpdated_at(updated_at);
		
			// Update the product record
		 
		 sessionsql.update("LoginMapper.updateProduct", productUpdate);

		 products = sessionsql.selectList("LoginMapper.GetAllProduct");
		 System.out.println(" update product successfully");
		 sessionsql.commit();
		 sessionsql.close();
		return SUCCESS;
	}

	public product UpdateProducts() {
		return productUpdate;
	}
	
	
	
	//delete
	 public String deleteProduct() throws IOException {
			 load();
			 
			 productDelete.setProduct_id(product_id);
				
			 productDelete = sessionsql.selectOne("LoginMapper.findByProductId", product_id);
			 System.out.println("---id product can xoa do la----  " + product_id );
			  
			 
			 sessionsql.delete("LoginMapper.deleteProduct", productDelete);
			 
			 products = sessionsql.selectList("LoginMapper.GetAllProduct");
			 System.out.println(" delete product successfully");
			 sessionsql.commit();
			 sessionsql.close();
			return SUCCESS;
		}

		public product deleteProducts() {
			return productFind;
		}

	
	//chuyển đến trang reditProduct
	public String reditProduct() throws IOException {
		load();	

//		sessionMap = ActionContext.getContext().getSession();
//		int count= sessionsql.selectOne("LoginMapper.countCustomer");
//		System.out.println("số lượng id là--"+count);
//		sessionMap.put("count",count);
//		customers = sessionsql.selectList("LoginMapper.GetAllPageCustomer", phantrang);
		products = sessionsql.selectList("LoginMapper.GetAllProduct");
		return SUCCESS;
	}
	
	
	
//	find email
	public String timkiemProduct() throws IOException {
		load();
		
//		
//		if (email_find.equals("") || name_find.equals("") || group_role_find.equals("")|| is_active==0) {
//			return SUCCESS;
//		}
		
		 if(!name_find.isEmpty()) {
			productFind.setProduct_name(name_find);
			System.out.println("---ten cần tìm đó là----  " + name_find );
			products = sessionsql.selectList("LoginMapper.findByNameProduct", name_find);
			sessionsql.commit();
			sessionsql.close();
			return SUCCESS;
		}
		else if(!price_first_find.isEmpty() && !price_end_find.isEmpty()) {
		
			System.out.println("---ten cần tìm đó là----  " + price_first_find );
			System.out.println("---ten cần tìm đó là----  " + price_end_find );
//			String price=  price_first_find + " AND " + price_end_find;
//			String price="BETWEEN " +price_first_find + " " + "AND  "+ price_end_find;
//			System.out.println("---ten cần tìm đó là----  " + price );
//			
			
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("price_first_find", price_first_find);
			params.put("price_end_find", price_end_find);

			
			products = sessionsql.selectList("LoginMapper.findByPrice", params);
			sessionsql.commit();
			sessionsql.close();
			return SUCCESS;
		}
		else {
			productFind.setProduct_name(is_safe_find);
			int active = 0;
			if (is_safe_find.equals("Đang bán") ) {
				 active =1;
				 System.out.println("is active --" +active);
			}
			 if (is_safe_find.equals("Hết hàng") ) {
				 active =2;
				 System.out.println("is active --" +active);
			}
			
			System.out.println("---trạng thái cần tìm đó là----  " + active);
			products = sessionsql.selectList("LoginMapper.findByActiveProduct", active);
			sessionsql.commit();
			sessionsql.close();
			return SUCCESS;
		}
	}

	//xóa tìm kiếm load lại trang data
	public String xoatim() throws IOException {
		load();
		
		products = sessionsql.selectList("LoginMapper.GetAllProduct");
		// return welcome page

		return SUCCESS;
	}
	
	// phantrang load lại trang data
				public String phantrangPro() throws IOException {
					load();
					int index=0;
					
					index= (i-1)*2;
					
					System.out.println("index hien tai: ---"+i);

					
					System.out.println("index khi click là: ---"+index);
					products = sessionsql.selectList("LoginMapper.GetAllPageProduct", index);
					// return welcome page

					return SUCCESS;
				}
				
				// phantrang next load trang data
				public String phantrangnextPro() throws IOException {
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
					products = sessionsql.selectList("LoginMapper.GetAllPageProduct", index);
					// return welcome page

					return SUCCESS;
				}
				
				// phantrang back load trang data
				public String phantrangbackPro() throws IOException {
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
					products = sessionsql.selectList("LoginMapper.GetAllPageProduct", index);
					// return welcome page

					return SUCCESS;
				}
				
	
	
	
	
	

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.sessionMap = sessionMap;
	}


	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}


	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}


	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}


	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}


	public int getIs_sales() {
		return is_sales;
	}
	public void setIs_sales(int is_sales) {
		this.is_sales = is_sales;
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
	
	
	
	
	
	
	
	


	public String getName_find() {
		return name_find;
	}
	public void setName_find(String name_find) {
		this.name_find = name_find;
	}
	
	
	public String getIs_safe_find() {
		return is_safe_find;
	}
	public void setIs_safe_find(String is_safe_find) {
		this.is_safe_find = is_safe_find;
	}
	
	
	public String getPrice_first_find() {
		return price_first_find;
	}
	public void setPrice_first_find(String price_first_find) {
		this.price_first_find = price_first_find;
	}
	
	
	public String getPrice_end_find() {
		return price_end_find;
	}
	public void setPrice_end_find(String price_end_find) {
		this.price_end_find = price_end_find;
	}


	public String getNameadd() {
		return nameadd;
	}
	public void setNameadd(String nameadd) {
		this.nameadd = nameadd;
	}


	public String getPriceadd() {
		return priceadd;
	}
	public void setPriceadd(String priceadd) {
		this.priceadd = priceadd;
	}


	public String getDescriptionadd() {
		return descriptionadd;
	}
	public void setDescriptionadd(String descriptionadd) {
		this.descriptionadd = descriptionadd;
	}

	
	public int getIs_saleadd() {
		return is_saleadd;
	}
	public void setIs_saleadd(int is_saleadd) {
		this.is_saleadd = is_saleadd;
	}


	public File getImageFile() {
		return imageFile;
	}


	public void setImageFile(File imageFile) {
		this.imageFile = imageFile;
	}


	public String getImageFileContentType() {
		return imageFileContentType;
	}


	public void setImageFileContentType(String imageFileContentType) {
		this.imageFileContentType = imageFileContentType;
	}


	public String  getImageFileFileName() {
		return imageFileFileName;
	}


	public void setImageFileFileName(String imageFileFileName) {
		this.imageFileFileName = imageFileFileName;
	}


	public String getProduct_priceUp() {
		return product_priceUp;
	}


	public void setProduct_priceUp(String product_priceUp) {
		this.product_priceUp = product_priceUp;
	}


	public int getI() {
		return i;
	}


	public void setI(int i) {
		this.i = i;
	}
	
	
	
	
	
	
}
