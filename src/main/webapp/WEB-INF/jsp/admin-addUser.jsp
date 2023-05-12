<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
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

            /* Style the container */
            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100%;
                padding: 1rem;
                background-color: #f8f9fa;
            }

            /* Style the form */
            form {
                max-width: 400px;
                width: 100%;
                padding: 1.5rem;
                border: 1px solid #ced4da;
                border-radius: 0.25rem;
                background-color: #ffffff;
            }

            /* Style the form elements */
            form label {
                display: block;
                margin-bottom: 0.5rem;
                font-size: 1rem;
                font-weight: 500;
                color: #212529;
            }

            form input {
                display: block;
                width: 100%;
                padding: 0.375rem 0.75rem;
                margin-bottom: 1rem;
                font-size: 1rem;
                line-height: 1.5;
                color: #495057;
                background-color: #ffffff;
                border: 1px solid #ced4da;
                border-radius: 0.25rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            form input:focus {
                outline: 0;
                border-color: #80bdff;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }

            form button {
                display: inline-block;
                font-weight: 400;
                color: #212529;
                text-align: center;
                vertical-align: middle;
                user-select: none;
                padding: 0.375rem 0.75rem;
                font-size: 1rem;
                line-height: 1.5;
                border: 1px solid #ced4da;
                border-radius: 0.25rem;
                transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            form button:hover {
                color: #fff;
                background-color: #007bff;
                border-color: #007bff;
            }

        </style>
    </head>
    <body>
        <h1>Admin Portal - Add new user!</h1>
        <h2>Enter the user details</h2>
        <div class="container">
            <form method="post" action="adminAddUser.htm">
                <label>Enter your First Name: </label>
                <input type="text" name="fname"><!-- comment -->
                <label>Enter your Last Name: </label>
                <input type="text" name="lname"><!-- comment -->
                <label>Enter your Email: </label><!-- comment -->
                <input type="text" name="email"><!-- comment -->
                <label>Enter your Role </label>
                <input type="text" name="role">
                <label>Enter your password: </label>
                <input type="text" name="password">
                <label>Enter your password again: </label>
                <input type="text" name="confirmPassword"><!-- comment -->
                <h3>Enter your current residence address</h3><br />
                <label>Enter Street Number: </label><!-- comment -->
                <input type="text" name="streetNum"><!-- comment -->
                <label>Enter Street Name: </label>
                <input type="text" name="streetName"><!-- comment -->
                <label>Enter City: </label>
                <input type="text" name="city">
                <label>Enter State: </label>
                <input type="text" name="state">
                <label>Enter Zip Code: </label>  
                <input type="text" name="zipcode">
                <input type="submit" Value="Submit">
                <input type="hidden" name="submission" value="submit">
                <!-- comment -->
            </form>
        </div>
    </body>
</html>
