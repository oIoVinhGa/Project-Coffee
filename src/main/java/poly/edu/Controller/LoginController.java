package poly.edu.Controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.edu.DAO.AccountDAO;
import poly.edu.DTO.AccountDTO;
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

	@GetMapping({ "", "/", "index" })
	public String showLogin(@ModelAttribute("account") Account acc) {
		return "Login";
	}

	@PostMapping("/ResultLogin")
	public String login(Model model, @Validated @ModelAttribute("account") AccountDTO accDTO, BindingResult result) {
		if (!result.hasErrors()) {
			Account acc = null;
			try {
				Optional<Account> accresult = accountrepository.findById(accDTO.getUsername());
				System.out.println("accresult:" + accresult.get().getPassword());
				if (accresult.get().getPassword().equals(accDTO.getPassword())) {
					acc = accountrepository.findById(accDTO.getUsername()).get();
					session.set("user", acc);
					String uri = session.get("security-uri");
					System.out.println("uri:" + uri);
					if (uri != null) {
						if (!uri.equals("") && uri.contains("/admin/**")) {

							return "redirect:/admin/account/views";
						} else if (uri.contains("/account/")) {

							return "redirect:/admin/account/views";
						} else
							return "redirect:/user/index";
					} else
						return "redirect:/user/index";
				} else {
					model.addAttribute("error_loginPass", "Password không đúng!");
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				model.addAttribute("error_loginUsername", "Username không tồn tại!");
			}
		} else {
			System.out.println("Text:::::: ");
		}
		return "Login";
	}

	@GetMapping("/logout")
	public String logout(@ModelAttribute("account") Account account) {
		session.remove("user");
		session.remove("security-uri");
		return "redirect:/Login";
	}
}
