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
    <meta charset="windows-1256" />
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="/css/stars.css" />
  </head>

  <body>
    <div class="container mt-5">
      <div class="d-flex justify-content-between">
        <hgroup>
          <h1>Welcome, ${thisUser.firstName} !</h1>
          <a href="/projects/new" class="btn btn-link"> Add a project</a>
        </hgroup>

        <div><a href="/logout" class="btn btn-link"> Logout</a> <br /></div>
      </div>

      <div>
        <c:forEach var="rating" items="${a}">
          <a href="/a/${rating[1]}"> ${rating[0]}</a>

          <c:set var="ratingValue" value="${rating[1]}" />
          <c:set var="maxRating" value="5" />
          <div class="rating-stars">
            <c:forEach begin="1" end="${maxRating}" var="i">
              <span class="star${ratingValue >= i ? ' filled' : ''}"
                >&#9734;</span
              >
            </c:forEach>
          </div>
        </c:forEach>
      </div>
    </div>
  </body>
</html>
