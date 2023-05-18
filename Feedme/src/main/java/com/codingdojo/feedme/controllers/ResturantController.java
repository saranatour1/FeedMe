package com.codingdojo.feedme.controllers;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.feedme.models.Category;
import com.codingdojo.feedme.models.Resturant;
import com.codingdojo.feedme.models.User;
import com.codingdojo.feedme.services.CatServices;
import com.codingdojo.feedme.services.MenuItemServices;
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
	@Autowired
	private MenuItemServices miServ;

	@Autowired
	private CatServices catServ;

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

	@GetMapping("/resturants")
	public String dashboard(Model model, HttpSession session) {
		// to collect all restaurants
		Long newUserId = (Long) session.getAttribute("newUser");
		User thisUser = userServ.findUserById(newUserId);
		model.addAttribute("thisUser", thisUser);
		List<Resturant> allRest = restServ.findAllResturants();

		List<Object[]> rating = rateServ.findAverageStarsPerRestaurant();
		List<Object[]> searchResult = (List<Object[]>) session.getAttribute("searchResult");
		model.addAttribute("all_rest", allRest); // all restaurants
		model.addAttribute("all_rating", rating); // rating
		model.addAttribute("result", searchResult); // search result

		List<Object[]> CatResult = (List<Object[]>) session.getAttribute("catoutput");
		model.addAttribute("catoutput", CatResult);
		session.removeAttribute("catoutput"); // Remove the session attribute

		String empty = (String) session.getAttribute("empty");
		model.addAttribute("empty", empty);
		session.removeAttribute("searchResult"); // Remove the session attribute
		// session.removeAttribute("badval");

		List<Category> allCats = catServ.finallCategories();
		model.addAttribute("allcat", allCats);
		return "rest.jsp";
	}

	// to render the main page after regestration
	@PostMapping("/findresturantbyname")
	public String findrestByName(@RequestParam("restName") String restName, HttpSession session,
			RedirectAttributes redirectAttributes) {
		List<Object[]> allRest = restServ.findResturantByName(restName);
		System.out.println(restName);
		if (restName.isBlank() || restName.isEmpty() || allRest.isEmpty() || allRest.contains(null)) {
			redirectAttributes.addFlashAttribute("noresult", "incorrect method of search or no result found");
		}

		session.setAttribute("searchResult", allRest);
		return "redirect:/resturants";
	}

	@GetMapping("/getresturantsbycat")
	public String findResturantsByCat(@RequestParam(value = "catVal", required = false) List<Long> id,
			HttpSession session, RedirectAttributes redirectAttributes) {
		String badValue = "";

		if (id == null || id.isEmpty()) {
			badValue = "Please enter a valid value!";
			redirectAttributes.addFlashAttribute("error", badValue);
			return "redirect:/resturants";
		} else {
			session.removeAttribute("badval");
		}

		List<Object[]> listOfOutput = restServ.findResturantByCat(id);
		System.out.println(listOfOutput);
		System.out.println(id); // [3], [1, 2, 3]

		session.setAttribute("catoutput", listOfOutput);
		return "redirect:/resturants";
	}

	// this to show single Resturant information
	@GetMapping("/resturants/{rest_id}")
	public String singleResturant(Model model, @PathVariable("rest_id") Long id) {
		Resturant resturant = restServ.findRestById(id);
		// to find a single resturant
		double avg = rateServ.findAverageRatingForRestaurant(id);
		List<Object[]> x = restServ.findMenuWithCategoriesAndMenuItemsByResturantId(id);
		System.out.println(avg); // 5.0
		model.addAttribute("avg", avg);
		model.addAttribute("x", x);

		return "show_rest_information.jsp";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("newUser");
		return "redirect:/";
	}

}
