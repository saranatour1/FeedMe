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
    <div class="container-fluid w-100 ">

      <nav class="container mx-auto d-flex my-4 justify-content-between">
        <h3>Logo</h3>
        <div>
          <button type="button" class="btn btn-light position-relative ">
            <a href="/cart"><i class="bi bi-cart"></i></a>
            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
              ${pendingCartCount}+
              <span class="visually-hidden">Cart </span>
            </span>
          </button>

          <a href="/myorders">My orders</a>
  
      
          <!-- <a href="/">Back to main page </a> -->
          <a href="/logout" class="btn btn-link"> Logout</a> 

        </div>


      </nav>

    </div>
    <div class="container mt-5">

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
            <a href="/resturants/${res[0]}">${res[1]} </a>
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
               <p><a href="/resturants/${res[0]}">${res[1]} </a>
               </a></p> 

              </c:forEach>
              <p class="text-danger"><c:out value="${error}"/></p>
            </p>




  
<!-- allrest -->

<!-- <c:forEach var="rating" items="${all_rest}">
  <div class="my-3">
  <a href="/resturants/${rating.id}"> ${rating.restName}</a>

  <c:forEach var="r" items="${all_rating}">
    <span>${Math.floor(r[2])}</span> 
    <div class="progress w-25" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="5">
      <div class="progress-bar" style="width: ${r[2]*20}%"></div>
    </div>

  </c:forEach>

 


  </div>
  </c:forEach> -->

  <c:forEach var="rest" items="${all_rest}">
  <div class="my-3">
    <a href="/resturants/${rest.id}">${rest.restName}</a>

    <c:set var="rating" value="${0}" /> 


    <c:forEach var="r" items="${all_rating}">
      <c:if test="${r[1] == rest.id}">
        <c:set var="rating" value="${Math.floor(r[2])}" />
      </c:if>
    </c:forEach>

    <span>${rating}</span> 
    <div class="progress w-25" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="5">
      <div class="progress-bar" style="width: ${rating * 20}px"></div>
    </div>
  </div>
</c:forEach>



         
       
      </div>
    </div>

                
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
