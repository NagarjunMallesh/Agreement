<%@page import="java.util.List"%>
<%@page import="com.finalProject.pojo.User"%>
<%@page import="com.finalProject.pojo.Schedule"%>
<%@page import="com.finalProject.pojo.Listings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
            }

            h1, h2 {
                color: #333;
                text-align: center;
            }

            table {
                margin: 0 auto;
                border-collapse: collapse;
                width: 80%;
                max-width: 800px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            th, td {
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #eee;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #ddd;
            }
            form {
                display: block;
                margin: 20px auto;
                max-width: 400px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
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
        </style> 
    </head>

    <body>
        <%  User user = (User) session.getAttribute("user"); %>
        <h1>Applicant Dashboard - <%= user.getFirst() + " " + user.getLast() %></h1>
        <h2>Schedule List</h2>
        <table>
            <thead>
                <tr>
                    <th>ScheduleID</th>
                    <th>Date</th>
                    <th>Description</th>
                    <th>Listings ID</th>
                    <th>Property Name</th>
                    <th>Agent's Name</th>
                    <th>Location</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Schedule> schedules = (List<Schedule>) session.getAttribute("schedules");
                    for (Schedule sch : schedules) {
                %>
                <tr>
                    <td><%= sch.getScheduleId()%></td>
                    <td><%= sch.getDate()%></td>
                    <td><%= sch.getDescription()%></td>
                    <td><%= sch.getListing().getListingsId()%></td>
                    <td><%= sch.getListing().getPropertyName()%></td>
                    <td><%= sch.getListing().getUser().getFirst()%></td>
                    <td><%= sch.getListing().getLocation()%></td>
                </tr>
                <% }%>
            </tbody>
            <h4>From the above details which record you want to delete</h4>
            <form action="modifySchedule.htm" method="post">
                <label>Enter the Schedule ID</label>
                <input type="text" name="selection">
                <input type="submit" name="button" value="Delete">
                <input type="submit" name="button" value="Update">
                <input type="hidden" name="userid" value="<%= user.getUserid() %>">
            </form>
        </table>
    </body>
</html>