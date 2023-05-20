package com.codingdojo.feedme.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;

@Entity
@Table(name = "orders")
public class Order {
  

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  private double total;
  private int quantity;
  //for dilivered or not
  private boolean orderStatus=false;
  private boolean isproccessed =false;



  public boolean isIsproccessed() {
    return isproccessed;
  }

  public void setIsproccessed(boolean isproccessed) {
    this.isproccessed = isproccessed;
  }

  //many to many relatioship between orders and menuItems
  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable(name = "orders_menuitems",
   joinColumns = @JoinColumn(name = "order_id"),
   inverseJoinColumns = @JoinColumn(name = "item_id"))
   @JsonIgnore
  private List<MenuItem> orderItems;

  //relation bewtween orders and resturant is a one to many, manytoone from the order side
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "resturant_id")
  @JsonIgnore
  private Resturant resturant;

  //one to many between users and orders 

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "user_id")
  @JsonIgnore
  private User user;




  // one to many reltiopship between orders and users, 
  // menu items manuy many 
  //returant one to many 

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public Resturant getResturant() {
    return resturant;
  }

  public void setResturant(Resturant resturant) {
    this.resturant = resturant;
  }

  public List<MenuItem> getOrderItems() {
    return orderItems;
  }

  public void setOrderItems(List<MenuItem> orderItems) {
    this.orderItems = orderItems;
  }

  public boolean isOrderStatus() {
    return orderStatus;
  }

  public void setOrderStatus(boolean orderStatus) {
    this.orderStatus = orderStatus;
  }

  public double getTotal() {
    return total;
  }

  public void setTotal(double total) {
    this.total = total;
  }


  

  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  @Column(updatable = false)
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date createdAt;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date updatedAt;

  


  public Order(double total, int quantity, Resturant resturant, User user) {
    this.total = total;
    this.quantity = quantity;
    this.resturant = resturant;
    this.user = user;
  }

  public Order() {
  }

  @PrePersist
  protected void onCreate() {
    this.createdAt = new Date();
  }

  @PreUpdate
  protected void onUpdate() {
    this.updatedAt = new Date();
  }
}
