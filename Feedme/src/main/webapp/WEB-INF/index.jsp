<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!-- c:out ; c:forEach etc. -->
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- Formatting (dates) -->
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <!-- form:form -->
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <!-- for rendering errors on PUT routes -->
        <%@ page isErrorPage="true" %>
          <!DOCTYPE html>
          <html>

          <head>

            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Login and Regestration page</title>
            <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
              integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
              crossorigin="anonymous"></script>
            <link rel="stylesheet" type="text/css" href="/css/main.css">
            <script src="script.js"></script>

          </head>

          <body>



            <nav class="navbar navbar-expand-lg navbar-light bg-light">
              <div class="container-fluid">
                <a class="navbar-brand" href="#">Wajbat</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                  data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                  aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
              </div>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a href="/login"> Sign in</a> |
                    <a href="/register">Sign up</a>
                  </li>
              </div>
            </nav>
            <div class="photo">
              <img src="https://ik.imagekit.io/shadid/55555.jpg?updatedAt=1684466122909" alt="" width="1500px"
                height="720px">
            </div>
            <p class="fade-in"> Indulge in the tantalizing flavors of Arab kabab at our restaurant. Our expert chefs
              skillfully prepare this iconic Middle Eastern dish to perfection, ensuring a memorable dining experience
              for our guests. Savor the succulent pieces of marinated meat, whether it's tender beef, juicy lamb, or
              flavorful chicken, grilled to perfection over open flames. The secret lies in our carefully crafted
              marinade, combining aromatic spices, fragrant herbs, and zesty citrus accents, creating a symphony of
              flavors that tantalize the taste buds. Each bite of our Arab kabab reveals a delightful harmony of smoky
              char, moist and tender meat, and a burst of enticing seasonings. Accompanied by fluffy saffron-infused
              rice and a selection of vibrant salads, pickles, and tantalizing sauces, our Arab kabab is a feast for all
              the senses. Experience the essence of Middle Eastern cuisine and let our Arab kabab transport you to the
              heart of the Arab world, where culinary traditions come alive with every delicious bite.

            </p>
            <div class="photo">
              <img src="https://ik.imagekit.io/shadid/666666.jpg?updatedAt=1684469546479" alt="" width="1500px"
                height="720px">
            </div>
            <p class="fade-in">
              At our restaurant, we take pride in crafting mouthwatering burgers that are sure to satisfy your cravings.
              Our burgers are a true culinary masterpiece, combining quality ingredients, expert grilling techniques,
              and a touch of culinary creativity. Prepare yourself for a tantalizing journey as we introduce you to the
              world of gourmet burgers.

              Each burger begins with a foundation of a freshly baked, soft and slightly toasted bun. We believe that
              the bun is just as important as the fillings, providing the perfect vessel for a harmonious flavor
              experience. Our buns are carefully selected to complement the burger patty and toppings, ensuring a
              delightful combination of textures and tastes.
            </p>

            <div class="photo">
              <img src="https://ik.imagekit.io/shadid/77777.jpg?updatedAt=1684469720441" alt="" width="1500px"
                height="720px">
            </div>
            <p class="fade-in">
              At our restaurant, we specialize in creating artisanal pizzas that will transport you to a world of
              gastronomic delight. Our pizzas are meticulously handcrafted using the finest ingredients, traditional
              techniques, and a dash of culinary passion. From the moment you take your first bite, you'll understand
              why pizza has become an iconic global favorite.

              Our journey begins with the foundation - the dough. We take pride in making our pizza dough from scratch,
              allowing it to rise to perfection and develop a light and airy texture. Every bite of our pizza crust is a
              symphony of crispiness on the outside and chewiness on the inside, creating the ideal canvas for our
              flavorful toppings.

              Speaking of toppings, we offer a wide variety to suit every taste and preference. Whether you're a fan of
              classic combinations like Margherita with fresh tomatoes, basil, and creamy mozzarella or adventurous
              flavors like BBQ chicken with tangy sauce, succulent chicken, and caramelized onions, we have something
              for everyone. Our toppings are carefully selected, ensuring the highest quality and optimal flavor balance
              in every bite.



            </p>








            <!-- Shadid please add any extra text -->
            <div class="d-flex justify-content-between border-bottom">
              <div>
                <p>
                  we have more than +${restcount} Resturants in our system
                </p>
                <img src="https://ik.imagekit.io/shadid/search.png?updatedAt=1684470487791" alt="">
              </div>

              <div>
                <p>
                  We have more than +${ordercount} orders in Total!
                </p>
                <img src="https://ik.imagekit.io/shadid/choose.png?updatedAt=1684470487902" alt="">
              </div>

              <div>
                <p>
                  we have more than + ${usercount} satisfied users!
                </p>
                <img src="https://ik.imagekit.io/shadid/order.png?updatedAt=1684470487786" alt="">
              </div>
            </div>



            <div class="d-flex justify-content-between border-top ">
              <div>
                <p>Palestine | English</p>
              </div>
              <div>
                <p>
                  &copy; 2023 Ashlo All rights reserved | <a href="#">Legal Advice </a> | <a href="#">Privacy
                    Policy</a> | <a href="#">Cookies Policy </a>|<a href="#"> Information about user licenses</a>
                </p>
              </div>

              <!-- <div>
                <p id="toggleCities">Cities</p>
                <ul id="cityList" style="display: none;">
                  <li>Nablus</li>
                  <li>Ramallah</li>
                  <li>Tulkarm</li>
                  <li>Jenin</li>
                  <li>Bethlehem</li>
                  <li>Hebron</li>
                  <li>Jericho</li>
                </ul>
              </div> -->
              <!-- <select id="city-select" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                <option selected>Cities</option>
                <option value="1">Nablus</option>
                <option value="2">Ramallah</option>
                <option value="3">Tulkarm</option>
              </select> -->
              
              <div class="mt-3">
                <select id="city-select" class="form-select form-select-lg">
                  <option selected>Cities</option>
                  <option value="1">Nablus</option>
                  <option value="2">Ramallah</option>
                  <option value="3">Tulkarm</option>
                </select>
              </div>
            </div>
              
              


              


              </div>
             <%-- <!-- <div class="carousel-item active ">
              <video autoplay="" loop="" playsinline="" muted="">
                  <source src="https://ik.imagekit.io/shadid/X2Download.app-Church_s_Chicken_Commercial_2019_-__USA__720p_.mp4?updatedAt=1684410691186">
                  Your browser does not support the video tag.
              </video>
          <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
            <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>  --%>
          </body>
          </html>