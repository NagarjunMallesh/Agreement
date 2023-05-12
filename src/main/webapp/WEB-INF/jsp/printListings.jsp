<%@page import="java.util.List"%>
<%@page import="com.finalProject.pojo.Listings"%>
<%@ page import="java.io.ByteArrayInputStream" %>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Base64"%>
<%@page import="javax.imageio.ImageIO"%>
<!DOCTYPE html>
<html xmlns='http://www.w3.org/1999/xhtml'>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Card Layout</title>
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

            /* Reset margins and paddings for the whole document */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /* Set the body to fill the whole viewport */
            html,
            body {
                height: 100%;
                width: 100%;
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

    </style>
</head>
<body>
        <h1>Welcome to the Agreement!</h1>
       
        <h3>Enter the Listings ID to modify</h3>
        <form method="post" action="listingModify.htm">
            <input type="text" name="input">
            <input type="submit" name="Button" value="UpdateListing">
            <input type="submit" name="Button" value="DeleteListing">
            <input type="hidden" name="select" value="selection">
            <input type="hidden" name="userid" value="${user.userid}">
        </form>
        <!--<a href="/FinalProject/homePage.htm">Home Page</a>-->
        <div class="container">
                <%
                    List<Listings> lists = (List<Listings>) session.getAttribute("listings");
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
                        out.println("</div>");
                    }
               %>
        </div>
</body>

</html>
