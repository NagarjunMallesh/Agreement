package com.finalProject.pojo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.finalProject.pojo.ProImages;

@Entity
@Table(name = "listings")
public class Listings {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int listingsId;
    private String propertyName;
    private double rent;
    private int noOfBeds;
    private int noOfBaths;
    private String Location;
    private java.sql.Date Date;
    private boolean isAvailable;
    private String fileName;
    
    @OneToMany(mappedBy = "listing", cascade = CascadeType.ALL)
    private List<Schedule> schedules;
    
    @Transient
    private String filePath;
    
    
    
    public boolean isAvailable() {
		return isAvailable;
	}

	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return "/Users/nagarjunmallesh/Documents/FinalProject_copy1/FinalProject_SpringBoot/images/";
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@ManyToOne
    @JoinColumn(name = "fkuser", referencedColumnName = "userid")
    User user;	
    
   
 
    
    
    public void setUser(User user) {
    	this.user = user;
    }
    
    public User getUser() {
    	return user;
    }
    

    public Listings() {
    }
   

    public int getListingsId() {
        return listingsId;
    }

    public void setListingsId(int listingsId) {
        this.listingsId = listingsId;
    }

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public double getRent() {
        return rent;
    }

    public void setRent(double rent) {
        this.rent = rent;
    }

    public int getNoOfBeds() {
        return noOfBeds;
    }

    public void setNoOfBeds(int noOfBeds) {
        this.noOfBeds = noOfBeds;
    }

    public int getNoOfBaths() {
        return noOfBaths;
    }

    public void setNoOfBaths(int noOfBaths) {
        this.noOfBaths = noOfBaths;
    }

    public String getLocation() {
        return Location;
    }

    public void setLocation(String Location) {
        this.Location = Location;
    }

    public java.sql.Date getDate() {
        return Date;
    }

    public void setDate(java.sql.Date Date) {
        this.Date = Date;
    }
    
    
    
}
