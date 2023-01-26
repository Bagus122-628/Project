package org.lithan.spring.repository;

import java.util.List;

import org.lithan.spring.models.Bidding;
import org.lithan.spring.models.Car;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BiddingRepository extends JpaRepository<Bidding, Long> {

   List<Bidding> findByCar(Car car);
}
