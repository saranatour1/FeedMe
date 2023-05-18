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
    <title>Login and Regestration page</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
  </head>

  <body>
    <div class="container mt-5">
      <div class="d-flex justify-content-between">
        <hgroup>
          <h1>Welcome, ${thisUser.firstName} !</h1>
          <a href="/projects/new" class="btn btn-link"> Add a project</a>
        </hgroup>

        <div><a href="/logout" class="btn btn-link"> Logout</a> <br /></div>
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




  


      <div>
        <c:forEach var="rating" items="${a}">
          <a href="/a/${rating[1]}"> ${rating[0]}</a>

          <c:set var="ratingValue" value="${rating[1]}" />
          <c:set var="maxRating" value="5" />
          <div class="rating-stars">
            <c:forEach begin="1" end="${maxRating}" var="i">
              <span class="star${ratingValue >= i ? ' filled' : ''}"
                >&#9734;</span
              >
            </c:forEach>
          </div>
        </c:forEach>
      </div>
    </div>

                
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
