package poly.edu.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import poly.edu.entity.Catagory;

public interface CategoryDAO extends JpaRepository<Catagory, String> {
	List<Catagory> findByName(String name);

	@Query(value = "select * from Categories c where c.category_id like ?1   ", nativeQuery = true)
	List<Catagory> findByNameSql(String name);

}
