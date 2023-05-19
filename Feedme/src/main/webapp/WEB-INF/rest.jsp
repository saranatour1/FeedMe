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
      .btn.btn-light.position-relative:hover{
        animation: tilt-shaking 0.5s infinite;
      } 

      @keyframes tilt-shaking {
        0% { transform: rotate(0deg); }
        25% { transform: rotate(5deg); }
        50% { transform: rotate(0eg); }
        75% { transform: rotate(-5deg); }
        100% { transform: rotate(0deg); }
      }
    </style>
  </head>

  <body>
    <div class="container mt-5">
      <div class="d-flex justify-content-between">
        <hgroup>
          <h1>Welcome, ${thisUser.firstName} !</h1>
          
        </hgroup>

        <div><a href="/logout" class="btn btn-link"> Logout</a> <br /></div>
      </div>
      <!-- Cart -->
      <!-- Cart -->
      <div>
        <button type="button" class="btn btn-light position-relative ">
          <a href="cart"><i class="bi bi-cart"></i></a>
          <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
            ${pendingCartCount}+
            <span class="visually-hidden">Cart </span>
          </span>
        </button>
      </div>





      <!-- search bar query -->
      <label for="restName"> Search Restuarnt name </label>
      <form action="/findresturantbyname" method="post" >
        <input type="search" name="restName" placeholder="search for Restuarnt">
        <input type="submit" value="submit">
      </form>

      <p>
        <c:forEach var="res" items="${result}">
            <!-- the result value -->
            <div > 
            <a href="/resturantss/${res[0]}">${res[1]} </a>
            </div>

        </c:forEach>

        <p class="text-danger"><c:out value="${noresult}"/></p>
      </p>

      <div>
        <h3>filter by category</h3>
            <form action="/getresturantsbycat" method="get">
              <c:forEach var="cat" items="${allcat}">
                <!-- the result value -->
                <label>
                  <input type="checkbox" class="radio" value="${cat.id}" name="catVal" />${cat.catName}
                </label>

            </c:forEach>
            <input type="submit" value="submit">
            </form>
            <p>
              <c:forEach var="res" items="${catoutput}">
               <p><a href="/resturantss/${res[0]}">${res[1]} </a>
               </a></p> 

              </c:forEach>
              <p class="text-danger"><c:out value="${error}"/></p>
            </p>




  



        <c:forEach var="rating" items="${all_rating}">
          <div class="my-3">
          <a href="/resturants/${rating[1]}"> ${rating[0]}</a>
         <span>${Math.floor(rating[2])}</span> 
         
          <div class="progress w-25" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="5">
            <div class="progress-bar" style="width: ${rating[2]*20}%"></div>
          </div>
         <!--tbd  -->
          <!-- <c:set var="ratingValue" value="${rating[1]}" />
          <c:set var="maxRating" value="5" />
          <div class="rating-stars">
            <c:forEach begin="1" end="${maxRating}" var="i">
              <span class="star${ratingValue >= i ? ' filled' : ''}"
                >&#9734;</span>
            
            </c:forEach> -->
          </div>
          </c:forEach>
         
       
      </div>
    </div>

                
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
