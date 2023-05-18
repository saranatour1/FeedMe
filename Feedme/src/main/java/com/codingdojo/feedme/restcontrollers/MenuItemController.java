package com.codingdojo.feedme.restcontrollers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.codingdojo.feedme.models.MenuItem;
import com.codingdojo.feedme.services.MenuItemServices;

public class MenuItemController {
  @Autowired
  private MenuItemServices menuService;

  // find menu item by id 
/**
 * This Java function finds a menu item by its ID using a menu service.
 * 
 * @param id The id parameter is a Long data type 
 * @return A MenuItem object is being returned. 
 * 
 */
  public MenuItem findMenuItem(Long id){
    return menuService.findItem(id);
  }


/**
 * This function returns a list of all menu items using the menuService.
 * 
 * @return A List of MenuItem objects is being returned.
 */

  public List<MenuItem> findallMenuItemse(){
    return menuService.findallMenuItems();
  }



}
