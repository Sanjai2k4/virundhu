package com.tap.controller;

import java.io.IOException;

import com.tap.model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // ==========================================
    // VIEW CART
    // ==========================================
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("cart.jsp")
               .forward(request, response);
    }

    // ==========================================
    // CART ACTIONS
    // ==========================================
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        // ==========================================
        // NO CART EXISTS
        // ==========================================
        if (cart == null) {

            sendResponse(
                    request,
                    response,
                    "0,0"
            );

            return;
        }

        // ==========================================
        // CLEAR CART
        // ==========================================
        if ("clear".equals(action)) {

            cart.clearCart();

            sendResponse(
                    request,
                    response,
                    "0,0"
            );

            return;
        }

        // ==========================================
        // GET MENU ID
        // ==========================================
        String menuIdParam = request.getParameter("menuId");

        if (menuIdParam == null || menuIdParam.trim().isEmpty()) {

            if (isAjaxRequest(request)) {

                response.setStatus(
                        HttpServletResponse.SC_BAD_REQUEST
                );

            } else {

                response.sendRedirect(
                        request.getContextPath() + "/cart"
                );
            }

            return;
        }

        int menuId;

        try {

            menuId = Integer.parseInt(menuIdParam);

        } catch (NumberFormatException e) {

            if (isAjaxRequest(request)) {

                response.setStatus(
                        HttpServletResponse.SC_BAD_REQUEST
                );

            } else {

                response.sendRedirect(
                        request.getContextPath() + "/cart"
                );
            }

            return;
        }

        // ==========================================
        // INCREASE QUANTITY
        // ==========================================
        if ("increase".equals(action)) {

            cart.increaseQuantity(menuId);
        }

        // ==========================================
        // DECREASE QUANTITY
        // ==========================================
        else if ("decrease".equals(action)) {

            cart.decreaseQuantity(menuId);
        }

        // ==========================================
        // REMOVE ITEM
        // ==========================================
        else if ("remove".equals(action)) {

            cart.removeItem(menuId);
        }

        // ==========================================
        // INVALID ACTION
        // ==========================================
        else {

            if (isAjaxRequest(request)) {

                response.setStatus(
                        HttpServletResponse.SC_BAD_REQUEST
                );

            } else {

                response.sendRedirect(
                        request.getContextPath() + "/cart"
                );
            }

            return;
        }

        // ==========================================
        // GET UPDATED VALUES
        // ==========================================
        int quantity = cart.getItemQuantity(menuId);

        int cartCount = cart.getTotalQuantity();

        String result = quantity + "," + cartCount;

        // ==========================================
        // SEND RESPONSE
        // ==========================================
        sendResponse(
                request,
                response,
                result
        );
    }

    // ==========================================
    // CHECK WHETHER REQUEST IS FROM JAVASCRIPT
    // ==========================================
    private boolean isAjaxRequest(
            HttpServletRequest request) {

        String requestedWith =
                request.getHeader("X-Requested-With");

        if ("XMLHttpRequest".equalsIgnoreCase(requestedWith)) {
            return true;
        }

        String accept =
                request.getHeader("Accept");

        if (accept == null || accept.isEmpty()) {
            return true;
        }

        return !accept.contains("text/html");
    }

    // ==========================================
    // SEND RESPONSE
    // ==========================================
    private void sendResponse(
            HttpServletRequest request,
            HttpServletResponse response,
            String result)
            throws IOException {

        if (isAjaxRequest(request)) {

            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");

            response.getWriter().write(result);

        } else {

            response.sendRedirect(
                    request.getContextPath() + "/cart"
            );
        }
    }
}