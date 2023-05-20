<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
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
            <div class="container-fluid w-100 ">

              <nav class="container mx-auto d-flex my-4 justify-content-between">
                <h3>Logo</h3>
                <div>
                  <a href="/myorders/rest"> My orders </a>
                  <a href="/logout" class="btn btn-link"> Logout</a> 
                </div>
              </nav>
            </div>


            <div class="container mt-5">

              <p>
                ${rest.id}
              </p>

              <h3>${rest.restName}</h3>
              <p>${rest.descreption}</p>
              <p>Opens at ${fn:substring(rest.openingTime, 11, 16)} and closes at ${fn:substring(rest.closingTime, 11, 16)}</p>
              <a href="tel:${rest.restNumber}">Call us at ${rest.restNumber}</a>
       
              <p>this resturant has gained this amount of likes ${Math.floor(avg)} </p>
               <div class="progress w-25" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="5">
                 <div class="progress-bar" style="width: ${avg*20}%"></div>
               </div>
               <div>
                <a href="/addmenuitemstomenu" class="btn btn-link"> edit menu </a>
                <a href="/editresturantprofile/${rest.id}" class="btn btn-link">edit profile</a>
               </div>

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
            
		
            <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
            
          </body>

          </html>