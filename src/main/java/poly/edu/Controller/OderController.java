package poly.edu.Controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.edu.DAO.OderDAO;
import poly.edu.entity.Oder;

@Controller
@RequestMapping("/admin/oder")
public class OderController {
	@Autowired
	OderDAO oderdao;

	@RequestMapping("/views")
	public String showOder(Model model) {

		List<Oder> oders = oderdao.findAll();
		model.addAttribute("ODERS", oders);

		return "Oder";
	}

	@PostMapping("/update")
	public String updateCart(@RequestParam("id") Long id, @RequestParam("status") Integer stt) {
		Optional<Oder> odersupdate = oderdao.findById(id);
		Oder oderupdate = odersupdate.get();
		oderupdate.setStatus(stt);
		oderdao.save(oderupdate);

		return "redirect:/admin/oder/views";
	}
}
