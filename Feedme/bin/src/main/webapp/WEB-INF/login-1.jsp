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
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <link rel="stylesheet" type="text/css" href="/css/log.css">
                        <title>Document</title>


                    </head>

                    <body>
                        <div class="wrapper fadeInDown">
                            <div id="formContent">

                                <h2 class="active"> Sign In </h2>

                                <form:form action="/login" method="post" modelAttribute="newLogin"
                                    class="container w-100">
                                    <p>
                                        <form:input type="email" path="email" id="login" class="fadeIn second"
                                            placeholder="login" />
                                        <form:errors path="email" class="text-danger" />
                                    </p>
                                    <p>
                                        <form:input type="password" path="password" id="password" class="fadeIn third"
                                            placeholder="password" />
                                        <form:errors path="password" class="text-danger" />
                                    </p>
                                    <input type="submit" value="Submit" class="fadeIn fourth" />


                                </form:form>
                            </div>
                        </div>




                    </body>

                    </html>