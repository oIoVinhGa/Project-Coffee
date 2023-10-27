package poly.edu.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.edu.DAO.CategoryDAO;
import poly.edu.DAO.ProductDAO;
import poly.edu.entity.Catagory;
import poly.edu.entity.Product;
import poly.edu.service.SessionService;
@Controller
@RequestMapping("/user/product")
public class UserProductController {
	@Autowired
	ProductDAO productRepository;

	@Autowired
	CategoryDAO categoryRepository;

	@Autowired
	SessionService session;

	@GetMapping({ "", "/", "/index" })
	public String showProductUser(Model model, @RequestParam("p") Optional<Integer> p) {
		model.addAttribute("UserSession", session.get("user"));
		Pageable pageable = PageRequest.of(p.orElse(0), 12);
		Page<Product> pageProduct = productRepository.findAll(pageable);
		model.addAttribute("pageproduct", pageProduct);
		return "UserProduct";
	}
	@GetMapping("/search")
	public String search(@RequestParam("search") Optional<String> search, @RequestParam("p") Optional<Integer> p,
			Model model) {
		String kwords = search.orElse(session.get("search"));
		session.set("search", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		Page<Product> pageProduct = productRepository.findAllByNameLike("%" + kwords + "%", pageable);
		model.addAttribute("pageproduct", pageProduct);

		return "UserProduct";
	}

	@GetMapping("/sortdesc")
	public String sortDesc(Model model, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Product> pageProduct = productRepository.findAllByOrderByPriceDesc(pageable);
		model.addAttribute("pageproduct", pageProduct);
		return "UserProduct";
	}

	@GetMapping("/sortasc")
	public String sortAsc(Model model, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		Page<Product> page = productRepository.findAllByOrderByPriceAsc(pageable);
		model.addAttribute("pageproduct", page);
		return "UserProduct";
	}

	@PostMapping("/searchMinMax")
	public String search(Model model, @RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		double minPrice = min.orElse(Double.MIN_VALUE);
		double maxPrice = max.orElse(Double.MAX_VALUE);
		Page<Product> page = productRepository.findByPriceBetween(minPrice, maxPrice, pageable);
		model.addAttribute("pageproduct", page);
		return "UserProduct";
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

	@GetMapping("load-products")
	public ResponseEntity<?> loadProduct(@RequestParam("productSelected") String categoryId) {
		List<Product> filteredProducts;
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaa=========================="+categoryId);
		filteredProducts = productRepository.findByNameCategory(categoryId);
		System.out.println("===============================");
		if (filteredProducts == null) {
			System.out.println("cksdfghjkl==========================");
		} else {
			System.out.println("else ====================");
		}

		return ResponseEntity.ok().body(filteredProducts);
	}
	
//	===================================================
	
	@GetMapping("/searchMinMax0_500")
	public String search0_500(Model model, @RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		double minPrice = 0;
		double maxPrice = 500000;
		Page<Product> page = productRepository.findByPriceBetween(minPrice, maxPrice, pageable);
		model.addAttribute("pageproduct", page);
		return "UserProduct";
	}
	@GetMapping("/searchMinMax500_1000")
	public String search500_1000(Model model, @RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		double minPrice = 500000;
		double maxPrice = 1000000;
		Page<Product> page = productRepository.findByPriceBetween(minPrice, maxPrice, pageable);
		model.addAttribute("pageproduct", page);
		return "UserProduct";
	}
	@GetMapping("/searchMinMax1000_1500")
	public String search1000_500(Model model, @RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		double minPrice = 1000000;
		double maxPrice = 1500000;
		Page<Product> page = productRepository.findByPriceBetween(minPrice, maxPrice, pageable);
		model.addAttribute("pageproduct", page);
		return "UserProduct";
	}
}
