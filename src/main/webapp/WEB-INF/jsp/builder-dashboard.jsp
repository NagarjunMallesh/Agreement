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

            .card {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            max-width: 300px;
            margin: auto;
            text-align: center;
            background-color: #f1f1f1;
            border-radius: 5px;
            }

            .card img {
                max-width: 100%;
                height: auto;
                border-radius: 5px 5px 0 0;
            }

            .card h3, .card p {
                margin: 15px 0;
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
        <h1>Welcome to the Application!</h1>
         <h2>${user.first} ${user.last}</h2>
        <h3>Please find the menu provided below</h3>
        <form method="post" action="listingMenu.htm">
            <input type="submit" name="Button" value="AddListing">
            <input type="submit" name="Button" value="PrintListing">
            <input type="hidden" name="select" value="selection">
            <input type="hidden" name="userid" value="${user.userid}">
        </form>
        <!--<a href="/FinalProject/homePage.htm">Home Page</a>-->

        <form action="signout.htm" method="POST">
            <button type="submit" id="signout-button">Sign Out</button>
        </form>
    </body>
</html>