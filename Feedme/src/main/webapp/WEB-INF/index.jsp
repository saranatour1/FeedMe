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
    <div
      class="container container-sm container-md container-lg container-xl mt-5 text-start"
    >
      <h1 class="my-4 text-primary text-center">Project Maneger</h1>
      <p class="my-1 text-center">A place for teams to manage projects.</p>

      <div class="row mt-3">
        <div class="col-6">
          <h4 class="text-start my-2">Register</h4>

          <form:form
            action="/register"
            method="post"
            modelAttribute="newUser"
            class="container w-100"
          >
            <p>
              <form:label path="firstName" class="form-label"
                >First Name:
              </form:label>
              <form:errors path="firstName" class="text-danger" />
              <form:input type="text" path="firstName" class="form-control" />
            </p>
            <p>
              <form:label path="lastName" class="form-label"
                >Last Name:
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
              <form:label path="password" class="form-label"
                >Password :</form:label
              >
              <form:errors path="password" class="text-danger" />
              <form:input
                type="password"
                path="password"
                class="form-control"
              />
            </p>

            <p>
              <form:label path="confirm" class="form-label"
                >Confirm Password:
              </form:label>
              <form:errors path="confirm" class="text-danger" />
              <form:input type="password" path="confirm" class="form-control" />
            </p>

            <input type="submit" value="Submit" class="btn btn-primary" />
          </form:form>
        </div>
        <div class="col-6">
          <h4 class="text-start my-2">Login</h4>

          <form:form
            action="/login"
            method="post"
            modelAttribute="newLogin"
            class="container w-100"
          >
            <p>
              <form:label path="email" class="form-label">Email :</form:label>
              <form:errors path="email" class="text-danger" />
              <form:input type="email" path="email" class="form-control" />
            </p>

            <p>
              <form:label path="password" class="form-label"
                >Password :</form:label
              >
              <form:errors path="password" class="text-danger" />
              <form:input
                type="password"
                path="password"
                class="form-control"
              />
            </p>
            <input type="submit" value="Submit" class="btn btn-primary" />
          </form:form>
        </div>
      </div>
    </div>

    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
