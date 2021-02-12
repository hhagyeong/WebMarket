package filter;

import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.IOException;

public class LogFileFilter implements Filter {

	PrintWriter writer;

	// 필터를 초기화하도록 init()메소드 작성
	public void init(FilterConfig config) throws ServletException {

		// web.xml 파일의 <init-param>요소에 설정된 매개변수 filename 값을 전달받도록 함
		String filename = config.getInitParameter("filename");

		// 매개변수 filename의 값이 없으면 예외 처리
		if (filename == null) {
			throw new ServletException("로그 파일의 이름을 찾을 수 없습니다");
		}
		try {
			writer = new PrintWriter(new FileWriter(filename, true), true);
		} catch (IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다");
		}
	}

	// 필터를 리소스에 적용하도록 doFilter() 메소드 작성
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws java.io.IOException, ServletException {
		writer.println("접속한 클라이언트 IP: " + request.getRemoteAddr());
		long start = System.currentTimeMillis();
		writer.println("접근한 URL 경로: " + getURLPath(request));
		writer.println("요청 처리 시작 시각: " + getCurrentTime());

		chain.doFilter(request, response);

		long end = System.currentTimeMillis();
		writer.println("요청 처리 종료 시각: " + getCurrentTime());
		writer.println("요청 처리 소요 시각: " + (end - start) + "ms ");
		writer.println("=========================================");
	}

	// 필터를 종료하기 전에 호출하도록 destroy() 메소드 작성
	public void destroy() {
		writer.close();
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
