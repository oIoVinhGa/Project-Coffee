package poly.edu.DTO;

import jakarta.persistence.Column;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OderDTO {

	@Column(columnDefinition = "nvarchar(255)") // Điều chỉnh độ dài cột theo yêu cầu của bạn
	@NotBlank(message = "Address cannot be empty")
	@Size(max = 255, message = "Address cannot be longer than 255 characters")
	private String Address;

	@Column(columnDefinition = "nvarchar(10)")
	@NotBlank(message = "Phonenumber cannot be empty")
	@Pattern(regexp = "^[0-9]*$", message = "Phonenumber must contain only numbers")
	@Size(max = 10, message = "Phonenumber cannot be longer than 10 characters")
	private String phonenumber;
}
