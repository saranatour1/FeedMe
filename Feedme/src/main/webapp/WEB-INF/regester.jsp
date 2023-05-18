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
            <title>Register Page </title>
            <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
          </head>

          <body>
            <div class="container mt-5">
              <div class="d-flex justify-content-between">
                <div class="col-6">
                  <h4 class="text-start my-2">Register</h4>

                  <form:form action="/register" method="post" modelAttribute="newUser" class="container w-100">

                    <p>
                      <form:label path="firstName" class="form-label">First Name:
                      </form:label>
                      <form:errors path="firstName" class="text-danger" />
                      <form:input type="text" path="firstName" class="form-control" />
                    </p>
                    <p>
                      <form:label path="lastName" class="form-label">Last Name:
                      </form:label>
                      <form:errors path="lastName" class="text-danger" />
                      <form:input type="text" path="lastName" class="form-control" />
                    </p>
                    <p>
                      <form:label path="email" class="form-label">Email :</form:label>
                      <form:errors path="email" class="text-danger" />
                      <form:input type="email" path="email" class="form-control" />
                    </p>

                    <p>
                      <form:label path="password" class="form-label">Password :</form:label>
                      <form:errors path="password" class="text-danger" />
                      <form:input type="password" path="password" class="form-control" />
                    </p>

                    <p>
                      <form:label path="confirm" class="form-label">Confirm Password:
                      </form:label>
                      <form:errors path="confirm" class="text-danger" />
                      <form:input type="password" path="confirm" class="form-control" />
                    </p>
                    <p>
                      <form:label path="dob" class="form-label">Date of birth: 
                      </form:label>
                      <form:errors path="dob" class="text-danger" />
                      <form:input type="date" path="dob" class="form-control" />
                    </p>
                    <p>
                      <form:label path="phoneNumber" class="form-label">Phone number:  
                      </form:label>
                      <form:errors path="phoneNumber" class="text-danger" />
                      <form:input type="text" path="phoneNumber" class="form-control" />
                    </p>
                    <p>
                      <label for="user_role" class="form-label">Sign up as a seller  
                      </label>
                      <input type="checkbox" id="user_role" name="user_role" value="2">
                    
                    </p>
                    <!-- the selection to rigester as a user or as a seller is left -->
                    <input type="submit" value="Submit" class="btn btn-primary" />
                  </form:form>
                </div>

                </div>
                </div>

            <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
          </body>

          </html>