package com.codingdojo.feedme.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.feedme.models.UserRole;
import com.codingdojo.feedme.repositories.UserRoleRepository;

import jakarta.persistence.PreUpdate;

@Service
public class UserRoleServices {

  @Autowired
	private UserRoleRepository roleRepo;

  //find user role by id
  public UserRole findUserRole(Long id){
    return roleRepo.findById(id).get();
  }
  
}
