package com.tap.controller;

import java.io.IOException;

import com.tap.dao.MenuDao;
import com.tap.daoimpl.MenuDaoImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private MenuDao menuDao;

    @Override
    public void init() throws ServletException {

        menuDao = new MenuDaoImpl();

        System.out.println(
            "AddToCartController initialized"
        );
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String menuIdParameter =
                request.getParameter("menuId");

        if (menuIdParameter == null ||
            menuIdParameter.isEmpty()) {

            response.setStatus(
                HttpServletResponse.SC_BAD_REQUEST
            );

            response.getWriter().write(
                "Invalid menu ID"
            );

            return;
        }

        int menuId =
                Integer.parseInt(menuIdParameter);

        // Get menu item
        Menu menu =
                menuDao.getMenu(menuId);

        if (menu == null) {

            response.setStatus(
                HttpServletResponse.SC_NOT_FOUND
            );

            response.getWriter().write(
                "Menu item not found"
            );

            return;
        }

        // Check availability
        if (!menu.isAvailable()) {

            response.setStatus(
                HttpServletResponse.SC_BAD_REQUEST
            );

            response.getWriter().write(
                "Item is not available"
            );

            return;
        }

        // Get session
        HttpSession session =
                request.getSession();

        // Get cart
        Cart cart =
                (Cart) session.getAttribute("cart");

        // Create cart if needed
        if (cart == null) {

            cart = new Cart();

            session.setAttribute(
                "cart",
                cart
            );
        }

        // Create CartItem
        CartItem item =
                new CartItem();

        item.setMenuId(
            menu.getMenuId()
        );

        item.setRestaurantId(
            menu.getRestaurantId()
        );

        item.setItemName(
            menu.getItemName()
        );

        item.setPrice(
            menu.getPrice()
        );

        item.setQuantity(1);

        item.setImagePath(
            menu.getImagePath()
        );

        // Add to cart
        cart.addItem(item);

        // Get updated quantity
        int quantity =
                cart.getItemQuantity(menuId);

        // Get total cart quantity
        int cartCount =
                cart.getTotalQuantity();

        System.out.println(
            menu.getItemName()
            + " quantity: "
            + quantity
        );

        // Send response to JavaScript
        response.setContentType(
            "text/plain"
        );

        response.setCharacterEncoding(
            "UTF-8"
        );

        response.getWriter().write(
            quantity + "," + cartCount
        );
    }
}