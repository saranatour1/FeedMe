package com.codingdojo.feedme.restcontrollers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.codingdojo.feedme.models.Menu;
import com.codingdojo.feedme.models.Rating;
import com.codingdojo.feedme.models.Resturant;
import com.codingdojo.feedme.services.RatingServices;
import com.codingdojo.feedme.services.ResturantServices;

@RestController
public class Rest_test {
	private final ResturantServices restService;
	private final RatingServices rateServices;


	public Rest_test(ResturantServices restService, RatingServices rateServices) {


		this.restService = restService;
		this.rateServices = rateServices;
	}



	//this to the dashbord page 

//	//this to show single Resturant information 
//	@GetMapping("/resturants/{rest_name}")
//	public String singleResturant(Model model,@PathVariable("rest_name") String name) {
//		
//		 List<Object[]> rest=restService.findResturantByName(name);
//		model.addAttribute("name", rest);
//		return "one_rest.jsp";
//	}
	
//	@GetMapping("/rating")
//		
//	public List<Object[]> findavg(){
//		List<Object[]> rating= rateService.findAverageStarsPerRestaurant();
//		return rating;
//		
//	}
	
	

	// this to the dashbord page
//	@GetMapping("/resturants")
//	public List<Resturant> Dashbord(Model model) {
//		// to collect all resturants
//		List<Resturant> allrest = restService.findAllResturants();
//		// to collect all rating
//		// List<Rating> rate=rateService.findAllRating();
//		// model.addAttribute("all_rest", allrest);
//		// model.addAttribute("all_rating", rate);
//		return allrest;
//	}
	// this to show single Resturant information
	// @GetMapping("/resturants/{rest_id}")
	// public String singleResturant(Model model,@PathVariable("rest_id") Long id) {
	// Resturant resturant=restService.findRestById(id);//to find a single resturant
	// model.addAttribute("rest",resturant);
	// return "show_rest_information.jsp";
	//
	//
	// }
//
//	@GetMapping("/rating")
//
//	public List<Object[]> findavg() {
//		List<Object[]> rating = rateServices.findAverageStarsPerRestaurant();
//		return rating;
//	}
//
//	// finds menu by resturant id
//	// @RequestMapping("/restmenu/{id}")
//	// public Menu findMenu(@PathVariable("id") Long id){
//	// return restService.findMbyRestId(id);
//	// }
//
//	@RequestMapping("/restmenu/{id}")
//	public List<Object[]> findMenu(@PathVariable("id") Long id) {
//		return restService.findMbyRestIdandCat(id);
//	}
//
//	// search functionality
//	@RequestMapping("/rest/{restName}")
//	public List<Object[]> findrestName(@PathVariable("restName") String restName) {
//		return restService.findResturantByName(restName);
//	}
//
//	// worksssssssss
//	@RequestMapping("/rest/cat/{catIds}")
//	public List<Object[]> findrestByCat(@PathVariable("catIds") List<Long> catIds) {
//		return restService.findResturantByCat(catIds);
//	}


}
