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
            <!-- the person will enter this page only once in his/her entire time on the site -->

            <div class="container">
              <div>
                Hello , ${thisUser.firstName}, Since this is your first time signing up you are required to regester your resturant first!
              </div>
            </div>



            <div id="login-box">

              <div class="left">
                <h1 class="Signup">Add your resturant, don't worry you can edit it later! </h1>
                <form:form action="/addaresturnattouser" method="post" modelAttribute="newRest" class="container w-200">
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
                    <form:input type="time" path="openingTime"  />
                    <form:errors path="openingTime" class="text-danger" />
                  </p>
                  <p>
                    <form:label path="closingTime">Your opening time: </form:label>
                    <form:input type="time" path="closingTime"  />
                    <form:errors path="closingTime" class="text-danger" />
                  </p>
                  <p>
                    <form:input type="text" path="descreption" placeholder="what is your resturant about?" />
                    <form:errors path="descreption" class="text-danger" />
                  </p>

            

                  <input type="submit" value="Submit" />
  
        
                </form:form>
              </div>
        
       

        

                

     
                <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
         
          </body>

          </html>