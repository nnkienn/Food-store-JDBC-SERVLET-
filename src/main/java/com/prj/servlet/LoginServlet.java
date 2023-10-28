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
import com.prj.main.User;
import com.prj.model.UserModel;


@WebServlet("/login-user")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset = UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");
				try {
					UserModel uDao = new UserModel(DbCon.getConnection());
					User user = uDao.userLogin(email, password);
					if(user != null) {
						request.getSession().setAttribute("auth", user);
						response.sendRedirect("index.jsp");
					}
					else {
						String message = "Đăng nhập lỗi";
						request.setAttribute("message", message);
						RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
						dispatcher.forward(request, response);


					}
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} 
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

}
