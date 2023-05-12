<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
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
            .alert-danger {
            background-color: #f8d7da;
            border-color: #f5c6cb;
            color: #721c24;
            padding: 0.75rem 1.25rem;
            margin-bottom: 1rem;
            border-radius: 0.25rem;
            }

            .alert-error h2 {
            margin-top: 0;
            margin-bottom: 0.5rem;
            font-size: 1.25rem;
            }

            .alert-error ul {
            margin-bottom: 0;
            list-style: none;
            }

            .alert-error li {
            margin-bottom: 0.5rem;
            font-size: 1rem;
            }
        </style>
    </head>
    <body>
        <h1>Welcome to Login Page!</h1>
        <h2>Enter your credentials</h2>
        <div class="container">
            <form action="login.htm" method="post">
                <h4>${loginError}</h4>
                <label>Enter Username: </label>
                <input type="text" name="username">
                <label>Enter Password: </label>
                <input type="password" name="password">
                
                
                <c:if test="${not empty errors}">
                    <div class="container">
                        <div class="alert alert-error">
                            <h2>Please correct the following errors:</h2>
                            <ul>
                                <c:forEach items="${errors}" var="entry">
                                    <li><c:out value="${entry.value}" /></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </c:if>

                <input type="submit" value="Login">
                <input type="hidden" name="loginPage" value="login">
            </form>
        </div>
    </body>
</html>