package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

public class EncodingFilter implements Filter {
	
	private String encoding; 
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// web.xml 에서 설정한 초기 파라미터 가져오기
		encoding = filterConfig.getInitParameter("encoding");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("인코딩 필터 : " + encoding);
		// 요청, 응답 시, 문자 인코딩 설정
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		
		// 다음 필터로 요청/응답 전달
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		
	}
}







