package com.codingdojo.feedme.repositories;

import java.util.List;
import java.util.Optional;

// import org.hibernate.mapping.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.codingdojo.feedme.models.Menu;

@Repository
public interface MenuRepository extends CrudRepository<Menu, Long> {
  
  /*
   * Find Menu by Id
   * 
   */

  //  public Optional<Menu> findById(Long id);

  // find menu containing restuarnt, return a list of menu items 
  // @Transactional
//   @Query(value = "SELECT m.id, mi.id as menu_item_id, mi.food_name, mi.food_price, mi.desreption, c.cat_name " +
//   "FROM menu m " +
//   "JOIN menu_items mi ON m.id = mi.menu_id " +
//   "JOIN categories_menuitems cm ON item_id = mi.id " +
//   "JOIN categories c ON category_id = c.id " +
//   "JOIN resturants r ON r.id = m.resturant_id " +
//   "WHERE r.id = :id")
// List<Object[]> findListOfMenu(@Param("id") Long id);




}
