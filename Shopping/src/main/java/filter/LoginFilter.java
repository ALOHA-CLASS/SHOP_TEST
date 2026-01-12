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
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		cookies = httpRequest.getCookies();
		
		String rememberMe = null;
		String token = null;
		if( cookies != null ) {
			for(int i = 0 ; i < cookies.length ; i++) {
				Cookie cookie = cookies[i];
				String cookieName = cookie.getName();
				String cookieValue = URLDecoder.decode( cookie.getValue(), "UTF-8" );
				switch(cookieName) {
				 	case "rememberMe" 	: rememberMe = cookieValue;		break;
				 	case "token" 		: token = cookieValue;		break;
				}
			}
		}
		
		System.out.println("LoginFilter ...");
		System.out.println("rememberMe : " + rememberMe);
		System.out.println("token : " + token);
		
		
		HttpSession session = httpRequest.getSession();
		
		// 자동 로그인 한 경우
		if( rememberMe != null && token != null ) {
			PersistentLogin login = userDAO.selectTokenByToken(token);
			if( login != null )
				session.setAttribute("loginId", login.getUserId());
		}
		
		chain.doFilter(request, response);
	}

	public void destroy() {
		
	}

}
