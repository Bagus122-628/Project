package org.lithan.spring.models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "tb_role")
public class Role {
   @Id
   @GeneratedValue
   private long id;

   @Column(name = "role_name")
   private String roleName;

   @ManyToMany(mappedBy = "roles")
   private List<User> users;
}
