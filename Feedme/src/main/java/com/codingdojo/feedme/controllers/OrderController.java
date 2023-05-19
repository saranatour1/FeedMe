package com.codingdojo.feedme.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.feedme.models.Order;
import com.codingdojo.feedme.models.User;
// import com.codingdojo.feedme.services.CatServices;
// import com.codingdojo.feedme.services.MenuItemServices;
import com.codingdojo.feedme.services.OrderServices;
// import com.codingdojo.feedme.services.RatingServices;
// import com.codingdojo.feedme.services.ResturantServices;
import com.codingdojo.feedme.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {
  
	@Autowired
	private UserService userServ;

	// @Autowired
	// private ResturantServices restServ;

	@Autowired
	private OrderServices orderServ;

	// @Autowired
	// private RatingServices rateServ;
	// @Autowired
	// private MenuItemServices miServ;

	// @Autowired
	// private CatServices catServ;

  //cart


	@RequestMapping("/cart")
	public String cart(Model model, HttpSession session){
		Long newUserId = (Long) session.getAttribute("newUser");
		User thisUser = userServ.findUserById(newUserId);
		model.addAttribute("thisUser", thisUser);
		
		// cart numbers
		List<Object[]> cart = orderServ.findPendingOrdersForUsers(newUserId);
		// List<Object[]> dilvOrders = orderServ.findPendingOrdersForUsers(newUserId);
		
		int count = cart.size();

		// System.out.println(cart);
		model.addAttribute("pendingCartCount", count);
		model.addAttribute("cart", cart);

		return "cart.jsp";
	}

	//handle transaction

	@PostMapping("/proccedtocheckout/{orderId}")
	public String success(@PathVariable("orderId") Long id){
		Order order = orderServ.findOrder(id);
		order.setOrderStatus(true);
		orderServ.updateOrder(order);
		return "redirect:/success";
	}

	@GetMapping("/cancelorder/{orderId}")
public String discard(@PathVariable("orderId") Long id){
	orderServ.removeOrder(id);
	return "redirect:/resturants";
}
  


  
}
