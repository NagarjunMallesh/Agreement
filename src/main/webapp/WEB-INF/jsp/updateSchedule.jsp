<%@page import="com.finalProject.pojo.User"%>
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
        <% User user = (User) session.getAttribute("user"); %>
        <h1>User Dashboard --- <%= user.getFirst() +" "+ user.getLast() %></h1>
        <h2>The Schedule Records to be updated</h2>
        <h2>Please enter details you want to update</h2>
        <div class="container">
            <form method="post" action="updateSchedule.htm">
                <input type="hidden" name="userid" value="<%= user.getUserid() %>">
                <input type="hidden" name="addrid" value=" ${sessionScope.schedule.getScheduleId()}">
                <label> Listings Description: </label>
                <input type="text" name="description" value="${sessionScope.schedule.getDescription()}"><!-- comment -->
                <label> Schedule Date: </label>
                <input type="text" name="date" value="${sessionScope.schedule.getDate()}"><!-- comment -->
                <label> Agent Name: </label><!-- comment -->
                <input type="text" name="email" value="${sessionScope.schedule.getListing().getUser().getFirst()}" disabled><!-- comment -->
                <input type="submit" Value="Submit">
                <input type="hidden" name="scheduleId" value="${sessionScope.schedule.getScheduleId()}">
                <input type="hidden"  name="userid" value="<%= user.getUserid()%>">
                <input type="hidden" name="submission" value="submit">
                <!-- comment -->
            </form>
        </div>

    </table>
</body>
</html>