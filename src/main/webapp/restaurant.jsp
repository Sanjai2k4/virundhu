<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Restaurant" %>

<!DOCTYPE html>
<html>–

<head>

    <meta charset="UTF-8">

    <title>Virundhu - Restaurants</title>

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:wght@300;400;500;600;700;800&display=swap"
          rel="stylesheet">


    <style>

        /* =========================
           GLOBAL
        ========================= */

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;

            background:
                linear-gradient(
                    135deg,
                    #fff8f2,
                    #fff1e6
                );

            color: #222;

            min-height: 100vh;
        }


        /* =========================
           HEADER
        ========================= */

        .header {

            width: 100%;

            padding: 18px 7%;

            background: rgba(255, 255, 255, 0.94);

            display: flex;

            justify-content: space-between;

            align-items: center;

            position: sticky;

            top: 0;

            z-index: 1000;

            box-shadow:
                0 5px 25px rgba(0, 0, 0, 0.08);

            backdrop-filter: blur(15px);
        }


        /* =========================
           VIRUNDHU LOGO
        ========================= */

        .logo {

            font-family: 'Pacifico', cursive;

            font-size: 42px;

            color: #ff5a00;

            letter-spacing: 1px;

            text-shadow:
                2px 2px 0 #ffe1cc,
                4px 4px 12px rgba(255, 90, 0, 0.20);

            cursor: pointer;

            transition: 0.3s ease;
        }


        .logo:hover {

            transform: scale(1.05);

        }


        .header-text {

            font-size: 15px;

            font-weight: 500;

            color: #555;
        }


        /* =========================
           HERO SECTION
        ========================= */

        .hero {

            width: 90%;

            max-width: 1200px;

            margin: 50px auto 40px;

            text-align: center;
        }


        .hero h1 {

            font-size: 44px;

            font-weight: 800;

            background:
                linear-gradient(
                    90deg,
                    #ff4b00,
                    #ff8a00
                );

            -webkit-background-clip: text;

            -webkit-text-fill-color: transparent;

            margin-bottom: 12px;
        }


        .hero p {

            color: #777;

            font-size: 17px;

            line-height: 1.6;
        }


        /* =========================
           RESTAURANT CONTAINER
        ========================= */

        .container {

            width: 90%;

            max-width: 1350px;

            margin: auto;

            padding-bottom: 70px;
        }


        .restaurant-container {

            display: grid;

            grid-template-columns:
                repeat(
                    auto-fit,
                    minmax(300px, 1fr)
                );

            gap: 30px;
        }


        /* =========================
           RESTAURANT CARD
        ========================= */

        .restaurant-card {

            background: rgba(255, 255, 255, 0.97);

            border-radius: 22px;

            overflow: hidden;

            box-shadow:
                0 8px 30px rgba(0, 0, 0, 0.08);

            border:
                1px solid rgba(255, 255, 255, 0.8);

            transition:
                transform 0.35s ease,
                box-shadow 0.35s ease;
        }


        .restaurant-card:hover {

            transform: translateY(-10px);

            box-shadow:
                0 20px 45px rgba(0, 0, 0, 0.15);
        }


        /* =========================
           IMAGE
        ========================= */

        .image-container {

            position: relative;

            width: 100%;

            height: 220px;

            overflow: hidden;
        }


        .restaurant-image {

            width: 100%;

            height: 100%;

            object-fit: cover;

            transition:
                transform 0.5s ease;
        }


        .restaurant-card:hover
        .restaurant-image {

            transform: scale(1.08);
        }


        /* =========================
           OPEN BADGE
        ========================= */

        .open-badge {

            position: absolute;

            top: 15px;

            left: 15px;

            padding: 7px 14px;

            border-radius: 30px;

            background: #20b15a;

            color: white;

            font-size: 12px;

            font-weight: 700;

            box-shadow:
                0 4px 12px rgba(0, 0, 0, 0.20);
        }


        /* =========================
           RATING BADGE
        ========================= */

        .rating-badge {

            position: absolute;

            bottom: 15px;

            right: 15px;

            background: white;

            padding: 7px 13px;

            border-radius: 25px;

            font-size: 14px;

            font-weight: 700;

            color: #333;

            box-shadow:
                0 4px 15px rgba(0, 0, 0, 0.15);
        }


        /* =========================
           RESTAURANT DETAILS
        ========================= */

        .restaurant-details {

            padding: 23px;
        }


        .restaurant-name {

            font-size: 23px;

            font-weight: 700;

            color: #222;

            margin-bottom: 9px;
        }


        /* =========================
           CUISINE
        ========================= */

        .cuisine {

            display: inline-block;

            background: #fff0e6;

            color: #ff5a00;

            padding: 6px 13px;

            border-radius: 25px;

            font-size: 12px;

            font-weight: 600;

            margin-bottom: 16px;
        }


        /* =========================
           ADDRESS
        ========================= */

        .address {

            color: #777;

            font-size: 14px;

            margin-bottom: 10px;

            line-height: 1.5;
        }


        /* =========================
           DELIVERY
        ========================= */

        .delivery {

            color: #555;

            font-size: 14px;

            margin-bottom: 12px;
        }


        .delivery strong {

            color: #333;
        }


        /* =========================
           OPEN / CLOSE
        ========================= */

        .timing {

            display: flex;

            justify-content: space-between;

            align-items: center;

            background: #fafafa;

            border: 1px solid #eeeeee;

            border-radius: 12px;

            padding: 12px;

            margin: 16px 0;
        }


        .timing-box {

            display: flex;

            flex-direction: column;

            gap: 3px;
        }


        .timing-title {

            font-size: 11px;

            color: #999;

            font-weight: 500;

            text-transform: uppercase;
        }


        .timing-time {

            font-size: 13px;

            font-weight: 600;

            color: #333;
        }


        .open-text {

            color: #20a957;

            font-size: 13px;

            font-weight: 700;

            background: #e9f9ef;

            padding: 6px 10px;

            border-radius: 20px;
        }


        /* =========================
           VIEW MENU BUTTON
        ========================= */

        .view-menu {

            display: block;

            text-align: center;

            background:
                linear-gradient(
                    135deg,
                    #ff5a00,
                    #ff8a00
                );

            color: white;

            padding: 13px;

            border-radius: 11px;

            text-decoration: none;

            font-weight: 600;

            font-size: 15px;

            transition:
                all 0.3s ease;

            box-shadow:
                0 6px 18px rgba(
                    255,
                    90,
                    0,
                    0.25
                );
        }


        .view-menu:hover {

            transform: translateY(-3px);

            box-shadow:
                0 10px 25px rgba(
                    255,
                    90,
                    0,
                    0.35
                );
        }


        /* =========================
           NO RESTAURANTS
        ========================= */

        .empty {

            grid-column: 1 / -1;

            text-align: center;

            padding: 70px 20px;

            background: white;

            border-radius: 20px;

            box-shadow:
                0 8px 25px rgba(
                    0,
                    0,
                    0,
                    0.06
                );
        }


        .empty h2 {

            font-size: 25px;

            color: #444;

            margin-bottom: 10px;
        }


        .empty p {

            color: #888;

            font-size: 14px;
        }


        /* =========================
           FOOTER
        ========================= */

        .footer {

            text-align: center;

            padding: 25px;

            color: #888;

            font-size: 13px;
        }


        .footer span {

            color: #ff5a00;

            font-weight: 600;
        }


        /* =========================
           RESPONSIVE
        ========================= */

        @media (max-width: 768px) {

            .header {

                padding: 15px 5%;
            }


            .logo {

                font-size: 34px;
            }


            .header-text {

                font-size: 12px;
            }


            .hero {

                margin-top: 35px;
            }


            .hero h1 {

                font-size: 34px;
            }


            .hero p {

                font-size: 14px;
            }


            .restaurant-container {

                grid-template-columns: 1fr;
            }
        }


        @media (max-width: 480px) {

            .header-text {

                display: none;
            }


            .logo {

                font-size: 32px;
            }


            .hero h1 {

                font-size: 29px;
            }


            .container {

                width: 92%;
            }
        }

    </style>

</head>


<body>


    <!-- =========================
         HEADER
    ========================= -->

    <header class="header">

        <div class="logo">
            Virundhu
        </div>

        <div class="header-text">
            Bengaluru's Food Delivery
        </div>

    </header>



    <!-- =========================
         HERO
    ========================= -->

    <section class="hero">

        <h1>
            Discover Restaurants
        </h1>

        <p>
            Explore delicious food from the best restaurants
            around Bengaluru
        </p>

    </section>



    <!-- =========================
         RESTAURANTS
    ========================= -->

    <main class="container">

        <div class="restaurant-container">

            <%

                List<Restaurant> restaurants =
                    (List<Restaurant>)
                    request.getAttribute("restaurants");


                if (restaurants != null &&
                    !restaurants.isEmpty()) {


                    for (Restaurant restaurant : restaurants) {

            %>


                <!-- =========================
                     RESTAURANT CARD
                ========================= -->

                <div class="restaurant-card">


                    <!-- IMAGE -->

                    <div class="image-container">

                        <img
                            class="restaurant-image"
                            src="<%= restaurant.getImagePath() %>"
                            alt="<%= restaurant.getName() %>"
                        >


                        <!-- OPEN STATUS -->

                        <div class="open-badge">

                            ● OPEN NOW

                        </div>


                        <!-- RATING -->

                        <div class="rating-badge">

                            ⭐
                            <%= restaurant.getRating() %>

                        </div>

                    </div>



                    <!-- DETAILS -->

                    <div class="restaurant-details">


                        <!-- RESTAURANT NAME -->

                        <div class="restaurant-name">

                            <%= restaurant.getName() %>

                        </div>


                        <!-- CUISINE -->

                        <div class="cuisine">

                            <%= restaurant.getCuisineType() %>

                        </div>


                        <!-- ADDRESS -->

                        <div class="address">

                            📍
                            <%= restaurant.getAddress() %>

                        </div>


                        <!-- DELIVERY -->

                        <div class="delivery">

                            🛵 Delivery in

                            <strong>
                                <%= restaurant.getDeliveryTime() %>
                                mins
                            </strong>

                        </div>


                        <!-- OPEN / CLOSE -->

                        <div class="timing">


                            <div class="timing-box">

                                <span class="timing-title">
                                    Opens
                                </span>

                                <span class="timing-time">
                                    🕙 10:00 AM
                                </span>

                            </div>


                            <div class="timing-box">

                                <span class="timing-title">
                                    Closes
                                </span>

                                <span class="timing-time">
                                    🕚 11:00 PM
                                </span>

                            </div>


                            <div class="open-text">

                                Open

                            </div>


                        </div>


                        <!-- VIEW MENU -->

                        <a
                            class="view-menu"
                            href="menu?restaurantId=<%= restaurant.getRestaurantId() %>"
                        >

                            View Menu →

                        </a>


                    </div>

                </div>


            <%

                    }

                } else {

            %>


                <!-- NO RESTAURANTS -->

                <div class="empty">

                    <h2>
                        No restaurants available
                    </h2>

                    <p>
                        Please check again later.
                    </p>

                </div>


            <%

                }

            %>

        </div>

    </main>



    <!-- =========================
         FOOTER
    ========================= -->

    <footer class="footer">

        © 2026
        <span>Virundhu</span>
        · Delicious food, delivered with love.

    </footer>


</body>

</html>