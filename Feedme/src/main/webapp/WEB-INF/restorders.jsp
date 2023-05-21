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
            <div class="container-fluid w-100 ">

              <nav class="container mx-auto d-flex my-4 justify-content-between">
                <h3>Logo</h3>
                <div>

        
                  <!-- <a href="/myorders">My orders </a> -->
          
              
                  <a href="/resturants">Back to main page </a>
                  <a href="/logout" class="btn btn-link"> Logout</a> 
        
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
    
                      </tr>
                      <input type="hidden" value="${pendingO[0][2]}" name="orderId">
                      <input type="submit" value="dilvered">
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
            <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
          </body>

          </html>