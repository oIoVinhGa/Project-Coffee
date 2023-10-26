package poly.edu.DTO;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailInfo {
	@NotBlank
	private String from;
	@NotBlank
	private String to;
	private String[] cc;
	private String[] bcc;
	@NotBlank
	private String subject;
	@NotBlank
	private String body;
	private String[] attachments;

	public MailInfo(String to, String subject, String body) {
		this.from = "FPT Polytechnic <tpvinh292931@gmail.com>";
		this.to = to;
		this.subject = subject;
		this.body = "OTP của bạn là :" + body;
	}

}
