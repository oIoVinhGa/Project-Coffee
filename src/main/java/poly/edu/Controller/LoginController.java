package poly.edu.Controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.edu.DAO.AccountDAO;
import poly.edu.entity.Account;
import poly.edu.service.ParamService;
import poly.edu.service.SessionService;

@Controller
@RequestMapping("/Login")
public class LoginController {
	@Autowired AccountDAO accountrepository;
	@Autowired ParamService param;
	@Autowired SessionService session;
	
	
}
