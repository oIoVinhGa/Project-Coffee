package poly.edu.Controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.edu.DAO.AccountDAO;
import poly.edu.DAO.CategoryDAO;
import poly.edu.DAO.ProductDAO;
import poly.edu.entity.Account;
import poly.edu.entity.Contact;
import poly.edu.entity.Product;
import poly.edu.service.ParamService;
import poly.edu.service.SessionService;

@Controller
@RequestMapping("/home")
public class HomeController {
	@Autowired
	ProductDAO productRepository;
	@Autowired
	CategoryDAO categoryRepository;
	@Autowired
	AccountDAO accountrepository;
	@Autowired
	SessionService session;
	@Autowired
	ParamService param;

	public boolean checkSecurity() {
		String username = session.get("USERNAME");
		System.out.println("checkLogin" + username);
		if (username != null) {
			return true;
		}
		return false;
	}

	@GetMapping({ "", "/", "index" })
	public String showIndex(Model model, @RequestParam("p") Optional<Integer> p) {

		List<Product> productArabica = productRepository.findByCategoryIdLike("CF01");
		model.addAttribute("ProductArabica", productArabica);

		List<Product> productRobusta = productRepository.findByCategoryIdLike("CF02");
		model.addAttribute("ProductRobusta", productRobusta);

		List<Product> productMoka = productRepository.findByCategoryIdLike("CF03");
		model.addAttribute("ProductMoka", productMoka);
		return "index";
	}

	

	@GetMapping("/register")
	public String showRegister(Model model) {
		model.addAttribute("ACCOUNT", new Account());
		return "Register";
	}
	
	@GetMapping("/forgotpassword")
	public String showForgotpassword(Model model) {
		model.addAttribute("ACCOUNT", new Account());
		return "Forgotpassword";
	}

//	@RequestMapping("/product")
//	public String showProductUser(Model model, @RequestParam("p") Optional<Integer> p) {
//		Pageable pageable = PageRequest.of(p.orElse(0), 15);
//		Page<Product> pageProduct = productRepository.findAll(pageable);
//		model.addAttribute("pageproduct", pageProduct);
//		return "HomeProduct";
//	}

	@RequestMapping("/abouts")
	public String showAbouts() {
		return "HomeAbout";
	}
	@RequestMapping("/contact")
	public String showContacts(@ModelAttribute("CONTACT") Contact contact, Model model ) {
		
		model.addAttribute("CONTACT", new Contact() );
		
		return "HomeContact";
	}

}