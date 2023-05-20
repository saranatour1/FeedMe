package com.codingdojo.feedme.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.feedme.models.Menu;
import com.codingdojo.feedme.models.Resturant;
import com.codingdojo.feedme.repositories.ResturantsRepo;

@Service
public class ResturantServices {
	@Autowired
	private ResturantsRepo restRepo;
	
	public Resturant addResturant(Resturant r){
		return restRepo.save(r);
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


		// find resturant menu by resturant id 
		public Menu findMbyRestId(Long id ){
			return restRepo.findMenuByResturantId(id);
		}

		// find all menu items and categories from resturnat id
		public List<Object[]> findMbyRestIdandCat(Long id ){
			return restRepo.findMenuWithCategoriesAndMenuItemsByResturantId(id);
		}


		// search restuant by its name 
		public List<Object[]> findResturantByName(String restName){
			return restRepo.findByRestName(restName);
		}

		
		// seacrh reasturant by catagory 
		public List<Object[]> findResturantByCat(List<Long> catIds){
			return restRepo.findResturantsByCat(catIds);
		}
		
//		public Restaurant findRestaurantByName(String name) {
//	        // Implement the logic to find a restaurant by its name
//	        return restRepo.findByRestName(name);
//	    }


		// count all resturants 

		public long countAllRest(){
			return restRepo.count();
		}
		public List<Object[]> findMenuWithCategoriesAndMenuItemsByResturantId(Long id){
			return restRepo.findMenuWithCategoriesAndMenuItemsByResturantId(id);
		}
		public Resturant updaterest(Resturant editRest){
			return restRepo.save(editRest);
		}
	
	
}

	
