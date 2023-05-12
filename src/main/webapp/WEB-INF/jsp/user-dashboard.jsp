<%@page import="java.util.List"%>
<%@page import="com.finalProject.pojo.User"%>
<%@page import="com.finalProject.pojo.Listings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Page</title>
        <style>
            h1 {
                font-size: 2rem;
                margin-bottom: 1rem;
                font-weight: 500;
                color: #212529;
                text-align: center;
            }

            /* Style the h2 elements */
            h2 {
                font-size: 1.5rem;
                margin-bottom: 0.75rem;
                font-weight: 500;
                color: #212529;
                text-align: center;
            }
            /* Style the h3 elements */
            h3 {
                font-size: 1.25rem;
                margin-bottom: 0.5rem;
                font-weight: 500;
                color: #212529;
                text-align: center;
            }
            
            .container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            grid-gap: 20px;
            padding: 20px;
            }

        .card {
            background-color: #f0f0f0;
            border-radius: 5px;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
        }

        .card:hover {
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .card img {
            max-width: 100%;
            height: auto;
            display: block;
            margin-bottom: 10px;
        }

        p {
                font-size: 1rem;
                margin-bottom: 5px;
                color: #212529;
            }
        .my-button {
            background-color: #a2b9bc;
            color: white;
            font-size: 16px;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        .my-button:hover {
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            background-color: #878f99;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        input[type="text"] {
            display: block;
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #3e8e41;
        }
       
            #signout-button {
            background-color: #FF0000;
            border: none;
            color: #FFFFFF;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 10px;
            margin-right: 10px;
            cursor: pointer;
            position: absolute;
            top: 0;
            right: 0;
            }

        </style>
    </head>
    <body>
        <% 
        User user = (User) session.getAttribute("user"); %>
        <h1>Welcome to the Application!</h1>
        <h2><%=user.getFirst() + " " + user.getLast() %></h2>
        <h3>Please find the menu provided below</h3>
        <form method="post" action="update.htm">
            <input class="my-button" type="submit" name="button" value="Update">
            <input class="my-button" type="submit" name="button" value="Schedule">
            <input type="hidden" name="select" value=${user.userid}>
        </form>
        <!--<a href="/FinalProject/homePage.htm">Home Page</a>-->
                <div class="container">
                <%
                    List<Listings> lists = (List<Listings>) session.getAttribute("list");
                     for (Listings list : lists) {
                        String imgName = list.getFilePath() +list.getFileName(); 
                        out.println("<div class='card'>");
                        out.println("<h3>Property Name: " + list.getPropertyName() + "</h3>");
                        out.println("<p>Property Rent: " + list.getRent() + "</p>");
                        out.println("<p>No Of Beds: " + list.getNoOfBeds() + "</p>");
                        out.println("<p>No Of Baths: " + list.getNoOfBaths() + "</p>");
                        out.println("<p>Location: " + list.getLocation() + "</p>");
                        out.println("<p>Availability Date: " + list.getDate() + "</p>");
                        out.println("<img src='" + imgName + "' alt='listing_image' />");
                        out.println("<form method='post' action='schedule.htm'>");
                        out.println("<label>Enter the Appointment Date: </label>");
                        out.println("<input type='date' name='date'>");
                        out.println("<input type='textarea' name='description'>");
                        out.println("<input type='hidden' name='userid' value='" + user.getUserid() + "'>");
                        out.println("<input type='hidden' name='listingsid' value='"+list.getListingsId()+"'>");
                        out.println("<input type='submit' name='submit' value='Submit'>");
                        out.println("</form>");
                        out.println("</div>");
                    }
               %>
        </div>

        <form action="signout.htm" method="POST">
            <button type="submit" id="signout-button">Sign Out</button>
        </form>
        
    </body>
</html>
