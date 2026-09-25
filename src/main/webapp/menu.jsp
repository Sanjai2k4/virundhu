<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Menu" %>
<%@ page import="com.tap.model.Cart" %>
<%@ page import="com.tap.model.CartItem" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Virundhu - Menu</title>


    <!-- Google Fonts -->

    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:wght@300;400;500;600;700;800&display=swap"
          rel="stylesheet">


    <style>

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

            background: rgba(255,255,255,0.95);

            display: flex;

            justify-content: space-between;

            align-items: center;

            position: sticky;

            top: 0;

            z-index: 1000;

            box-shadow:
                0 5px 25px rgba(0,0,0,0.08);

            backdrop-filter: blur(15px);
        }


        .logo {

            font-family: 'Pacifico', cursive;

            font-size: 42px;

            color: #ff5a00;

            text-shadow:
                2px 2px 0 #ffe1cc,
                4px 4px 12px rgba(255,90,0,0.20);
        }


        .header-right {

            display: flex;

            align-items: center;

            gap: 25px;
        }


        .back-link {

            text-decoration: none;

            color: #ff5a00;

            font-weight: 600;

            font-size: 14px;
        }


        /* =========================
           VIEW CART
        ========================= */

        .cart-link {

            text-decoration: none;

            background: #ff5a00;

            color: white;

            padding: 10px 18px;

            border-radius: 25px;

            font-size: 14px;

            font-weight: 600;

            transition: 0.3s ease;
        }


        .cart-link:hover {

            background: #e64f00;

            transform: translateY(-2px);
        }


        .cart-count {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            min-width: 24px;

            height: 24px;

            padding: 0 6px;

            margin-left: 5px;

            background: white;

            color: #ff5a00;

            border-radius: 50%;

            font-size: 12px;

            font-weight: 700;
        }


        /* =========================
           HERO
        ========================= */

        .hero {

            text-align: center;

            width: 90%;

            max-width: 1200px;

            margin: 50px auto 40px;
        }


        .hero h1 {

            font-size: 42px;

            font-weight: 800;

            background:
                linear-gradient(
                    90deg,
                    #ff4b00,
                    #ff8a00
                );

            -webkit-background-clip: text;

            -webkit-text-fill-color: transparent;

            margin-bottom: 10px;
        }


        .hero p {

            color: #777;

            font-size: 16px;
        }


        /* =========================
           MENU CONTAINER
        ========================= */

        .container {

            width: 90%;

            max-width: 1300px;

            margin: auto;

            padding-bottom: 70px;
        }


        .menu-container {

            display: grid;

            grid-template-columns:
                repeat(
                    auto-fit,
                    minmax(300px, 1fr)
                );

            gap: 30px;
        }


        /* =========================
           MENU CARD
        ========================= */

        .menu-card {

            background: rgba(255,255,255,0.97);

            border-radius: 22px;

            overflow: hidden;

            box-shadow:
                0 8px 30px rgba(0,0,0,0.08);

            transition:
                transform 0.35s ease,
                box-shadow 0.35s ease;
        }


        .menu-card:hover {

            transform: translateY(-8px);

            box-shadow:
                0 20px 45px rgba(0,0,0,0.15);
        }


        /* =========================
           IMAGE
        ========================= */

        .image-container {

            width: 100%;

            height: 220px;

            overflow: hidden;

            position: relative;
        }


        .menu-image {

            width: 100%;

            height: 100%;

            object-fit: cover;

            transition:
                transform 0.5s ease;
        }


        .menu-card:hover
        .menu-image {

            transform: scale(1.08);
        }


        /* =========================
           AVAILABLE
        ========================= */

        .available-badge {

            position: absolute;

            top: 15px;

            left: 15px;

            background: #20b15a;

            color: white;

            padding: 7px 13px;

            border-radius: 20px;

            font-size: 12px;

            font-weight: 700;
        }


        /* =========================
           DETAILS
        ========================= */

        .menu-details {

            padding: 22px;
        }


        .menu-name {

            font-size: 22px;

            font-weight: 700;

            margin-bottom: 8px;

            color: #222;
        }


        .description {

            color: #777;

            font-size: 14px;

            line-height: 1.6;

            min-height: 45px;

            margin-bottom: 15px;
        }


        /* =========================
           PRICE
        ========================= */

        .price {

            color: #ff5a00;

            font-size: 20px;

            font-weight: 700;

            margin-bottom: 18px;
        }


        /* =========================
           ADD BUTTON
        ========================= */

        .add-button {

            display: block;

            width: 100%;

            border: none;

            background:
                linear-gradient(
                    135deg,
                    #ff5a00,
                    #ff8a00
                );

            color: white;

            padding: 12px;

            border-radius: 10px;

            font-family: 'Poppins', sans-serif;

            font-size: 15px;

            font-weight: 600;

            cursor: pointer;

            transition: 0.3s ease;
        }


        .add-button:hover {

            transform: translateY(-2px);

            box-shadow:
                0 8px 20px rgba(255,90,0,0.3);
        }


        /* =========================
           ADDED ITEM AREA
        ========================= */

        .cart-action {

            width: 100%;
        }


        .quantity-box {

            display: none;

            align-items: center;

            justify-content: space-between;

            gap: 10px;

            margin-top: 10px;
        }


        .quantity-box.show {

            display: flex;
        }


        .quantity-button {

            width: 38px;

            height: 38px;

            border: none;

            border-radius: 8px;

            background: #ff5a00;

            color: white;

            font-size: 20px;

            font-weight: 700;

            cursor: pointer;
        }


        .quantity-number {

            font-size: 17px;

            font-weight: 700;

            color: #333;

            min-width: 35px;

            text-align: center;
        }


        .added-message {

            text-align: center;

            color: #20a858;

            font-size: 13px;

            font-weight: 600;

            margin-top: 8px;
        }


        /* =========================
           UNAVAILABLE
        ========================= */

        .unavailable {

            background: #eeeeee;

            color: #999;

            cursor: not-allowed;

            box-shadow: none;
        }


        .unavailable:hover {

            transform: none;

            box-shadow: none;
        }


        /* =========================
           EMPTY
        ========================= */

        .empty {

            grid-column: 1 / -1;

            text-align: center;

            background: white;

            padding: 70px 20px;

            border-radius: 20px;

            box-shadow:
                0 8px 25px rgba(0,0,0,0.06);
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

            .logo {

                font-size: 34px;
            }


            .hero h1 {

                font-size: 34px;
            }


            .menu-container {

                grid-template-columns: 1fr;
            }


            .header-right {

                gap: 10px;
            }


            .back-link {

                display: none;
            }
        }


        @media (max-width: 480px) {

            .header {

                padding: 15px 5%;
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


<%
    /*
     * Get cart from session.
     * This allows us to display the current
     * quantity and cart count when the page loads.
     */

    Cart cart =
        (Cart) session.getAttribute("cart");


    int cartCount = 0;

    if (cart != null) {

        cartCount =
            cart.getTotalQuantity();
    }
%>


<!-- =========================
     HEADER
========================= -->

<header class="header">


    <div class="logo">

        Virundhu

    </div>


    <div class="header-right">


        <a href="restaurants"
           class="back-link">

            ← Back to Restaurants

        </a>


        <!-- VIEW CART -->

        <a href="cart"
           class="cart-link">

            🛒 View Cart

            <span
                class="cart-count"
                id="cart-count">

                <%= cartCount %>

            </span>

        </a>


    </div>


</header>



<!-- =========================
     HERO
========================= -->

<section class="hero">


    <h1>

        Delicious Menu

    </h1>


    <p>

        Choose your favourite food and enjoy your meal

    </p>


</section>



<!-- =========================
     MENU
========================= -->

<main class="container">


    <div class="menu-container">


        <%

            List<Menu> menus =
                (List<Menu>)
                request.getAttribute("menus");


            if (menus != null &&
                !menus.isEmpty()) {


                for (Menu menu : menus) {

                    int currentQuantity = 0;


                    /*
                     * Find current quantity of this item
                     * from the session cart.
                     */

                    if (cart != null) {

                        currentQuantity =
                            cart.getItemQuantity(
                                menu.getMenuId()
                            );
                    }

        %>


        <!-- =========================
             MENU CARD
        ========================= -->

        <div class="menu-card">


            <!-- IMAGE -->

            <div class="image-container">


                <img
                    class="menu-image"

                    src="<%= menu.getImagePath() %>"

                    alt="<%= menu.getItemName() %>"
                >


                <% if (menu.isAvailable()) { %>


                    <div class="available-badge">

                        ● AVAILABLE

                    </div>


                <% } else { %>


                    <div
                        class="available-badge"
                        style="background:#777;">

                        NOT AVAILABLE

                    </div>


                <% } %>


            </div>



            <!-- DETAILS -->

            <div class="menu-details">


                <!-- ITEM NAME -->

                <div class="menu-name">

                    <%= menu.getItemName() %>

                </div>



                <!-- DESCRIPTION -->

                <div class="description">

                    <%= menu.getDescription() %>

                </div>



                <!-- PRICE -->

                <div class="price">

                    ₹ <%= menu.getPrice() %>

                </div>



                <!-- =========================
                     ADD TO CART
                ========================= -->

                <% if (menu.isAvailable()) { %>


                    <div class="cart-action">


                        <button
                            type="button"

                            class="add-button"

                            id="add-button-<%= menu.getMenuId() %>"

                            onclick="addToCart(
                                <%= menu.getMenuId() %>
                            )">

                            <%
                                if (currentQuantity > 0) {
                            %>

                                Add Again

                            <%
                                } else {
                            %>

                                Add to Cart

                            <%
                                }
                            %>

                        </button>



                        <!-- QUANTITY CONTROLS -->

                        <div
                            class="quantity-box
                            <%= currentQuantity > 0
                                ? "show"
                                : "" %>"

                            id="quantity-box-<%= menu.getMenuId() %>">


                            <!-- MINUS -->

                            <button
                                type="button"

                                class="quantity-button"

                                onclick="updateQuantity(
                                    <%= menu.getMenuId() %>,
                                    'decrease'
                                )">

                                −

                            </button>


                            <!-- QUANTITY -->

                            <span
                                class="quantity-number"

                                id="quantity-<%= menu.getMenuId() %>">

                                <%= currentQuantity %>

                            </span>


                            <!-- PLUS -->

                            <button
                                type="button"

                                class="quantity-button"

                                onclick="updateQuantity(
                                    <%= menu.getMenuId() %>,
                                    'increase'
                                )">

                                +

                            </button>


                        </div>


                        <!-- ADDED MESSAGE -->

                        <div
                            class="added-message"

                            id="message-<%= menu.getMenuId() %>">

                            <%
                                if (currentQuantity > 0) {
                            %>

                                Added to cart

                            <%
                                }
                            %>

                        </div>


                    </div>


                <% } else { %>


                    <button
                        class="add-button unavailable"

                        type="button"

                        disabled>

                        Currently Unavailable

                    </button>


                <% } %>


            </div>


        </div>


        <%

                }

            } else {

        %>


        <!-- =========================
             EMPTY
        ========================= -->

        <div class="empty">


            <h2>

                No menu items available

            </h2>


            <p>

                This restaurant currently has no
                menu items.

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



<!-- =========================
     JAVASCRIPT
========================= -->

<script>


/*
 * =============================
 * ADD TO CART
 * =============================
 *
 * This sends the menuId to
 * AddToCartController.
 *
 * IMPORTANT:
 * There is NO redirect here.
 *
 * Therefore the user stays
 * on menu.jsp.
 */

function addToCart(menuId) {


    fetch("addToCart", {

        method: "POST",

        headers: {

            "Content-Type":
                "application/x-www-form-urlencoded"

        },

        body:
            "menuId=" +
            encodeURIComponent(menuId)

    })


    .then(function(response) {


        if (!response.ok) {

            throw new Error(
                "Unable to add item"
            );

        }


        return response.text();

    })


    .then(function(data) {


        /*
         * Controller returns:
         *
         * quantity,cartCount
         *
         * Example:
         *
         * 2,5
         */

        var values =
            data.split(",");


        var quantity =
            parseInt(values[0]);


        var cartCount =
            parseInt(values[1]);



        /*
         * Update quantity
         */

        var quantityElement =
            document.getElementById(
                "quantity-" + menuId
            );


        if (quantityElement) {

            quantityElement.innerText =
                quantity;

        }



        /*
         * Show quantity controls
         */

        var quantityBox =
            document.getElementById(
                "quantity-box-" + menuId
            );


        if (quantityBox) {

            quantityBox.classList.add(
                "show"
            );

        }



        /*
         * Change button text
         */

        var addButton =
            document.getElementById(
                "add-button-" + menuId
            );


        if (addButton) {

            addButton.innerText =
                "Add Again";

        }



        /*
         * Show message
         */

        var message =
            document.getElementById(
                "message-" + menuId
            );


        if (message) {

            message.innerText =
                "Added to cart";

        }



        /*
         * Update cart count
         */

        var cartCountElement =
            document.getElementById(
                "cart-count"
            );


        if (cartCountElement) {

            cartCountElement.innerText =
                cartCount;

        }

    })


    .catch(function(error) {


        console.error(error);


        alert(
            "Unable to add item to cart."
        );

    });

}



/*
 * =============================
 * INCREASE / DECREASE
 * =============================
 */

function updateQuantity(
    menuId,
    action
) {


    fetch("cart", {

        method: "POST",

        headers: {

            "Content-Type":
                "application/x-www-form-urlencoded"

        },

        body:
            "action=" +
            encodeURIComponent(action) +
            "&menuId=" +
            encodeURIComponent(menuId)

    })


    .then(function(response) {


        if (!response.ok) {

            throw new Error(
                "Unable to update quantity"
            );

        }


        /*
         * CartServlet redirects normally.
         *
         * We don't want that redirect
         * while we are on menu.jsp.
         *
         * So simply reload menu.jsp
         * after the update.
         */

        return response;

    })


    .then(function() {

        window.location.reload();

    })


    .catch(function(error) {

        console.error(error);

        alert(
            "Unable to update quantity."
        );

    });

}

</script>


</body>

</html>