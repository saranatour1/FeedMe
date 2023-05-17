package com.codingdojo.feedme.restcontrollers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.codingdojo.feedme.models.Rating;
import com.codingdojo.feedme.models.Resturant;
import com.codingdojo.feedme.services.RatingServices;
import com.codingdojo.feedme.services.ResturantServices;

@RestController
public class Rest_test {
	private final ResturantServices restService;
	private final RatingServices rateService;

	
	
	public Rest_test(ResturantServices restService, RatingServices rateService) {
		
		this.restService = restService;
		this.rateService = rateService;
	}


	//this to the dashbord page 
	@GetMapping("/resturants")
	public List<Resturant> Dashbord(Model model) {
		//to collect all resturants 
		List<Resturant> allrest=restService.findAllResturants();
		//to collect all rating 
		//List<Rating> rate=rateService.findAllRating();
		//model.addAttribute("all_rest", allrest);
		//model.addAttribute("all_rating", rate);
		return allrest;
	}
	//this to show single Resturant information 
//	@GetMapping("/resturants/{rest_id}")
//	public String singleResturant(Model model,@PathVariable("rest_id") Long id) {
//		Resturant resturant=restService.findRestById(id);//to find a single resturant 
//		model.addAttribute("rest",resturant);
//		return "show_rest_information.jsp";
//		
//		
//	}
	
	@GetMapping("/rating")
		
	public List<Object[]> findavg(){
		List<Object[]> rating= rateService.findAverageStarsPerRestaurant();
		return rating;
		
	}
	
	
}
