package com.codingdojo.feedme.services;

import java.util.List;

// import org.hibernate.mapping.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.feedme.models.Category;
import com.codingdojo.feedme.repositories.CategoryRepository;

@Service
public class CatServices {

  @Autowired
  private CategoryRepository catRepo;

  //find all categories 
  public List<Category> finallCategories(){
    return catRepo.findAll();
  }
  


}
