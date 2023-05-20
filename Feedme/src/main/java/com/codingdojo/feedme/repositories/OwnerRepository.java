package com.codingdojo.feedme.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.feedme.models.Owner;

@Repository
public interface OwnerRepository extends CrudRepository<Owner,Long> {
  List<Owner> findAll();




}
