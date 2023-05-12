package com.finalProject.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.query.NativeQuery;
import org.springframework.stereotype.Component;

import com.finalProject.pojo.Listings;
import com.finalProject.pojo.Schedule;

@Component
public class ScheduleDao extends DAO {
	
	public void saveSchedule(Schedule schedule) {
        try {
            begin();
            getSession().save(schedule);
            commit();
        } catch (Exception e) {
            System.out.println("Exception -> " + e);
        }
    }

    public void deleteSchedule(Schedule schedule) {
        begin();
        getSession().delete(schedule);
        commit();
    }

    public void updateSchedule(Schedule schedule) {
        begin();
        getSession().update(schedule);
        commit();
    }

    public void deleteById(int scheduleId) {
        try {
            begin();
            getSession().delete(getSession().get(Schedule.class, scheduleId));
            commit();
        } catch (Exception e) {
            System.out.println("Exception -> " + e);
        }
    }

    public Schedule getSchedule(int scheduleId) {
        Schedule schedule = getSession().get(Schedule.class, scheduleId);
        return schedule;
    }
    
    public List<Schedule> getAllListings(){
        
        List<Schedule> schedules = new ArrayList<>();
        schedules =  getSession().createQuery("SELECT a FROM Schedule a", Schedule.class).getResultList();
        return schedules;
    }
    
    public List<Schedule> getScheduleById(int userId){
        System.out.println("inside the dao class print lists by id--->");
        List<Schedule> schedules = new ArrayList<>();
        NativeQuery<Schedule> query = getSession().createNativeQuery("SELECT * FROM Schedule WHERE userID = :userid", Schedule.class);
        query.setParameter("userid",userId);
        System.out.println("inside the dao class query lists by id--->" + query.getQueryString());
        schedules = query.getResultList();
        System.out.println("inside the dao class--->" + schedules);
        return schedules;
    }
	
}
