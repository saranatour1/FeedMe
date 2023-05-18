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
            <title>Login and Regestration page</title>
            <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
            <link rel="stylesheet" type="text/css" href="/css/style.css">
            
          </head>

          <body>
            


            <div id="login-box">
              <div class="left">
                <h1>Sign up</h1>
                <form:form action="/register" method="post" modelAttribute="newUser" class="container w-100">
                  <p>
                    <form:input type="text" path="firstName" placeholder="firstName" />
                  </p>
                  <p>
                    <form:input type="text" path="lastName" placeholder="lastName" />
                  </p>
                  <p>
                    <form:input type="email" path="email" placeholder="email" />
                  </p>
                  <p>
                    <form:input type="password" path="password" placeholder="password" />
                  </p>
                  <p>
                    <form:input type="password" path="confirm" placeholder="confirm" />
                  </p>
                  <p>
                    <p>
                      <form:input type="Date" path="dob" placeholder="Date of birth" />
                    </p>
                    <p>
                      <form:input type="text" path="phoneNumber" placeholder="phoneNumber" />
                    </p>
                  <input type="submit" value="Submit" />
    
                  <form:errors path="firstName" class="text-danger" />
                  <form:errors path="confirm" class="text-danger" />
                  <form:errors path="password" class="text-danger" />
                  <form:errors path="lastName" class="text-danger" />
                  <form:errors path="email" class="text-danger" />
                  <form:errors path="dob" class="text-danger" />
                  <form:errors path="phoneNumber" class="text-danger" />
        
                </form:form>
              </div>
        
              <div class="right">
                <span class="loginwith">Sign in with<br />social network</span>
        
                <button class="social-signin facebook">Log in with facebook</button>
                <button class="social-signin twitter">Log in with Twitter</button>
                <button class="social-signin google">Log in with Google+</button>
              </div>
              <div class="or">OR</div>
            </div>
        

                
<!-- 
                <div class="col-6">
                  <h4 class="text-start my-2">Login</h4>

                  <form:form action="/login" method="post" modelAttribute="newLogin" class="container w-100">
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
                    <input type="submit" value="Submit" class="btn btn-primary" />
                  </form:form>
                </div>
              </div>
            </div> -->

            <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

          </body>

          </html>