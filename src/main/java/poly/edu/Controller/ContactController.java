package poly.edu.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.validation.Valid;
import poly.edu.DAO.ContactDAO;
import poly.edu.entity.Contact;

@Controller
@RequestMapping("/admin/contact")
public class ContactController {

	@Autowired
	ContactDAO contactDAO;
	
//	@RequestMapping("")
	
	@PostMapping("/create")
	public String createContact(@Valid @ModelAttribute("CONTACT") Contact contact, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "redirect:home/contact";
		}
		contactDAO.save(contact);
		return "redirect:/home";
	}

}
