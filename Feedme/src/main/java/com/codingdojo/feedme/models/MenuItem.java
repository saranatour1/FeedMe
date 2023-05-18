package com.codingdojo.feedme.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

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
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "menu_items")
public class MenuItem {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @NotEmpty(message = "food name is required!")
  @Size(min = 3, message = "food name must at least 3 characters")
  private String foodName;

  @NotEmpty(message = "descreption is required!")
  @Size(min = 3, message = "descreption must at least 3 characters")
  private String desreption;
  //add price 
  @NotNull(message = "price is required!")
  @Positive(message = "price must be a positive value")
  private double foodPrice;
 
  
  // menu and menu items have a relationship of many to one
  // manytoone side, between menu and menu items
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "menu_id")
  private Menu menu;

  // Category and menu items have a many to many relationship

  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable(name = "categories_menuitems",
   joinColumns = @JoinColumn(name = "item_id"),
   inverseJoinColumns = @JoinColumn(name = "category_id"))
  private List<Category> categories;


  //menu items and orders have a many to many relationship
  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable(name = "orders_menuitems",
   joinColumns = @JoinColumn(name = "item_id"),
   inverseJoinColumns = @JoinColumn(name = "order_id"))
  private List<Order> orders;



  public List<Order> getOrders() {
    return orders;
  }

  public void setOrders(List<Order> orders) {
    this.orders = orders;
  }

  public List<Category> getCategories() {
    return categories;
  }

  public void setCategories(List<Category> categories) {
    this.categories = categories;
  }

  public Menu getMenu() {
    return menu;
  }

  public void setMenu(Menu menu) {
    this.menu = menu;
  }



  public Double getFoodPrice() {
    return foodPrice;
  }

  public void setFoodPrice(Double foodPrice) {
    this.foodPrice = foodPrice;
  }

  @Column(updatable = false)
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date createdAt;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date updatedAt;

  public MenuItem() {
  }

  @PrePersist
  protected void onCreate() {
    this.createdAt = new Date();
  }

  @PreUpdate
  protected void onUpdate() {
    this.updatedAt = new Date();
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getFoodName() {
    return foodName;
  }

  public void setFoodName(String foodName) {
    this.foodName = foodName;
  }

  public String getDesreption() {
    return desreption;
  }

  public void setDesreption(String desreption) {
    this.desreption = desreption;
  }

  public Date getCreatedAt() {
    return createdAt;
  }

  public void setCreatedAt(Date createdAt) {
    this.createdAt = createdAt;
  }

  public Date getUpdatedAt() {
    return updatedAt;
  }

  public void setUpdatedAt(Date updatedAt) {
    this.updatedAt = updatedAt;
  }

}
