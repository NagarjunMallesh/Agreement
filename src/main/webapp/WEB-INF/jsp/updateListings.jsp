<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
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
        <h1>Builder Dashboard!!!</h1>
        <h2>Welcome ${listing.getUser().getFirst()} ${listing.getUser().getLast()}</h2>
        <h3>Please enter your details to update the House Listings</h3>
        <h3></h3>
        <div class="container">
            <form method="post" action="updateDetails.htm">
                <input type="file" name="imageFile">
                <label>Enter the Property Name: </label>
                <input type="text" name="pname" value="${listing.getPropertyName()}"><!-- comment -->
                <label>Enter the Property Rent: </label>
                <input type="text" name="prent" value="${listing.getRent()}"><!-- comment -->
                <label>Enter the No of Baths: </label><!-- comment -->
                <input type="text" name="noOfBaths" value="${listing.getNoOfBaths()}"><!-- comment -->
                <label>Enter the No of Beds: </label>
                <input type="text" name="noOfBeds" value="${listing.getNoOfBeds()}">
                <label>Enter the Location </label>
                <input type="text" name="location" value="${listing.getLocation()}">
                <label>Enter the Availability Date: </label>
                <input type="date" name="date" value="${listing.getDate()}"><!-- comment -->
                <select name='available' id='vacant'><br>
                    <option value='yes'>Available for Rent</option>
                    <option value='no'>Not Available for Rent</option>

                <input type="submit" Value="Submit">
                <input type="hidden" name="listingID" value="${listing.getListingsId()}">
                <input type="hidden" name="submission" value="submit">
             </form>

                <!-- comment -->
 
        </div>
    </body>
</html>