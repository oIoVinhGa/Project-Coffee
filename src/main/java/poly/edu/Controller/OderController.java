package poly.edu.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.edu.DAO.OderDAO;
import poly.edu.entity.Oder;

@Controller
@RequestMapping("/admin/oder")
public class OderController {
	@Autowired OderDAO oderdao;
	
	@RequestMapping("/views")
	public String showOder(Model model) {
		
		List<Oder> oders = oderdao.findAll();
		model.addAttribute("ODERS", oders);
		
		
		return "Oder";
	}
}
