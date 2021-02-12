package filter;

import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class LogFilter implements Filter {

	// 필터를 초기화하도록 init()메소드 작성
	public void init(FilterConfig config) throws ServletException {
		System.out.println("WebMarket 초기화");
	}

	// 필터를 리소스에 적용하도록 doFilter() 메소드 작성
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws java.io.IOException, ServletException {
		System.out.println("접속한 클라이언트 IP: " + request.getRemoteAddr());
		long start = System.currentTimeMillis();
		System.out.println("접근한 URL 경로: " + getURLPath(request));
		System.out.println("요청 처리 시작 시각: " + getCurrentTime());
		chain.doFilter(request, response);

		long end = System.currentTimeMillis();
		System.out.println("요청 처리 종료 시각: " + getCurrentTime());
		System.out.println("요청 처리 소요 시간: " + (end - start) + "ms ");
		System.out.println("===========================================");
	}

	// 필터를 종료하기 전에 호출하도록 destroy() 메소드 작성
	public void destroy() {

	}

	// 현재 접속한 URL을 얻어오는 사용자 정의 메소드인 getURLPath() 작성
	private String getURLPath(ServletRequest request) {
		HttpServletRequest req;
		String currentPath = "";
		String queryString = "";
		if (request instanceof HttpServletRequest) {
			req = (HttpServletRequest) request;
			currentPath = req.getRequestURI();
			queryString = req.getQueryString();
			queryString = queryString == null ? "" : "?" + queryString;
		}
		return currentPath + queryString;
	}

	// 현재 시간을 얻어오는 사용자 정의 메소드 getCurrentTime() 작성
	private String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(calendar.getTime());
	}

}
