<%@page import="java.util.List"%>
<%@page import="com.finalProject.pojo.User"%>
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
        <h1>Admin Portal</h1>
        <h2>Users List</h2>
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
                    <td><%= user.getUserid()%></td>
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
            <h4>From the above details which record you want to delete</h4>
            <form action="user-delete.htm" method="post">
                <label>Enter the User ID</label>
                <input type="text" name="selection">
                <input type="submit" name="button" value="Delete">
                <input type="submit" name="button" value="Update">
            </form>
        </table>
    </body>
</html>