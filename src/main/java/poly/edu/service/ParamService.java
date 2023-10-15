package poly.edu.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class ParamService {

	@Autowired HttpServletRequest request;
	
	/**
	 * Đọc chuỗi giá trị của tham số
	 * @param name tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu ko tồn tại
	 */
	
	public String getString(String name, String defaultValue) {
		String value = request.getParameter(name);
		return value != null ? value : defaultValue;
	}
	
	/**
	 * Đọc số nguyên giá trị của tham số
	 * @param name tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị thma số hoặc giá trị mặc định nếu ko tồn tại
	 */
	public int getInt(String name,int defaultValue) {
		String value = getString(name, String.valueOf(defaultValue));
		return Integer.parseInt(value);
	}
	
	/**
	 * Đọc  giá trị double của tham số
	 * @param name tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị thma số hoặc giá trị mặc định nếu ko tồn tại
	 */
	public double getDouble(String name,double defaultValue) {
		String value = getString(name, String.valueOf(defaultValue));
		return Double.parseDouble(value);
	}
	
	/**
	 * Đọc  giá trị boolean của tham số
	 * @param name tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị thma số hoặc giá trị mặc định nếu ko tồn tại
	 */
	public boolean getBoolean(String name,boolean defaultValue) {
		String value = getString(name, String.valueOf(defaultValue));
		return Boolean.parseBoolean(value);
	}
	/**
	 * Đọc  giá trị thời gian của tham số
	 * @param name tên tham số
	 * @param pattern là định dạng thời gian
	 * @return giá trị thma số hoặc null nếu ko tồn tại
	 * @throws RuntimeException nếu ko đúng định dạng
	 */
	public Date getDate(String name,String pattern) {
		String value = getString(name, "");
		try {
			return new SimpleDateFormat(pattern).parse(value);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
		
	}
	/**
	 * Lưu file upload vào thư mục
	 * @param file chuawfile upload từ client
	 * @param path đường dẫn tính từ webroot
	 * @return đối tường chứa file đã lưu hoặc null nếu ko có file
	 * @throws RuntimeException lỗi lưu file
	 */
	
	public File save(MultipartFile file , String path) {
		if(!file.isEmpty()) {
			File dir = new File(request.getServletContext().getRealPath(path));
			if(!dir.exists()) {
				dir.mkdirs();
			}
			try {
				File savedFile = new File(dir,file.getOriginalFilename());
				file.transferTo(savedFile);
				return savedFile;
			} catch (Exception e) {
				// TODO: handle exception
				throw new RuntimeException(e);
			}
		}
		
		return null;
	}
	
}
