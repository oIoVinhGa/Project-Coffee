package poly.edu.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
import poly.edu.entity.Catagory;
import poly.edu.entity.Contact;
import poly.edu.entity.Product;
import poly.edu.service.SessionService;

@RequestMapping("/user")
@Controller
public class UserController {
	@Autowired
	ProductDAO productRepository;
	@Autowired
	CategoryDAO categoryRepository;
	@Autowired
	AccountDAO accountrepository;
	@Autowired
	SessionService session;

	@RequestMapping({ "", "/", "/index" })
	public String showuserform(Model model, @RequestParam("p") Optional<Integer> p) {
		List<Product> productArabica = productRepository.findByCategoryIdLike("CF01");
		model.addAttribute("ProductArabica", productArabica);

		List<Product> productRobusta = productRepository.findByCategoryIdLike("CF02");
		model.addAttribute("ProductRobusta", productRobusta);

		List<Product> productMoka = productRepository.findByCategoryIdLike("CF03");
		model.addAttribute("ProductMoka", productMoka);
		return "Userindex";
	}

	@GetMapping("/register")
	public String showRegister(Model model) {
		model.addAttribute("ACCOUNT", new Account());
		return "Register";
	}



	@RequestMapping("/abouts")
	public String showAbouts() {
		return "UserAbout";
	}

	@RequestMapping("/contact")
	public String showContacts(@ModelAttribute("CONTACT") Contact contact, Model model) {

		model.addAttribute("CONTACT", new Contact());

		return "UserContact";
	}

	@ModelAttribute("category")
	public List<String> getFaculties() {
		// List<Catagory> list = categoryRepository.findByNameSql("10");
		List<Catagory> list = categoryRepository.findAll();
		List<String> categoryList = new ArrayList<>();

		for (Catagory l : list) {
			categoryList.add(l.getName());
		}
		return categoryList;
	}
}
