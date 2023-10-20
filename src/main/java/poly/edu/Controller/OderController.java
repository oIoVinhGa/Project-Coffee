package poly.edu.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/oder")
public class OderController {
	
	
	@RequestMapping("views")
	public String showOder() {
		
		
		return "Oder";
		
	}
}
