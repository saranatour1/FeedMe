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

<hr>
<div>
</div>
<hr>

<c:set var="ratingValue" value="${avg}" />
          <c:set var="maxRating" value="5" />
          <div class="rating-stars">
            <c:forEach begin="1" end="${maxRating}" var="i">
              <span class="star${ratingValue >= i ? ' filled' : ''}"
                >&#9734;</span>
                </c:forEach>
                </div>

${x}
<h1>Menu Items</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Food Name</th>
                <th>Description</th>
                <th>Food Price</th>
                <th>Category Name</th>
                <th>Category ID</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="menuItem" items="${x}">
                <tr>
                    <td>${menuItem[0]}</td>
                    <td>${menuItem[1]}</td>
                    <td>${menuItem[2]}</td>
                    <td>${menuItem[3]}</td>
                    <td>${menuItem[4]}</td>
                    <td>${menuItem[5]}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>









  </body>
</html>
