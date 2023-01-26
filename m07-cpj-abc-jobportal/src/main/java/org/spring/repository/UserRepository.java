package org.spring.repository;


import java.util.List;

import org.spring.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends JpaRepository<User, Long> {

	User findByEmail(String email);

	User findByToken(String token);
	
	@Query(value="SELECT u FROM User u WHERE u.profile.first_name LIKE '%' || :keyword || '%'"
			+ " OR u.profile.last_name LIKE '%' || :keyword || '%'" + " OR u.profile.country LIKE '%' || :keyword || '%'")
	List<User> search(@Param(value = "keyword")String keyword);
}
