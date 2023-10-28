package com.prj.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.prj.connection.DbCon;
import com.prj.main.User;
import com.prj.model.UserModel;

@WebServlet("/register-user")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            UserModel uDao = new UserModel(DbCon.getConnection());
            if (uDao.checkemailexist(email)) {
                String message = "The email is exits";
                request.setAttribute("message", message);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
                dispatcher.forward(request, response);
                return;
            }
            User user = uDao.userRegister(name, email, password);

            if (user != null) {
                request.getSession().setAttribute("auth", user);
                String message = "Register is succeed";
                request.setAttribute("message", message);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
                dispatcher.forward(request, response);
            } else {
                String message = "Register is fails";
                request.setAttribute("message", message);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
                dispatcher.forward(request, response);
                return; 
            }
        } catch (Exception e) {
            e.printStackTrace();
            String message = "Register is fails";
            request.setAttribute("message", message);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
            dispatcher.forward(request, response);
            return; 
        }
    }
}
