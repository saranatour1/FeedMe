package com.codingdojo.feedme.models;

import java.time.LocalTime;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "resturants")
public class Resturant {
  public Resturant() {
  }

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  // retsurant name
  @NotEmpty(message = "resturant name is required!")
  private String restName;

  // address
  @NotEmpty(message = "address is required!")
  private String address;

  // phone number
  @NotEmpty(message = "Phone number is required")
  @Size(min = 10, max = 15, message = "Phone number must be between 10 and 15 characters")
  private String restNumber;

  // opening time
  @DateTimeFormat(pattern = "HH:mm")
  private Date openingTime;
  // closing time
  @DateTimeFormat(pattern = "HH:mm")
  private Date closingTime;

  // descreption
  @NotEmpty(message = "descreption is required")
  @Size(min = 10, message = "descreption should be more than 10 charecters")
  private String descreption;

  // one to one relationship between the menu an Resturant, since 1 restuarnt has
  // 1 menu
  @OneToOne(mappedBy = "resturant", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
  private Menu menu;

  //one to many between resturant and orders
  @OneToMany(mappedBy="resturant", fetch = FetchType.LAZY)
  private List<Order> restOrders;
  
  // resturants and ratings
  @OneToMany(mappedBy="resturant", fetch = FetchType.LAZY)
  private List<Rating> restRatings;

  public List<Rating> getRestRatings() {
    return restRatings;
  }

  public void setRestRatings(List<Rating> restRatings) {
    this.restRatings = restRatings;
  }

  public List<Order> getRestOrders() {
    return restOrders;
  }

  public void setRestOrders(List<Order> restOrders) {
    this.restOrders = restOrders;
  }

  public Menu getMenu() {
    return menu;
  }

  public void setMenu(Menu menu) {
    this.menu = menu;
  }

  @Column(updatable = false)
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date createdAt;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date updatedAt;

  @PrePersist
  protected void onCreate() {
    this.createdAt = new Date();
  }

  @PreUpdate
  protected void onUpdate() {
    this.updatedAt = new Date();
  }

  public Resturant(@NotEmpty(message = "resturant name is required!") String restName,
      @NotEmpty(message = "address is required!") String address,
      @NotEmpty(message = "Phone number is required") @Size(min = 10, max = 15, message = "Phone number must be between 10 and 15 characters") String restNumber,
      Date openingTime, Date closingTime,
      @NotEmpty(message = "descreption is required") @Size(min = 10, message = "descreption should be more than 10 charecters") String descreption) {
    this.restName = restName;
    this.address = address;
    this.restNumber = restNumber;
    this.openingTime = openingTime;
    this.closingTime = closingTime;
    this.descreption = descreption;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getRestName() {
    return restName;
  }

  public void setRestName(String restName) {
    this.restName = restName;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getRestNumber() {
    return restNumber;
  }

  public void setRestNumber(String restNumber) {
    this.restNumber = restNumber;
  }

  public Date getOpeningTime() {
    return openingTime;
  }

  public void setOpeningTime(Date openingTime) {
    this.openingTime = openingTime;
  }

  public Date getClosingTime() {
    return closingTime;
  }

  public void setClosingTime(Date closingTime) {
    this.closingTime = closingTime;
  }

  public String getDescreption() {
    return descreption;
  }

  public void setDescreption(String descreption) {
    this.descreption = descreption;
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
