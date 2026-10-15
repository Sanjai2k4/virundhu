<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.Cart" %>
<%@ page import="com.tap.model.CartItem" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Virundhu - My Cart</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            padding: 30px;
        }

        .container {
            max-width: 1000px;
            margin: auto;
        }

        h1 {
            text-align: center;
            color: #ff5a00;
            margin-bottom: 30px;
        }

        .cart-item {
            background: white;
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 12px;

            display: flex;
            align-items: center;
            gap: 20px;

            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .food-image {
            width: 120px;
            height: 100px;
            object-fit: cover;
            border-radius: 10px;
        }

        .item-details {
            flex: 1;
        }

        .item-details h2 {
            margin-bottom: 10px;
            color: #333;
        }

        .price {
            color: #ff5a00;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .quantity-box {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .quantity-button {
            width: 35px;
            height: 35px;

            border: none;
            border-radius: 5px;

            background: #ff5a00;
            color: white;

            font-size: 20px;
            cursor: pointer;
        }

        .quantity {
            font-weight: bold;
            font-size: 18px;
        }

        .item-total {
            text-align: right;
        }

        .item-total h3 {
            margin-bottom: 15px;
        }

        .remove-button {
            background: #dc3545;
            color: white;

            border: none;
            padding: 8px 15px;

            border-radius: 6px;

            cursor: pointer;
        }

        .cart-summary {
            background: white;
            padding: 25px;

            border-radius: 12px;

            margin-top: 20px;

            text-align: right;
        }

        .cart-total {
            color: #ff5a00;
            margin-bottom: 20px;
        }

        .clear-button {
            background: #dc3545;
            color: white;

            border: none;

            padding: 12px 20px;

            border-radius: 6px;

            cursor: pointer;
        }

        .checkout-button{
            background: #28a745;
            color: white;

            border: none;

            padding: 12px 25px;

            border-radius: 6px;

            margin-left: 10px;

            cursor: pointer;
        }

        .empty-cart {
            background: white;
            padding: 60px;

            text-align: center;

            border-radius: 12px;
        }

        .continue-button {
            display: inline-block;

            margin-top: 20px;

            background: #ff5a00;
            color: white;

            padding: 12px 20px;

            text-decoration: none;

            border-radius: 6px;
        }

    </style>

</head>


<body>


<%

    Cart cart =
        (Cart) session.getAttribute("cart");

%>


<div class="container">


    <h1>🛒 My Cart</h1>


    <% if (cart == null ||
           cart.getItems().isEmpty()) { %>


        <!-- EMPTY CART -->

        <div class="empty-cart">

            <h2>
                Your cart is empty
            </h2>

            <p>
                Add some delicious food!
            </p>

            <a href="restaurants"
               class="continue-button">

                Continue Shopping

            </a>
           
        </div>


    <% } else { %>


        <!-- CART ITEMS -->

        <% for (CartItem item :
                cart.getItems()) { %>


            <div class="cart-item">


                <!-- FOOD IMAGE -->

                <img
                    src="<%= item.getImagePath() %>"
                    alt="<%= item.getItemName() %>"
                    class="food-image"
                >


                <!-- ITEM DETAILS -->

                <div class="item-details">

                    <h2>
                        <%= item.getItemName() %>
                    </h2>

                    <p class="price">

                        ₹ <%= item.getPrice() %>

                    </p>


                    <!-- QUANTITY -->

                    <div class="quantity-box">


                        <!-- DECREASE -->

                        <form action="cart"
                              method="post">

                            <input type="hidden"
                                   name="action"
                                   value="decrease">

                            <input type="hidden"
                                   name="menuId"
                                   value="<%= item.getMenuId() %>">

                            <button
                                type="submit"
                                class="quantity-button">

                                −

                            </button>

                        </form>


                        <span class="quantity">

                            <%= item.getQuantity() %>

                        </span>


                        <!-- INCREASE -->

                        <form action="cart"
                              method="post">

                            <input type="hidden"
                                   name="action"
                                   value="increase">

                            <input type="hidden"
                                   name="menuId"
                                   value="<%= item.getMenuId() %>">

                            <button
                                type="submit"
                                class="quantity-button">

                                +

                            </button>

                        </form>


                    </div>

                </div>


                <!-- TOTAL -->

                <div class="item-total">

                    <h3>

                        ₹ <%= item.getPrice()
                              * item.getQuantity() %>

                    </h3>


                    <!-- REMOVE -->

                    <form action="cart"
                          method="post">

                        <input type="hidden"
                               name="action"
                               value="remove">

                        <input type="hidden"
                               name="menuId"
                               value="<%= item.getMenuId() %>">

                        <button
                            type="submit"
                            class="remove-button">

                            Remove

                        </button>

                    </form>

                </div>


            </div>


        <% } %>


        <!-- CART SUMMARY -->

        <div class="cart-summary">

            <h2 class="cart-total">

                Total:
                ₹ <%= cart.getTotal() %>

            </h2>
             
            


            <!-- CLEAR CART -->

            <form action="cart"
                  method="post"
                  style="display:inline;">

                <input type="hidden"
                       name="action"
                       value="clear">

                <button
                    type="submit"
                    class="clear-button">

                    Clear Cart

                </button>

            </form>


            <!-- CHECKOUT -->
            
             <a href="checkout.jsp" 
             class="checkout-button">

                Proceed to Checkout

            </a>

           
            
           

        </div>


    <% } %>


</div>


</body>

</html>