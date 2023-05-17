package com.codingdojo.feedme.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.feedme.models.LoginUser;
import com.codingdojo.feedme.models.User;
import com.codingdojo.feedme.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
	// Add once service is implemented:
	@Autowired
	private UserService userServ;

	// the main page, rendering the form with the basic things.
	// i did something wrong here most likely

	@RequestMapping("/")
	public String showForm(@ModelAttribute("newUser") User user, Model model) {
		// Bind empty User and LoginUser objects to the JSP
		// to capture the form input
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}

	// Post operation for Regesteration handling
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser,
			BindingResult result, Model model, HttpSession session) {

		// placed the user into a variable
		User registeredUser = userServ.register(newUser, result);

		session.setAttribute("newUser", registeredUser);
		if (result.hasErrors()) {
			// this is needed at all times to capture the incorrect user values
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}

		// Store the registered user's ID in session or perform any necessary login
		// operations
		session.setAttribute("newUser", registeredUser.getId());

		return "redirect:/dashboard";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,
			BindingResult result, Model model, HttpSession session) {

		User user = userServ.login(newLogin, result);

		if (result.hasErrors()) {
			// to capture the form inputs
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}

		// Store the logged-in user's ID in session or perform any necessary login
		// operations
		session.setAttribute("newUser", user.getId());
		return "redirect:/dashboard";
	}

	// main page
	@GetMapping("/dashboard")
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
