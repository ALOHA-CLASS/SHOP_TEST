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
	boolean newFile = false;			// 새 이미지 파일 업로드 여부
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
				case "condition" 		: product.setCondition( value );  break;
			}
		}
		// 파일 데이터
		else {
			String fileName = item.getName();
			
			// 파일 업로드
			if( item == null || fileName == null || fileName == "" ) continue;	// 이미지 없이 업로드한 경우 null 체크
			
			// 업로드 파일명 중복 방지
			// 실제 파일명		 :  강아지.png
			// 업로드 파일명 	 :  UID_강아지.png
			fileName = UUID.randomUUID().toString().substring(0, 11) + "_" + fileName;
			File fileObj = new File(path + "/" + fileName);
			item.write(fileObj.toPath());			// 파일 저장
			file = fileObj.getPath();		
			product.setFile(file);			// DB 에 추가할 파일 경로(file 변수) 지정	- "E:/TJE/UPLOAD/강아지.png"
			newFile = true;					// 업로드한 이미지 파일이 있음
		}
	}
	
	Product oldProduct = productDAO.getProductById(product.getProductId());
	
	// 새로운 이미지 업로드한 경우
	if( newFile ) {
		// 기존 파일 삭제
		String oldFilePath = oldProduct.getFile();
		
		// oldFilePath 파일 경로 null 체크
		if( oldFilePath == null ) oldFilePath = "";
		
		// 파일 삭제
		File oldFile = new File(oldFilePath);
			
		// 파일 존재여부 확인
		if( oldFile.exists() ) {
			// delete()
			// - 파일 삭제 성공 --> true
			// - 파일 삭제 실패 --> false
			// * 하위 경로에 파일이 존재하면 삭제가 되지 않는다.
			if( oldFile.delete() ) {
				System.out.println("파일 삭제 성공!!!");
			}
			else {
				System.err.println("파일 삭제 실패!!!");
			}
		} else {
			System.err.println("파일이 존재하지 않습니다!!!");
		}
	} 
	// 새로운 이미지를 업로드하지 않은 경우
	else {
		// 파일 경로를 기존 파일로 유지
		String oldFilePath = oldProduct.getFile(); 
		if( oldFilePath == null || oldFilePath.isEmpty() ) {
			oldFilePath = "";
		}
		product.setFile( oldFilePath );
	}
 
	out.print(product.getUnitsInStock());
	
	int result = productDAO.update(product);		// 상품 데이터 수정
	String productId = product.getProductId();
	
	if( result > 0 ) {
// 		response.sendRedirect("editProducts.jsp");			// 상품 편집 목록으로 이동
		response.sendRedirect("update.jsp?id=" + productId);	// 상품 수정
	} else {
		response.sendRedirect("update.jsp?id=" + productId + "&error");	// 상품 수정 + 에러
	}

%>





