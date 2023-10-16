package poly.edu.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.validation.Valid;
import poly.edu.DAO.AccountDAO;
import poly.edu.entity.Account;

@RequestMapping("register")
@Controller
public class RegisterController {
	@Autowired AccountDAO accountrepository;
	
	@RequestMapping("Create")
	public String registerAccount(@Valid @ModelAttribute("ACCOUNT") Account ac, BindingResult result ,Model model) {
		if (result.hasErrors()) {
			return "Register";
		}
		accountrepository.save(ac);
		model.addAttribute("ACCOUNT", new Account());
		return "redirect:/home/Login";
	}
}
