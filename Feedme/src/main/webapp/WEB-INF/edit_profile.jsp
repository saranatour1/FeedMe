<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Login and Regestration page</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <style>
      body {
        background-image: url('https://ik.imagekit.io/shadid/14584848m.jpg?updatedAt=1684671556865');
        background-repeat: no-repeat;
        background-size: cover;
      }
    </style>
  </head>
  <body>


    <div class="container-fluid w-100 ">
      <nav class="container mx-auto d-flex my-4 justify-content-between border-bottom border-gray">
        <img class="logo" src="https://ik.imagekit.io/shadid/1515151.svg?updatedAt=1684593623048" alt="">

        <div>

          <button type="button" class="btn btn-primary" onclick="location.href='/myorders'"
            style="background-color: #c0a67a;">
            <a href="/myorders" style="text-decoration: none; color: inherit;">My orders</a>
          </button>


          <button type="button" class="btn btn-primary" onclick="location.href='/logout'"
            style="background-color: #f36c37;">
            <a href="/logout" style="text-decoration: none; color: inherit;">Logout</a>
          </button>
        </div>
      </nav>
    </div>

    <!-- the person will enter this page only once in his/her entire time on the site -->
    <!-- <div class="container">
      <div> Hello , ${thisUser.firstName}, Since this is your first time signing up you are required to regester your resturant first! </div>
    </div> -->

    <!-- <div id="login-box">
      <div class="left">
        <h1 class="Signup"> This is a ${editRest.restName}  you can easily edit later to describe your restaurant and its specialties</h1>
        <form:form action="/editresturantprofile/${editRest.id}" method="post" modelAttribute="editRest" class="container w-200">
          <input type="hidden" name="_method" value="put">
          <p>
            <form:input type="text" path="restName" placeholder="Your resturant name" />
            <form:errors path="restName" class="text-danger" />
          </p>
          <p>
            <form:input type="text" path="address" placeholder="where are you located?" />
            <form:errors path="address" class="text-danger" />
          </p>
          <p>
            <form:input type="text" path="restNumber" placeholder="0521892861" />
            <form:errors path="restNumber" class="text-danger" />
          </p>
          <p>
            <form:label path="openingTime">Your opening time: </form:label>
            <form:input type="time" path="openingTime" />
            <form:errors path="openingTime" class="text-danger" />
          </p>
          <p>
            <form:label path="closingTime">Your opening time: </form:label>
            <form:input type="time" path="closingTime" />
            <form:errors path="closingTime" class="text-danger" />
          </p>
          <form:input type="hidden" path="id" value="${editRest.id}" />
          <p>
            <form:input type="text" path="descreption" placeholder="what is your resturant about?" />
            <form:errors path="descreption" class="text-danger" />
          </p>
          <input type="submit" value="Submit" />
        </form:form>
      </div> -->


      <div id="login-box" class="container">
  <div class="row">
    <div class="col-lg-6">
      <form:form action="/editresturantprofile/${editRest.id}" method="post" modelAttribute="editRest" class="container w-200">
        <input type="hidden" name="_method" value="put">
        <div class="form-group mt-2">
          <form:input type="text" path="restName" class="form-control" placeholder="Your restaurant name" />
          <form:errors path="restName" class="text-danger" />
        </div>
        <div class="form-group mt-2">
          <form:input type="text" path="address" class="form-control" placeholder="Where are you located?" />
          <form:errors path="address" class="text-danger" />
        </div>
        <div class="form-group mt-2">
          <form:input type="text" path="restNumber" class="form-control" placeholder="0521892861" />
          <form:errors path="restNumber" class="text-danger" />
        </div>
        <div class="form-group text-light mt-2">
          <form:label path="openingTime">Your opening time:</form:label>
          <form:input type="time" path="openingTime" class="form-control" />
          <form:errors path="openingTime" class="text-danger" />
        </div>
        <div class="form-group text-light mt-2">
          <form:label path="closingTime">Your closing time:</form:label>
          <form:input type="time" path="closingTime" class="form-control" />
          <form:errors path="closingTime" class="text-danger" />
        </div>
        <form:input type="hidden" path="id" value="${editRest.id}" />
        <div class="form-group mt-2">
          <form:input type="text" path="descreption" class="form-control" placeholder="What is your restaurant about?" />
          <form:errors path="descreption" class="text-danger" />
        </div>
        <input type="submit" value="Submit" class="btn btn-primary mt-2"  style="background-color: #e93e04; border-color: #607fa6;" />
      </form:form>
    </div>
  </div>
</div>

      <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </body>
</html>