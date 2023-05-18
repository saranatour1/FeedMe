package com.codingdojo.feedme.services;

import java.util.List;

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

  // return pending orders 
  public List<Object[]> findPendingOrdersForUsers(Long id){
    return orderRepo.findPendingOrdersForUser(id);
  }

  // return dileverd orders 

  public List<Object[]> findDileverdOrders(Long id){
    return orderRepo.findDeliveredOrdersForUser(id);
  }

  //count of pending cart values

  public int countPendingOrders(Long id){
    List<Object[]> cart = findPendingOrdersForUsers(id);
		boolean is_delivered = false;
		int count = 0;
		
		if (cart.size() > 0) {
				is_delivered = false;
				Object[] firstElement = cart.get(0);
				count = ((Number) firstElement[0]).intValue();
		}else{
			is_delivered=true;
			count=0;
		}
		// System.out.println(count);
		
		// System.out.println(cart);
		// model.addAttribute("pendingCartCount",  count);
    return count;
  }


}
