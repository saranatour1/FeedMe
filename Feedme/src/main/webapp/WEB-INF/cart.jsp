<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- for rendering errors on PUT routes -->
<div%@ page isErrorPage="true" %>
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
        <div><a href="/resturants">Back to main page </a></div>
      </div>
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
      
        <h1 class="my-3">Your cart for Restaurant ${cart[0][1]}</h1>
        <p>You have ${pendingCartCount} items in this cart.</p>
        <table class="table w-50 mx-auto">
          <thead>
            <tr>
              <th scope="col">count</th>
              <th scope="col">Item name</th>
              <!-- <th scope="col">Quantity</th> -->
              <th scope="col">Item price</th>
              <th scope="col">Location</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="item" items="${cart}">
              <tr>
                <td>${item[0]}</td>
                <td>${item[4]}</td>
                <!-- <td>${item[6]}</td> -->
                <td>${item[5]}</td>
                <td>${item[11]}</td>
              </tr>
            </c:forEach>
          </tbody>
          <tfoot>
            <tr>
              <td colspan="2">
                <span class="fw-bold">Total: ${cart[0][10]} $</span>
              </td>
              <td colspan="2">
                <span class="fw-bold">Quantity: ${pendingCartCount}</span>
              </td>

            </tr>
          </tfoot>
        </table>
      
        <div class="d-flex justify-content-center">
          <form action="/proccedtocheckout/${cart[0][2]}" method="post">
            <label for="proceed">Do you want to proceed to checkout?</label>
            <input type="submit" value="Submit" class="btn btn-light">
            <a href="/cancelorder/${cart[0][2]}" class="btn btn-link">Cancel order</a>
          </form>
        </div>

          


      </div>








  





                
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
