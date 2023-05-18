package com.codingdojo.feedme.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.feedme.repositories.OrderRepositories;

@Service
public class OrderServices {
  
    
  @Autowired
  private OrderRepositories orderRepo;

  // count all orders 

  public Long countOrders(){
    return orderRepo.count();
  }
}
