package org.lithan.spring.repository;

import java.time.Year;
import java.util.List;

import org.lithan.spring.models.Car;
import org.lithan.spring.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CarRepository extends JpaRepository<Car, Long> {

      List<Car> findByPublisher(User user);

      List<Car> findByMakeLikeAndModelLikeAndYearLikeAndPriceBetween(String make, String model, Year year,
                  double minPrice, double maxPrice);

      @Query("SELECT p FROM Car p WHERE CONCAT(p.make, p.model, p.year, p.price) LIKE %?1%")
      public List<Car> search(String keyword);

      @Query("SELECT p FROM Car p WHERE CONCAT(p.make, p.model, p.year) LIKE %?1% and p.price between ?2 and ?3")
      public List<Car> search(String keyword, double min, double max);

}
