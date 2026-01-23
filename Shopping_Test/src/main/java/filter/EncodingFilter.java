package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.annotation.WebInitParam;

@WebFilter(
    urlPatterns = "/*",
    initParams = {
        @WebInitParam(name = "encoding", value = "UTF-8")
    }
)
public class EncodingFilter implements Filter {

    private String encoding;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 어노테이션에서 설정한 초기 파라미터 가져오기
        encoding = filterConfig.getInitParameter("encoding");
        System.out.println("EncodingFilter init : " + encoding);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        System.out.println("인코딩 필터 : " + encoding);

        request.setCharacterEncoding(encoding);
        response.setCharacterEncoding(encoding);

        // 다음 필터 또는 서블릿으로 전달
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // 정리 작업 필요 시 사용
    }
}
