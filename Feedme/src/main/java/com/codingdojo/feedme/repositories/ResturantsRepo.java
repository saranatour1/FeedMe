package com.codingdojo.feedme.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.feedme.models.Resturant;


@Repository
public interface ResturantsRepo  extends CrudRepository<Resturant,Long> {
	List<Resturant>findAll(); 
	Optional<Resturant> findById(Long id); 
	
	
	

}
