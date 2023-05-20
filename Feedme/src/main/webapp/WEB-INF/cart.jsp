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
                background-image: url('https://ik.imagekit.io/shadid/999999.jpg?updatedAt=1684549259272');
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

                  <button type="button" class="btn btn-primary" onclick="location.href='/resturants'"
                    style="background-color: #76c095;">
                    <a href="/resturants" style="text-decoration: none; color: inherit;">My Homepage</a>
                  </button>

                  <button type="button" class="btn btn-primary" onclick="location.href='/logout'"
                    style="background-color: #76c095;">
                    <a href="/logout" style="text-decoration: none; color: inherit;">Logout</a>
                  </button>
                </div>
              </nav>
            </div>

            <div class="container mt-5">
              <c:if test="${!cart.isEmpty()}">
                <h1 class="my-3">Your cart for Restaurant ${cart[0][1]}</h1>
                <p>You have ${pendingCartCount} items in this .</p>
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
              </c:if>

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

            <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
          </body>

          </html>