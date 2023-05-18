package com.codingdojo.feedme.repositories;

import java.util.List;
import java.util.Optional;

// import org.hibernate.mapping.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.codingdojo.feedme.models.Menu;

@Repository
public interface MenuRepository extends CrudRepository<Menu, Long> {
  
  /*
   * Find Menu by Id
   * 
   */

  //  public Optional<Menu> findById(Long id);






}
