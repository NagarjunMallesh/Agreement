<%@page import="java.util.List"%>
<%@page import="com.mycompany.finalproject.pojo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <style>                       body {
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
    </style>
    <body>
        <h1>Admin Portal</h1>
        <h2>Display User List to Delete Record</h2>
        <table>
            <thead>
                <tr>
                    <th>UserID</th>
                    <th>FirstName</th>
                    <th>LastName</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>StreetNum</th>
                    <th>StreetName</th>
                    <th>City</th>
                    <th>Zipcode</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<User> users = (List<User>) session.getAttribute("userList");
                    for (User user : users) {
                %>
                <tr>
                    <td><%= user.getUserId()%></td>
                    <td><%= user.getFirst()%></td>
                    <td><%= user.getLast()%></td>
                    <td><%= user.getEmail()%></td>
                    <td><%= user.getRole()%></td>
                    <td><%= user.getAddress().getStreetNum()%></td>
                    <td><%= user.getAddress().getStreetName()%></td>
                    <td><%= user.getAddress().getCity()%></td>
                    <td><%= user.getAddress().getZip()%></td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </body>
</html>