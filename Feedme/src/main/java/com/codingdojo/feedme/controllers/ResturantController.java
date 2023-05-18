package com.codingdojo.feedme.controllers;

import java.util.List;

import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.feedme.models.Resturant;
import com.codingdojo.feedme.models.User;
import com.codingdojo.feedme.services.OrderServices;
import com.codingdojo.feedme.services.RatingServices;
import com.codingdojo.feedme.services.ResturantServices;
import com.codingdojo.feedme.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ResturantController {
	// user services

	@Autowired
	private UserService userServ;

	@Autowired
	private ResturantServices restServ;

	@Autowired
	private OrderServices orderServ;

	@Autowired
	private RatingServices rateServ;

	@RequestMapping("/")
	public String aboutUs(Model model) {
		// Bind empty User and LoginUser objects to the JSP
		// to capture the form input
		Long restCount = restServ.countAllRest();
		Long orderCount = orderServ.countOrders();
		Long userCount = userServ.countUsers();

		model.addAttribute("restcount", restCount);
		model.addAttribute("ordercount", orderCount);
		model.addAttribute("usercount", userCount);
		return "index.jsp";
	}

	// to render the main page after regestration
	@GetMapping("/resturants")
	public String dashbord(Model model, HttpSession session) {
		// to collect all resturants
		Long newUserId = (Long) session.getAttribute("newUser");
		User thisUser = userServ.findUserById(newUserId);
		model.addAttribute("thisUser", thisUser);
		List<Resturant> allrest = restServ.findAllResturants();
		// to collect all rating
		// List<Rating> rate=rateServices.findAllRating();
		List<Object[]> rating = rateServ.findAverageStarsPerRestaurant();
		model.addAttribute("all_rest", allrest); // all resturants
		model.addAttribute("all_rating", rating); // rating
		return "rest.jsp";
	}

	// this to show single Resturant information
	@GetMapping("/resturantss/{rest_id}")
	public String singleResturant(Model model, @PathVariable("rest_id") Long id) {
		Resturant resturant = restServ.findRestById(id);
		// to find a single resturant
		double avg = rateServ.findAverageRatingForRestaurant(id);
		model.addAttribute("rest", resturant);

		return "show_rest_information.jsp";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("newUser");
		return "redirect:/";
	}

}
