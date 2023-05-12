package com.finalProject.dao;

import com.finalProject.dao.DAO;
import com.finalProject.pojo.Address;

/**
 *
 * @author nagarjunmallesh
 */
public class AddressDao extends DAO{
     public void save(Address a) {
        begin();
        getSession().save(a);
        commit();
    }
    
    public void update(Address a) {
        try {
            begin();
            getSession().update(a);
            commit();
        } catch(Exception e) {
            System.out.println("Exception: " + e.getMessage());
        }
    }
    
    public void delete(Address a) {
        begin();
        getSession().delete(a);
        commit();
    }
    
    public Address address(int aid) {
        Address address = getSession().get(Address.class, aid);
        return address;
    }
}