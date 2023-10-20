package poly.edu.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Oders")
public class Oder implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long Id;

	@Column(columnDefinition = "nvarchar(255)") // Điều chỉnh độ dài cột theo yêu cầu của bạn
	@NotBlank(message = "Address cannot be empty")
	@Size(max = 255, message = "Address cannot be longer than 255 characters")
	private String Address;

	@Temporal(TemporalType.DATE)
	@Column(name = "Createdate")
	Date CreateDate = new Date();

	@Column(columnDefinition = "nvarchar(10)")
	@NotBlank(message = "Phonenumber cannot be empty")
	@Pattern(regexp = "^[0-9]*$", message = "Phonenumber must contain only numbers")
	@Size(max = 10, message = "Phonenumber cannot be longer than 10 characters")
	private String phonenumber;

	@ManyToOne
	@JoinColumn(name = "Username")
	Account account;

	@JsonIgnore
	@OneToMany(mappedBy = "oder", fetch = FetchType.EAGER)
	List<OderDetail> orderDetails;
}
