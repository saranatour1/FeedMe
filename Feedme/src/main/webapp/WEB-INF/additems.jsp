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
              
              body {
                background-image: url('https://ik.imagekit.io/shadid/65656mm.jpg?updatedAt=1684689853927');
                background-size: cover;
                background-repeat: no-repeat;
              }
            </style>
          </head>

          <body>
            

            <div class="container-fluid w-100 ">
              <nav class="container mx-auto d-flex my-4 justify-content-between border-bottom border-gray">
                <img class="logo" src="https://ik.imagekit.io/shadid/1515151.svg?updatedAt=1684593623048" alt="">
        
                <div>
        
                  <button type="button" class="btn btn-primary" onclick="location.href='/myorders'"
                    style="background-color: #61c8e3;">
                    <a href="/myorders" style="text-decoration: none; color: inherit;">My orders</a>
                  </button>
        
        
                  <button type="button" class="btn btn-primary" onclick="location.href='/logout'"
                    style="background-color: #4a5d29;">
                    <a href="/logout" style="text-decoration: none; color: inherit;">Logout</a>
                  </button>
                </div>
              </nav>
            </div>


            <div class="container mt-5 w-50 d-flex  flex-column " style="align-items: flex-start; margin-left: 3%;">
              <form:form action="/addmenuitemstomenu" method="post" modelAttribute="menuItem" style="width: 50%;">
                <div class="form-group">
                  <label for="foodName">Food Name:</label>
                  <form:input path="foodName" id="foodName" class="form-control" />
                </div>
            
                <div class="form-group">
                  <label for="description">Description:</label>
                  <form:input path="desreption" id="description" class="form-control" />
                </div>
            
                <div class="form-group">
                  <label for="foodPrice">Food Price:</label>
                  <form:input type="number" path="foodPrice" id="foodPrice" class="form-control" />
                </div>
            
                <div class="form-group">
                  <label for="categories">Categories:</label>
                  <form:select path="categories" multiple="true" id="categories" class="form-control">
                    <form:options items="${categories}" itemLabel="catName" itemValue="id" />
                  </form:select>
                </div>
            
                <input type="submit" value="Submit" class="btn btn-primary mt-2" style="background-color: #e4a63f" />

              </form:form>
            
              <div class="w-50">
                <label for="catName">Add a category:</label>   
                <form action="/addcat" method="post">
                  <div class="form-group">
                    <input type="text" name="catName" id="catName" class="form-control">
                  </div>
                  <input type="submit" value="Submit" class="btn btn-primary mt-2" style="background-color: #e4a63f" />
                </form>
              </div>
            </div>
            

               <div class="w-75" style="margin-left: 4%">
                <h1 class="my-3">Menu Items</h1>
                <table class="table table-striped table-bordered">
                  <thead class="thead-dark">
                      <tr>
                          <th>Id</th>
                          <th>Food Name</th>
                          <th>Description</th>
                          <th>Food Price</th>
                          <th>Category Name</th>
                      </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="menuItem" items="${mi}">
                      <tr>
                        <td>${menuItem.id}</td>
                        <td>${menuItem.foodName}</td>
                        <td>${menuItem.desreption}</td>
                        <td class="item-price">${menuItem.foodPrice}</td>
                        <td>
                          <c:forEach items="${menuItem.categories}" var="cat">
                            ${cat.catName}
                          </c:forEach>
                        </td>
                      </tr>
                    </c:forEach>

                    <tr>
                      <td>add a category</td>
                      <td>

                      </td>
        
                    </tr>
                    

                  </tbody>
                  
              </table>
              
              </div>
            </div>

            <footer class="container-fluid bg-light py-3" style="position: fixed; bottom:-5px;">
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