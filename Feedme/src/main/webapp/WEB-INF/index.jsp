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

            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Login and Regestration page</title>
            <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
              integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
              crossorigin="anonymous"></script>

            <link rel="stylesheet" type="text/css" href="/css/main.css">
            <script src="script.js"></script>
            <style>
              .btn.btn-light.position-relative:hover {
                animation: tilt-shaking 0.5s infinite;
              }

              @keyframes tilt-shaking {
                0% {
                  transform: rotate(0deg);
                }

                25% {
                  transform: rotate(5deg);
                }

                50% {
                  transform: rotate(0eg);
                }

                75% {
                  transform: rotate(-5deg);
                }

                100% {
                  transform: rotate(0deg);
                }
              }

              .btn-primary {
                transition: transform 0.3s ease;
              }

              .btn-primary:hover {
                transform: scale(1.1);
              }

              .custom-btn {
                background-color: #fbd500;
              }

              .custom-btn:hover {
                background-color: #fbd500;
              }

              body {
                overflow-x: hidden;
                background-color: #d9e4df;
              }
            </style>

          </head>

          <body>

            <div class="container-fluid w-100 ">
              <nav class="container mx-auto d-flex my-4 justify-content-between border-bottom border-gray">
                <img class="logo" src="https://ik.imagekit.io/shadid/1515151.svg?updatedAt=1684593623048" alt="">

                <div>
                  <button type="button" class="btn btn-primary" onclick="location.href='/login'"
                    style="background-color: #76c095;">
                    <a href="/login" style="text-decoration: none; color: inherit;"> Sign in</a>
                  </button>

                  <button type="button" class="btn btn-primary" onclick="location.href='/register'"
                    style="background-color: #4d92e6;">
                    <a href="/register" style="text-decoration: none; color: inherit;">Sign up</a>
                  </button>
                </div>
              </nav>
            </div>


            <div id="carouselExample" class="carousel slide">
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="https://ik.imagekit.io/shadid/77777.jpg?updatedAt=1684469720441"
                    class="d-block w-100 object-fit-cover" height="600px" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="https://ik.imagekit.io/shadid/666666.jpg?updatedAt=1684469546479"
                    class="d-block w-100 object-fit-cover" height="600px" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="https://ik.imagekit.io/shadid/2323m.jpg?updatedAt=1684611255679"
                    class="d-block w-100 object-fit-cover" height="600px" alt="...">
                </div>

              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>

            <div class="row justify-content-center mt-3">
              <div class="col-md-4 ">
                <p>Welcome to our restaurant, where gastronomy meets elegance and taste takes center stage. We pride
                  ourselves on providing a
                  memorable dining experience that combines exceptional cuisine, impeccable service,
                  and a warm and inviting atmosphere.

                  At our restaurant, we believe that great food is at the heart of any remarkable dining experience. Our
                  talented team of chefs meticulously
                  crafts each dish with the finest ingredients, ensuring a burst of flavors that will tantalize your
                  taste buds.
                  From signature appetizers to delectable main courses and indulgent desserts, our menu showcases a
                  fusion of culinary traditions and innovative creations<br>
                  Come and experience the epitome of culinary excellence at our restaurant. Book your table today and
                  embark on a memorable gastronomic adventure. We look forward to serving you soon.

              </div>
              <div class="col-md-4">
                <p>To complement your meal, our extensive wine list features a curated selection of local and
                  international wines. Our knowledgeable sommeliers are happy to guide you in
                  choosing the perfect pairing for your chosen dishes, elevating your dining experience to new heights.
                  <br>
                  We understand that dietary preferences and restrictions are important considerations for our guests.
                  That's why we offer a range of vegetarian, vegan, and gluten-free options, ensuring that everyone can
                  savor the flavors of our cuisine.
                  In addition to our exceptional dining experience, we also provide catering services for special
                  events. Whether it's a wedding, corporate function, or social gathering, our experienced team will
                  work closely with you to create a customized menu that exceeds your expectations. <br>

              </div>
            </div>




              <div class="container">
                <div class="row">
                  <div class="col-8">
                    <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
                      <div class="carousel-inner">
                        <div class="carousel-item active">
                          <img src="https://ik.imagekit.io/shadid/1212m.jpg?updatedAt=1684611251928"
                            class="d-block w-100 object-fit-cover" height="600px" alt="...">
                        </div>
                        <div class="carousel-item">
                          <img src="https://ik.imagekit.io/shadid/4545m.jpg?updatedAt=1684611439472"
                            class="d-block w-100 object-fit-cover" height="600px" alt="...">
                        </div>
                        <div class="carousel-item">
                          <img
                            src="https://ik.imagekit.io/shadid/5656m.jpg?updatedAt=1684611259388"
                            class="d-block w-100 object-fit-cover" height="600px" alt="...">
                        </div>
                      </div>
                      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                      </button>
                      <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                      </button>
                    </div>
                  </div>
                  <div class="col-4" > 
                    <div class=" d-flex align-items-center justify-content-center flex-column  h-100">
                      <img class="img-fluid" src="https://ik.imagekit.io/shadid/pipse_AdobeExpress.gif?updatedAt=1684651279231" alt="">
                    </div>
                  </div>
                </div>
              </div>




                <div class="embed-responsive embed-responsive-16by9 mt-4">
                  <video class="embed-responsive-item w-100 h-30" autoplay loop muted>
                    <source src="https://ik.imagekit.io/shadid/fooooooood.mp4?updatedAt=1684607536978" type="video/mp4">
                    Your browser does not support the video tag.
                  </video>
                </div>
                
                



              <!-- Shadid please add any extra text -->
              <div class="d-flex justify-content-between border-bottom">
                <div>
                  <p>
                    we have more than +${restcount} Resturants in our system
                  </p>
                  <img src="https://ik.imagekit.io/shadid/search.png?updatedAt=1684470487791" alt="">
                </div>

                <div>
                  <p>
                    We have more than +${ordercount} orders in Total!
                  </p>
                  <img src="https://ik.imagekit.io/shadid/choose.png?updatedAt=1684470487902" alt="">
                </div>

                <div>
                  <p>
                    we have more than + ${usercount} satisfied users!
                  </p>
                  <img src="https://ik.imagekit.io/shadid/order.png?updatedAt=1684470487786" alt="">
                </div>
              </div>




              <footer class="bg-light py-3">
                <div class="container">
                  <div class="d-flex justify-content-between">
                    <p class="text-muted">© 2023 Wajbat All rights reserved</p>
                    <p class="text-muted">
                      <a href="#">Legal Advice</a> |
                      <a href="#">Privacy Policy</a> |
                      <a href="#">Cookies Policy</a> |
                      <a href="#">Information about user licenses</a>
                    </p>
                  </div>
                </div>
              </footer>

              <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>