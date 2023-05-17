package com.codingdojo.feedme.repositories;

// import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

// import com.codingdojo.fs.models.Book;
import com.codingdojo.feedme.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    
  //find by email 
    Optional<User> findByEmail(String email);

  // get all projects the user isn't joined at 

  
    
}