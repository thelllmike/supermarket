package cn.techtutorial.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.dao.*;
import cn.techtutorial.model.*;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("login-email");
            String password = request.getParameter("login-password");

            if ("admin@gmail.com".equals(email) && "password".equals(password)) {
                // Simulate successful login for the admin
                User admin = new User();
                admin.setEmail(email);
                admin.setPassword(password);

                request.getSession().setAttribute("auth", admin);
                response.sendRedirect("admin.jsp");
            } else {
                out.println("Invalid credentials");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}