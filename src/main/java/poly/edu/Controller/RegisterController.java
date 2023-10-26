package poly.edu.Controller;

import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;
import poly.edu.DAO.AccountDAO;
import poly.edu.DTO.MailInfo;
import poly.edu.entity.Account;
import poly.edu.service.MailerServiceImpl;
import poly.edu.service.SessionService;

@RequestMapping("register")
@Controller
public class RegisterController {
	 
	 @Autowired SessionService sessionsv;
	
	@Autowired
	AccountDAO accountrepository;
	@Autowired
	MailerServiceImpl mailer;

	@RequestMapping("SendOTP")
	public String SenMailOTP(@Valid @ModelAttribute("ACCOUNT") Account ac, BindingResult result, Model model) {
		Random random = new Random();
		int min = 100000;
		int max = 999999;
		int OTP = random.nextInt(max-min)+min;
		sessionsv.set("OTPsession",OTP);
		if (result.hasErrors()) {
			return "Register";
		} else {
			MailInfo mail = new MailInfo();
			mail.setFrom("Skyrim <tpvinh292931@gmail.com>");
			mail.setSubject("Skyrim xác nhận mã OTP!");
			mail.setTo(ac.getEmail());
			mail.setBody("Mã xác nhập OTP của bạn là :" + OTP);
			try {
				mailer.queue(mail);
				model.addAttribute("success_sendEmail", "Email sẽ được gửi trong giây lát!");
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return "Register";

	}
	
	@RequestMapping("Create")
	public String registerAccount(@Valid @ModelAttribute("ACCOUNT") Account ac,@RequestParam("otp") int otp, BindingResult result, Model model) {
		Optional<Account> acc = accountrepository.findById(ac.getUsername());
		int otpSS = sessionsv.get("OTPsession");
		System.out.println( "OTP:" + otpSS);
		if (result.hasErrors()) {
			return "Register";
		} else {
			if (!acc.isEmpty()) {
				model.addAttribute("error_RegisterAccount", "Account already exists!");
			}else if (otp != otpSS) {
				model.addAttribute("error_SendMailOTP", "OTP is incorrect!");
			}
			else {
				sessionsv.remove("OTPsession");
				ac.setAdmin(false);
				accountrepository.save(ac);
				model.addAttribute("ACCOUNT", new Account());
				return "redirect:/Login";
			}
		}
		return "Register";
	}
}
