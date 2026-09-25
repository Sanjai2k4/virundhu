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

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("cart.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String action =
                request.getParameter("action");

        HttpSession session =
                request.getSession();

        Cart cart =
                (Cart) session.getAttribute("cart");

        if (cart == null) {

            response.sendRedirect("cart");

            return;
        }

        int menuId = 0;

        if (request.getParameter("menuId") != null) {

            menuId = Integer.parseInt(
                request.getParameter("menuId")
            );
        }

        if ("increase".equals(action)) {

            cart.increaseQuantity(menuId);

        } else if ("decrease".equals(action)) {

            cart.decreaseQuantity(menuId);

        } else if ("remove".equals(action)) {

            cart.removeItem(menuId);

        } else if ("clear".equals(action)) {

            cart.clearCart();
        }

        response.sendRedirect("cart");
    }
}