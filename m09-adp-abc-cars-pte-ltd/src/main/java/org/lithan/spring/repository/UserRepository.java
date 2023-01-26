package org.lithan.spring.repository;

import java.util.Optional;

import org.lithan.spring.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

   Optional<User> findByUsername(String username);
}
