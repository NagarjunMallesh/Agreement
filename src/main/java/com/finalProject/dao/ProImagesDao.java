package com.finalProject.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.finalProject.pojo.Listings;
import com.finalProject.pojo.ProImages;


@Component
public class ProImagesDao extends DAO {


    public void saveImages(ProImages images) {
        try {
            begin();
            getSession().save(images);
            commit();
        } catch (Exception e) {
            System.out.println("Exception -> " + e);
        }
    }

    public void deleteImages(ProImages image) {
        begin();
        getSession().delete(image);
        commit();
    }

    public void updateImages(ProImages image) {
        begin();
        getSession().update(image);
        commit();
    }

    public void deleteById(int imagesID) {
        try {
            begin();
            getSession().delete(getSession().get(ProImages.class, imagesID));
            commit();
        } catch (Exception e) {
            System.out.println("Exception -> " + e);
        }
    }

    public ProImages getLisitng(int imagesID) {
        ProImages images = getSession().get(ProImages.class, imagesID);
        return images;
    }

    public List<ProImages> getAllListings(){
        System.out.println("inside the dao class--->");
        List<ProImages> images = new ArrayList<>();
        images =  getSession().createQuery("SELECT a FROM User a", ProImages.class).getResultList();
        System.out.println("the arraylist inside the dao class --> " + images);
        return images;
    }
}
