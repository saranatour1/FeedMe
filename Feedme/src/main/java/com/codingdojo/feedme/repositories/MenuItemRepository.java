package com.codingdojo.feedme.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.codingdojo.feedme.models.MenuItem;

@Repository
public interface MenuItemRepository  extends CrudRepository<MenuItem, Long>  {
  
  //find menu all menu items
  List<MenuItem> findAll();

  //find menu item by id
  // Optional<MenuItem> findById(Long id);

  //find menu item by resturant id 

  @Query(value = "select mi.id,mi.food_name,mi.desreption,mi.food_price, c.cat_name, c.id from menu_items mi "+
                  "join menu m on menu_id = m.id " 
                  +"join categories_menuitems cm on item_id=mi.id "
                  +"join categories c on category_id = c.id "
                  +"where m.id = :id ", nativeQuery = true)
List<Object[]> findMenuItemByuMenuId(@Param("id") Long id);





  //find all menu item by resturant id  + menu id 


}
