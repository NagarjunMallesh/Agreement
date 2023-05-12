package com.finalProject.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.ScrollableResults;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalProject.dao.DAO;
import com.finalProject.pojo.User;

@Repository
public class UserDao extends DAO {


    public void saveUser(User user) {
        try {
            begin();
            getSession().save(user);
            commit();
        } catch (Exception e) {
            System.out.println("Exception -> " + e);
        }
    }

    public void deleteUser(User user) {
        begin();
        getSession().delete(user);
        commit();
    }

    public void updateUser(User user) {
        begin();
        getSession().update(user);
        commit();
    }

    public void deleteById(int userid) {
        try {
            begin();
            getSession().delete(getSession().get(User.class, userid));
            commit();
        } catch (Exception e) {
            System.out.println("Exception -> " + e);
        }
    }

    public User getUser(int userid) {
        User user = getSession().get(User.class, userid);
        return user;
    }

    public List<User> getAllUser() {
        System.out.println("inside the dao class--->");
        List<User> allUsers = new ArrayList<>();
        allUsers =  getSession().createQuery("SELECT a FROM User a", User.class).getResultList();
        System.out.println("the arraylist inside the dao class --> " + allUsers);
        return allUsers;
    }

    
    
    public User findByEmailAndPassword(String email, String password) {
        try{
           
            Query<User> query = getSession().createQuery("FROM User WHERE email = :email AND password = :password", User.class);
            query.setParameter("email", email);
            query.setParameter("password", password);
            ScrollableResults results = query.scroll();
            while (results.next()) {
                User user = (User) results.get(0);
                // Do something with the user object
                System.out.println("user in dao class"+ user);
                return user;
            }
            results.close();
            return null;
        } catch (Exception e) {
            System.out.println("Inside Exception findByEmail");
            e.printStackTrace();
            return null;
        }
    }
    
    public List<User> searchByName(String name){
        System.out.println("name inside DAO class ->" + name);
        String hql="FROM User u WHERE u.first LIKE :name or u.last LIKE :name";
        Query<User> query= getSession().createQuery(hql, User.class);
        query.setParameter("name", "%" + name + "%");
        System.out.println("query in dao class" + query);
        return query.list();
    }
}