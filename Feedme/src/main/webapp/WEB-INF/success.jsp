<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
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
                background-color: #F8B282;
              }

              .custom-btn:hover {
                background-color: #F8B282;
              }


              body {
                background-image: url('https://ik.imagekit.io/shadid/10101010101010.jpg?updatedAt=1684551325729');
                background-size: cover;
                background-repeat: no-repeat;
              }
              body {
                overflow-x: hidden;
              }
            </style>
          </head>

          <body>

            <div class="container-fluid w-100 ">
              <nav class="container mx-auto d-flex my-4 justify-content-between border-bottom border-gray">
                <img class="logo" src="https://ik.imagekit.io/shadid/1515151.svg?updatedAt=1684593623048" alt="">

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

            <div class="container d-flex justify-content-between align-items-center mt-5">

              <div class="alert alert-success mx-auto mt-5" role="alert">
                <h4 class="alert-heading">Thank you for your order</h4>
                <p>Your order is being prosssessed at nhe moment, </p>
                <hr>
                <p class="mb-0">redirecting you to the main page ....</p>
                <p>redirecting you in  <span id="timer">0 second(s)</span></p>
              </div>

            </div>
 




          
<div style="width :100vw; height:100vh " >
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

<script>
  var duration = 30; 
  var seconds = 0;

  function printSeconds() {
    var displayElement = document.getElementById('timer');
    displayElement.textContent = seconds + " second(s)";


    if (seconds >= duration) {
      window.location.href = "/resturants";
    }
  }

  setInterval(function() {
    seconds++;
    printSeconds();
  }, 1000);
</script>


          
            <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
          </body>

          </html>