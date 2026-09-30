<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Restaurant" %>

<%
    List<Restaurant> restaurants =
        (List<Restaurant>) request.getAttribute("restaurants");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Restaurants - Virundhu</title>


    <!-- =========================
         GOOGLE FONT
         ========================= -->

    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap"
          rel="stylesheet">


    <!-- =========================
         RESTAURANT PAGE CSS
         ========================= -->

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }


        html {
            scroll-behavior: smooth;
        }


        body {
            font-family: 'Poppins', sans-serif;
            background: #fffaf5;
            color: #222;
        }


        /* =========================
           HERO
           ========================= */

        .restaurant-hero {
            padding: 75px 7% 60px;
            text-align: center;

            background:
                linear-gradient(
                    135deg,
                    #fff3e6,
                    #fffaf5
                );

            scroll-margin-top: 90px;
        }


        .hero-small {
            color: #ff6b00;
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 2px;
            margin-bottom: 12px;
        }


        .restaurant-hero h1 {
            font-size: 46px;
            font-weight: 800;
            margin-bottom: 12px;
            color: #222;
        }


        .restaurant-hero h1 span {
            color: #ff6b00;
        }


        .restaurant-hero p {
            color: #777;
            font-size: 16px;
            max-width: 650px;
            margin: auto;
            line-height: 1.7;
        }


        /* =========================
           UNIQUE SEARCH
           ========================= */

        .search-wrapper {
            max-width: 700px;
            margin: 32px auto 0;
        }


        .search-box {
            display: flex;
            align-items: center;

            background: white;

            border: 1px solid #f1dfd1;

            border-radius: 18px;

            padding: 7px;

            box-shadow:
                0 12px 35px rgba(0, 0, 0, 0.08);

            transition: 0.3s;
        }


        .search-box:focus-within {
            border-color: #ff6b00;

            box-shadow:
                0 12px 35px rgba(255, 107, 0, 0.15);
        }


        .search-icon {
            width: 48px;
            height: 48px;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #fff3e6;

            border-radius: 14px;

            font-size: 20px;

            flex-shrink: 0;
        }


        .search-box input {
            flex: 1;

            border: none;
            outline: none;

            padding: 14px 16px;

            font-family: 'Poppins', sans-serif;

            font-size: 14px;

            background: transparent;

            color: #333;
        }


        .search-box input::placeholder {
            color: #999;
        }


        .search-button {
            border: none;

            background: #ff6b00;

            color: white;

            padding: 13px 22px;

            border-radius: 13px;

            font-family: 'Poppins', sans-serif;

            font-weight: 600;

            cursor: pointer;

            transition: 0.3s;
        }


        .search-button:hover {
            background: #e85d00;
            transform: translateY(-2px);
        }


        .search-hint {
            text-align: left;

            color: #999;

            font-size: 11px;

            margin-top: 8px;

            padding-left: 10px;
        }


        /* =========================
           RESTAURANT SECTION
           ========================= */

        .restaurant-section {
            padding: 65px 7%;
        }


        .section-header {
            display: flex;

            align-items: center;

            justify-content: space-between;

            margin-bottom: 30px;
        }


        .section-header h2 {
            font-size: 30px;
            font-weight: 700;
        }


        .restaurant-count {
            color: #777;
            font-size: 14px;
        }


        /* =========================
           RESTAURANT GRID
           ========================= */

        .restaurant-grid {
            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 28px;
        }


        /* =========================
           RESTAURANT CARD
           ========================= */

        .restaurant-card {
            background: white;

            border-radius: 20px;

            overflow: hidden;

            box-shadow:
                0 8px 25px rgba(0, 0, 0, 0.07);

            transition: 0.3s;

            border: 1px solid #f2f2f2;
        }


        .restaurant-card:hover {
            transform: translateY(-8px);

            box-shadow:
                0 18px 40px rgba(0, 0, 0, 0.12);
        }


        /* =========================
           RESTAURANT IMAGE
           ========================= */

        .restaurant-image {
            height: 210px;

            position: relative;

            overflow: hidden;

            background: #f5f5f5;
        }


        .restaurant-image img {
            width: 100%;
            height: 100%;

            object-fit: cover;

            transition: 0.5s;
        }


        .restaurant-card:hover
        .restaurant-image img {
            transform: scale(1.07);
        }


        /* =========================
           RATING
           ========================= */

        .rating {
            position: absolute;

            top: 15px;
            left: 15px;

            background: white;

            color: #188038;

            padding: 6px 10px;

            border-radius: 20px;

            font-size: 12px;

            font-weight: 700;

            box-shadow:
                0 4px 12px rgba(0, 0, 0, 0.12);
        }


        /* =========================
           OPEN STATUS
           ========================= */

        .open-status {
            position: absolute;

            top: 15px;
            right: 15px;

            background: #e8f7ed;

            color: #188038;

            padding: 6px 11px;

            border-radius: 20px;

            font-size: 11px;

            font-weight: 600;
        }


        /* =========================
           CARD CONTENT
           ========================= */

        .restaurant-content {
            padding: 22px;
        }


        .restaurant-content h3 {
            font-size: 21px;

            margin-bottom: 7px;

            font-weight: 700;
        }


        .cuisine {
            display: inline-block;

            background: #fff0e3;

            color: #ff6b00;

            padding: 5px 10px;

            border-radius: 15px;

            font-size: 11px;

            font-weight: 600;

            margin-bottom: 14px;
        }


        .restaurant-info {
            color: #777;

            font-size: 13px;

            margin: 7px 0;
        }


        .restaurant-bottom {
            margin-top: 18px;

            padding-top: 15px;

            border-top: 1px solid #eee;

            display: flex;

            align-items: center;

            justify-content: space-between;
        }


        .delivery-time {
            font-size: 12px;
            color: #666;
        }


        /* =========================
           VIEW MENU BUTTON
           ========================= */

        .view-menu {
            text-decoration: none;

            background: #ff6b00;

            color: white;

            padding: 9px 16px;

            border-radius: 20px;

            font-size: 12px;

            font-weight: 600;

            transition: 0.3s;
        }


        .view-menu:hover {
            background: #e85d00;

            transform: translateX(3px);
        }


        /* =========================
           LOCATION SECTION
           ========================= */

        .location-section {
            padding: 30px 7% 70px;

            scroll-margin-top: 90px;
        }


        .location-content {
            display: flex;

            align-items: center;

            gap: 20px;

            background:
                linear-gradient(
                    135deg,
                    #fff0e3,
                    #fff8f2
                );

            border: 1px solid #f6dfcd;

            border-radius: 22px;

            padding: 28px 30px;

            box-shadow:
                0 10px 30px rgba(0, 0, 0, 0.05);
        }


        .location-icon {
            width: 60px;
            height: 60px;

            flex-shrink: 0;

            display: flex;

            align-items: center;
            justify-content: center;

            background: white;

            border-radius: 18px;

            font-size: 28px;
        }


        .location-content h2 {
            font-size: 21px;

            margin-bottom: 5px;
        }


        .location-content p {
            color: #777;

            font-size: 13px;

            line-height: 1.6;
        }


        .location-button {
            margin-left: auto;

            border: none;

            background: #ff6b00;

            color: white;

            padding: 12px 20px;

            border-radius: 25px;

            font-family: 'Poppins', sans-serif;

            font-size: 13px;

            font-weight: 600;

            cursor: pointer;

            white-space: nowrap;

            transition: 0.3s;
        }


        .location-button:hover {
            background: #e85d00;

            transform: translateY(-2px);
        }


        /* =========================
           FOOTER
           ========================= */

        .footer {
            margin-top: 20px;

            background: #222;

            color: white;

            text-align: center;

            padding: 35px 20px;
        }


        .footer-logo {
            color: #ff6b00;

            font-size: 25px;

            font-weight: 800;

            margin-bottom: 10px;
        }


        .footer p {
            color: #aaa;

            font-size: 13px;
        }


        /* =========================
           RESPONSIVE TABLET
           ========================= */

        @media (max-width: 1000px) {

            .restaurant-grid {
                grid-template-columns:
                    repeat(2, 1fr);
            }

        }


        /* =========================
           RESPONSIVE MOBILE
           ========================= */

        @media (max-width: 700px) {

            .restaurant-hero {
                padding: 50px 5%;
            }


            .restaurant-hero h1 {
                font-size: 36px;
            }


            .restaurant-section {
                padding: 45px 5%;
            }


            .restaurant-grid {
                grid-template-columns: 1fr;
            }


            .section-header {
                flex-direction: column;

                align-items: flex-start;

                gap: 5px;
            }


            .search-box {
                border-radius: 15px;
            }


            .search-icon {
                width: 42px;
                height: 42px;
            }


            .search-button {
                padding: 11px 15px;
            }


            .location-section {
                padding: 20px 5% 50px;
            }


            .location-content {
                flex-direction: column;

                text-align: center;

                padding: 25px 20px;
            }


            .location-button {
                margin-left: 0;

                width: 100%;
            }

        }


        /* =========================
           SMALL MOBILE
           ========================= */

        @media (max-width: 450px) {

            .restaurant-hero h1 {
                font-size: 30px;
            }


            .restaurant-hero p {
                font-size: 14px;
            }


            .search-box {
                padding: 5px;
            }


            .search-box input {
                padding: 12px 8px;

                font-size: 12px;
            }


            .search-button {
                font-size: 11px;

                padding: 10px 12px;
            }


            .restaurant-content {
                padding: 18px;
            }


            .restaurant-bottom {
                flex-direction: column;

                align-items: flex-start;

                gap: 12px;
            }


            .view-menu {
                width: 100%;

                text-align: center;
            }

        }

    </style>

</head>


<body>


    <!-- =========================
         COMMON NAVBAR
         ========================= -->

    <jsp:include page="navbar.jsp" />


    <!-- =========================
         HERO
         ========================= -->

    <section class="restaurant-hero"
             id="restaurantHero">

        <div class="hero-small">
            DISCOVER • ORDER • ENJOY
        </div>


        <h1>
            Discover
            <span>Restaurants</span>
        </h1>


        <p>
            Explore delicious food from your favourite
            restaurants and discover your next meal.
        </p>


        <!-- =========================
             SEARCH
             ========================= -->

        <div class="search-wrapper">

            <div class="search-box">

                <div class="search-icon">
                    &#128269;
                </div>


                <input
                    type="text"
                    id="restaurantSearch"
                    placeholder="What are you craving today?"
                    onkeyup="searchRestaurants()">


                <button
                    class="search-button"
                    type="button"
                    onclick="searchRestaurants()">

                    Search

                </button>

            </div>


            <div class="search-hint">
                Try searching for "Biryani", "Dosa", "Chinese"...
            </div>

        </div>

    </section>



    <!-- =========================
         RESTAURANTS
         ========================= -->

    <section class="restaurant-section">


        <div class="section-header">

            <h2>
                Popular Restaurants
            </h2>


            <span class="restaurant-count">

                <%= restaurants != null
                    ? restaurants.size()
                    : 0 %>

                Restaurants

            </span>

        </div>



        <div class="restaurant-grid"
             id="restaurantGrid">


            <%

                if (restaurants != null &&
                    !restaurants.isEmpty()) {

                    for (Restaurant restaurant : restaurants) {

            %>


            <!-- =========================
                 RESTAURANT CARD
                 ========================= -->

            <div class="restaurant-card"

                 data-name="<%= restaurant.getName().toLowerCase() %>"

                 data-cuisine="<%= restaurant.getCuisineType().toLowerCase() %>">


                <!-- IMAGE -->

                <div class="restaurant-image">


                    <img
                        src="<%= restaurant.getImagePath() %>"

                        alt="<%= restaurant.getName() %>"

                        onerror="this.src='https://via.placeholder.com/600x400?text=Virundhu+Restaurant';">


                    <!-- RATING -->

                    <div class="rating">

                        &#11088;
                        <%= restaurant.getRating() %>

                    </div>


                    <!-- OPEN STATUS -->

                    <div class="open-status">

                        &#9679; Open

                    </div>

                </div>



                <!-- CONTENT -->

                <div class="restaurant-content">


                    <h3>

                        <%= restaurant.getName() %>

                    </h3>


                    <!-- CUISINE -->

                    <span class="cuisine">

                        <%= restaurant.getCuisineType() %>

                    </span>


                    <!-- ADDRESS -->

                    <div class="restaurant-info">

                        &#128205;

                        <%= restaurant.getAddress() %>

                    </div>


                    <!-- DELIVERY -->

                    <div class="restaurant-info">

                        &#128336;

                        <%= restaurant.getDeliveryTime() %>

                        mins delivery

                    </div>



                    <!-- BOTTOM -->

                    <div class="restaurant-bottom">


                        <span class="delivery-time">

                            &#128666; Fast delivery

                        </span>


                        <a
                            href="<%= request.getContextPath() %>/menu?restaurantId=<%= restaurant.getRestaurantId() %>"

                            class="view-menu">

                            View Menu &#8594;

                        </a>

                    </div>

                </div>

            </div>


            <%

                    }

                } else {

            %>


            <!-- =========================
                 NO RESTAURANTS
                 ========================= -->

            <div style="
                grid-column: 1 / -1;
                text-align: center;
                padding: 70px 20px;
            ">


                <div style="
                    font-size: 60px;
                    margin-bottom: 15px;
                ">

                    &#127860;

                </div>


                <h2>
                    No restaurants found
                </h2>


                <p style="
                    color: #777;
                    margin-top: 8px;
                ">

                    Please try again later.

                </p>

            </div>


            <%

                }

            %>


        </div>

    </section>



    <!-- =========================
         LOCATION
         ========================= -->

    <section class="location-section"
             id="location">


        <div class="location-content">


            <div class="location-icon">

                &#128205;

            </div>


            <div>

                <h2>
                    Find delicious food near you
                </h2>


                <p>
                    Discover restaurants and delicious meals
                    available around your location.
                </p>

            </div>


            <button
                type="button"
                class="location-button"
                onclick="getMyLocation()">

                &#128205; Use My Location

            </button>


        </div>

    </section>



    <!-- =========================
         FOOTER
         ========================= -->

    <footer class="footer">


        <div class="footer-logo">

            🍴 VIRUNDHU

        </div>


        <p>
            Delicious food. Delivered with love.
        </p>


        <p style="margin-top: 10px;">

            &copy; 2026 Virundhu.
            All rights reserved.

        </p>


    </footer>



    <!-- =========================
         JAVASCRIPT
         ========================= -->

    <script>


        /* =========================
           RESTAURANT SEARCH
           ========================= */

        function searchRestaurants() {

            let searchValue =
                document
                    .getElementById("restaurantSearch")
                    .value
                    .toLowerCase()
                    .trim();


            let cards =
                document
                    .querySelectorAll(".restaurant-card");


            cards.forEach(function(card) {


                let name =
                    card.getAttribute("data-name");


                let cuisine =
                    card.getAttribute("data-cuisine");


                if (
                    name.includes(searchValue) ||
                    cuisine.includes(searchValue)
                ) {

                    card.style.display = "";

                } else {

                    card.style.display = "none";

                }

            });

        }



        /* =========================
           GET USER LOCATION
           ========================= */

        function getMyLocation() {


            if (!navigator.geolocation) {

                alert(
                    "Location is not supported by your browser."
                );

                return;

            }


            navigator.geolocation.getCurrentPosition(

                function(position) {


                    const latitude =
                        position.coords.latitude;


                    const longitude =
                        position.coords.longitude;


                    alert(
                        "Your location detected!\\n\\n" +

                        "Latitude: " +
                        latitude +

                        "\\nLongitude: " +
                        longitude
                    );

                },


                function(error) {

                    alert(
                        "Please allow location access in your browser."
                    );

                }

            );

        }

    </script>


</body>

</html>