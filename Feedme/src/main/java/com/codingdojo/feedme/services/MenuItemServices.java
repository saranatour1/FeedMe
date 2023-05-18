package com.codingdojo.feedme.services;

import java.util.List;

// import org.hibernate.mapping.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.feedme.models.MenuItem;
import com.codingdojo.feedme.repositories.MenuItemRepository;

@Service
public class MenuItemServices {
  @Autowired
  private MenuItemRepository menuItemRepo;

  /*
   * Find all menu Items.
   * returns a List of menu items, but does not take any arguments
   * 
   * @Param : none
   * 
   * @return : List<MenuItem>
   * 
   */

  public List<MenuItem> findallMenuItems() {
    return menuItemRepo.findAll();
  }


  // find menu item by id 
  public MenuItem findItem(Long id){
    return menuItemRepo.findById(id).get();
  }
 
  
  
  /*
   * Find Menu Items By resturant menu Id
   * returns a list of objects of arrays
   * 
   * @Param : Long Menu Id
   * 
   * @return: List<Object[]> of the menu item
   * 
   */

  // public List<Object[]> findAllItemsForMenuId(Long id) {
  //   List<Object[]> MenuList = menuItemRepo.findMenuItemByuMenuId(id);
  //   return MenuList;
  // }

}
