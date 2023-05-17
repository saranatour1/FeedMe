package com.codingdojo.feedme.services;

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

  // @Autowired
  // private BookRepository bookRepository;

  // TO-DO: Write register and login methods!
  // This method will be called from the controller
  // whenever a user submits a registration form.

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

    if (!newUser.getFirstName().matches("[a-zA-Z]+") || !newUser.getLastName().matches("[a-zA-Z]+")) {
      // First name and last name empty - letters only
      result.rejectValue("userName", "not letters", "The User Name must only consist of letters! ");

    }

    // Password Confirmation - matches password
    if (!newUser.getPassword().equals(newUser.getConfirm())) {
      result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
      return null;
    }

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

  // i decided to put the project services alone

}
