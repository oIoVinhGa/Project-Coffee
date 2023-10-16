package poly.edu.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.edu.entity.Contact;

public interface ContactDAO extends JpaRepository<Contact, String> {

}
