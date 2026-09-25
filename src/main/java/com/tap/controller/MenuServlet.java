package com.tap.controller;

import java.io.IOException;
import java.util.List;

import com.tap.dao.MenuDao;
import com.tap.daoimpl.MenuDaoImpl;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private MenuDao menuDao;

    @Override
    public void init() throws ServletException {
        menuDao = new MenuDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String restaurantIdParam =
                request.getParameter("restaurantId");

        if (restaurantIdParam == null ||
            restaurantIdParam.isEmpty()) {

            response.sendRedirect("restaurants");
            return;
        }

        int restaurantId =
                Integer.parseInt(restaurantIdParam);

        List<Menu> menus =
                menuDao.getMenusByRestaurant(restaurantId);

        request.setAttribute("menus", menus);

        request.setAttribute("restaurantId", restaurantId);

        request.getRequestDispatcher("menu.jsp")
               .forward(request, response);
    }
}