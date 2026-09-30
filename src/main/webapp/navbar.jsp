<%
    String currentPage = request.getRequestURI();

    boolean isMenuPage =
            currentPage != null &&
            currentPage.endsWith("menu.jsp");

    com.tap.model.Cart navbarCart =
            (com.tap.model.Cart) session.getAttribute("cart");

    int navbarCartCount = 0;

    if (navbarCart != null) {
        navbarCartCount =
                navbarCart.getTotalQuantity();
    }
%>


<style>

    .virundhu-navbar {

        position: sticky;

        top: 0;

        z-index: 9999;

        width: 100%;

        min-height: 72px;

        padding: 0 7%;

        background: rgba(255,255,255,0.96);

        backdrop-filter: blur(12px);

        display: flex;

        align-items: center;

        justify-content: space-between;

        box-shadow:
            0 2px 15px rgba(0,0,0,0.08);
    }


    .virundhu-logo {

        text-decoration: none;

        color: #ff6b00;

        font-size: 26px;

        font-weight: 800;

        letter-spacing: -1px;

        white-space: nowrap;
    }


    .virundhu-nav-links {

        display: flex;

        align-items: center;

        gap: 28px;
    }


    .virundhu-nav-links a {

        text-decoration: none;

        color: #333;

        font-size: 14px;

        font-weight: 500;

        transition: 0.3s;

        white-space: nowrap;
    }


    .virundhu-nav-links a:hover {

        color: #ff6b00;

        transform: translateY(-1px);
    }


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

        color: white;

        font-size: 10px;

        font-weight: 700;

        display: flex;

        align-items: center;

        justify-content: center;
    }


    .virundhu-login {

        background: #ff6b00;

        color: white !important;

        padding: 10px 20px;

        border-radius: 25px;
    }


    .virundhu-login:hover {

        background: #e85d00 !important;

        transform: translateY(-2px);
    }


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


    @media (max-width: 900px) {

        .virundhu-navbar {

            padding: 12px 5%;

            flex-wrap: wrap;
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


    @media (max-width: 450px) {

        .virundhu-logo {

            font-size: 21px;
        }

    }

</style>


<nav class="virundhu-navbar">


    <!-- LOGO -->

    <a
        href="<%= request.getContextPath() %>/restaurants#restaurantHero"
        class="virundhu-logo">

        🍴 VIRUNDHU

    </a>


    <!-- MOBILE BUTTON -->

    <button
        class="virundhu-mobile-button"
        onclick="toggleVirundhuMenu()"
        type="button">

        &#9776;

    </button>


    <!-- NAVIGATION -->

    <div
        class="virundhu-nav-links"
        id="virundhuNavLinks">


        <!-- HOME -->

        <a
            href="<%= request.getContextPath() %>/restaurants#restaurantHero">

            &#127968; Home

        </a>


        <!-- RESTAURANTS -->

        <a
            href="<%= request.getContextPath() %>/restaurants">

            &#127860; Restaurants

        </a>


        <!-- LOCATION -->

        <a
            href="<%= request.getContextPath() %>/restaurants#location">

            &#128205; Location

        </a>


        <!-- ORDERS -->

        <a
            href="<%= request.getContextPath() %>/orders">

            &#128230; Orders

        </a>


        <!-- CART ONLY ON MENU PAGE -->

        <% if (isMenuPage) { %>

            <a
                href="<%= request.getContextPath() %>/cart"
                class="virundhu-cart">

                &#128722; View Cart

                <span class="virundhu-cart-count">

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


<script>

    function toggleVirundhuMenu() {

        const nav =
            document.getElementById("virundhuNavLinks");

        nav.classList.toggle("show");

    }

</script>