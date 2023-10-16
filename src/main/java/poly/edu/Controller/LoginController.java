package poly.edu.Controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.edu.DAO.AccountDAO;
import poly.edu.entity.Account;
import poly.edu.service.ParamService;
import poly.edu.service.SessionService;

@Controller
@RequestMapping("/Login")
public class LoginController {
	@Autowired
	AccountDAO accountrepository;
	@Autowired
	ParamService param;
	@Autowired
	SessionService session;

	@PostMapping("/ResultLogin")
	public String ResultLogin(Model model) {
		String u = param.getString("username", "");
		String p = param.getString("password", "");
		try {
			Optional<Account> account = accountrepository.findById(u);
			if (!account.get().getPassword().equals(p)) {
				model.addAttribute("MESSAGE", "Invalid password");
			} else {
				String uri = session.get("security-uri");
				if (uri != null) {
					return "redirect:" + uri;
				} else {
					model.addAttribute("MESSAGE", "Login successfull");
					session.set("USERNAME", u);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("MESSAGE", "Invalid username");
		}
		return "redirect:/home";
	}
}
