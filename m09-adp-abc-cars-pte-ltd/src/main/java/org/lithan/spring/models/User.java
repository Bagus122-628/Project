package org.lithan.spring.models;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
@Entity
@Table(name = "tb_user")
public class User implements UserDetails {
   @Id
   @GeneratedValue
   private long id;

   @Column(name = "photo_profile")
   private String profile;

   @Column(nullable = false)
   private String username;

   @Column(nullable = false)
   private String password;

   @Column(name = "phone_number")
   private String phoneNumber;

   @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
   @JoinTable(joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
   private List<Role> roles;

   @Override
   public Collection<? extends GrantedAuthority> getAuthorities() {
      return this.roles.stream().map(role -> new SimpleGrantedAuthority(role.getRoleName()))
            .collect(Collectors.toList());
   }

   @Override
   public boolean isAccountNonExpired() {
      return true;
   }

   @Override
   public boolean isAccountNonLocked() {
      return true;
   }

   @Override
   public boolean isCredentialsNonExpired() {
      return true;
   }

   @Override
   public boolean isEnabled() {
      return true;
   }
}