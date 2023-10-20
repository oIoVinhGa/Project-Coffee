package poly.edu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import poly.edu.entity.Account;

@Service
public class AuthInterceptor implements HandlerInterceptor {
	@Autowired
	SessionService session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		Account user = session.get("user"); // lấy từ session
		String error = "";
//		System.out.println("Role" + user.getAdmin());
		if (user == null) { 
//			response.sendRedirect("/Login");
			// chưa đăng nhập
			error = "Please login!";
		}

// không đúng vai trò
		else if (!user.getAdmin() && uri.startsWith("/admin/")) {
			error = "Access denied!";
		}
		if (error.length() > 0) { // có lỗi
			session.set("security-uri", uri);
			response.sendRedirect("/Login?error=" + error);
			return false;
		}
		return true;
	}
}
