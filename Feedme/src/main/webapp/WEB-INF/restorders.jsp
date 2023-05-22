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
              body {
                background-image: url('https://ik.imagekit.io/shadid/12124444mm.jpg?updatedAt=1684735644187');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: bottom right;
              }
              body {
                overflow-x: hidden;
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
            </style>
          </head>

          <body>

            <div class="container-fluid w-100 ">
              <nav class="container mx-auto d-flex my-4 justify-content-between border-bottom border-gray">
                <img class="logo" src="https://ik.imagekit.io/shadid/1515151.svg?updatedAt=1684593623048" alt="">
        
                <div>
        
                  <button type="button" class="btn btn-primary" onclick="location.href='/myorders'"
                    style="background-color:  #fec700d2;">
                    <a href="/myorders" style="text-decoration: none; color: inherit;">My orders</a>
                  </button>
        
        
                  <button type="button" class="btn btn-primary" onclick="location.href='/logout'"
                    style="background-color: #7d9011;">
                    <a href="/logout" style="text-decoration: none; color: inherit;">Logout</a>
                  </button>;
                </div>
              </nav>
            </div>



            <div class="container mt-5">
              <h3 class="my-3"> Your have these orders waiting for dilvery :</h3>

              <c:if test="${!pendingO.isEmpty()}">
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
                    <c:forEach var="item" items="${pendingO}">
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
                    <form action="/changestatus" method="post" >
                      <tr>
                        <td colspan="2">
                          <span class="fw-bold">Total: ${pendingO[0][10]} $</span>
                        </td>
                        <td colspan="2">
                          <span class="fw-bold">Quantity: ${pendingCartCount}</span>
                        </td>
                        <td>
                          <input type="hidden" value="${pendingO[0][2]}" name="orderId">
                          <input type="submit" value="dilvered" class="btn btn-primary" style="background-color: #e04119;">
                        </td>
                      </tr>

                    </form>

                  </tfoot>
                </table>
              </c:if>
              <c:if test="${pendingO.isEmpty()}">
              <p>You have no orders to be dilivered</p>
              </c:if>


              <h3 class="my-3"> these are the dilvered items:</h3>

              <c:if test="${!dil.isEmpty()}">
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
                    <c:forEach var="item" items="${dil}">
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
                        <span class="fw-bold">Total: ${dil[0][10]} $</span>
                      </td>
                      <td colspan="2">
                        <span class="fw-bold">Quantity: ${dil.size()}</span>
                      </td>
  
                    </tr>
                  </tfoot>
                </table>
              </c:if>
              <c:if test="${dil.isEmpty()}">
              <p> No items yet</p>
              </c:if>
            </div>

            <footer class="bg-light py-3 container-fluid" style="position: fixed; bottom: 0;">
              <div class="container mx-auto">
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
            <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
          </body>

          </html>