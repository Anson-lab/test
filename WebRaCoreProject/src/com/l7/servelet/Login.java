package com.l7.servelet;

import java.io.IOException;
import java.util.Collection;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.l7.core.controller.UserController;
import com.l7.core.dto.RoleDTO;
import com.l7.core.dto.UserDTO;
import com.l7.core.exception.CustomerSQLException;
import com.l7.core.exception.ValidationSQLException;

/**
 * Servlet implementation class Login
 */
@WebServlet("/RaLogin")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserController userControllerObj = new UserController();
		UserDTO user = new UserDTO();

		
		
		String redirectPath="/JSP/JSP/login.jsp";
		 String userC = null,passwordC = null;
		Cookie[] cookies = request.getCookies();
		if(cookies!=null) {
		for(Cookie cookie:cookies) {
			
			if(cookie.getName().equals("userCookie"))
			  userC = cookie.getValue();
			if(cookie.getName().equals("passwordCookie"))
			 passwordC = cookie.getValue();
		}
		}
		
		try {
			
			if(userC!=null && passwordC!=null) {
				
				user.setUsername(userC);
				user.setPassword(passwordC);
				user=userControllerObj.userLogin(user);
				for(int i=0;i<user.getRoleList().size();i++)
					Collections.sort(user.getRoleList().get(i).getFeatureList());
				request.getSession().setAttribute("user", user);
				redirectPath="/JSP/JSP/main.jsp";
				
				
				}
		} catch (ValidationSQLException e) {
			// TODO Auto-generated catch block
			
			//e.printStackTrace();
		} catch (CustomerSQLException e) {
			// TODO Auto-generated catch block
			
			//e.printStackTrace();
		}
		
		getServletConfig().getServletContext().getRequestDispatcher(redirectPath).forward(request, response);
		
		
		
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String remember=request.getParameter("remember");
		
		
		String redirectPath="/JSP/JSP/login.jsp";
		UserController userControllerObj = new UserController();
		UserDTO user = new UserDTO();
		user.setUsername(username);
		user.setPassword(password);
		
		try {
			user=userControllerObj.userLogin(user);
			for(int i=0;i<user.getRoleList().size();i++)
			Collections.sort(user.getRoleList().get(i).getFeatureList());
			
				request.getSession().setAttribute("user", user);
				if(remember!=null && !remember.trim().equals("")) {
					Cookie userCookie = new Cookie("userCookie", username);
					Cookie passwordCookie = new Cookie("passwordCookie", password);
					Cookie rememberCookie = new Cookie("rememberCookie", remember);
					
					userCookie.setMaxAge(60*60*24*15);
					passwordCookie.setMaxAge(60*60*24*15);
					rememberCookie.setMaxAge(60*60*24*15);
					
					response.addCookie(userCookie);
					response.addCookie(passwordCookie);
					response.addCookie(rememberCookie);
					
					
				
			}
				redirectPath="/JSP/JSP/main.jsp";
				
		} catch (ValidationSQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		} catch (CustomerSQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		getServletConfig().getServletContext().getRequestDispatcher(redirectPath).forward(request, response);
		
		
	}

}
//comment by gokul
