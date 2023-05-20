package com.codingdojo.feedme.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.feedme.models.Owner;
// import com.codingdojo.feedme.repositories.MenuRepository;
import com.codingdojo.feedme.repositories.OwnerRepository;

@Service
public class OwnerService {
  @Autowired
  private OwnerRepository ownerRepo;

  public Owner findOwnerById(Long id){
    return ownerRepo.findById(id).get();
  }

  public Owner adOwner(Owner owner){
    return ownerRepo.save(owner);
  }

}
