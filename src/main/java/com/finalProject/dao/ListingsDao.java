package com.finalProject.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.query.NativeQuery;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.finalProject.pojo.Listings;
import com.finalProject.pojo.User;




@Component
public class ListingsDao extends DAO {


    public void saveListing(Listings listings) {
        try {
            begin();
            getSession().save(listings);
            commit();
        } catch (Exception e) {
            System.out.println("Exception -> " + e);
        }
    }

    public void deleteListing(Listings listing) {
        begin();
        getSession().delete(listing);
        commit();
    }

    public void updateListing(Listings listing) {
        begin();
        getSession().update(listing);
        commit();
    }

    public void deleteById(int listingId) {
        try {
            begin();
            getSession().delete(getSession().get(Listings.class, listingId));
            commit();
        } catch (Exception e) {
            System.out.println("Exception -> " + e);
        }
    }

    public Listings getLisitng(int listingsId) {
        Listings listing = getSession().get(Listings.class, listingsId);
        return listing;
    }
    
    public List<Listings> getListingsById(int userId){
        System.out.println("inside the dao class print lists by id--->");
        List<Listings> listings = new ArrayList<>();
        NativeQuery<Listings> query = getSession().createNativeQuery("SELECT * FROM Listings WHERE fkuser = :userid", Listings.class);
        query.setParameter("userid",userId);
        System.out.println("inside the dao class query lists by id--->" + query.getQueryString());
        listings = query.getResultList();
        System.out.println("inside the dao class--->" + listings);
        return listings;
    }


    public List<Listings> getAllListings(){
        
        List<Listings> listings = new ArrayList<>();
        listings =  getSession().createQuery("SELECT a FROM Listings a", Listings.class).getResultList();
        System.out.println("the arraylist inside the dao class --> " + listings);
        return listings;
    }
    
}
