<%@page import="java.util.List"%>
<%@page import="com.finalProject.pojo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Update Page</title>
    </head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        h1, h2, h3, h4, h5 {
            color: #333;
            text-align: center;
        }

        .container {
            display: block;
            margin: 20px auto;
            max-width: 800px;
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
    <body>
        <h1>Admin Portal</h1>
        <h2>The Record to be updated</h2>
        <h5>User ID : ${sessionScope.user.getUserid()}</h5>
        <h5>First Name : ${sessionScope.user.getFirst()}</h5>
        <h5>Last Name : ${sessionScope.user.getLast()}</h5><!-- comment -->
        <h5>Email : ${sessionScope.user.getEmail()}</h5><!-- comment -->
        <h5>Role : ${sessionScope.user.getRole()}</h5><!-- comment -->
        <h5>Street Number : ${sessionScope.user.getAddress().getStreetNum()}</h5><!-- comment -->
        <h5>Street Name : ${sessionScope.user.getAddress().getStreetName()}</h5><!-- comment -->
        <h5>City : ${sessionScope.user.getAddress().getCity()}</h5><!-- comment -->
        <h5>State : ${sessionScope.user.getAddress().getState()}</h5><!-- comment -->
        <h5>Zip : ${sessionScope.user.getAddress().getZip()}</h5><!-- comment -->
        

        <h2>Please enter details you want to update</h2>
        <div class="container">
            <form method="post" action="admin-updateUser.htm">
                <input type="hidden" name="userid" value="${sessionScope.user.getUserid()}">
                <input type="hidden" name="addrid" value=" ${sessionScope.user.getAddress().getAddrid()}">
                <label>Enter your First Name: </label>
                <input type="text" name="fname" value="${sessionScope.user.getFirst()}"><!-- comment -->
                <label>Enter your Last Name: </label>
                <input type="text" name="lname" value="${sessionScope.user.getLast()}"><!-- comment -->
                <label>Enter your Email: </label><!-- comment -->
                <input type="text" name="email" value="${sessionScope.user.getEmail()}"><!-- comment -->
                <label>Enter your Role </label>
                <input type="text" name="role" value="${sessionScope.user.getRole()}">
                <h3>Enter your current residence address</h3><br />
                <label>Enter Street Number: </label><!-- comment -->
                <input type="text" name="streetNum" value="${sessionScope.user.getAddress().getStreetNum()}"><!-- comment -->
                <label>Enter Street Name: </label>
                <input type="text" name="streetName" value="${sessionScope.user.getAddress().getStreetName()}"><!-- comment -->
                <label>Enter City: </label>
                <input type="text" name="city" value="${sessionScope.user.getAddress().getCity()}">
                <label>Enter State: </label>
                <input type="text" name="state" value="${sessionScope.user.getAddress().getState()}">
                <label>Enter Zip Code: </label>  
                <input type="text" name="zipcode" value="${sessionScope.user.getAddress().getZip()}">
                <input type="submit" Value="Submit">
                <input type="hidden" name="submission" value="submit">
                <!-- comment -->
            </form>
        </div>

    </table>
</body>
</html>