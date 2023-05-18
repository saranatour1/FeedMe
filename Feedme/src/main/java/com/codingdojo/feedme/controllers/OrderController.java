package com.codingdojo.feedme.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.codingdojo.feedme.services.CatServices;
import com.codingdojo.feedme.services.MenuItemServices;
import com.codingdojo.feedme.services.OrderServices;
import com.codingdojo.feedme.services.RatingServices;
import com.codingdojo.feedme.services.ResturantServices;
import com.codingdojo.feedme.services.UserService;

@Controller
public class OrderController {
  
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

  //cart
  


  
}
