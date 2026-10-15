<%@ page import="com.tap.model.Cart" %>
<%@ page import="com.tap.model.CartItem" %>
<%@ page import="java.util.List" %>

<%
    Cart cart = (Cart) session.getAttribute("cart");

    if (cart == null || cart.getItems().isEmpty()) {
        response.sendRedirect("cart");
        return;
    }

    List<CartItem> items = cart.getItems();
    double total = cart.getTotal();
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Checkout - Virundhu</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:wght@400;500;600;700&display=swap"
          rel="stylesheet">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: #fff7ef;
            color: #222;
        }

        .checkout-container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
        }

        .page-title {
            text-align: center;
            margin-bottom: 35px;
        }

        .page-title h1 {
            margin: 0;
            font-size: 36px;
            color: #ff6b00;
        }

        .page-title p {
            margin-top: 8px;
            color: #777;
        }

        .checkout-layout {
            display: grid;
            grid-template-columns: 1.4fr 1fr;
            gap: 30px;
        }

        .checkout-card {
            background: white;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
        }

        .checkout-card h2 {
            margin-top: 0;
            margin-bottom: 25px;
            color: #222;
            font-size: 24px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
        }

        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 13px 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            outline: none;
        }

        .form-group input:focus,
        .form-group textarea:focus,
        .form-group select:focus {
            border-color: #ff6b00;
        }

        .form-group textarea {
            min-height: 110px;
            resize: vertical;
        }

        .payment-options {
            display: flex;
            gap: 12px;
            flex-direction: column;
        }

        .payment-option {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 14px;
            border: 1px solid #ddd;
            border-radius: 10px;
            cursor: pointer;
        }

        .payment-option:hover {
            border-color: #ff6b00;
        }

        .payment-option input {
            accent-color: #ff6b00;
        }

        .order-item {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }

        .order-item:last-child {
            border-bottom: none;
        }

        .item-image {
            width: 65px;
            height: 65px;
            border-radius: 10px;
            object-fit: cover;
        }

        .item-details {
            flex: 1;
        }

        .item-name {
            font-weight: 600;
            margin-bottom: 5px;
        }

        .item-quantity {
            font-size: 13px;
            color: #777;
        }

        .item-price {
            font-weight: 600;
            color: #ff6b00;
        }

        .total-section {
            border-top: 2px solid #eee;
            margin-top: 20px;
            padding-top: 20px;
        }

        .total-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
        }

        .total-row.final {
            font-size: 22px;
            font-weight: 700;
            color: #ff6b00;
            margin-top: 15px;
        }

        .place-order-button {
            width: 100%;
            margin-top: 25px;
            padding: 15px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(
                135deg,
                #ff6b00,
                #ff9500
            );
            color: white;
            font-size: 17px;
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
            cursor: pointer;
            transition: 0.3s;
        }

        .place-order-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(255, 107, 0, 0.25);
        }

        .back-cart {
            display: inline-block;
            margin-bottom: 25px;
            color: #ff6b00;
            text-decoration: none;
            font-weight: 500;
        }

        .back-cart:hover {
            text-decoration: underline;
        }

        @media (max-width: 800px) {

            .checkout-layout {
                grid-template-columns: 1fr;
            }

            .checkout-container {
                width: 94%;
            }

            .page-title h1 {
                font-size: 30px;
            }
        }

    </style>

</head>

<body>

    <jsp:include page="navbar.jsp" />

    <div class="checkout-container">

        <a href="cart" class="back-cart">
            ← Back to Cart
        </a>

        <div class="page-title">

            <h1>Checkout</h1>

            <p>
                Complete your order with Virundhu
            </p>

        </div>


        <div class="checkout-layout">


            <!-- ========================= -->
            <!-- DELIVERY DETAILS -->
            <!-- ========================= -->

            <div class="checkout-card">

                <h2>Delivery Details</h2>

                <form action="placeOrder"
                      method="post">

                    <div class="form-group">

                        <label for="address">
                            Delivery Address
                        </label>

                        <textarea
                            id="address"
                            name="address"
                            placeholder="Enter your complete delivery address"
                            required></textarea>

                    </div>


                    <h2>Payment Method</h2>

                    <div class="payment-options">

                        <label class="payment-option">

                            <input
                                type="radio"
                                name="paymentMode"
                                value="Cash on Delivery"
                                checked>

                            <span>
                                Cash on Delivery
                            </span>

                        </label>


                        <label class="payment-option">

                            <input
                                type="radio"
                                name="paymentMode"
                                value="UPI">

                            <span>
                                UPI
                            </span>

                        </label>


                        <label class="payment-option">

                            <input
                                type="radio"
                                name="paymentMode"
                                value="Card">

                            <span>
                                Credit / Debit Card
                            </span>

                        </label>

                    </div>


                    <button
                        type="submit"
                        class="place-order-button">

                        Place Order

                    </button>

                </form>

            </div>


            <!-- ========================= -->
            <!-- ORDER SUMMARY -->
            <!-- ========================= -->

            <div class="checkout-card">

                <h2>Order Summary</h2>


                <%
                    for (CartItem item : items) {

                        double itemTotal =
                                item.getPrice()
                                * item.getQuantity();
                %>

                    <div class="order-item">

                        <%
                            if (item.getImagePath() != null
                                    && !item.getImagePath().isEmpty()) {
                        %>

                            <img
                                src="<%= item.getImagePath() %>"
                                class="item-image"
                                alt="<%= item.getItemName() %>">

                        <%
                            }
                        %>


                        <div class="item-details">

                            <div class="item-name">

                                <%= item.getItemName() %>

                            </div>

                            <div class="item-quantity">

                                Qty:
                                <%= item.getQuantity() %>

                            </div>

                        </div>


                        <div class="item-price">

                            ₹<%= String.format(
                                "%.2f",
                                itemTotal
                            ) %>

                        </div>

                    </div>

                <%
                    }
                %>


                <div class="total-section">

                    <div class="total-row">

                        <span>
                            Item Total
                        </span>

                        <span>
                            ₹<%= String.format(
                                "%.2f",
                                total
                            ) %>
                        </span>

                    </div>


                    <div class="total-row">

                        <span>
                            Delivery Fee
                        </span>

                        <span>
                            ₹0.00
                        </span>

                    </div>


                    <div class="total-row final">

                        <span>
                            Total
                        </span>

                        <span>
                            ₹<%= String.format(
                                "%.2f",
                                total
                            ) %>
                        </span>

                    </div>

                </div>

            </div>

        </div>

    </div>

</body>
</html>