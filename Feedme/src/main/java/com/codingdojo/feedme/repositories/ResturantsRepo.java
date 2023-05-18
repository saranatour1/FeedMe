package com.codingdojo.feedme.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.codingdojo.feedme.models.Menu;
import com.codingdojo.feedme.models.Resturant;

@Repository
public interface ResturantsRepo extends CrudRepository<Resturant, Long> {
  List<Resturant> findAll();

  Optional<Resturant> findById(Long id);

  @Query("SELECT r.menu FROM Resturant r WHERE r.id = :resturantId")
  Menu findMenuByResturantId(@Param("resturantId") Long resturantId);

  @Query("SELECT menu.id, menuItems.foodName, menuItems.desreption, menuItems.foodPrice, categories.catName, resturant.restName FROM Menu menu "
      +
      "JOIN menu.resturant resturant " +
      "LEFT JOIN menu.menuItems menuItems " +
      "INNER JOIN menuItems.categories categories " +
      "WHERE resturant.id = :resturantId")
  List<Object[]> findMenuWithCategoriesAndMenuItemsByResturantId(@Param("resturantId") Long resturantId);


  // Search by resturant name 
  @Query("SELECT r.id , r.restName FROM Resturant r WHERE r.restName LIKE %:restName%")
  List<Object[]> findByRestName(@Param("restName") String restName);
  

  @Query(value="select DISTINCT r.id, r.rest_name, categories.cat_name from menu " +
        "join resturants r on resturant_id = r.id " +
        "left join menu_items on menu.id = menu_items.menu_id " +
        "inner join categories_menuitems on item_id = menu_items.id " +
        "inner join categories on category_id = categories.id " +
        "where categories.id IN (:categoryIds)",nativeQuery = true )
List<Object[]> findResturantsByCat(@Param("categoryIds") List<Long> categoryIds);


// return all resturant counts // used deafult count 

// @Query(value = " select count(*) as count from resturants" , nativeQuery = true)
// int countResturants();


// @Query("SELECT r.id, r.rest_name, categories.cat_name FROM Menu menu " +
//         "JOIN menu.resturant r " +
//         "LEFT JOIN menu.menuItems menuItems " +
//         "INNER JOIN menuItems.categories categories " +
//         "WHERE categories.id IN :categoryIds")
// List<Object[]> findRestaurantsByCat(@Param("categoryIds") List<Long> categoryIds);



//   @Query("SELECT r.id, r.rest_name, categories.cat_name FROM Menu menu " +
//         "JOIN menu.resturant r " +
//         "LEFT JOIN menu.menuItems menuItems " +
//         "INNER JOIN menuItems.categories categories " +
//         "WHERE categories.id IN :categoryIds")
// List<Object[]> findRestaurantsByCategories(@Param("categoryIds") List<Long> categoryIds);



//Resturant findByRestName(String restName);



}
