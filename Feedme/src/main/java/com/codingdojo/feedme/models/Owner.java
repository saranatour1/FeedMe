package com.codingdojo.feedme.models;

import java.security.PublicKey;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "owners")
public class Owner {

  public Owner(){}
  

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  // restrurant owner information

  @OneToOne(fetch=FetchType.LAZY)
  @JoinColumn(name="user_id")
  private User user;

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }


  @OneToOne(fetch=FetchType.LAZY)
  @JoinColumn(name="resturant_id")
  private Resturant resturant;


  public Owner(User user, Resturant resturant) {
    this.user = user;
    this.resturant = resturant;
  }

  public Resturant getResturant() {
    return resturant;
  }

  public void setResturant(Resturant resturant) {
    this.resturant = resturant;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

}
