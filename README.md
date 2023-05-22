# Wajbat
> A Spring Boot appliction collaboration 
## Overview 
**Wajbat** is a web application designed to provide restaurants with a dedicated space to gain recognition and attract customers in their local area. By offering a platform for restaurant owners to showcase their establishments and interact with potential customers, Wajbat aims to facilitate the growth and success of local restaurants.

## Table of Contents
- [Overview](#overview)
- [User Features](#user-features)
- [Restaurant Owner Features](#restaurant-owner-features)
- [Contributors](#contributors)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [Project Description](#project-description)
- [Useful Links](#useful-links)
- [Acknowledgements](#acknowledgements)

### User Features
- **User Profiles**: Users can create  profiles that allow them to manage their orders, view their order history.
- **Restaurant Search**: Users can quickly search for restaurants based on categories and names, enabling them to find their preferred dining options easily.
- **Order Placement**: Users can place food orders from the available restaurants, allowing them to select dishes, and provide delivery details.
- **Rating and Reviews**: Users have the ability to rate and review restaurants, helping others make informed choices and contributing to the overall restaurant community.

### Restaurant Owner Features
- **Restaurant Profile Management**: Restaurant owners can sign up and create profiles for their establishments. They have the flexibility to edit their menus, update their business information, and showcase their offerings.
- **Order Management**: Restaurant owners can view incoming orders, approve or decline them, and track the progress of ongoing orders. They can also access the order history, which includes details of previous orders placed by customers.

# Contributers
The success of this project was made possible by the contributions of the following individuals:
- [Mohammad shadid](https://github.com/mohadshadid). 
- [Sara Natour](https://github.com/saranatour1).
- [Yousef Labadi](https://github.com/Yousef-labadi).
- [Hussam ](https://github.com/hussamhabayeb).


    ### Scrum master 
    - Mr. [Amin Eid](https://github.com/amin-eid).

We express our heartfelt gratitude to each contributor for their dedication, hard work, and collaborative efforts. This project would not have been possible without their expertise and commitment.

If you are interested in contributing to this project, please feel free to reach out or submit pull requests. We welcome any enhancements, bug fixes, or new features that can further improve the application.

Thank you to all the contributors, including the Scrum Master, for their significant contributions and contributions in making this project a success.

<hr>

# Technologies Used:
<sub>Note: An Explanation to each tool set is described in [Project Description](#project-description)</sub>

[![Tools](https://skillicons.dev/icons?i=java,js,css,bootstrap,spring,mysql,postman&perline=7)](https://skillicons.dev) 

- [Google Maps Api](https://developers.google.com/maps/documentation/javascript) 
- [imagekit API](https://imagekit.io/)
- [Dotenv java Library](https://github.com/cdimascio/java-dotenv)
<hr>


## Getting Started
To use this application on your local machine, follow the steps below:

- **Install JDK**: Ensure you have JDK 8 or a newer version installed on your machine. You can download and install JDK from the official Oracle website or use a package manager like Homebrew for macOS. 
    - a helpfull link : [JDK inastallition](https://docs.oracle.com/en/java/javase/11/install/installation-jdk-microsoft-windows-platforms.html#GUID-E3C75F92-D3B2-421D-A9BE-933C15F7CD1B) .

- Set up Development Environment: Choose one of the following options to set up your development environment:

    - Spring Boot STS: Install Spring Boot STS (Spring Tool Suite) on your device. Spring Boot STS provides an integrated development environment specifically designed for Spring Boot applications. [Release notes](https://spring.io/blog/2021/06/21/spring-tools-4-11-0-released)
    - Java IDE: Alternatively, you can use a Java code IDE such as IntelliJ IDEA or Eclipse with the Spring Boot plugin installed. [A helpfull Blog on the best java IDE's](https://hackr.io/blog/best-java-ides)
    - VS Code Extension: If you prefer Visual Studio Code, you can install the relevant Spring Boot extension provided by Microsoft to enhance your development experience. [VsCode Extention](https://code.visualstudio.com/docs/java/java-spring-boot#:~:text=To%20install%2C%20launch%20VS%20Code,and%20then%20follow%20the%20wizard.)

- Clone the Project: Clone the project repository to your local machine using Git or download the ZIP file directly from the repository.

- Open the Project: Open your preferred IDE and import the project by selecting the directory where the pom.xml file is located.

- Build and Run: Use the IDE's build tools to resolve project dependencies and build the application. Once the build process completes successfully, run the application from your IDE.

- Access the Application: Once the application is up and running, open a web browser and navigate to the provided URL or localhost to access the application locally. Follow the on-screen instructions to start using the application and explore its features.

**Make sure to review any additional configuration steps or environment variables required by the application and adjust them accordingly.**

With these steps, you should now be able to run the application on your local machine and start enjoying its features.
<hr>


# Project Description
This project encompasses a wide range of features. Let's begin by showcasing the user story:

- About Us Page: Upon visiting our website's main page, users are greeted with an About Us section that includes both the Register and Sign In buttons in the top navigation bar, along with our website logo. The page boasts a user-friendly interface with a responsive design, where bootstrap grid layout is used:

### Demo:
![About Us ](https://github.com/saranatour1/FeedMe/assets/77834808/1b5333fc-cb45-4677-9198-4732bc368eb4)


   <!--Demo of the about us page  -->
- Register Page: For first-time users, the Registration page provides an intuitive sign-up process. You have the option to register as a seller or a normal user. Java validation is implemented to ensure input integrity.
### Demo:
 ![Sign up](https://github.com/saranatour1/FeedMe/assets/77834808/e41dad96-28bf-4614-a485-412c677b9819)
- Sign In Page: If you are already a user, you will be directed to the Sign In page. Upon successful registration or signing in, appropriate feedback will be provided.
### Demo
![Sign in page](https://github.com/saranatour1/FeedMe/assets/77834808/db719c23-3a8b-4ae5-ad46-149392d70039)

- Redirection, normal user page: 
Redirection to Normal User Page: After successful registration or sign-in, the user will be redirected to a page displaying all the restaurants. On this page, users have the option to search for restaurants by name or by category. 

### Demo 
![Main resturant Page](https://github.com/saranatour1/FeedMe/assets/77834808/7cc092c9-330f-490d-90a1-e84f398f1e2c)


Viewing the Restaurant:
- Users can view detailed information about each restaurant, including its menu, contact information, and location.
- Users have the option to place an order directly from the restaurant's page.
- The integration of Google Maps API allows users to see the map of the restaurant's location.
- We utilized the Geoencoding API provided by Google Maps to convert the restaurant's address into latitude and longitude coordinates.
- The backend retrieves the location points and sends them to the frontend for rendering.
- The frontend then utilizes the received location points to display the map of the restaurant's location.
- To implement this functionality, JavaScript code is used. You can refer to the following example for guidance on using the API: [Google Maps API Example](https://console.cloud.google.com/google/maps-apis/discover/place-details?project=sublime-delight-383610).
- you can also rate the restaurant 

### Demo 
![RMain Resturant page](https://github.com/saranatour1/FeedMe/assets/77834808/0f890993-9e29-441d-bcb7-4ea2d012ff8b)
![Screen Shot 2023-05-22 at 01 15 47](https://github.com/saranatour1/FeedMe/assets/77834808/40379da2-0574-4193-a222-5340e0facb54)


- Cart: 
  - When you place an order, you are prompted to proceed to checkout.
  - At the checkout, you have the option to either discard the cart or proceed with the order.
  - Upon selecting "Proceed," your order is processed.
  - You are then redirected to a success page to confirm the order completion.
  - Finally, you are redirected back to the restaurant's dashboard to continue your journey.

### Demo 
![cart](https://github.com/saranatour1/FeedMe/assets/77834808/4ba5bc8f-50a5-464c-b65a-3eaede30ea8d)

![Success](https://github.com/saranatour1/FeedMe/assets/77834808/078ba926-7b51-4a59-a5e8-5f2b4eca6f13)

- My Orders:
  - You have access to a history of your current orders as well as previous ones.
 ### Demo
  ![My orders](https://github.com/saranatour1/FeedMe/assets/77834808/940bb0c4-f935-4438-a2ca-95d5e3704a91)


- Register Your Restaurant: As a seller, once you sign up, you will be prompted to enter your restaurant information to gain access to the rest of the webpage.

- View of Your Restaurant: As a seller, you have the same view as a normal user, but with two additional buttons to edit the menu or edit the profile.


- Edit Your Profile: When you choose to edit your profile, you will be redirected to the same page used for registering your restaurant. This allows you to update your profile information conveniently.


- Edit Menu: The edit menu feature enables you to add items to your menu, create categories, and associate them with the menu items. This way, you can easily manage and customize your restaurant's menu offerings.

### Demo 
![Screen Shot 2023-05-22 at 09 01 19](https://github.com/saranatour1/FeedMe/assets/77834808/4815583b-f3f6-4754-a46f-23c94718834c)

- My Orders (Restaurant Owner): As a restaurant owner, you have access to the list of current orders that need to be marked as delivered. Additionally, you can also view your past orders, allowing you to keep track of order history and manage the overall order fulfillment process efficiently.

### Demo 
![Screen Shot 2023-05-22 at 09 02 45](https://github.com/saranatour1/FeedMe/assets/77834808/0a5a715c-ea2e-46d5-9098-83649cba65f4)
![Screen Shot 2023-05-22 at 09 12 26](https://github.com/saranatour1/FeedMe/assets/77834808/67d6368b-ba64-4e08-918f-da27a3102d65)

and thats all :) 

<hr>

### Useful links: 
- [Maps api example](https://console.cloud.google.com/google/maps-apis/discover/place-details?project=sublime-delight-383610)
- [Dot env by baeldung](https://www.baeldung.com/spring-boot-properties-env-variables)
- [Dot env](https://github.com/cdimascio/java-dotenv) by @cdimascio
- [Google api Explore](https://developers.google.com/apis-explorer)
- [Customize White label error](https://www.baeldung.com/spring-boot-custom-error-page)


### Acknowledgements

This project was a collaborative effort as part of a bootcamp with Axsos Academy, serving as the final project for the Java stack. We would like to express our gratitude to Axsos Academy for providing us with the opportunity to work on this project.

Feel free to use this application and modify it to suit your needs. If you decide to use it, we kindly ask that you mention and acknowledge our contributions.

- Mohammad Shadid: [GitHub](https://github.com/mohadshadid)
- Sara Natour: [GitHub](https://github.com/saranatour1)
- Yousef Labadi: [GitHub](https://github.com/Yousef-labadi)
- Hussam Habayeb :[Github](https://github.com/hussamhabayeb).







  




 



