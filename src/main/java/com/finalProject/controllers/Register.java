package com.finalProject.controllers;

import java.util.HashMap;
import java.util.Map;

//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.dao.AddressDao;
import com.finalProject.dao.UserDao;
import com.finalProject.pojo.Address;
import com.finalProject.pojo.User;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class Register {
    
    public Register() {
    }
    
    @GetMapping("/register.htm")
    public String handleGetRequest(){
        return "register";
    }
    
    @PostMapping("/register.htm")
    protected ModelAndView handleRequestInternal(UserDao userDao, AddressDao addrDao,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
            
    	 Map<String, String> errors = new HashMap<>();
    	 Map<String, String> formValues = new HashMap<>(); 
    	 
    	 
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String streetName = request.getParameter("streetName");
        String streetNumParam = request.getParameter("streetNum");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zipcode = request.getParameter("zipcode");
        int streetNum = 0;
        
        
        formValues.put("fname", fname);
        formValues.put("lname", lname);
        formValues.put("email", email);
        formValues.put("role", role);
        formValues.put("streetName", streetName);
        formValues.put("streetNum", streetNumParam);
        formValues.put("city", city);
        formValues.put("state", state);
        formValues.put("zipcode", zipcode);
                
        if (fname == null || fname.isEmpty()) {
            errors.put("fname", "Please enter your first name");
        }

        if (lname == null || lname.isEmpty()) {
            errors.put("lname", "Please enter your last name");
        }

        if (email == null || email.isEmpty()) {
            errors.put("email", "Please enter your email address");
        } else {
            String emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
            if (!email.matches(emailRegex)) {
                errors.put("email", "Please enter a valid email address");
            }
        }

        if (password == null || password.isEmpty()) {
            errors.put("password", "Please enter a password");
        } else if (password.length() < 8 || !password.matches(".*[A-Za-z].*") || !password.matches(".*[0-9].*")) {
            errors.put("password", "Please enter a password that meets the requirements");
        }

        if (confirmPassword == null || confirmPassword.isEmpty()) {
            errors.put("confirmPassword", "Please confirm your password");
        } else if (!confirmPassword.equals(password)) {
            errors.put("confirmPassword", "Passwords do not match");
        }

        if (streetNumParam == null || streetNumParam.isEmpty()) {
            errors.put("streetNum", "Please enter a street number");
        } else {
            try {
                 streetNum = Integer.parseInt(streetNumParam);
                if (streetNum < 1) {
                    errors.put("streetNum", "Please enter a valid street number");
                }
            } catch (NumberFormatException e) {
                errors.put("streetNum", "Please enter a valid street number");
            }
        }

        if (city == null || city.isEmpty()) {
            errors.put("city", "Please enter a city");
        }

        if (state == null || state.isEmpty()) {
            errors.put("state", "Please enter a state");
        }

        if (zipcode == null || zipcode.isEmpty()) {
            errors.put("zipcode", "Please enter a zipcode");
        } else {
            String zipcodeRegex = "^\\d{5}(-\\d{4})?$"; // US zipcode format
            if (!zipcode.matches(zipcodeRegex)) {
                errors.put("zipcode", "Please enter a valid zipcode");
            }
        }

        if (!errors.isEmpty()) {
        	System.out.println("print the size" + errors.size());
            // If there are any errors, return to the registration form with the errors map
        	
            ModelAndView mav =  new ModelAndView("register", "errors", errors);
            mav.addObject("formValues", formValues);
            return mav;
        }
        
        
        
        
        User user = new User();
        Address addr = new Address();
        
        user.setFirst(fname);
        user.setLast(lname);
        user.setRole(role);
        user.setEmail(email);
        if(password.equals(confirmPassword)){
            user.setPassword(password);
        }else{
            System.out.println("Password Mismatch");
        }
        
        addr.setCity(city);
        addr.setState(state);
        addr.setStreetName(streetName);
        addr.setStreetNum(streetNum);
        addr.setZip(zipcode);
        
        user.setAddress(addr);
        
        
        
        addrDao.save(addr);
        userDao.saveUser(user);
        
        
//     request.getSession().setAttribute("user",user);
        return new ModelAndView("result");
    }
    
}
