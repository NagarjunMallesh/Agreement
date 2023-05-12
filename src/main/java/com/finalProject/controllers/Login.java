package com.finalProject.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.dao.ListingsDao;
import com.finalProject.dao.UserDao;
import com.finalProject.pojo.Listings;
import com.finalProject.pojo.User;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class Login {

    public Login() {
    }

//    @RequestMapping(value = "/login", method = RequestMethod.GET)
//    public String loginPage(Model model) {
//        
//        return "login";
//    }
    @GetMapping("login.htm")
    public String handleLoginGet() {
        return "login";
    }
    
//    @GetMapping("admin-")

    @PostMapping("/login.htm")
    protected ModelAndView handleLoginInternal(ListingsDao listingsDao, UserDao userdao,
    		HttpSession session,
    		HttpServletRequest  request,
            HttpServletResponse response) {
    	
   	 	Map<String, String> errors = new HashMap<>();
   	 	Map<String, String> loginDetails = new HashMap<>(); 



        System.out.println("INSIDE LOGIN ");
        String status = request.getParameter("loginPage");
        if (status.equalsIgnoreCase("login")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            
            
            if (username == null || username.isEmpty()) {
                errors.put("email", "Please enter your email address");
            } else {
                String emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
                if (!username.matches(emailRegex)) {
                    errors.put("email", "Please enter a valid email address");
                }
            }
            
            
            if (!errors.isEmpty()) {
            	System.out.println("print the size" + errors.size());
                // If there are any errors, return to the registration form with the errors map
            	
                ModelAndView mav =  new ModelAndView("login", "errors", errors);
                mav.addObject("formValues", loginDetails);
                return mav;
            }
            
            
            
            User user = userdao.findByEmailAndPassword(username, password);
            if (user != null) {
                if (user.getRole().equalsIgnoreCase("admin")) {
                    return new ModelAndView("admin-dashboard", "user", user);
                }else if (user.getRole().equalsIgnoreCase("user")) {
                	List<Listings> list = listingsDao.getAllListings();
                	session.setAttribute("list", list);
                	session.setAttribute("user", user);
                    return new ModelAndView("user-dashboard");
                } else if (user.getRole().equalsIgnoreCase("builder")) {
                    return new ModelAndView("builder-dashboard", "user", user);
                } else if (user.getRole().equalsIgnoreCase("marketplace")) {
                    return new ModelAndView("market-dashboard", "user", user);
                }
            } else {
                ModelAndView modelandView = new ModelAndView("login");
                modelandView.addObject("loginError","User Account not found, Please register to login!");
                return modelandView;
            }
        }
        return null;
    }
    
    
   

}

