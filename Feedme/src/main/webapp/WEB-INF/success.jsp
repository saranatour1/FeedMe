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
            </style>
          </head>

          <body>

            <div class="container d-flex justify-content-between align-items-center mt-5">

              <div class="alert alert-success mx-auto mt-5" role="alert">
                <h4 class="alert-heading">Thank you for your order</h4>
                <p>Your order is being prosssessed at nhe moment, </p>
                <hr>
                <p class="mb-0">redirecting you to the main page ....</p>
                <p>redirecting you in  <span id="timer">0 second(s)</span></p>
              </div>

            </div>
 


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