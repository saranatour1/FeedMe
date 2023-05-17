package com.codingdojo.feedme.restcontrollers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.codingdojo.feedme.models.Menu;
import com.codingdojo.feedme.services.MenuService;
// import com.codingdojo.feedme.services.UserService;

@RestController
public class MenuTestController {

  @Autowired
  private MenuService menuService;

  // find menu by its id

  // tested, returns the resturant

  /*
   * {"id":1,"createdAt":"2023-05-17T07:30:00.000+00:00","updatedAt":
   * "2023-05-17T07:30:00.000+00:00","resturant":{"id":1,
   * "restName":"Pasta Paradise","address":"123 Main St","restNumber":"555-1234",
   * "openingTime":"2023-05-17T15:00:00.000+00:00","closingTime":
   * "2023-05-17T19:00:00.000+00:00","descreption":"A cozy Italian restaurant"}
   */
  @RequestMapping("/findMenu/{id}")
  public Menu findMenu(@PathVariable("id") Long id) {
    return menuService.findMenu(id);
  }


}
