package com.codingdojo.feedme.controllers;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.codingdojo.feedme.models.Rating;
import com.codingdojo.feedme.models.Resturant;
import com.codingdojo.feedme.services.RatingServices;
import com.codingdojo.feedme.services.ResturantServices;



@Controller
public class ResturantController {
	
	private ResturantServices resturantServvices;
	private RatingServices rateServices;
	
	
	public ResturantController(ResturantServices resturantServvices, RatingServices rateServices) {
		super();
		this.resturantServvices = resturantServvices;
		this.rateServices = rateServices;
	}


	@GetMapping("/resturant")
	public String Dashbord1(Model model) {
		//to collect all resturants 
		List<Resturant> allrest=resturantServvices.findAllResturants();
		//to collect all rating 
		//List<Rating> rate=rateServices.findAllRating();
		List<Object[]> rating= rateServices.findAverageStarsPerRestaurant();
		model.addAttribute("all_rest", allrest);
		model.addAttribute("all_rating", rating);
		
		
		return "dashbord_resturant.jsp";
	}
	@GetMapping("/resturants")
	public String Dashbord(Model model) {
		//to collect all resturants 
		List<Resturant> allrest=resturantServvices.findAllResturants();
		//to collect all rating 
		List<Rating> rate=rateServices.findAllRating();
		List<Object[]>a=rateServices.findAverageStarsPerRestaurant();
		model.addAttribute("a", a);
	model.addAttribute("all_rating", rate);
		
		return "rest.jsp";
	}
	
	//this to show single Resturant information 
	@GetMapping("/resturantss/{rest_id}")
	public String singleResturant(Model model,@PathVariable("rest_id") Long id) {
		Resturant resturant=resturantServvices.findRestById(id);
		//to find a single resturant 
		double avg=rateServices.findAverageRatingForRestaurant(id);
		model.addAttribute("rest",resturant);
		
		return "show_rest_information.jsp";
		
		
	}
}
