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

            h1, h3 {
                color: #333;
                text-align: center;
            }

            form {
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 20px auto;
                max-width: 400px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
                text-align: center;
            }

            label {
                display: inline-block;
                margin-bottom: 10px;
                color: #333;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-right: 10px;
            }

            input[type="Hidden"] {
                display: none;
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
        <h1>Welcome to Admin Portal!</h1>
        <h3>Select the operations to be performed</h3>
        <form action="admin.htm" method="post" >
            <label>Select an Options: </label>
            <input type="submit" Name="Button" Value="AddUser">
            <input type="submit" Name="Button" value="PrintUser">
            <input type="Hidden" Name="Selection" value="select"/> <BR />
        </form>

        <form action="signout.htm" method="POST">
            <button type="submit" id="signout-button">Sign Out</button>
        </form>
    </body>
</html>