package poly.edu.Controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

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
import org.springframework.web.multipart.MultipartFile;

import poly.edu.DAO.AccountDAO;
import poly.edu.entity.Account;
import poly.edu.utils.FileUploadUtil;

@Controller
@RequestMapping("/admin/account")
public class AccountController {
	@Autowired AccountDAO accountDao;
	@RequestMapping("/views")
	public String showAccount(Model model) {
		model.addAttribute("ACCOUNT", new Account());
		List<Account> account = accountDao.findAll();
		model.addAttribute("ACCOUNTS", account);
		return "Account";
	}
	
	@PostMapping("/Create")
	public String createAccount(@Validated @ModelAttribute("ACCOUNT") Account ac,BindingResult result ,Model model,
			@RequestParam("image") MultipartFile multipartFile) throws IOException {
		if (result.hasErrors()|| multipartFile.isEmpty()) {

			if (multipartFile.isEmpty()) {
				model.addAttribute("ERROR_PHOTO", "Please select a photo");
			}
			List<Account> account = accountDao.findAll();
			model.addAttribute("ACCOUNTS", account);
			return "Account";
		}
		String filename = org.springframework.util.StringUtils.cleanPath(multipartFile.getOriginalFilename());
		String uploadDir = "uploads/";
		ac.setPhoto(filename);
		accountDao.save(ac);
		FileUploadUtil.saveFile(uploadDir, filename, multipartFile);
		
		return "redirect:/admin/account/views";
	}
	
	@GetMapping("/edit/{username}")
	public String edit(@PathVariable("username") String username, Model model) {
		Optional<Account> accounts = accountDao.findById(username);
		if (accounts.isPresent()) {
			model.addAttribute("ACCOUNT", accounts.get());
		} else {
			model.addAttribute("ACCOUNT", new Account());
		}
		List<Account> account = accountDao.findAll();
		model.addAttribute("ACCOUNTS", account);
		return "Account";
	}
	@GetMapping(value = "/views", params = "btnDel")
	public String DelAccount(@RequestParam("username") String username, Model model) {
		accountDao.deleteById(username);
		List<Account> account = accountDao.findAll();
		model.addAttribute("ACCOUNTS", account);
		return "redirect:/admin/account/views";
	}
}
