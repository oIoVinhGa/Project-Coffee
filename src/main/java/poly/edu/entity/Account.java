package poly.edu.entity;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@SuppressWarnings("serial")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "Accounts")
public class Account implements Serializable {
	@Id
	@NotEmpty(message = "Username not empty")
	@Column(columnDefinition = "varchar(30)")
	private String username;

	@NotEmpty(message = "Password not empty")
	@Size(min = 6, message = "Password tu 6 ki tu")
	@Column(columnDefinition = "varchar(30)")
	private String password;

	@NotEmpty(message = "Fullname not empty")
	@Column(columnDefinition = "nvarchar(70)")
	private String fullname;

	@NotEmpty(message = "Email not empty")
	@Email(message = "Email Khong dung dinh dang")
	@Column(columnDefinition = "varchar(150)")
	private String email;

	private String photo;
	private Boolean activated;
	private Boolean admin;

	@JsonIgnore
	@OneToMany(mappedBy = "account", fetch = FetchType.EAGER)
	List<Oder> orders;
}