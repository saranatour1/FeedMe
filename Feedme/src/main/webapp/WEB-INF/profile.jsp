<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!-- c:out ; c:forEach etc. -->
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- Formatting (dates) -->
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <!-- form:form -->
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
          <!-- for rendering errors on PUT routes -->
          <%@ page isErrorPage="true" %>
            <!DOCTYPE html>
            <html>

            <head>
              <meta charset="UTF-8" />
              <title>all Resturant dashboards</title>
              <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
              <link rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
              <style>
                .btn.btn-light.position-relative:hover {
                  animation: tilt-shaking 0.5s infinite;
                }

                @keyframes tilt-shaking {
                  0% {
                    transform: rotate(0deg);
                  }

                  25% {
                    transform: rotate(5deg);
                  }

                  50% {
                    transform: rotate(0eg);
                  }

                  75% {
                    transform: rotate(-5deg);
                  }

                  100% {
                    transform: rotate(0deg);
                  }
                }
                body {
                overflow-x: hidden;
                background-color: #fefaef;
              }
              </style>
            </head>

            <body>



              <nav class="navbar navbar-expand-lg bg-body-tertiary container-fluid">
                <div class="container mx-auto">
                  <a class="navbar-brand" href="#">Meals</a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                      <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">Features</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">Pricing</a>
                      </li>
                    </ul>
                    <span class="navbar-text">
                      <button type="button" class="btn btn-primary" onclick="location.href='/myorders'" style="background-color: #61c8e3;">
                        <a href="/myorders" style="text-decoration: none; color: inherit;">My orders</a>
                      </button>
                      <button type="button" class="btn btn-primary" onclick="location.href='/logout'" style="background-color: #4a5d29;">
                        <a href="/logout" style="text-decoration: none; color: inherit;">Logout</a>
                      </button>

                    </span>
                  </div>
                </div>
              </nav>
              

              <c:if test="${rest.id==10}">
            <div id="carouselExample" class="carousel slide">
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="https://ik.imagekit.io/shadid/36363636.jpg?updatedAt=1684697977119"
                    class="d-block w-100 object-fit-cover" height="600px" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="https://ik.imagekit.io/shadid/5555555mm.png?updatedAt=1684697553969"
                    class="d-block w-100 object-fit-cover" height="600px" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="https://ik.imagekit.io/shadid/52152152m.jpg?updatedAt=1684697824567"
                    class="d-block w-100 object-fit-cover" height="600px" alt="...">
                </div>

              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>


            <div class="row justify-content-center mt-3">
              <div class="col-md-4 ">
                <p>Welcome to our pizza restaurant, where the love for pizza is served in every slice! We are passionate 
                  about creating the perfect combination of flavors, quality ingredients, and a delightful dining experience for pizza enthusiasts like you.

                  At our restaurant, we believe in the art of crafting authentic and mouthwatering pizzas. From the crispy 
                  thin crust to the rich and savory toppings, each pizza is carefully prepared to satisfy your taste buds. Our dedicated team of skilled 
                  chefs takes pride in hand-tossing the dough, selecting the freshest ingredients, and baking the pizzas to perfection in our traditional brick ovens.
                  
                  We offer a diverse menu with a wide variety of pizza options to cater to every preference. Whether you're a fan of classic Margherita, 
                  loaded with fresh basil and gooey mozzarella, or prefer adventurous combinations like BBQ chicken or vegetarian delights, we have something to please every palate.
                   Gluten-free and vegan options are also available, ensuring that everyone can enjoy our delicious pizzas.<br>
                  Come and experience the epitome of culinary excellence at our restaurant. Book your table today and
                  embark on a memorable gastronomic adventure. We look forward to serving you soon.

              </div>
              <div class="col-md-4">
                <p>Alongside our pizzas, we offer a range of delectable appetizers, fresh salads, and indulgent desserts to complement your dining experience.
                   Our friendly and attentive staff is always ready to assist you in selecting the perfect combination of dishes and beverages to create a memorable meal.

                  We strive to provide a warm and inviting atmosphere, whether you're dining in with family and friends or ordering for takeout. Our cozy seating areas, 
                  tastefully decorated interiors, and welcoming ambiance make it the perfect place to unwind, savor great food, and create lasting memories.
                  <br>
                  We also offer convenient online ordering and delivery services, ensuring that you can enjoy our scrumptious pizzas wherever you are. Whether it's a cozy 
                  night at home, a gathering with friends, or a quick office lunch, our pizzas are just a few clicks away.
                  
                  Visit our pizza restaurant today and embark on a culinary journey that celebrates the art of pizza-making. We can't wait to serve you and share our passion for 
                  delicious, handcrafted pizzas. Come and experience the ultimate pizza indulgence at our restaurant. <br>

              </div>
            </div>



            <section id="menu">
              <div class="container">
                <h2>Our Menu</h2>
                <div class="row">
                  <div class="col-md-6">
                    <div class="menu-item fade-in">
                      <img src="https://ik.imagekit.io/shadid/5555555mm.png?updatedAt=1684697553969" alt="Pizza 1" class="img-fluid">
                      <h3>Margherita</h3>
                      <p>Tomato sauce, mozzarella, basil</p>
                      <p class="price">$9.99</p>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="menu-item fade-in">
                      <img src="https://ik.imagekit.io/shadid/69696mm.jpg?updatedAt=1684700796488" alt="Pizza 2" class="img-fluid">
                      <h3>Pepperoni</h3>
                      <p>Tomato sauce, mozzarella, pepperoni</p>
                      <p class="price">$10.99</p>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="menu-item fade-in">
                      <img src="https://ik.imagekit.io/shadid/77777.jpg?updatedAt=1684469720441" alt="Pizza 3" class="img-fluid">
                      <h3>Hawaiian</h3>
                      <p>Tomato sauce, mozzarella, ham, pineapple</p>
                      <p class="price">$11.99</p>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="menu-item fade-in">
                      <img src="https://ik.imagekit.io/shadid/52152152m.jpg?updatedAt=1684697824567" alt="Pizza 4" class="img-fluid">
                      <h3>Veggie Supreme</h3>
                      <p>Tomato sauce, mozzarella, bell peppers, onions, mushrooms, olives</p>
                      <p class="price">$12.99</p>
                    </div>
                  </div>
                  <!-- Add more menu items here -->
                </div>
              </div>
            </section>
          </c:if> 
          





          <c:if test="${rest.id==9}">
            <div id="carouselExample" class="carousel slide">
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="https://ik.imagekit.io/shadid/666666.jpg?updatedAt=1684469546479"
                    class="d-block w-100 object-fit-cover" height="600px" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="https://ik.imagekit.io/shadid/999999922.jpg?updatedAt=1684704004111"
                    class="d-block w-100 object-fit-cover" height="600px" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="https://ik.imagekit.io/shadid/88888882.jpg?updatedAt=1684704004815"
                    class="d-block w-100 object-fit-cover" height="600px" alt="...">
                </div>

              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>


            <div class="row justify-content-center mt-3">
              <div class="col-md-4 ">
                <p>Welcome to our burger restaurant, where the love for burger is served in every slice! We are passionate 
                  about creating the perfect combination of flavors, quality ingredients, and a delightful dining experience for  enthusiasts like you.

                  At our restaurant, we believe in the art of crafting authentic and mouthwatering burgers. From the crispy 
                  thin crust to the rich and savory toppings, each burger is carefully prepared to satisfy your taste buds. Our dedicated team of skilled 
                  chefs takes pride in hand-tossing the dough, selecting the freshest ingredients, and baking the burgers to perfection in our traditional brick ovens.
                  
                  We offer a diverse menu with a wide variety of burger options to cater to every preference. Whether you're a fan of classic Margherita, 
                  loaded with fresh basil and gooey mozzarella, or prefer adventurous combinations like BBQ chicken or vegetarian delights, we have something to please every palate.
                   Gluten-free and vegan options are also available, ensuring that everyone can enjoy our delicious burgers.<br>
                  Come and experience the epitome of culinary excellence at our restaurant. Book your table today and
                  embark on a memorable gastronomic adventure. We look forward to serving you soon.

              </div>
              <div class="col-md-4">
                <p>Alongside our burgers, we offer a range of delectable appetizers, fresh salads, and indulgent desserts to complement your dining experience.
                   Our friendly and attentive staff is always ready to assist you in selecting the perfect combination of dishes and beverages to create a memorable meal.

                  We strive to provide a warm and inviting atmosphere, whether you're dining in with family and friends or ordering for takeout. Our cozy seating areas, 
                  tastefully decorated interiors, and welcoming ambiance make it the perfect place to unwind, savor great food, and create lasting memories.
                  <br>
                  We also offer convenient online ordering and delivery services, ensuring that you can enjoy our scrumptious burgers wherever you are. Whether it's a cozy 
                  night at home, a gathering with friends, or a quick office lunch, our burgers are just a few clicks away.
                  
                  Visit our burger restaurant today and embark on a culinary journey that celebrates the art of burger-making. We can't wait to serve you and share our passion for 
                  delicious, handcrafted burgers. Come and experience the ultimate burger indulgence at our restaurant. <br>

              </div>
            </div>



            <section id="menu">
              <div class="container">
                <h2>Our Menu</h2>
                <div class="row">
                  <div class="col-md-6">
                    <div class="menu-item fade-in">
                      <img src="https://ik.imagekit.io/shadid/88888882.jpg?updatedAt=1684704004815" alt="burger 1" class="img-fluid">
                      <h3>Cheeseburger</h3>
                      <p>Tomato sauce, mozzarella, basil</p>
                      <p class="price">$20.99</p>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="menu-item fade-in">
                      <img src="https://ik.imagekit.io/shadid/88888882.jpg?updatedAt=1684704004815" alt="burger 2" class="img-fluid">
                      <h3>Bacon Burger</h3>
                      <p>Tomato sauce, mozzarella, pepperoni</p>
                      <p class="price">$18.99</p>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="menu-item fade-in">
                      <img src="https://ik.imagekit.io/shadid/88888882.jpg?updatedAt=1684704004815" alt="burger 3" class="img-fluid">
                      <h3>BBQ Burger</h3>
                      <p>Tomato sauce, mozzarella, ham, pineapple</p>
                      <p class="price">$25.99</p>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="menu-item fade-in">
                      <img src="https://ik.imagekit.io/shadid/88888882.jpg?updatedAt=1684704004815" alt="burger 4" class="img-fluid">
                      <h3>Chicken Burger</h3>
                      <p>Tomato sauce, mozzarella, bell peppers, onions, mushrooms, olives</p>
                      <p class="price">$17.99</p>
                    </div>
                  </div>
                  <!-- Add more menu items here -->
                </div>
              </div>
            </section>
          </c:if>
            
          
            
            

            <div class="container">
              <div class="row">
                <div class="col-6">
                  <div class="card bg-light w-50 ">
                    <div class="card-header">
                      <h3>
                        <i class="bi bi-file-person"></i> ${rest.restName}
                      </h3>
                    </div>
                    <div class="card-body">
                      <div class="text-start">
                        <p>
                          <i class="bi bi-card-list"></i> ${rest.descreption}
                        </p>
                        <p>
                          <i class="bi bi-clock-history"></i> Opens at ${fn:substring(rest.openingTime, 11, 16)} and closes at ${fn:substring(rest.closingTime, 11,
                            16)}
                        </p>
                        <p>
                          <i class="bi bi-geo-alt"></i> Located at ${rest.address}
                        </p>
                        <a href="tel:${rest.restNumber}">
                          <i class="bi bi-headset"></i> Call us at ${rest.restNumber} </a>
                      </div>
                    </div>
                    <div class="card-footer">
                      <a href="/addmenuitemstomenu" class="btn btn-link"> edit menu </a>
                      <a href="/editresturantprofile/${rest.id}" class="btn btn-link">edit profile</a>
                    </div>
                  </div>
                </div>
                <div class="col-6">

                  <div class="card w-50">
                    <div class="card-header">
                      Your ratings
                    </div>
                    <div class="card-body">
                      <p>this resturant has gained this amount of likes ${Math.floor(avg)} </p>
                      <div class="progress " role="progressbar" aria-label="Basic example" aria-valuenow="0"
                      aria-valuemin="0" aria-valuemax="5">
                      <div class="progress-bar" style="width: ${avg*20}%"></div>
                    </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>




              <div class="container mt-5">

                <div class="mx-auto">
                  <h1 class="my-3">Menu Items</h1>
                  <table class="table table-striped table-bordered">
                    <thead class="thead-dark">
                      <tr>
                        <th>Id</th>
                        <th>Food Name</th>
                        <th>Description</th>
                        <th>Food Price</th>
                        <th>Category Name</th>
                        <th>Quantity</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="menuItem" items="${x}">
                        <tr>
                          <td>${menuItem[0]}</td>
                          <td>${menuItem[1]}</td>
                          <td>${menuItem[2]}</td>
                          <td class="item-price">${menuItem[3]}</td>
                          <td>${menuItem[4]}</td>
                          <td>${menuItem[5]}</td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
              <footer class="container-fluid bg-light py-3" style=" bottom:-5px;">
                <div class="container">
              
                  <div class="d-flex justify-content-between">
                    <p class="text-muted">© 2023 Wajbat All rights reserved</p>
                    <p class="text-muted">
                      <a href="#">Legal Advice</a> |
                      <a href="#">Privacy Policy</a> |
                      <a href="#">Cookies Policy</a> |
                      <a href="#">Information about user licenses</a>
                    </p>
                  </div>
                </div>
              </footer>

              <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
            </body>
            </html>