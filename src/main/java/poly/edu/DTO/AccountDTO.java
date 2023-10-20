package poly.edu.DTO;

import jakarta.persistence.Column;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class AccountDTO {
	@NotEmpty(message = "Username not empty")
	@Column(columnDefinition = "varchar(30)")
	private String username;

	@NotEmpty(message = "Password not empty")
	@Size(min = 6, message = "Password tu 6 ki tu")
	@Column(columnDefinition = "varchar(30)")
	private String password;
}
