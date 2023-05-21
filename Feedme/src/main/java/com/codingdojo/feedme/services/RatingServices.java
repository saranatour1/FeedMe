package com.codingdojo.feedme.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.feedme.models.Rating;
import com.codingdojo.feedme.repositories.RatingRepo;

@Service
public class RatingServices {
	private final RatingRepo rateRepo;

	public RatingServices(RatingRepo rateRepo) {

		this.rateRepo = rateRepo;
	}

	public List<Rating> findAllRating() {
		return rateRepo.findAll();

	}

	public List<Object[]> findAverageStarsPerRestaurant() {
		return rateRepo.findAverageStarsPerRestaurant();
	}

	public double findAverageRatingForRestaurant(Long id) {
		return rateRepo.findAverageRatingForRestaurant(id);
	}

	public Rating addRating(Rating rating) {

		return rateRepo.save(rating);
	}

	
	
}
