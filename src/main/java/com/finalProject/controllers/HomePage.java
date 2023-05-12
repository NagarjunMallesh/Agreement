package com.finalProject.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class HomePage {

    public HomePage() {
    }

    @GetMapping("/homePage.htm")
    public String handleGetRequest()
    {
    	return "homePage"; 
    }
    
    @PostMapping("/homePage.htm")
    protected ModelAndView handleIntroRequest(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String selection = request.getParameter("Selection");
        if (selection == null) {
            return new ModelAndView("homePage");
        }

        if (selection.equals("select")) {
            String button = request.getParameter("Button");
            if (button.equalsIgnoreCase("Login")) {
                return new ModelAndView("login");
            } else if (button.equalsIgnoreCase("Register")) {
                return new ModelAndView("register");
            }
        }
        return null;
    }

}