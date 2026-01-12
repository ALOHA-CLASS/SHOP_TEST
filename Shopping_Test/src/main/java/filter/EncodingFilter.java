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
	
	/**
	 * TODO : 요청 및 응답에 대한 문자 인코딩 타입을 'UTF-8' 으로 설정
	 * - 필터가 초기화 될 때, web.xml 에서 설정한 초기 파라미터 "encoding"을 가져와 멤버변수 encoding(String) 에 초기화한다.
	 * - 필터가 실행될 때, 요청 객체와, 응답 객체에 문자 인코딩을 멤버변수 encoding 으로 설정하고 다음 필터를 호출한다.
	 */
}







