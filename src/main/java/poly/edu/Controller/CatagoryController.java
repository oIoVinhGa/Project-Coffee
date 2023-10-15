package poly.edu.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.edu.DAO.CategoryDAO;
import poly.edu.entity.Catagory;

@Controller
@RequestMapping("/category")
public class CatagoryController {

	@Autowired
	CategoryDAO dao;

	@RequestMapping({"/index","","/"})
	public String showCategory(Model model, @ModelAttribute("item") Catagory ca) {
		ca.setId(null);
		ca.setName(null);
		List<Catagory> items = dao.findAll();
		model.addAttribute("items", items);
		return "catagory";
	}
	
	@PostMapping("/create")
	public String createCategory(Model model, @Validated @ModelAttribute("item") Catagory ca,BindingResult result) {
		if(!result.hasErrors()) {
			if(!dao.findById(ca.getId()).isEmpty()) {
				model.addAttribute("error_catagory", "ID đã tồn tại");
			}else {
				dao.save(ca);
				model.addAttribute("error_catagory", "Create Category Success!");
			}
		}
		ca.setId(null);
		ca.setName(null);
		List<Catagory> items = dao.findAll();
		model.addAttribute("items", items);
		return "catagory";
	}
	
	@PostMapping("/update")
	public String updateCategory(Model model, @Validated @ModelAttribute("item") Catagory ca,BindingResult result) {
		if(!result.hasErrors()) {
			if(dao.findById(ca.getId()).isEmpty()) {
				model.addAttribute("error_catagory", "ID không tồn tại");
			}else {
				dao.save(ca);
				model.addAttribute("error_catagory", "Create Category Success!");
			}
		}
		ca.setId(null);
		ca.setName(null);
		List<Catagory> items = dao.findAll();
		model.addAttribute("items", items);
		return "catagory";
	}
	
	
	@GetMapping("/edit/{id}")
	public String editCategory(Model model , @PathVariable("id") String id,@ModelAttribute("item") Catagory ca) {
		if(dao.findById(ca.getId()).isEmpty()) {
			return "redirect:/category/index";
		}else {
			Catagory catagory = dao.findById(id).get();
			ca.setId(catagory.getId());
			ca.setName(catagory.getName());
		}

		List<Catagory> items = dao.findAll();
		model.addAttribute("items", items);
		return "catagory";
	}
	@GetMapping("/delete")
	public String deleteCategory(Model model , @RequestParam("id") String id,@ModelAttribute("item") Catagory ca) {
		if(dao.findById(ca.getId()).isEmpty()) {
			return "redirect:/category/index";
		}else {
			dao.deleteById(id);
			model.addAttribute("success_category", "delete success");
		}
		List<Catagory> items = dao.findAll();
		model.addAttribute("items", items);
		return "catagory";
	}
}
