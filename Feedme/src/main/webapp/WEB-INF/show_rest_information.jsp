<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${rest.restName}</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
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

      #map {
        height: 400px;
        width: 400px;
      }
    </style>
    <link rel="stylesheet" type="text/css" href="/css/stars.css" />
  </head>
  <body>
    <div class="hidden" style="opacity: 0%; width: 0px; height: 0px;">
      <p id="x">${locationLink.get("placeId")} </p>
      <p id="y">${locationLink.get("latitude")}</p>
      <p id="z">${locationLink.get("longitude")}</p>
    </div>
    <div class="container-fluid w-100 ">
      <nav class="container mx-auto d-flex my-4 justify-content-between border-bottom border-gray">
        <img class="logo" src="https://ik.imagekit.io/shadid/1515151.svg?updatedAt=1684593623048" alt="Page logo">
        <div>
          <button type="button" class="btn btn-light position-relative custom-btn">
            <a href="/cart">
              <i class="bi bi-cart"></i>
            </a>
            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"> ${pendingCartCount}+ <span class="visually-hidden">Cart </span>
            </span>
          </button>
          <button type="button" class="btn btn-primary" onclick="location.href='/myorders'" style="background-color: #76c095;">
            <a href="/myorders" style="text-decoration: none; color: inherit;">My orders</a>
          </button>
          <button type="button" class="btn btn-primary" onclick="location.href='/resturants'" style="background-color: #76c095;">
            <a href="/resturants" style="text-decoration: none; color: inherit;">My Homepage</a>
          </button>
          <button type="button" class="btn btn-primary" onclick="location.href='/logout'" style="background-color: #76c095;">
            <a href="/logout" style="text-decoration: none; color: inherit;">Logout</a>
          </button>
        </div>
      </nav>
    </div>
    <div class="container container-sm container-md container-lg container-xl mx-auto">
      <!-- Resturant information -->
      <!-- A place to add your pictures here -->
      <!-- If you want to add pictures, and reduce their size, play with the col property -->
      <div class="row">
        <c:if test="${rest.id==r.id}">
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
      </div>
    </div>
    <div class="container container-sm container-md container-lg container-xl">
      <div class="row">
        <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
          <div class="card bg-light">
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
                  <i class="bi bi-clock-history"></i> Opens at ${fn:substring(rest.openingTime, 11, 16)} and closes at ${fn:substring(rest.closingTime, 11, 16)}
                </p>
                <p>
                  <i class="bi bi-geo-alt"></i> Located at ${rest.address}
                </p>
                <a href="tel:${rest.restNumber}">
                  <i class="bi bi-headset"></i> Call us at ${rest.restNumber} </a>
              </div>
            </div>
          </div>
        </div>
        <!-- feel free to edit what ever you like shadid :D -->
        <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
          <div class="card bg-light">
            <div class="card-body">
              <h5 class="card-title">Likes</h5>
              <p class="card-text">This restaurant has gained ${Math.floor(avg)} likes</p>
              <div class="progress">
                <div class="progress-bar" role="progressbar" style="width: ${avg * 20}%" aria-valuenow="${avg * 20}" aria-valuemin="0" aria-valuemax="100"></div>
              </div>
              <div class="mt-4">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"> Add Your Rating ${thisUser.firstName} </button>
              </div>
            </div>
          </div>
        </div>
        <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
          <div class="container">
            <div id="map"></div>
          </div>
        </div>
      </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Add Your Rating</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form action="/addrating/${thisUser.id}/${rest.id}" method="post">
              <div class="mb-3">
                <label for="stars" class="form-label">Rating:</label>
                <input type="number" class="form-control" name="stars" id="stars" min="0" max="5" required>
              </div>
              <div class="mb-3">
                <label for="comments" class="form-label">Comments:</label>
                <input type="text" class="form-control" name="comments" id="comments" minlength="5" maxlength="300" required>
              </div>
              <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- ${pointlink} -->
    <div class="container">
      <div class="mx-auto">
        <h1 class="my-3">Menu Items</h1>
        <table class="table">
          <thead>
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
            <form action="/addItemsToCart/${rest.id}" method="post">
              <c:forEach var="menuItem" items="${x}">
                <tr>
                  <td>
                    <input type="hidden" value="${menuItem[0]}" name="ItemId">${menuItem[0]}
                  </td>
                  <td>${menuItem[1]}</td>
                  <td>${menuItem[2]}</td>
                  <td class="item-price">${menuItem[3]}</td>
                  <td>${menuItem[4]}</td>
                  <td>
                    <div class="d-flex align-items-center ">
                      <button type="button" class="btn btn-light reset-btn me-3">Reset</button>
                      <button type="button" class="btn btn-light add-items me-3">Add Item</button>
                      <input type="number" name="quantity" value="0" class="form-control quantity">
                    </div>
                  </td>
                </tr>
              </c:forEach>
              <tr>
                <td colspan="3">
                  <p>Total: <input type="text" value="0" id="total" name="total" class="form-control">
                  </p>
                </td>
                <td colspan="3">
                  <div class="d-flex align-items-center">
                    <p>Quantity: <input type="text" name="quantityTotal" id="quantity-total" class="form-control">
                    </p>
                    <input type="submit" class="btn btn-primary ms-3" value="Submit">
                  </div>
                </td>
              </tr>
            </form>
          </tbody>
        </table>
      </div>
    </div>
    <!-- </div> -->
    <!-- tbd -->
    <!-- <c:set var="ratingValue" value="${avg}" /><c:set var="maxRating" value="5" /><div class="rating-stars"><c:forEach begin="1" end="${maxRating}" var="i"><span class="star${ratingValue >= i ? ' filled' : ''}"
>&#9734;</span></c:forEach></div> -->
    <!-- ${x} -->
    <footer class="bg-light py-3">
      <div class="container">
        <div class="d-flex justify-content-between">
          <p class="text-muted">© 2023 Wajbat All rights reserved</p>
          <p class="text-muted">
            <a href="#">Legal Advice</a> | <a href="#">Privacy Policy</a> | <a href="#">Cookies Policy</a> | <a href="#">Information about user licenses</a>
          </p>
        </div>
      </div>
    </footer>
    <script src="/js/modal.js"></script>
    <script src="/js/quantity.js"></script>
    <script src="/js/location.js"></script>
    <!-- <script src="/js/location.js"></script> -->
    <script src="https://maps.googleapis.com/maps/api/js?key=${apiKey}&callback=initMap&libraries=places&v=weekly" defer></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>