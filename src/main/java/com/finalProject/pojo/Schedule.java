package com.finalProject.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "Schedule")
public class Schedule {
	
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int scheduleId;
    
    private java.sql.Date Date;
    private String Description;
    
    @ManyToOne
    @JoinColumn(name = "listingsID", referencedColumnName = "listingsId")
    Listings listing;
    
	@ManyToOne
    @JoinColumn(name = "userID", referencedColumnName = "userid")
    User user;

	public int getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}

	public java.sql.Date getDate() {
		return Date;
	}

	public void setDate(java.sql.Date date) {
		Date = date;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public Listings getListing() {
		return listing;
	}

	public void setListing(Listings listing) {
		this.listing = listing;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}	
	
	
	
    
}
