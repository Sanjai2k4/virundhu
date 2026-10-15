<%
    /*
     * =====================================================
     * CURRENT PAGE
     * =====================================================
     */

    String currentPage = request.getRequestURI();

    String currentServlet =
            request.getServletPath();


    /*
     * MenuServlet uses /menu,
     * so we must check both /menu and menu.jsp.
     */

    boolean isMenuPage =
            "/menu".equals(currentServlet)
            ||
            (currentPage != null &&
             currentPage.endsWith("menu.jsp"));


    /*
     * =====================================================
     * GET CART FROM SESSION
     * =====================================================
     */

    com.tap.model.Cart navbarCart =
            (com.tap.model.Cart) session.getAttribute("cart");


    int navbarCartCount = 0;


    if (navbarCart != null) {

        navbarCartCount =
                navbarCart.getTotalQuantity();
    }
%>


<!-- =====================================================
     GOOGLE FONT
===================================================== -->

<link rel="preconnect"
      href="https://fonts.googleapis.com">

<link rel="preconnect"
      href="https://fonts.gstatic.com"
      crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet">


<!-- =====================================================
     NAVBAR CSS
===================================================== -->

<style>

    * {
        box-sizing: border-box;
    }


    /* =====================================================
       NAVBAR
    ===================================================== */

    .virundhu-navbar {

        position: sticky;

        top: 0;

        z-index: 9999;

        width: 100%;

        min-height: 80px;

        padding: 0 7%;

        background: rgba(255, 255, 255, 0.97);

        backdrop-filter: blur(12px);

        display: flex;

        align-items: center;

        justify-content: space-between;

        box-shadow:
            0 2px 15px rgba(0, 0, 0, 0.08);

    }


    /* =====================================================
       VIRUNDHU BRAND
    ===================================================== */

    .virundhu-brand {

        font-family: 'Pacifico', cursive !important;

        font-size: 42px !important;

        font-weight: 400 !important;

        color: #ff6b00 !important;

        text-decoration: none !important;

        letter-spacing: 0 !important;

        line-height: 1 !important;

        display: inline-block;

        white-space: nowrap;

        cursor: pointer;

        transition:
            transform 0.3s ease,
            text-shadow 0.3s ease;

    }


    .virundhu-brand:visited {

        color: #ff6b00 !important;

        text-decoration: none !important;

    }


    .virundhu-brand:hover {

        color: #ff6b00 !important;

        text-decoration: none !important;

        transform: scale(1.05);

        text-shadow:
            0 5px 15px
            rgba(255, 107, 0, 0.25);

    }


    .virundhu-brand:active {

        transform: scale(0.98);

    }


    /* =====================================================
       NAVIGATION LINKS
    ===================================================== */

    .virundhu-nav-links {

        display: flex;

        align-items: center;

        gap: 28px;

    }


    .virundhu-nav-links a {

        text-decoration: none;

        color: #333;

        font-family: 'Poppins', sans-serif;

        font-size: 14px;

        font-weight: 500;

        white-space: nowrap;

        transition:
            color 0.3s ease,
            transform 0.3s ease;

    }


    .virundhu-nav-links a:hover {

        color: #ff6b00;

        text-decoration: none;

        transform: translateY(-1px);

    }


    /* =====================================================
       CART
    ===================================================== */

    .virundhu-cart {

        position: relative;

    }


    .virundhu-cart-count {

        position: absolute;

        top: -12px;

        right: -16px;

        min-width: 20px;

        height: 20px;

        padding: 0 5px;

        border-radius: 20px;

        background: #ff6b00;

        color: white !important;

        font-family: 'Poppins', sans-serif;

        font-size: 10px;

        font-weight: 700;

        display: flex;

        align-items: center;

        justify-content: center;

    }


    /* =====================================================
       LOGIN
    ===================================================== */

    .virundhu-login {

        background: #ff6b00;

        color: white !important;

        padding: 10px 22px;

        border-radius: 25px;

        text-decoration: none !important;

        font-weight: 600 !important;

        transition:
            background 0.3s ease,
            transform 0.3s ease;

    }


    .virundhu-login:hover {

        background: #e85d00 !important;

        color: white !important;

        transform: translateY(-2px);

    }


    /* =====================================================
       MOBILE BUTTON
    ===================================================== */

    .virundhu-mobile-button {

        display: none;

        border: none;

        background: #fff3e6;

        color: #ff6b00;

        width: 42px;

        height: 42px;

        border-radius: 12px;

        font-size: 22px;

        cursor: pointer;

    }


    /* =====================================================
       TABLET / MOBILE
    ===================================================== */

    @media (max-width: 900px) {

        .virundhu-navbar {

            padding: 12px 5%;

            flex-wrap: wrap;

        }


        .virundhu-brand {

            font-size: 34px !important;

        }


        .virundhu-mobile-button {

            display: block;

        }


        .virundhu-nav-links {

            display: none;

            width: 100%;

            flex-direction: column;

            align-items: stretch;

            gap: 5px;

            padding: 15px 0;

        }


        .virundhu-nav-links.show {

            display: flex;

        }


        .virundhu-nav-links a {

            padding: 12px 15px;

            border-radius: 10px;

        }


        .virundhu-nav-links a:hover {

            background: #fff3e6;

        }


        .virundhu-login {

            text-align: center;

        }

    }


    @media (max-width: 500px) {

        .virundhu-brand {

            font-size: 30px !important;

        }

    }

</style>


<!-- =====================================================
     NAVBAR
===================================================== -->

<nav class="virundhu-navbar">


    <!-- BRAND -->

    <a
        href="<%= request.getContextPath() %>/restaurants"
        class="virundhu-brand">

        Virundhu

    </a>


    <!-- MOBILE MENU BUTTON -->

    <button
        class="virundhu-mobile-button"
        onclick="toggleVirundhuMenu()"
        type="button">

        ☰

    </button>


    <!-- NAVIGATION -->

    <div
        class="virundhu-nav-links"
        id="virundhuNavLinks">


        <!-- HOME -->

        <a
            href="<%= request.getContextPath() %>/restaurants#restaurantHero">

            Home

        </a>


        <!-- RESTAURANTS -->

        <a
            href="<%= request.getContextPath() %>/restaurants">

            Restaurants

        </a>


        <!-- LOCATION -->

        <a
            href="<%= request.getContextPath() %>/restaurants#location">

            Location

        </a>


        <!-- ORDERS -->

        <a
            href="<%= request.getContextPath() %>/orders">

            Orders

        </a>


        <!-- CART ONLY ON MENU PAGE -->

        <% if (isMenuPage) { %>

            <a
                href="<%= request.getContextPath() %>/cart"
                class="virundhu-cart">

                View Cart

                <span
                    class="virundhu-cart-count"
                    id="cart-count">

                    <%= navbarCartCount %>

                </span>

            </a>

        <% } %>


        <!-- LOGIN -->

        <a
            href="<%= request.getContextPath() %>/login.jsp"
            class="virundhu-login">

            Login

        </a>

    </div>

</nav>


<!-- =====================================================
     MOBILE MENU JAVASCRIPT
===================================================== -->

<script>

function toggleVirundhuMenu() {

    const nav =
        document.getElementById(
            "virundhuNavLinks"
        );

    nav.classList.toggle("show");

}

</script>