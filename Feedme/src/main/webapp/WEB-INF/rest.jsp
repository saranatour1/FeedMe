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
            <meta charset="UTF-8" />
            <title>all Resturant dashboards</title>
            <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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

              .btn-primary {
                transition: transform 0.3s ease;
              }

              .btn-primary:hover {
                transform: scale(1.1);
              }

              .custom-btn {
                background-color: #fbd500;
              }

              .custom-btn:hover {
                background-color: #fbd500;
              }
              body {
                overflow-x: hidden;
              }
            </style>

            <style>
              body {
                background-image: url('https://ik.imagekit.io/shadid/77777777.jpeg?updatedAt=1684517750560');
                background-size: cover;
                background-repeat: no-repeat;
              }
            </style>
          </head>

          <body>

            <div class="container-fluid w-100 ">
              <nav class="container mx-auto d-flex my-4 justify-content-between border-bottom border-gray">
                <h3>wajbat</h3>
                <div>

                  <button type="button" class="btn btn-light position-relative custom-btn">
                    <a href="/cart"><i class="bi bi-cart"></i></a>
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                      ${pendingCartCount}+
                      <span class="visually-hidden">Cart </span>
                    </span>
                  </button>

                  <button type="button" class="btn btn-primary" onclick="location.href='/myorders'"
                    style="background-color: #76c095;">
                    <a href="/myorders" style="text-decoration: none; color: inherit;">My orders</a>
                  </button>


                  <button type="button" class="btn btn-primary" onclick="location.href='/logout'"
                    style="background-color: #4d92e6;">
                    <a href="/logout" style="text-decoration: none; color: inherit;">Logout</a>
                  </button>
                </div>
              </nav>
            </div>

            <div class="photo mt-4 mx-auto" style="width: 1500px;">
              <img src="https://ik.imagekit.io/shadid/main-page.jpeg?updatedAt=1684505250631" alt="" class="w-100"
                style="height: 300px;">
            </div>



            <div class="container mx-auto d-flex">
              <div class="container main-container border-end border-gray mt-4">
                <h3>Filter by category</h3>
                <form action="/getresturantsbycat" method="get">
                  <ul>
                    <c:forEach var="cat" items="${allcat}">
                      <li>
                        <input type="checkbox" class="form-check-input" value="${cat.id}" name="catVal" />
                        <span class="form-check-label">${cat.catName}</span>
                      </li>
                    </c:forEach>
                  </ul>
                  <input type="submit" class="btn btn-primary" value="Submit">
                </form>

                <ul>
                  <c:forEach var="res" items="${catoutput}">
                    <li>
                      <a href="/resturantss/${res[0]}">${res[1]}</a>
                    </li>
                  </c:forEach>
                </ul>

                <p class="text-danger">
                  <c:out value="${error}" />
                </p>
              </div>

              <div class="container main-container">
                <c:forEach var="rating" items="${all_rating}">
                  <div class="my-3">
                    <a href="/resturants/${rating[1]}">${rating[0]}</a>
                    <span>${Math.floor(rating[2])}</span>

                    <div class="progress">
                      <div class="progress-bar" role="progressbar" style="width: ${rating[2]*20}%"></div>
                    </div>
                  </div>
                </c:forEach>
              </div>
            </div>



            <div style="width :100vw; height:20vh " >
            </div>

            <footer class="bg-light py-3">
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
            </footer>



            </div>
            <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
          </body>

          </html>