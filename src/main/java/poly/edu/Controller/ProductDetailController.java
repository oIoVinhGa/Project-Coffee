package poly.edu.Controller;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.edu.DAO.AccountDAO;
import poly.edu.DAO.CategoryDAO;
import poly.edu.DAO.ProductDAO;
import poly.edu.service.ParamService;
import poly.edu.service.SessionService;

@Controller
@RequestMapping("/home/productDetail")
public class ProductDetailController {
	
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

	
	@GetMapping("views/{id}")
	public String editproduct(@PathVariable("id")int id, Model model) {
		model.addAttribute("singleList", Arrays.asList(productRepository.getById(id)));
		return "HomeProductDetail";
	}
}

