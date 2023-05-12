package com.finalProject.controllers;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.dao.ListingsDao;
import com.finalProject.dao.ProImagesDao;
import com.finalProject.dao.UserDao;
import com.finalProject.pojo.Listings;
import com.finalProject.pojo.ProImages;
import com.finalProject.pojo.User;
import com.google.protobuf.TextFormat.ParseException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ListingController {

	@GetMapping("/listings.htm")
	public String handleGetRequest() {
	    return "builder-dashboard";
	}
	
	@GetMapping("/addListings.htm")
	public String handleGetBuilderRequest() {
		return "addListings";
	}
	
	@PostMapping("/listingMenu.htm")
	public ModelAndView handlePostRequest(UserDao userDao,ListingsDao listing,ProImages images,HttpSession session,HttpServletRequest request) throws Exception {
		System.out.println("inside post controllers");
		String select = request.getParameter("select");
		if(select.equals("selection")){
			int userid = Integer.parseInt(request.getParameter("userid"));
			User user = userDao.getUser(userid);
			String button = request.getParameter("Button");
			if(button.equals("AddListing")) {
				session.setAttribute("user", user);
				return new ModelAndView("addListings");
			}else if(button.equals("PrintListing")) {
				List<Listings> listings = listing.getListingsById(userid);
				session.setAttribute("listings", listings);
				return new ModelAndView("printListings");
			}
		}
		return null;
	}
		
		
		
	@PostMapping("/addListings.htm")
	public ModelAndView handleAddRequest(UserDao userDao,ListingsDao listing, ProImagesDao images, HttpSession session, HttpServletRequest request) throws Exception {
		
		String propertyName = request.getParameter("pname");
		String fileName = request.getParameter("imageFile"); 
		Double rent = Double.parseDouble(request.getParameter("prent"));
		int noOfBeds = Integer.parseInt(request.getParameter("noOfBeds"));
		int noOfBaths = Integer.parseInt(request.getParameter("noOfBaths"));
		String Location = request.getParameter("location");
		String dateString = request.getParameter("date");
		int userid = Integer.parseInt(request.getParameter("userid"));
		User user = userDao.getUser(userid);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // Specify the format of your date string

		    java.util.Date utilDate = dateFormat.parse(dateString);
		    java.sql.Date date = new java.sql.Date(utilDate.getTime());

		boolean isAvailable;
//		String img = request.getParameter("imageFile"); 
//		  System.out.println("image file name ===>" + img);	
//	      BufferedImage bImage = ImageIO.read(new File(img));
//	      ByteArrayOutputStream bos = new ByteArrayOutputStream();
//	      ImageIO.write(bImage, "jpg", bos );
//	      byte [] data = bos.toByteArray();
//		
		String available = request.getParameter("available");
		if(available.equals("yes")) {
			isAvailable = true;
		}else if(available.equals("no")) {
			isAvailable = false;
		}
		
		
		Listings list = new Listings();
		ProImages image = new ProImages();
		
		list.setPropertyName(propertyName);
		list.setRent(rent);
		list.setLocation(Location);
		list.setNoOfBaths(noOfBaths);
		list.setNoOfBeds(noOfBeds);
		list.setDate(date);
		list.setFileName(fileName);
		list.setUser(user);
		
		
//		image.setData(data);
//		images.saveImages(image);
		listing.saveListing(list);

		
	
		session.setAttribute("listingTransaction", "Add Listings");
		return new ModelAndView("resultListings");
	}
	
	@PostMapping("/listingModify.htm")
	public ModelAndView modifyListings(HttpSession session,ListingsDao listDao, HttpServletRequest request) throws Exception {
		int listID = Integer.parseInt(request.getParameter("input"));
		System.out.println("inside modify function --->" + listID);
		String button = request.getParameter("Button");
		if(button.equals("DeleteListing")) {
			listDao.deleteById(listID);
			session.setAttribute("listingTransaction", "Deleted Listing");
			return new ModelAndView("resultListings");
		}else if(button.equals("UpdateListing")) {
			System.out.println("inside modify update condition --->");
			Listings listing = listDao.getLisitng(listID);
			session.setAttribute("listing", listing);
			return new ModelAndView("updateListings");
		}
		return null;
	}
	
	
	@PostMapping("/updateDetails.htm")
	public ModelAndView updateListings(HttpSession session, UserDao userDao, ListingsDao listDao, HttpServletRequest request) throws Exception {
		
		
		String propertyName = request.getParameter("pname");
		Double rent = Double.parseDouble(request.getParameter("prent"));
		int noOfBeds = Integer.parseInt(request.getParameter("noOfBeds"));
		int noOfBaths = Integer.parseInt(request.getParameter("noOfBaths"));
		String Location = request.getParameter("location");
		String dateString = request.getParameter("date");
		
		int listingID = Integer.parseInt(request.getParameter("listingID"));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // Specify the format of your date string

		    java.util.Date utilDate = dateFormat.parse(dateString);
		    java.sql.Date date = new java.sql.Date(utilDate.getTime());

		boolean isAvailable = false;
		
		String available = request.getParameter("available");

		
		
		String fileName = request.getParameter("imageFile"); 	
		Listings list = listDao.getLisitng(listingID);
		User user = list.getUser();
		if(fileName.equals(null)) {
			fileName = list.getFileName();
		}
		
		if(available.equals("yes")) {
			isAvailable = true;
		}else if(available.equals("no")) {
			isAvailable = false;
		}else if(available.equals(null)) {
			isAvailable = list.isAvailable();
		}
		
		
		list.setPropertyName(propertyName);
		list.setRent(rent);
		list.setLocation(Location);
		list.setNoOfBaths(noOfBaths);
		list.setNoOfBeds(noOfBeds);
		list.setDate(date);
		list.setFileName(fileName);
		list.setUser(user);
		list.setAvailable(isAvailable);
		
		
		listDao.updateListing(list);
		
		session.setAttribute("listingTransaction", "Updated Listing");
		return new ModelAndView("resultListings");
		
	}
	
	@PostMapping("/signout.htm")
	public ModelAndView handleSignoutRequest(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:/homePage.htm");
	}
		
}
		
	
//









