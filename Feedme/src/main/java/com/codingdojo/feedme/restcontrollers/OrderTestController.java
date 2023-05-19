package com.codingdojo.feedme.restcontrollers;

import java.util.List;

// import org.hibernate.mapping.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.codingdojo.feedme.services.OrderServices;

@RestController
public class OrderTestController {
  @Autowired
  private OrderServices orderServ;

  /*
   * [
    [
        3,
        5,
        "Tomato Soup",
        6.99,
        3,
        false,
        3,
        3,
        35.99
    ]
]
   * 
   * 
   * 
   * 
   * 
   */

  @RequestMapping("/test/order/{id}")
  public List<Object[]> findPendingOrders(@PathVariable("id") Long id ){
    return orderServ.findPendingOrdersForUsers(id);
    
  }

}
