package com.codingdojo.feedme.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.feedme.models.Order;
import com.codingdojo.feedme.repositories.OrderRepositories;

@Service
public class OrderServices {

  @Autowired
  private OrderRepositories orderRepo;

  //find order by id
  public Order findOrder(Long id){
    return orderRepo.findById(id).get();
  }

  //delete order by id 
  public void removeOrder(Long id){
    orderRepo.deleteById(id);
  }

  public void updateOrder(Order order){
    orderRepo.save(order);
  }

  public Order addOrder(Order b) {
    return orderRepo.save(b);
  }


  // count all orders 

  public Long countOrders(){
    return orderRepo.count();
  }

  // return pending orders 
  public List<Object[]> findPendingOrdersForUsers(Long id){
    return orderRepo.findPendingOrdersForUser(id);
  }

  public List<Object[]> findPendingCartForUsers(Long id){
    return orderRepo.findPendingCartForUser(id);
  }

  public List<Object[]> findPendingItemsByResturantId(Long id){

    return orderRepo.findPendingOrdersForRest(id);
  }

  // recieved orders
  public List<Object[]> findDiliveredItemsForRest(Long id){
    return orderRepo.findDeliveredOrdersForRestId(id);
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

    return count;
  }


}
