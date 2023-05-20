package com.codingdojo.feedme.controllers;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.metamodel.mapping.ordering.OrderByFragment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.feedme.models.Category;
import com.codingdojo.feedme.models.Menu;
import com.codingdojo.feedme.models.MenuItem;
import com.codingdojo.feedme.models.Order;
import com.codingdojo.feedme.models.Owner;
import com.codingdojo.feedme.models.Resturant;
import com.codingdojo.feedme.models.User;
import com.codingdojo.feedme.services.CatServices;
import com.codingdojo.feedme.services.MenuItemServices;
import com.codingdojo.feedme.services.MenuServices;
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

  @Autowired 
  private MenuServices menuServ;


  
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


      // Long restId = (Long) session.getAttribute("restId");
      // Resturant rst = restServ.findRestById(restId) ;


      // model.addAttribute("rest", rst);

      Resturant resturant = thisUser.getOwner().getResturant();
      System.out.println(resturant);
      model.addAttribute("rest", resturant);
      
    
      double avg =0.0;
      if(resturant.getRestRatings().isEmpty() || resturant.getRestRatings() ==null){
         avg = 0.0;
      }else{
  
         avg = rateServ.findAverageRatingForRestaurant(resturant.getId());
      }
      List<Object[]> x = restServ.findMenuWithCategoriesAndMenuItemsByResturantId(resturant.getId());
      System.out.println(avg); // 5.0
      model.addAttribute("avg", avg);

      model.addAttribute("x", x);



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



      session.setAttribute("restId", resturant.getId());
      return "redirect:/profile/"+ newUserId ;
    }
    @GetMapping("/editresturantprofile/{rest_id}")
    public String GoToEditProfile(@ModelAttribute("editRest") Resturant editRest,@PathVariable("rest_id") Long rest_id,Model model) {
    	
    	Resturant rest=restServ.findRestById(rest_id);
    	model.addAttribute("editRest", rest);
    	return "edit_profile.jsp";
    	
    	
    }
    
    
    @PutMapping("/editaresturnattouser/{rest_id}")
    public String EditProfile(@Valid @ModelAttribute("editRest") Resturant editRest,BindingResult result,@PathVariable("rest_id") Long rest_id,Model model,HttpSession session) {
    	Long newUserId = (Long) session.getAttribute("newUser");
    	if (result.hasErrors()) {
    		model.addAttribute("editRest", editRest);
    		return "edit_profile.jsp";
    	}else 
    	{
    		restServ.updaterest(editRest);
        	
    		return "redirect:/profile/" + newUserId;
    	}
    	
    	
    	
    }

    
    @RequestMapping("/myorders/rest")
    public String showOrders(HttpSession session ,Model model){
      Long newUserId = (Long) session.getAttribute("newUser");
      User thisUser = userServ.findUserById(newUserId);
      System.out.printf(thisUser.getFirstName());
      model.addAttribute("thisUser", thisUser);

      Resturant resturant = thisUser.getOwner().getResturant();

      // this returns the orders that are not yet dilivered from the resturant side, and since the resturant and owner are connected there is no problem of resuing the same query
      List<Object[]>  notDiliveredItems = orderServ.findPendingItemsByResturantId(resturant.getId());
      List<Object[]> dil = orderServ.findDiliveredItemsForRest(resturant.getId());

      model.addAttribute("dil", dil);
      model.addAttribute("pendingO", notDiliveredItems);
      return "restorders.jsp";
    }

    //get orders based on resturant id not the user ID, althogh it is correct,
    // fixing a small bug with old data, nothing is cached
    //form to change the status of the orders for that restrant
    // for the user side, we need to add 

    @PostMapping("/changestatus")
    public String getDelivered(@RequestParam("orderId") Long id){
      Order orderToDiliver = orderServ.findOrder(id);
      orderToDiliver.setOrderStatus(true);
      orderServ.addOrder(orderToDiliver);
      return "redirect:/resturants";
    }

    // edit menu + menu Items
//NullPointerException
@GetMapping("/addmenuitemstomenu") 
public String addMenuItems(@ModelAttribute("menuItem") MenuItem menuItem,  Model model, HttpSession session) {
  Long newUserId = (Long) session.getAttribute("newUser");
  User thisUser = userServ.findUserById(newUserId);
  System.out.printf(thisUser.getFirstName());
  model.addAttribute("thisUser", thisUser);
  model.addAttribute("menuItem", new MenuItem());
  // get the restaurant of the user 
  Resturant resturant = thisUser.getOwner().getResturant();


  if (resturant.getMenu() == null) {
  
    Menu menu = new Menu(resturant, null);
    menuServ.saveMenu(menu);
  
    resturant.setMenu(menu); // Set the menu for the restaurant
  }

  List<MenuItem> menuItems = resturant.getMenu().getMenuItems();

  List<Category> categories = catServ.finallCategories();
  model.addAttribute("categories", categories);

  model.addAttribute("mi", menuItems);
  model.addAttribute("rest", resturant);

  return "additems.jsp";
}

//hand\linh the item adding

@PostMapping("/addmenuitemstomenu") 
public String handleaddMenuItems(@Valid @ModelAttribute("menuItem") MenuItem menuItem, BindingResult result,  Model model, HttpSession session) {
  if (result.hasErrors()) {
    // this is needed at all times to capture the incorrect user values
    model.addAttribute("menuItem", new MenuItem());
    return "additems.jsp";
  }

  //this returns null ?
  Long newUserId = (Long) session.getAttribute("newUser");
  User thisUser = userServ.findUserById(newUserId);

  miServ.savMenuItem(menuItem);

  Menu menu = thisUser.getOwner().getResturant().getMenu();
  menuItem.setMenu(menu);
  miServ.savMenuItem(menuItem);
  List<MenuItem> items = new ArrayList<>();
  items.add(0, menuItem);
  menu.setMenuItems(items);
  menuServ.saveMenu(menu);

  return "redirect:/addmenuitemstomenu";
}


@PostMapping("/addcat")
public String addcat(@RequestParam("catName") String cString){

  Category newCat = new Category(cString);
  catServ.saveCat(newCat);

  return "redirect:/addmenuitemstomenu";
}






  



  
}
