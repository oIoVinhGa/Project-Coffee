package poly.edu.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@RequestMapping({"","","index"})
	public String ShowAdmin() {
		return "Admin";
	}
	
	@RequestMapping({"/product"})
	public String ShowAdminProduct() {
		return "redirect:/product/page";
	}
	@RequestMapping({"/catagory"})
	public String ShowAdmincatagory() {
		return "redirect:/category";
	}
	@RequestMapping({"/account"})
	public String ShowAdminAccount() {
		return "redirect:/account/views";
	}
}
