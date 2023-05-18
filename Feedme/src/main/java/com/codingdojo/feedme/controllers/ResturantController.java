package com.codingdojo.feedme.controllers;

import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.feedme.models.User;
import com.codingdojo.feedme.services.OrderServices;
import com.codingdojo.feedme.services.ResturantServices;
import com.codingdojo.feedme.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ResturantController {
  //user services 

  @Autowired
	private UserService userServ;

  @Autowired
	private ResturantServices restServ;

	@Autowired
	private OrderServices orderServ;

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



  @GetMapping("/resturants ")
	public String homePage(Model model, HttpSession session) {
		Long newUserId = (Long) session.getAttribute("newUser");
		User thisUser = userServ.findUserById(newUserId);
		model.addAttribute("thisUser", thisUser);
		return "hello.jsp";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("newUser");
		return "redirect:/";
	}

}
