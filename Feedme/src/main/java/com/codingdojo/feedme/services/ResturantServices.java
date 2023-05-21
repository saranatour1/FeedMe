package com.codingdojo.feedme.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.codingdojo.feedme.models.Menu;
import com.codingdojo.feedme.models.Resturant;
import com.codingdojo.feedme.repositories.ResturantsRepo;
import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.model.GeocodingResult;

// import io.github.cdimascio.dotenv.Dotenv;

@Service
public class ResturantServices {
	@Autowired
	private ResturantsRepo restRepo;


@Autowired
private Environment env;

	
	public Resturant addResturant(Resturant r){
		return restRepo.save(r);
	}

	//find all Resturan 
	public List<Resturant> findAllResturants(){
		return restRepo.findAll();
		
	}
	//find returant By Id
	public Resturant findRestById(Long id){
		Optional<Resturant> rest=restRepo.findById(id);
		if (rest.isPresent()) {
			 return rest.get();
		}else {
			return null;
		}
}


		// find resturant menu by resturant id 
		public Menu findMbyRestId(Long id ){
			return restRepo.findMenuByResturantId(id);
		}

		// find all menu items and categories from resturnat id
		public List<Object[]> findMbyRestIdandCat(Long id ){
			return restRepo.findMenuWithCategoriesAndMenuItemsByResturantId(id);
		}


		// search restuant by its name 
		public List<Object[]> findResturantByName(String restName){
			return restRepo.findByRestName(restName);
		}

		
		// seacrh reasturant by catagory 
		public List<Object[]> findResturantByCat(List<Long> catIds){
			return restRepo.findResturantsByCat(catIds);
		}
		
//		public Restaurant findRestaurantByName(String name) {
//	        // Implement the logic to find a restaurant by its name
//	        return restRepo.findByRestName(name);
//	    }


		// count all resturants 

		public long countAllRest(){
			return restRepo.count();
		}
		public List<Object[]> findMenuWithCategoriesAndMenuItemsByResturantId(Long id){
			return restRepo.findMenuWithCategoriesAndMenuItemsByResturantId(id);
		}
		public void updaterest(Resturant editRest){
			 restRepo.save(editRest);
		}


		
		//return the location geo point for the resturant

		public Map<String, Object> findLocationLink(Long id) {
			// Dotenv dotenv = Dotenv.load();

			// Dotenv dotenv = Dotenv.configure()
			// .directory("/")
			// .filename(".env") // instead of '.env', use 'env'
			// .load();
			// dotenv.get(null, null)
			// String API_KEY = System.getEnv(API_KEY);

			String apiKey = env.getProperty("API_KEY");
			// System.out.println(apiKey);
			

			GeoApiContext context = new GeoApiContext.Builder()
					.apiKey(apiKey)
					.build();
	
					String locationStr = restRepo.findById(id).get().getAddress();

					try {
						GeocodingResult[] results = GeocodingApi.geocode(context, locationStr).await();
		
						double latitude = results[0].geometry.location.lat;
						double longitude = results[0].geometry.location.lng;
						String placeId = results[0].placeId;
		
						String pointLink = String.format("https://www.google.com/maps?q=%.6f,%.6f", latitude, longitude);
		
						Map<String, Object> location = new HashMap<>();
						location.put("latitude", latitude);
						location.put("longitude", longitude);
						location.put("placeId", placeId);
						location.put("pointLink", pointLink);
		
						System.out.println("Point place Id: " + placeId);
						System.out.println("Point link URL: " + pointLink);
		
						return location;
				} catch (Exception e) {
						e.printStackTrace();
		
						// Return error message in case of exception
						Map<String, Object> errorResponse = new HashMap<>();
						errorResponse.put("error", "Error occurred while processing the request.");
		
						return errorResponse;
				} finally {
						context.shutdown();
				}
	
			
		}
	
	
}

	
