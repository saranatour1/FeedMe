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
            <title>Confirmation page, all books</title>
            <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
          </head>

          <body>
            <div class="container mt-5">
              <div class="d-flex justify-content-between">
                <hgroup>
                  <h1>Welcome, ${thisUser.firstName} !</h1>
                  <a href="/projects/new" class="btn btn-link"> Add a project</a>
                </hgroup>

                <div>
                  <a href="/logout" class="btn btn-link"> Logout</a> <br>

                </div>

            <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
          </body>

          </html>