package org.lithan.spring.models;

import java.sql.Timestamp;
import java.time.Year;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Data
@Entity
@Table(name = "tb_car")
public class Car {
   @Id
   @GeneratedValue
   private long id;

   @Column(name = "car_photo")
   private String photo;

   @Column(name = "car_model")
   private String model;

   @Column(name = "car_make")
   private String make;

   @Column(name = "car_year")
   private Year year;

   @Column(name = "car_description")
   private String description;

   @Column(name = "car_price")
   private double price;

   @Column(name = "is_active")
   private boolean isActive;

   @ManyToOne()
   @JoinColumn(name = "publish_by")
   private User publisher;

   @Column(name = "publish_on")
   private Date publishOn;

}
