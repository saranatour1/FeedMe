package com.codingdojo.feedme.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;



import com.codingdojo.feedme.models.Order;
// import com.codingdojo.feedme.models.Rating;

@Repository
public interface OrderRepositories extends CrudRepository<Order,Long> {
	List<Order> findAll();
	
	// find all orders for user that are with status not dilivered

	@Query(value = "SELECT count(mi.id), r.rest_name, o.id, mi.id as item_id, mi.food_name, mi.food_price, o.quantity, o.order_status, o.resturant_id, o.user_id, o.total, r.address " +
	"FROM orders o " +
	"INNER JOIN users ON users.id = user_id " +
	"INNER JOIN resturants r ON resturant_id = r.id " +
	"INNER JOIN orders_menuitems omi ON order_id = o.id " +
	"INNER JOIN menu_items mi ON item_id = mi.id " +
	"WHERE users.id = :id AND o.isproccessed = 0 " +
	"GROUP BY o.id, mi.id, mi.food_name, mi.food_price, o.quantity, o.order_status, o.resturant_id, o.user_id, o.total, r.address", nativeQuery = true)
	List<Object[]> findPendingOrdersForUser(@Param("id") Long id);
	



//select the dilevered cart orders

@Query(value = "SELECT count(mi.id), r.rest_name, o.id, mi.id as item_id, mi.food_name, mi.food_price, o.quantity, o.order_status, o.resturant_id, o.user_id, o.total, r.address " +
"FROM orders o " +
"INNER JOIN users ON users.id = user_id " +
"INNER JOIN resturants r ON resturant_id = r.id " +
"INNER JOIN orders_menuitems omi ON order_id = o.id " +
"INNER JOIN menu_items mi ON item_id = mi.id " +
"WHERE users.id = :id AND o.order_status = 1 " +
"GROUP BY o.id, mi.id, mi.food_name, mi.food_price, o.quantity, o.order_status, o.resturant_id, o.user_id, o.total, r.address", nativeQuery = true)
List<Object[]> findDeliveredOrdersForUser(@Param("id") Long id);



//peding items by resturant id 

	@Query(value = "SELECT count(mi.id), r.rest_name, o.id, mi.id as item_id, mi.food_name, mi.food_price, o.quantity, o.order_status, o.resturant_id, o.user_id, o.total, r.address " +
	"FROM orders o " +
	"INNER JOIN users ON users.id = user_id " +
	"INNER JOIN resturants r ON resturant_id = r.id " +
	"INNER JOIN orders_menuitems omi ON order_id = o.id " +
	"INNER JOIN menu_items mi ON item_id = mi.id " +
	"WHERE r.id = :id AND o.order_status = 0 " +
	"GROUP BY o.id, mi.id, mi.food_name, mi.food_price, o.quantity, o.order_status, o.resturant_id, o.user_id, o.total, r.address", nativeQuery = true)
	List<Object[]> findPendingOrdersForRest(@Param("id") Long id);



	@Query(value = "SELECT count(mi.id), r.rest_name, o.id, mi.id as item_id, mi.food_name, mi.food_price, o.quantity, o.order_status, o.resturant_id, o.user_id, o.total, r.address " +
"FROM orders o " +
"INNER JOIN users ON users.id = user_id " +
"INNER JOIN resturants r ON resturant_id = r.id " +
"INNER JOIN orders_menuitems omi ON order_id = o.id " +
"INNER JOIN menu_items mi ON item_id = mi.id " +
"WHERE r.id = :id AND o.order_status = 1 " +
"GROUP BY o.id, mi.id, mi.food_name, mi.food_price, o.quantity, o.order_status, o.resturant_id, o.user_id, o.total, r.address", nativeQuery = true)
List<Object[]> findDeliveredOrdersForRestId(@Param("id") Long id);


}
