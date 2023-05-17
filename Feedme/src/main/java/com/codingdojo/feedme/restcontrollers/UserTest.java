package com.codingdojo.feedme.restcontrollers;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.codingdojo.feedme.models.User;
import com.codingdojo.feedme.services.UserService;

@RestController
public class UserTest {
  @Autowired
  private UserService userServ;

  // @PostMapping("/test/regestration")
  // public ResponseEntity<String> regesterForm(@RequestBody User newUser) {
    
  //   return ResponseEntity.ok("Registration successful.");

  // }
  // @RequestMapping(value = "/test/regestration", method = RequestMethod.POST)
  // public User create(@RequestParam(value = "firstName") String firstName, @RequestParam(value = "lastName") String lastName,
  //         @RequestParam(value = "email") String email, @RequestParam(value = "password") String password ,@RequestParam(value = "confirm") String confirm ,@RequestParam(value = "dob")  Date dob
  //         ,@RequestParam(value = "phoneNumber") String phoneNumber , BindingResult result) {
  //           if (result != null && result.hasErrors()) {
  //             // Handle errors
  //         }
          
  //     User newUser = new User(firstName, lastName, email , password , dob, phoneNumber);
  //     return userServ.register(newUser, result);
  // }


}
