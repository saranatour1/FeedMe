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
        <div class="col-6 col-sm-6 col-md-8 col-lg-4"></div>
        <div class="col-6 col-sm-6 col-md-8 col-lg-4"></div>
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