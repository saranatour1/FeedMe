package com.codingdojo.feedme.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ServerProperties.Reactive.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.feedme.models.MenuItem;
import com.codingdojo.feedme.models.Order;
import com.codingdojo.feedme.models.Resturant;
import com.codingdojo.feedme.models.User;
import com.codingdojo.feedme.services.MenuItemServices;
// import com.codingdojo.feedme.services.CatServices;
// import com.codingdojo.feedme.services.MenuItemServices;
import com.codingdojo.feedme.services.OrderServices;
import com.codingdojo.feedme.services.ResturantServices;
// import com.codingdojo.feedme.services.RatingServices;
// import com.codingdojo.feedme.services.ResturantServices;
import com.codingdojo.feedme.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {

	@Autowired
	private UserService userServ;

	@Autowired
	private ResturantServices restServ;

	@Autowired
	private OrderServices orderServ;

	// @Autowired
	// private RatingServices rateServ;

	@Autowired
	private MenuItemServices miServ;

	// @Autowired
	// private CatServices catServ;

	// cart

	@RequestMapping("/cart")
	public String cartShow(Model model, HttpSession session) {
		Long newUserId = (Long) session.getAttribute("newUser");
		User thisUser = userServ.findUserById(newUserId);
		model.addAttribute("thisUser", thisUser);

		// cart numbers
		List<Object[]> cart = orderServ.findPendingCartForUsers(newUserId);
		// List<Object[]> dilvOrders = orderServ.findPendingOrdersForUsers(newUserId);

		int count = cart.size();

		// System.out.println(cart);
		model.addAttribute("pendingCartCount", count);
		model.addAttribute("cart", cart);
		session.setAttribute("checkout", false);
		return "cart.jsp";
	}

	// handle transaction

	@PostMapping("/proccedtocheckout/{orderId}")
	public String success(@PathVariable("orderId") Long id, HttpSession session) {
		Order order = orderServ.findOrder(id);
		// session.setAttribute("checkout", true);

		order.setIsproccessed(true);
		orderServ.updateOrder(order);
		return "redirect:/success";
	}

	@GetMapping("/cancelorder/{orderId}")
	public String discard(@PathVariable("orderId") Long id) {
		orderServ.removeOrder(id);
		return "redirect:/resturants";
	}

	// new order
	@RequestMapping("/addItemsToCart/{rest_id}")
	public String addItemToCart(@RequestParam("ItemId") List<Long> ItemId, @RequestParam("total") String total,
			@RequestParam("quantityTotal") String quantityTotal, @PathVariable("rest_id") Long restId, HttpSession session) {
		Long newUserId = (Long) session.getAttribute("newUser");
		User thisUser = userServ.findUserById(newUserId);

		double wholeTotal = Double.valueOf(total);

		int allQuantity = Integer.valueOf(quantityTotal);

		Resturant resturant = restServ.findRestById(restId);

		Order newOrder = new Order(wholeTotal, allQuantity, resturant, thisUser);
		newOrder.setOrderItems(new ArrayList<>());

		for (Long id : ItemId) {
			MenuItem item = miServ.findItem(id);
			newOrder.getOrderItems().add(item);
		}
		orderServ.addOrder(newOrder);

		// newOrder.s

		// Making a new order ,

		System.out.println(ItemId);
		System.out.println(allQuantity);

		System.out.println(restId);

		return "redirect:/resturants/{rest_id}";
	}

	// Success page

	@RequestMapping("/success")
	public String success(HttpSession session, Model model) {
		Long newUserId = (Long) session.getAttribute("newUser");
		User thisUser = userServ.findUserById(newUserId);
		model.addAttribute("thisUser", thisUser);

		String successMsg = "Thank you" + thisUser.getFirstName() + "Your order is being proccessed";

		model.addAttribute("msg", successMsg);

		return "success.jsp";
	}


	@RequestMapping("/myorders")
	public String ordersPage(HttpSession session, Model model ){
		Long newUserId = (Long) session.getAttribute("newUser");
		User thisUser = userServ.findUserById(newUserId);
		model.addAttribute("thisUser", thisUser);

		if(thisUser.getUserrole().getId() ==2){
			return "redirect:/myorders/rest";
		}

		List<Object[]> pendingOrders = orderServ.findPendingOrdersForUsers(newUserId);
		List<Object[]> cart = orderServ.findPendingCartForUsers(newUserId);
		
		List<Object[]> diliveredOrders = orderServ.findDileverdOrders(newUserId);
		int countPending = cart.size();
		int countDilivered = diliveredOrders.size();

		/* 
		 * we have a wierd issue here, the code is completly fine, but the orders are not being estimated correctly 
		 * 
		 */


		System.out.println(countDilivered);


		model.addAttribute("pendingCartCount", countPending);
		model.addAttribute("pendingO", pendingOrders);

		model.addAttribute("dil", diliveredOrders);
		model.addAttribute("countd",countDilivered);
		return "myorders.jsp";
	}

}
