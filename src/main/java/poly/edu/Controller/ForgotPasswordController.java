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
import poly.edu.DTO.AccountForgotDTO;
import poly.edu.DTO.MailInfo;
import poly.edu.entity.Account;
import poly.edu.service.MailerServiceImpl;
import poly.edu.service.SessionService;

@Controller
@RequestMapping("/forgotpassword")
public class ForgotPasswordController {
	@Autowired
	SessionService sessionsv;

	@Autowired
	AccountDAO accountrepository;
	@Autowired
	MailerServiceImpl mailer;

	@RequestMapping("/SendOTP")
	public String SendMailOTP(@Valid @ModelAttribute("ACCOUNT") AccountForgotDTO ac, BindingResult result,
			Model model) {
		Optional<Account> acc = accountrepository.findById(ac.getUsername());
		Random random = new Random();
		int min = 100000;
		int max = 999999;
		int OTP = random.nextInt(max - min) + min;
		sessionsv.set("OTPsession", OTP);
		if (result.hasErrors()) {

			System.out.println("Send 1");
			return "Forgotpassword";
		} else if (acc.isEmpty()) {
			System.out.println("Send 2");
			model.addAttribute("error_forgotAccount", "Account does not exist!");
		} else if (!acc.get().getEmail().equals(ac.getEmail())) {
			System.out.println("Send 3");
			model.addAttribute("error_EmailAccount", "Email is incorrect");
		} else {
			System.out.println("Send 4");
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
		return "Forgotpassword";

	}

	@RequestMapping("/Forgot")
	public String ForgotAccount(@Valid @ModelAttribute("ACCOUNT") AccountForgotDTO ac, BindingResult result,
			@RequestParam("otp") String otp, Model model) {
		Optional<Account> acc = accountrepository.findById(ac.getUsername());
		int otpSS = sessionsv.get("OTPsession");

		if (result.hasErrors()) {
			return "Forgotpassword";
		} else if (acc.isEmpty()) {
			System.out.println("2");
			model.addAttribute("error_forgotAccount", "Account does not exist!");
		} else if (!acc.get().getEmail().equals(ac.getEmail())) {
			System.out.println("3");
			model.addAttribute("error_EmailAccount", "Email is incorrect");
		} else if (Integer.parseInt(otp) != otpSS) {
			model.addAttribute("error_SendMailOTP", "OTP is incorrect!");
		} else {
			sessionsv.remove("OTPsession");
			MailInfo mail = new MailInfo();
			mail.setFrom("Skyrim <tpvinh292931@gmail.com>");
			mail.setSubject("Skyrim Thông tin tài khoản");
			mail.setTo(ac.getEmail());
			mail.setBody("Mật khẩu của bạn là:" + acc.get().getPassword());
			try {
				mailer.queue(mail);
				model.addAttribute("success_sendEmail", "Mật khẩu đã được gửi đến Email của bạn!");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "Forgotpassword";
	}
}
