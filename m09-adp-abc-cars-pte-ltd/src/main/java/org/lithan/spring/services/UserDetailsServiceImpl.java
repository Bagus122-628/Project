package org.lithan.spring.services;

import java.util.Optional;

import org.lithan.spring.models.User;
import org.lithan.spring.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

  @Autowired
  private UserRepository repo;

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    System.out.println("load user by username: " + username);

    Optional<User> optional = Optional.ofNullable(this.repo.findByUsername(username))
        .orElseThrow(() -> new UsernameNotFoundException(username + " not found"));

    return optional.get();
  }
}
