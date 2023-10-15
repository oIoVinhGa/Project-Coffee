package poly.edu.service;

import org.springframework.beans.factory.annotation.Autowired;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CokkieService {
	@Autowired HttpServletRequest request;
	@Autowired HttpServletResponse response;
	
	/**
	 * Đọc cookie tử request
	 * @param name tên cookie cần đọc
	 * @return đỗi tượng cookie đọc được hoặc null nếu không tôn tại
	 */
	public Cookie get(String name) {
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equalsIgnoreCase(name)) {
					return cookie;
				}
			}
		}
		return null;
	}
	
	/**
	 * Đọc giá trị của cookie từ request
	 * @param name tên cookie cần đọc
	 * @return chuỗi giá trị đọc được hoặc rỗng nếu không tồn tại
	 */
	public String getValue(String name, String DefaultValue) {
		Cookie cookie = get(name);
		if(cookie != null) {
			return cookie.getValue();
		}
		return DefaultValue;
	}
	
	/**
	 * Tạo và gửi cookie về client
	 * @param name tên cookie
	 * @param value giá trị cookie
	 * @param hours thời hạn(giờ)
	 * @return đối tượng cookie đã tạo
	 */
	public Cookie add(String name , String value, int hours) {
		Cookie cookie = new Cookie(name,value);
		cookie.setMaxAge(hours*60*60);
		cookie.setPath("/");
		response.addCookie(cookie);
		return cookie;
	}
	
	/**
	 * Xóa cookie khỏi client
	 * @param name tên cookie cần xóa
	 */
	public void remove(String name) {
		add(name,"",0);
	}
}
