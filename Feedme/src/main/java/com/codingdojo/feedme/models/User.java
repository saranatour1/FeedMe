package com.codingdojo.feedme.models;

import java.util.Date;
// import java.util.List;
import java.util.List;

// import javax.management.relation.Role;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
// import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
// import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Size;

//Define that an entity will be saved to the database, and define the table name, here it is called users

@Entity
@Table(name = "users")
public class User {
  // define all the variables with their corrosponding validations , from id, name
  // email password

  // adding the id, applying the rule that it is a unique id , and is auto
  // generated
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  // First name
  @NotEmpty(message = "first name is required!")
  @Size(min = 3, max = 30, message = "first name must be between 3 and 30 characters")
  private String firstName;

  // Last name
  @NotEmpty(message = "last name is required!")
  @Size(min = 3, max = 30, message = "last name must be between 3 and 30 characters")
  private String lastName;

  @NotEmpty(message = "Email is required!")
  @Email(message = "Please enter a valid email!")
  private String email;

  @NotEmpty(message = "Password is required!")
  @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters")
  private String password;

  @Transient
  @NotEmpty(message = "Confirm Password is required!")
  @Size(min = 8, max = 128, message = "Confirm Password must be between 8 and 128 characters")
  private String confirm;

  // date of birth
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  @Past(message = "date must be in the future!")
  private Date dob;

  // phone number
  @NotEmpty(message = "Phone number is required")
  @Size(min = 10, max = 15, message = "Phone number must be between 10 and 15 characters")
  private String phoneNumber;


  @OneToOne(mappedBy="user", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
  private Owner owner;



  public Owner getOwner() {
    return owner;
  }

  public void setOwner(Owner owner) {
    this.owner = owner;
  }

  public Date getDob() {
    return dob;
  }

  public void setDob(Date dob) {
    this.dob = dob;
  }



  // adding the created at and updated at is crusial for me

  // created at and the updated at columns
  @Column(updatable = false)
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date createdAt;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date updatedAt;

  //one to many relatiship between users and orders
  @OneToMany(mappedBy="user", fetch = FetchType.LAZY)
  private List<Order> userOrders;


  //users and ratings
  @OneToMany(mappedBy="user", fetch = FetchType.LAZY)
  private List<Rating> userRatings;

  //roles and users 
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name="role_id")
  private UserRole userrole;

  // Constructor




  public User(UserRole userrole) {
    this.userrole = userrole;
  }

  public UserRole getUserrole() {
    return userrole;
  }

  public void setUserrole(UserRole userrole) {
    this.userrole = userrole;
  }

  public List<Rating> getUserRatings() {
    return userRatings;
  }

  public void setUserRatings(List<Rating> userRatings) {
    this.userRatings = userRatings;
  }

  public List<Order> getUserOrders() {
    return userOrders;
  }

  public void setUserOrders(List<Order> userOrders) {
    this.userOrders = userOrders;
  }

  // empty constructor
  public User() {
  }

  public User(
      @NotEmpty(message = "first name is required!") @Size(min = 3, max = 30, message = "first name must be between 3 and 30 characters") String firstName,
      @NotEmpty(message = "last name is required!") @Size(min = 3, max = 30, message = "last name must be between 3 and 30 characters") String lastName,
      @NotEmpty(message = "Email is required!") @Email(message = "Please enter a valid email!") String email,
      @NotEmpty(message = "Password is required!") @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters") String password,
      @Past(message = "date must be in the future!") Date dob,
      @NotEmpty(message = "Phone number is required") @Size(min = 10, max = 15, message = "Phone number must be between 10 and 15 characters") String phoneNumber) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.email = email;
    this.password = password;
    this.dob = dob;
    this.phoneNumber = phoneNumber;
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

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getConfirm() {
    return confirm;
  }

  public void setConfirm(String confirm) {
    this.confirm = confirm;
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

  public String getFirstName() {
    return firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }
  public String getPhoneNumber() {
    return phoneNumber;
}

public void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
}

}
