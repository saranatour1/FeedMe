package com.codingdojo.feedme.repositories;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.feedme.models.UserRole;

public interface UserRoleRepository  extends CrudRepository<UserRole, Long>  {
  //find user role by id

  

}

