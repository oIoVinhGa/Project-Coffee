package poly.edu.entity;

import java.io.Serializable;
import java.util.List;

import org.hibernate.annotations.Nationalized;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@SuppressWarnings("serial")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Categories")
public class Catagory implements Serializable {
	@Id
	@Column(name = "CategoryId")
	@NotEmpty(message = "CategoryID not empty")
	@Size(min=4,message = "Password tu 4 ki tu")
	private String id;
	
	@Nationalized
	@NotEmpty(message = "CategoryID not empty")
	private String name;
	
	@JsonIgnore
	@OneToMany(mappedBy = "category")
	List<Product> products;
}
