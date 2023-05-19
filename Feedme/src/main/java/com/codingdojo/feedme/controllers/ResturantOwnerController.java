package com.codingdojo.feedme.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.feedme.models.Owner;
import com.codingdojo.feedme.models.Resturant;
import com.codingdojo.feedme.models.User;
import com.codingdojo.feedme.services.CatServices;
import com.codingdojo.feedme.services.MenuItemServices;
import com.codingdojo.feedme.services.OrderServices;
import com.codingdojo.feedme.services.OwnerService;
import com.codingdojo.feedme.services.RatingServices;
import com.codingdojo.feedme.services.ResturantServices;
import com.codingdojo.feedme.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ResturantOwnerController {

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

  @Autowired
	private OwnerService ownerServ;

  
  // if(thisUser.getUserrole().getId() == 2 ){
  //   return "redirect:/profile/{newUserId}";
  // }

    @RequestMapping("/profile/{newUserId}")
    public String ownerProfile(HttpSession session , @PathVariable("newUserId") Long id  ,Model model){
      // initialize an empty resturant 
      Long newUserId = (Long) session.getAttribute("newUser");
      User thisUser = userServ.findUserById(newUserId);
      model.addAttribute("thisUser", thisUser);

      // if the newly registered person does not have a resturant, we need to link him to a form to create a new resturnt

      if(thisUser.getOwner() ==null){
        //return the person directly to the form of a new resturant 

        return "redirect:/addaresturnattouser";
      }
      



      // Resturant resturant = restServ.addResturant(new Resturant());
      // Owner owner = ownerServ.adOwner(new Owner(thisUser, resturant));

      // model.addAttribute("myRest", resturant);
      
      return "profile.jsp";
    }


    // place to render the page 

    @GetMapping("/addaresturnattouser")
    public String addRest(@ModelAttribute("newRest") Resturant resturant, Model model ,HttpSession session) {
      model.addAttribute("newRest", new Resturant());
      Long newUserId = (Long) session.getAttribute("newUser");
      User thisUser = userServ.findUserById(newUserId);

     
      
      model.addAttribute("thisUser", thisUser);
      return "addresturant.jsp";
    }

    @PostMapping("/addaresturnattouser")
    public String login(@Valid @ModelAttribute("newRest") Resturant resturant,
        BindingResult result, Model model, HttpSession session) {
          Long newUserId = (Long) session.getAttribute("newUser");
          User thisUser = userServ.findUserById(newUserId);
          System.out.printf(thisUser.getFirstName());
          model.addAttribute("thisUser", thisUser);

          System.out.printf(resturant.getAddress(),resturant.getClosingTime());

      // User user = userServ.login(newLogin, result);
      model.addAttribute("newRest", resturant);

      if (result.hasErrors()) {
        // to capture the form inputs
        model.addAttribute("newRest", resturant);
        return "addresturant.jsp";
      }
      restServ.addResturant(resturant);
      Owner owner = ownerServ.adOwner(new Owner(thisUser, resturant));


      model.addAttribute("rest", resturant);
      return "redirect:/profile/"+ newUserId ;
    }
  



  
}
