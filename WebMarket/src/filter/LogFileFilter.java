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

	// ���͸� �ʱ�ȭ�ϵ��� init()�޼ҵ� �ۼ�
	public void init(FilterConfig config) throws ServletException {

		// web.xml ������ <init-param>��ҿ� ������ �Ű����� filename ���� ���޹޵��� ��
		String filename = config.getInitParameter("filename");

		// �Ű����� filename�� ���� ������ ���� ó��
		if (filename == null) {
			throw new ServletException("�α� ������ �̸��� ã�� �� �����ϴ�");
		}
		try {
			writer = new PrintWriter(new FileWriter(filename, true), true);
		} catch (IOException e) {
			throw new ServletException("�α� ������ �� �� �����ϴ�");
		}
	}

	// ���͸� ���ҽ��� �����ϵ��� doFilter() �޼ҵ� �ۼ�
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws java.io.IOException, ServletException {
		writer.println("������ Ŭ���̾�Ʈ IP: " + request.getRemoteAddr());
		long start = System.currentTimeMillis();
		writer.println("������ URL ���: " + getURLPath(request));
		writer.println("��û ó�� ���� �ð�: " + getCurrentTime());

		chain.doFilter(request, response);

		long end = System.currentTimeMillis();
		writer.println("��û ó�� ���� �ð�: " + getCurrentTime());
		writer.println("��û ó�� �ҿ� �ð�: " + (end - start) + "ms ");
		writer.println("=========================================");
	}

	// ���͸� �����ϱ� ���� ȣ���ϵ��� destroy() �޼ҵ� �ۼ�
	public void destroy() {
		writer.close();
	}

	// ���� ������ URL�� ������ ����� ���� �޼ҵ��� getURLPath() �ۼ�
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

	// ���� �ð��� ������ ����� ���� �޼ҵ� getCurrentTime() �ۼ�
	private String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(calendar.getTime());
	}

}
