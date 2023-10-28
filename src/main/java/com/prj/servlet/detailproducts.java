package com.prj.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.prj.connection.DbCon;
import com.prj.main.Product;
import com.prj.model.ProductModel;

import java.util.ArrayList;


@WebServlet("/detail-product")
public class detailproducts extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");

        try {
            String productId = request.getParameter("id");
            ProductModel pDao = new ProductModel(DbCon.getConnection());
            Product pd = pDao.getProductById(productId);
            if (pd != null) {
                request.setAttribute("product", pd);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("/detail-product.jsp");
                dispatcher.forward(request, response);
                return;


            } else {
                response.getWriter().println("Product not found");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
