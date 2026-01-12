package filter;

import java.io.IOException;
import java.net.URLDecoder;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import shop.dao.UserRepository;
import shop.dto.PersistentLogin;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/*")
public class LoginFilter implements Filter {
	
	Cookie[] cookies;
	UserRepository userDAO;
    public LoginFilter() {
        super();
    }

    public void init(FilterConfig fConfig) throws ServletException {
    	userDAO = new UserRepository();
    }

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		/**
		 * TODO: 쿠키 정보와 DB 정보를 확인하여 자동 로그인 기능을 구현
		 * - 쿠키 정보 "rememberMe", "token"을 가져와 변수에 저장한다.
		 * - 쿠키 정보 "rememberMe", "token" 가 모두 존재하는 경우, 자동 로그인을 설정한 경우로 판단한다.
		 * - 자동 로그인을 설정한 경우, 테이블 [persistent_logins] 에서 해당 token을 조건으로 login_id를 조회하여 session 에 "loginId" 라는 속성명으로 등록한다.
		 */
		
		chain.doFilter(request, response);
	}

	public void destroy() {
		
	}

}
