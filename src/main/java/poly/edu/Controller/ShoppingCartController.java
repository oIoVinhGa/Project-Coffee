package poly.edu.Controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;
import poly.edu.DAO.OderDAO;
import poly.edu.DAO.OderDetailDAO;
import poly.edu.DAO.ProductDAO;
import poly.edu.DTO.OderDTO;
import poly.edu.entity.Account;
import poly.edu.entity.CartItem;
import poly.edu.entity.Oder;
import poly.edu.entity.OderDetail;
import poly.edu.entity.Product;
import poly.edu.service.SessionService;
import poly.edu.service.ShoppingCartService;

@RequestMapping("/shopping-cart")
@Controller
public class ShoppingCartController {
	 private long lastCreationTime = 0;
	 
	 
	
	@Autowired
	ProductDAO productdao;

	@Autowired
	OderDetailDAO oderdetailDAO;
	
	@Autowired OderDAO oderDAO;

	@Autowired
	ShoppingCartService cartService;

	@Autowired
	SessionService session;

	@PostMapping("/update")
	public String updateCart(@RequestParam("id") Integer id, @RequestParam("qty") Integer qty) {
		cartService.update(id, qty);
		return "redirect:/shopping-cart/views";
	}

//	@PostMapping("/create")
//	public String createBill(@Valid @ModelAttribute("ODERS") OderDTO oderDTO,BindingResult result,Model model) {
//		if(!result.hasErrors()) {
//			Account acc = session.get("user");
//			System.out.println("session" + acc);
//			Oder oder = new Oder();
//			oder.setPhonenumber(oderDTO.getPhonenumber());
//			oder.setAddress(oderDTO.getAddress());
//			oder.setCreateDate(new Date());
//			oder.setAccount(acc);
//			oderDAO.save(oder);
//			Collection<CartItem> cartitem = new ArrayList<>(cartService.getAllItems());
//			for (CartItem item : cartitem) {
//				OderDetail oderdetail = new OderDetail();
//				oderdetail.setQuantity(item.getQty());
//				oderdetail.setPrice(item.getPrice());
//				oderdetail.setProduct(productdao.findById(item.getProductId()).get());
//				oderdetail.setOder(oder);
//				oderdetailDAO.save(oderdetail);
//			}
//		}
//		System.out.println("Thêm Giỏ hàng thành công!");
//		return "redirect:/shopping-cart/views";
//	}
	
	 @PostMapping("/create")
	    public String createBill(@Valid @ModelAttribute("ODERS") OderDTO oderDTO, BindingResult result, Model model) {
	        if (!result.hasErrors()) {
	            // Đảm bảo rằng đã trôi qua ít nhất 20 giây kể từ lần tạo hóa đơn trước đó
	            long currentTime = System.currentTimeMillis();
	            if (currentTime - lastCreationTime >= 60000) {
	                Account acc = session.get("user");
	                System.out.println("session" + acc);
	                Oder oder = new Oder();
	                oder.setPhonenumber(oderDTO.getPhonenumber());
	                oder.setAddress(oderDTO.getAddress());
	                oder.setCreateDate(new Date());
	                oder.setStatus(0);
	                oder.setAccount(acc);
	                oderDAO.save(oder);
	                Collection<CartItem> cartitem = new ArrayList<>(cartService.getAllItems());
	                for (CartItem item : cartitem) {
	                    OderDetail oderdetail = new OderDetail();
	                    oderdetail.setQuantity(item.getQty());
	                    oderdetail.setPrice(item.getPrice());
	                    oderdetail.setProduct(productdao.findById(item.getProductId()).get());
	                    oderdetail.setOder(oder);
	                    oderdetailDAO.save(oderdetail);
	                }

	                // Cập nhật thời gian tạo lần cuối
	                lastCreationTime = currentTime;
	            } else {
	                System.out.println("Bạn đã vượt quá số lần tạo hóa đơn cho phép trong khoảng thời gian 60 giây.");
	            }
	        }

	        System.out.println("Thêm Giỏ hàng thành công!");
	        return "redirect:/shopping-cart/views";
	    }

	@GetMapping("/views")
	public String viewsCarts(Model model) {
		model.addAttribute("ODERS", new OderDTO());
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
	
    @Scheduled(fixedDelay = 60000) // Chạy mỗi 20 giây (20000 milliseconds)
    public void createScheduled() {
        // Cho phép người dùng tạo hóa đơn khi đã trôi qua ít nhất 20 giây
        long currentTime = System.currentTimeMillis();
        if (currentTime - lastCreationTime >= 60000) {
            // Đặt logic để tạo hóa đơn ở đây
            // Cập nhật thời gian tạo lần cuối
            lastCreationTime = currentTime;
        }
    }
}
