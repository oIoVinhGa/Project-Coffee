package poly.edu.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import poly.edu.entity.Product;

public interface ProductDAO extends JpaRepository<Product, Integer> {
	
	List<Product> findByCategoryIdLike(String catagory);
	
	@Query("SELECT  Top(3) p FROM Product p WHERE p.category.id=?1")
	List<Product> findProductByCategoryId(String categoryid);
	
//	Page<Product> findAllByCategoryLike(String keywords, Pageable pageable);
	
//	 @Query("SELECT o FROM products o WHERE o.categoryid = :category ORDER BY productid LIMIT 3")
//	List<Product> findTop3ProductWithCategory(String catagory);
	
//	@Query("select * from products p inner join categories c on p.categoryid = c.category_id")
//	List<Product> findAllProductAndCatergory();
//
//	Page<Product> findAllByNameLike(String name, Pageable Pageable);

}
