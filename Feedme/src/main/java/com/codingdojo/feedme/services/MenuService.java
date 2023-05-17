package com.codingdojo.feedme.services;

// import java.util.List;

// import org.hibernate.mapping.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.feedme.models.Menu;
import com.codingdojo.feedme.repositories.MenuRepository;

@Service
public class MenuService {
  
  @Autowired
  private MenuRepository menuRepo;

  /*
   * Find Menu By it's Id
   */

  public Menu findMenu(Long id) {
    return menuRepo.findById(id).get();
  }

  /*
   * Find Menu by Resturant ID,
   * 
   * @Param: Long resturantID
   * 
   * @Returns: List<Object> array full of items and data.
   * "m.id, mi.id as menu_item_id , mi.food_name , mi.food_price, mi.desreption , c.cat_name"
   * 
   */

  // public List<Object[]> findMenuByResturantId(Long id) {
  //   return  menuRepo.findmenuByResturantId(id);
  // }



}
