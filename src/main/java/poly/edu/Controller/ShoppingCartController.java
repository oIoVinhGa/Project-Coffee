package poly.edu.Controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.edu.DAO.ProductDAO;
import poly.edu.entity.CartItem;
import poly.edu.entity.Product;
import poly.edu.service.ShoppingCartService;

@RequestMapping("/shopping-cart")
@Controller
public class ShoppingCartController {
	@Autowired
	ProductDAO productdao;

	@Autowired
	ShoppingCartService cartService;
	
	@PostMapping("/update")
	public String updateCart(@RequestParam("id") Integer id,@RequestParam("qty")Integer qty) {
		cartService.update(id, qty);
		return "redirect:/shopping-cart/views";
	}

	@GetMapping("/views")
	public String viewsCarts(Model model) {
		model.addAttribute("CART_ITEMS", cartService.getAllItems());
		model.addAttribute("TOTAL", cartService.getAmount());
		return "CartViews";
	}

	@GetMapping("/add/{id}")
	public String addCart(@PathVariable("id") Integer id) {
		Optional<Product> p = productdao.findById(id);
		if (p != null) {
			CartItem item = new CartItem();
			item.setProductId(p.get().getId());
			item.setName(p.get().getName());
			item.setPrice(p.get().getPrice());
			item.setQty(1);
			cartService.add(item);
		}
		return "redirect:/shopping-cart/views";
	}

	@GetMapping("clear")
	public String clearCart() {
		cartService.clear();
		return "redirect:/shopping-cart/views";
	};

	@GetMapping("del/{id}")
	public String removeCart(@PathVariable("id") Integer id) {
		cartService.remove(id);
		return "redirect:/shopping-cart/views";
	}
}
