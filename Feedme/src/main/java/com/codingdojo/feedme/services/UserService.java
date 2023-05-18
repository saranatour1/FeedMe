package com.codingdojo.feedme.services;

import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.Date;
// import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.feedme.models.LoginUser;
import com.codingdojo.feedme.models.User;
import com.codingdojo.feedme.repositories.UserRepository;

// import com.codingdojo.fs.models.Book;

@Service
public class UserService {
  @Autowired
  private UserRepository userRepo;

  public User register(User newUser, BindingResult result) {

    if (result.hasErrors()) {
      return null;
    }
    // valid Email format, does not already exist in the database, not blank
    if (userRepo.findByEmail(newUser.getEmail()).isPresent()) {
      result.rejectValue("email", "Duplicate",
          "Email is already registered");
      return null;
    }

    // first name and last name must be letters only
    if (!newUser.getFirstName().matches("[a-zA-Z]+") || !newUser.getLastName().matches("[a-zA-Z]+")) {
      // First name and last name empty - letters only
      result.rejectValue("userName", "not letters", "The User Name must only consist of letters! ");

    }

    // Password Confirmation - matches password
    if (!newUser.getPassword().equals(newUser.getConfirm())) {
      result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
      return null;
    }

    // date of birth validation
    Date dob = newUser.getDob();
    LocalDate dateOfBirth = dob.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    LocalDate today = LocalDate.now();

    // Calculate age
    Period period = Period.between(dateOfBirth, today);
    int age = period.getYears();

    if (age <= 18) {
      result.rejectValue("dob", "Too young", "You must be at least 18 to join our website");
    }

    // matching the phone number with regex
    // String phoneNumberRegex = "^\\+(?:[0-9] ?){6,14}[0-9]$";
    if (newUser.getPhoneNumber().length() < 10) {
      result.rejectValue("phoneNumber", "does not match", "Invalid charecters or length");
    }

    //how to make sure that the user signed up as an admin or as a user in the main? 

    // by this line it is assumed there are no errors
    // Hash and set password, save user to database
    String hashedPassword = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    newUser.setPassword(hashedPassword);
    return userRepo.save(newUser);

  }

  // This method will be called from the controller
  // whenever a user submits a login form.
  public User login(LoginUser newLoginObject, BindingResult result) {

    // i see no point of adding these liness:
    // I am wrong
    if (result.hasErrors()) {
      return null;
    }
    // Find user in the DB by email
    Optional<User> potentialUser = userRepo.findByEmail(newLoginObject.getEmail());

    // Check whether the email provided is associated with a user in the database
    if (potentialUser.isEmpty()) {
      result.rejectValue("email", "Not Found", "User not found");
      return null;
    }

    User user = potentialUser.get();

    // If it is, check whether the password matches what's saved in the database
    if (!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
      result.rejectValue("password", "Invalid", "Invalid password");
      return null;
    }
    return user;
  }

  // this returns the user if it is found, else it returns null.
  public User findUserById(Long id) {
    return userRepo.findById(id).get();
  }

  public Long countUsers(){
    return userRepo.count();
  }


}
