package com.codingdojo.feedme.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.feedme.models.LoginUser;
import com.codingdojo.feedme.models.User;
import com.codingdojo.feedme.models.UserRole;
import com.codingdojo.feedme.services.UserRoleServices;
import com.codingdojo.feedme.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
	// Add once service is implemented:
	@Autowired
	private UserService userServ;

	@Autowired 
	private UserRoleServices roleServ;

	/**
 * Retrieves the registration page.
 *
 * @param newUser The new user object.
 * @param model   The model for the view.
 * @return The name of the registration page.
 */

	@GetMapping("/register")
	public String register(@ModelAttribute("newUser") User newUser, Model model) {
		model.addAttribute("newUser", new User());
		return "regester-1.jsp";
	}


	// Post operation for Regesteration handling
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser,
			BindingResult result, Model model, HttpSession session , @RequestParam(value = "user_role", defaultValue = "1") Long userRole ,RedirectAttributes redirectAttributes ) {
		// placed the user into a variable
	

		User registeredUser = userServ.register(newUser, result);
		UserRole role = roleServ.findUserRole(userRole);
			System.out.println(userRole);

		if(registeredUser ==null){
			redirectAttributes.addFlashAttribute("error", "you must add all information to procceed");
			return "redirect:/register";
		}
	
		registeredUser.setUserrole(role);
		userServ.updateUserInfo(registeredUser);

		// registeredUser.setUserrole(2);
		// System.out.print(user_role);
		session.setAttribute("newUser", registeredUser);
		if (result.hasErrors()) {
			// this is needed at all times to capture the incorrect user values
			model.addAttribute("newLogin", new LoginUser());
			return "regester-1.jsp";
		}
		// Store the registered user's ID in session or perform any necessary login
		// operations
		session.setAttribute("newUser", registeredUser.getId());
		return "redirect:/resturants";
	}

	@GetMapping("/login")
	public String login(@ModelAttribute("newLogin") LoginUser newLogin, Model model) {
		model.addAttribute("newLogin", new LoginUser());
		return "login-1.jsp";
	}


	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,
			BindingResult result, Model model, HttpSession session) {

		User user = userServ.login(newLogin, result);

		if (result.hasErrors()) {
			// to capture the form inputs
			model.addAttribute("newUser", new User());
			return "login-1.jsp";
		}

		// Store the logged-in user's ID in session or perform any necessary login
		// operations
		session.setAttribute("newUser", user.getId());
		return "redirect:/resturants ";
	}

	//resturants 

	// main page

}
