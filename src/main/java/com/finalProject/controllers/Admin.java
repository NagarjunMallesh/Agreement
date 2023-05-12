package com.finalProject.controllers;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import jakarta.servlet.http.HttpSession;
import com.finalProject.dao.AddressDao;
import com.finalProject.dao.UserDao;
import com.finalProject.pojo.Address;
import com.finalProject.pojo.User;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class Admin {

    public Admin() {
    }

    @GetMapping("/adminDashboard.htm")
    public String handleGetRequest() {
        return "admin-dashboard";
    }

    @PostMapping("/admin.htm")
    protected ModelAndView handleUserRequest(UserDao userDao, HttpSession session,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        String category = request.getParameter("Selection");
        if (category.equals("select")) {
            String selection = request.getParameter("Button");
            if (selection.equals("AddUser")) {
                return new ModelAndView("admin-addUser");
            } else if (selection.equals("PrintUser")) {
                List<User> userList = userDao.getAllUser(); 
                session.setAttribute("userList", userList);
                return new ModelAndView("admin-getAllUser");
            }
        }
        return null;
        //throw new UnsupportedOperationException("Not yet implemented");
    }

    @PostMapping("/adminAddUser.htm")
    protected ModelAndView handleUserEntry(UserDao userDao, HttpSession session, HttpServletRequest request,
    		HttpServletResponse response) throws Exception {

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String streetName = request.getParameter("streetName");
        int streetNum = Integer.parseInt(request.getParameter("streetNum"));
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zipcode = request.getParameter("zipcode");

        User user = new User();
        Address addr = new Address();

        user.setFirst(fname);
        user.setLast(lname);
        user.setRole(role);
        user.setEmail(email);
        if (password.equals(confirmPassword)) {
            user.setPassword(password);
        } else {
            System.out.println("Password Mismatch");
        }

        addr.setCity(city);
        addr.setState(state);
        addr.setStreetName(streetName);
        addr.setStreetNum(streetNum);
        addr.setZip(zipcode);

        addr.setUser(user);

        user.setAddress(addr);

        userDao.saveUser(user);

        session.setAttribute("user", user);
        //request.getSession().setAttribute("user", user);
        session.setAttribute("transaction", "Adding User");
        return new ModelAndView("resultAdmin");
//        return null;
    }

    @PostMapping("/admin-modifyUser.htm")
    public ModelAndView handleUserModify(UserDao userDao, HttpServletRequest request) throws Exception {
        String name = request.getParameter("Name");
        System.out.println("name in admin" + name);
        List<User> userList = userDao.searchByName(name);
        for (User user : userList) {
            System.out.println("The user last name and address in controllers" + user.getLast() + " ++" + user.getAddress());

        }
        //request.getSession().setAttribute("userList", userList);
        return new ModelAndView("admin-deleteUser");
    }

    @PostMapping("/user-delete.htm")
    public ModelAndView deleteUser(UserDao userDao,HttpSession session, HttpServletRequest request) throws Exception {
        int userid = Integer.parseInt(request.getParameter("selection"));
        String button = request.getParameter("button");
        if (button.equals("Delete")) {
            userDao.deleteById(userid);
            session.setAttribute("transaction", "Deleted User");
            return new ModelAndView("resultAdmin");
        } else if (button.equals("Update")) {
            User user = userDao.getUser(userid);
            //request.getSession().setAttribute("user", user);
            session.setAttribute("user", user);
            return new ModelAndView("admin-modifyUser");
        }
        return null;
    }

    @PostMapping("/admin-updateUser.htm")
    public ModelAndView updateUser(UserDao userDao,AddressDao addrDao,HttpSession session, HttpServletRequest request) throws Exception {

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        String streetName = request.getParameter("streetName");
        int streetNum = Integer.parseInt(request.getParameter("streetNum"));
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zipcode = request.getParameter("zipcode");
        int userid = Integer.parseInt(request.getParameter("userid"));
        
        

        User user = userDao.getUser(userid);
        Address addr = user.getAddress();
        
        user.setUserid(userid);
        
        user.setFirst(fname);
        user.setLast(lname);
        user.setRole(role);
        user.setEmail(email);

        addr.setAddrid(user.getAddress().getAddrid());
        addr.setCity(city);
        addr.setState(state);
        addr.setStreetName(streetName);
        addr.setStreetNum(streetNum);
        addr.setZip(zipcode);

        
        user.setAddress(addr);
        addrDao.update(addr);
        session.setAttribute("transaction", "Updating User");
        return new ModelAndView("resultAdmin");
    }
    
	@PostMapping("/signout.htm")
	public ModelAndView handleSignoutRequest(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:/homePage.htm");
	}

}
