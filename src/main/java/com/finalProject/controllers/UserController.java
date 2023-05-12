package com.finalProject.controllers;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.dao.AddressDao;
import com.finalProject.dao.ListingsDao;
import com.finalProject.dao.ScheduleDao;
import com.finalProject.dao.UserDao;
import com.finalProject.pojo.Address;
import com.finalProject.pojo.Listings;
import com.finalProject.pojo.Schedule;
import com.finalProject.pojo.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	public UserController() {
		
	}
	
	
	@GetMapping("/userDashboard.htm")
		public String handleGetRequest(){
			return "user-dashboard";
		}

//	@GetMapping("/user")
//	public String handleUpdateRequest() {
//		return "user-updateDetails";
//	}
	
	
	@PostMapping("/update.htm")
	public ModelAndView handlePutRequest(ScheduleDao scheduleDao, UserDao userDao, HttpSession session, HttpServletRequest request) throws Exception {
			
		String button = request.getParameter("button");
		int userid = Integer.parseInt(request.getParameter("select"));

			if(button.equals("Update")) {
//				System.out.println("user controller userid" + userid);
				User user = userDao.getUser(userid);
				session.setAttribute("user", user);
				return new ModelAndView("userUpdate");
			} else if(button.equals("Schedule")) {
				List<Schedule> schedule = scheduleDao.getScheduleById(userid);
				User user = userDao.getUser(userid);
				session.setAttribute("user", user);
				session.setAttribute("schedules", schedule);
				return new ModelAndView("schedules");
			}
		return null;
	}
	
	
	@PostMapping("/updateUser.htm")
	public ModelAndView handleUpdateRequest(AddressDao addrDao, UserDao userDao, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
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
        userDao.updateUser(user);
	    session.setAttribute("userTransaction", "Update profile");
		return new ModelAndView("resultUser");

	}
	
	
	@PostMapping("/schedule.htm")
	public ModelAndView handleScheduleRequest(ScheduleDao scheduleDao, ListingsDao listingsDao, UserDao userDao, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
			int userId = Integer.parseInt(request.getParameter("userid"));
			int listingsId = Integer.parseInt(request.getParameter("listingsid"));
			System.out.println("user details ---> "+userId+"listings details ---> "+listingsId);
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // Specify the format of your date string
			String dateString = request.getParameter("date");
		    java.util.Date utilDate = dateFormat.parse(dateString);
		    java.sql.Date date = new java.sql.Date(utilDate.getTime());
		    String description = request.getParameter("description");
		    
		    User user = userDao.getUser(userId);
		    Listings listing = listingsDao.getLisitng(listingsId);
		    
		    Schedule schedule = new Schedule();
		    schedule.setDate(date);
		    schedule.setDescription(description);
		    schedule.setListing(listing);
		    schedule.setUser(user);
		    
		    scheduleDao.saveSchedule(schedule);
		    session.setAttribute("userTransaction", "Scheduled an appointment for visting");
			return new ModelAndView("resultUser");
	}
	
	@PostMapping("/signout.htm")
	public ModelAndView handleSignoutRequest(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:/homePage.htm");
	}
}
