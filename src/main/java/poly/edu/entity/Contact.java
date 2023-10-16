package poly.edu.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

@Data
@Entity
@Table(name="contact")
public class Contact {
	
	@Id
	@Column(name = "ContactID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer contactID;
	
	
	@NotEmpty(message = "Yourname not empty")
	@Column(columnDefinition = "nvarchar(70)")
	private String name;
	
	@NotEmpty(message = "Phone Number not empty")
	@Column(columnDefinition = "nvarchar(20)")
	private String phonenumber;
	
	@NotEmpty(message = "Email not empty")
	@Email(message = "Email Khong dung dinh dang")
	@Column(columnDefinition = "varchar(150)")
	private String email;
	
	
	@NotEmpty(message = "Message not empty")
	@Column(columnDefinition = "varchar(150)")
	private String Message;
}
