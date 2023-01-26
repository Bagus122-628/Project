package org.lithan.spring.models;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "tb_bidding")
public class Bidding {
   @Id
   @GeneratedValue
   private long id;

   @ManyToOne
   @JoinColumn(name = "bid_on_car")
   private Car car;

   @ManyToOne
   @JoinColumn(name = "bidder_id")
   private User user;

   @Column(name = "offer_price")
   private double price;

   @Column(name = "offer_on")
   private Timestamp timestamp;

   @Column(name = "offer_status")
   private boolean status;
}
