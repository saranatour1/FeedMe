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
            <!-- Shadid please add any extra text -->
            
            <a href="/login"> Sign in</a> 
            <a href="/register">Sign up</a>
            <p>
              we have more than +${restcount} Resturants in our system
            </p>

            <p>
              We have more than +${ordercount} orders in Total!
            </p>

            <p>
              we have more than + ${usercount} satisfied users! 
            </p>
            
            <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
          </body>

          </html>

