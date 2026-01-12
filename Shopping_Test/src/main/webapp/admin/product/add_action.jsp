<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload2.core.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload2.core.FileItem"%>
<%@page import="org.apache.commons.fileupload2.jakarta.JakartaServletFileUpload"%>
<%@page import="java.util.List"%> 
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="shop.dao.ProductRepository" />
<%       
	request.setCharacterEncoding("UTF-8");
 
	// [NEW] - 파일 업로드 추가 
	// String path = "E:\\TJE\\UPLOAD";
	ServletContext context = getServletContext();
	String rootPath = context.getRealPath("/");
	String path = rootPath + "/UPLOAD";
// 	String path = "/UPLOAD";
	
	// 업로드 디렉토리 생성
	File uploadDir = new File(path);
	if (!uploadDir.exists()) {
		uploadDir.mkdirs();
	}
	
	// DiskFileItemFactory 설정
	DiskFileItemFactory factory = DiskFileItemFactory.builder()
		.setBufferSize(4 * 1024)			// 4KB - 메모리상의 최대 크기
		.setPath(path)						// 임시 저장 경로
		.get();
	
	// JakartaServletFileUpload 설정
	JakartaServletFileUpload upload = new JakartaServletFileUpload(factory);
	upload.setFileSizeMax(10 * 1000 * 1000); 		// 10MB - 파일 최대 크기
	
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	Product product = new Product();
	String file = "";
	while( params.hasNext() ) {
		FileItem item = (FileItem) params.next();
		
		// FileItem
		// .getFieldName()		: 요청 파라미터 이름 - productId
		// .getString()			: 요청 파라미터 값   - P1001
		
		String value = item.getString(java.nio.charset.StandardCharsets.UTF_8);			// P1001
		// 일반 데이터
		if( item.isFormField() ) {
			switch(item.getFieldName()) {
				case "productId" 		: product.setProductId( value );  break;
				case "name" 			: product.setName( value );  break;
				case "unitPrice" 		: product.setUnitPrice(value.isEmpty() ? 0 : Integer.parseInt(value));  break;
				case "description" 		: product.setDescription( value );  break;
				case "manufacturer" 	: product.setManufacturer( value );  break;
				case "category" 		: product.setCategory( value );  break;
				case "unitsInStock" 	: product.setUnitsInStock( value.isEmpty() ? 0 : Integer.parseInt(value) );  break;
				case "condition" 		: product.setCondition( value );
										  out.print("condition : " + value);
										  break;
			}
		}
		// 파일 데이터
		else {
			String fileName = item.getName();
			
			if( item == null || fileName == null || fileName == "" ) continue;	// 이미지 없이 업로드한 경우 null 체크
			
			fileName = UUID.randomUUID().toString().substring(0, 11) + "_" + fileName;
			File fileObj = new File(path + "/" + fileName);
			item.write(fileObj.toPath());		// 파일 저장
			file = fileObj.getPath();		
			product.setFile(file);			// DB 에 추가할 파일 경로(file 변수) 지정	- "E:/TJE/UPLOAD/강아지.png"
		}
	}

// 	String productId = request.getParameter("productId");
// 	String name = request.getParameter("name");
// 	String unitPrice = request.getParameter("unitPrice");
// 	String description = request.getParameter("description");
// 	String manufacturer = request.getParameter("manufacturer");
// 	String category = request.getParameter("category");
// 	String unitsInStock = request.getParameter("unitsInStock");
// 	String condition = request.getParameter("condition");
	
// 	// 가격, 재고 수는 int, long 타입으로 변환
// 	Integer price = unitPrice.isEmpty() ? 0 : Integer.parseInt(unitPrice);
// 	long stock = unitsInStock.isEmpty() ? 0 : Long.parseLong(unitsInStock);
	
// 	Product product = new Product();
// 	product.setProductId(productId);
// 	product.setName(name);
// 	product.setUnitPrice(price);
// 	product.setDescription(description);
// 	product.setManufacturer(manufacturer);
// 	product.setCategory(category);
// 	product.setUnitsInStock(stock);
// 	product.setCondition(condition);

	int result = productDAO.insert(product);		// 상품 데이터 등록
	
	response.sendRedirect("list.jsp");			// 상품 목록으로 이동
%>





