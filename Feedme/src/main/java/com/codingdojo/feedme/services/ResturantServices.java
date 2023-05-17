package com.codingdojo.feedme.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.feedme.models.Resturant;
import com.codingdojo.feedme.repositories.ResturantsRepo;

@Service
public class ResturantServices {
	private final ResturantsRepo restRepo;
	public ResturantServices(ResturantsRepo restRepo) {
		this.restRepo=restRepo;
	}
	//find all Resturan 
	public List<Resturant> findAllResturants(){
		return restRepo.findAll();
		
	}
	//find returant By Id
	public Resturant findRestById(Long id){
		Optional<Resturant> rest=restRepo.findById(id);
		if (rest.isPresent()) {
			 return rest.get();
		}else {
			return null;
		}
	
}
	
	
}

	
