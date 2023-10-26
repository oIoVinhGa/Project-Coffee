package poly.edu.DTO;

import jakarta.persistence.Column;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AccountForgotDTO {
	@NotEmpty(message = "Username not empty")
	@Column(columnDefinition = "varchar(30)")
	private String username;
	
	@NotEmpty(message = "Email not empty")
	@Email(message = "Email Khong dung dinh dang")
	private String email;
}
