package com.codingdojo.feedme.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.feedme.models.Order;
// import com.codingdojo.feedme.models.Rating;

@Repository
public interface OrderRepositories extends CrudRepository<Order,Long> {
	List<Order> findAll(); 

  
}
