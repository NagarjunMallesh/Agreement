package com.finalProject.controllers;

import java.text.SimpleDateFormat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.dao.ScheduleDao;
import com.finalProject.dao.UserDao;
import com.finalProject.pojo.Schedule;
import com.finalProject.pojo.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Schedules {
	
	
@PostMapping("/modifySchedule.htm")
public ModelAndView handleModifyRequest(UserDao userDao, ScheduleDao scheduleDao, HttpSession session, HttpServletRequest request) {
	int id = Integer.parseInt(request.getParameter("selection"));
	int userid = Integer.parseInt(request.getParameter("userid"));
	String button = request.getParameter("button");
	if(button.equals("Delete")) {
		scheduleDao.deleteById(id);
	    session.setAttribute("userTransaction", "Delete Scheduled Appointment");
		return new ModelAndView("resultUser");
	}else if(button.equals("Update")) {
		User user = userDao.getUser(userid);
		Schedule schedule = scheduleDao.getSchedule(id);
		session.setAttribute("schedule", schedule);
		session.setAttribute("user", user);
		return new ModelAndView("updateSchedule");
	}
	return null;
}


@PostMapping("/updateSchedule.htm")
public ModelAndView handleUpdateRequest(ScheduleDao scheduleDao, HttpSession session, HttpServletRequest request) throws Exception {
	String description = request.getParameter("description");
	String dateString = request.getParameter("date");
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // Specify the format of your date string
	int scheduleID = Integer.parseInt(request.getParameter("scheduleId"));
	
	Schedule schedule = scheduleDao.getSchedule(scheduleID);

    java.util.Date utilDate = dateFormat.parse(dateString);
    java.sql.Date date = new java.sql.Date(utilDate.getTime());
    
    schedule.setDate(date);
    schedule.setDescription(description);
    scheduleDao.updateSchedule(schedule);
    
    session.setAttribute("userTransaction", "Update Scheduled Appointment");
	return new ModelAndView("resultUser");
    	
}
	
}
