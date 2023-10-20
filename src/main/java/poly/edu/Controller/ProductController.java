package poly.edu.Controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import poly.edu.DAO.CategoryDAO;
import poly.edu.DAO.ProductDAO;
import poly.edu.entity.Catagory;
import poly.edu.entity.Product;
import poly.edu.utils.FileUploadUtil;

@Controller
@RequestMapping("/admin/product")
public class ProductController {
	@Autowired
	ProductDAO productDao;
	@Autowired
	CategoryDAO catagoryDAO;

	@ModelAttribute("categories")
	public List<Catagory> modelCategories() {
		return catagoryDAO.findAll();
	}

	@RequestMapping("/page")
	public String showProduct(Model model, @RequestParam("p") Optional<Integer> p,
			@RequestParam("field") Optional<String> field) throws IOException {
		Sort sort = Sort.by(Direction.DESC, field.orElse("price"));
		Pageable pageable = PageRequest.of(p.orElse(0), 8, sort);
		Page<Product> page = productDao.findAll(pageable);
		model.addAttribute("product", new Product());
		model.addAttribute("page", page);
		model.addAttribute("items", productDao.findAll());
		return "product";
	}

//	@RequestMapping("sort")
//	public String sortProduct(@RequestParam("p") Optional<Integer> p ,@RequestParam("field") Optional<String> field, Model model) {
//		Sort sort = Sort.by(Direction.DESC, field.orElse("price"));
//
//		model.addAttribute("field", field.get());
//		model.addAttribute("product", new Product());
//		List<Product> items = productDao.findAll(sort);
//		
//		model.addAttribute("items", items);
//		return "product";
//	}

	@PostMapping("Create")
	public String createProduct(@Valid @ModelAttribute("product") Product product, BindingResult result,
			@RequestParam("image") MultipartFile multipartFile, Model model, @RequestParam("p") Optional<Integer> p,
			@RequestParam("field") Optional<String> field) throws Exception {

		if (result.hasErrors() || multipartFile.isEmpty()) {

			if (multipartFile.isEmpty()) {
				model.addAttribute("ERROR_PHOTO", "Please select a photo");

				Sort sort = Sort.by(Direction.DESC, field.orElse("price"));
				Pageable pageable = PageRequest.of(p.orElse(0), 8, sort);
				Page<Product> page = productDao.findAll(pageable);
				model.addAttribute("page", page);
				model.addAttribute("items", productDao.findAll());
				return "product";
			}

		}

		String filename = org.springframework.util.StringUtils.cleanPath(multipartFile.getOriginalFilename());
		String uploadDir = "uploads/";
		product.setImage(filename);
		product.setCreateDate(new Date());
		productDao.save(product);
		FileUploadUtil.saveFile(uploadDir, filename, multipartFile);
		return "redirect:/admin/product/page";
	}

//	@PostMapping("Update")
//	public String updateProduct(@Valid @ModelAttribute("product") Product product, BindingResult result,
//			@RequestParam("image") MultipartFile multipartFile, Model model, @RequestParam("p") Optional<Integer> p,
//			@RequestParam("field") Optional<String> field) throws Exception {
//
//		if (result.hasErrors() || multipartFile.isEmpty()) {
//
//			if (multipartFile.isEmpty()) {
//				model.addAttribute("ERROR_PHOTO", "Please select a photo");
//				Sort sort = Sort.by(Direction.DESC, field.orElse("price"));
//				Pageable pageable = PageRequest.of(p.orElse(0), 5, sort);
//				Page<Product> page = productDao.findAll(pageable);
//				model.addAttribute("page", page);
//				model.addAttribute("items", productDao.findAll());
//				return "product";
//			}
//		}
//
//		String filename = org.springframework.util.StringUtils.cleanPath(multipartFile.getOriginalFilename());
//		String uploadDir = "uploads/";
//		product.setImage(filename);
//		product.setCreateDate(new Date());
//		productDao.save(product);
//		FileUploadUtil.saveFile(uploadDir, filename, multipartFile);
//		return "redirect:/product/page";
//	}

	@GetMapping("/edit/{id}")
	public String EditProduct(@PathVariable("id") Integer id, Model model, @RequestParam("p") Optional<Integer> p,
			@RequestParam("field") Optional<String> field) {
		Optional<Product> product = productDao.findById(id);
		System.out.println("test:" + product.get().getName());
		if (product.isPresent()) {
			product.get().setId(id);
			model.addAttribute("product", product.get());

			Catagory category = catagoryDAO.findById(product.get().getCategory().getId()).get();
			model.addAttribute("categoriesProduct", category);

//			model.addAttribute("items", productDao.findAll());

			Sort sort = Sort.by(Direction.DESC, field.orElse("price"));
			Pageable pageable = PageRequest.of(p.orElse(0), 8, sort);
			Page<Product> page = productDao.findAll(pageable);
			model.addAttribute("page", page);
			model.addAttribute("items", productDao.findAll());
			return "product";
		} else {
			return "redirect:/admin/product/page";
		}

//		return "product";
	}

	@GetMapping(value = "page", params = "btnDel")
	public String DeleteProduct(@RequestParam("id") Integer id, Model model) {
		productDao.deleteById(id);
		return "redirect:/admin/product/page";
	}
}
