package com.codingdojo.feedme.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.codingdojo.feedme.models.Rating;






@Repository
public interface RatingRepo extends CrudRepository<Rating,Long>
{
	List<Rating>findAll(); 
	
	@Query(value = "SELECT r.rest_name, r.id, AVG(ra.stars) AS average_stars "
            + "FROM resturants r "
            + "JOIN ratings ra ON r.id = ra.resturant_id "
            + "GROUP BY r.rest_name, r.id", nativeQuery = true)
List<Object[]> findAverageStarsPerRestaurant();
	//to find a single rating for resturants
    @Query(value = "SELECT AVG(stars) AS average_rating " +
            "FROM ratings " +
            "WHERE resturant_id = :restaurantId", nativeQuery = true)
    Double findAverageRatingForRestaurant(@Param("restaurantId") Long restaurantId);
	
	
	
}
