<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.Map, java.util.HashMap" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            .alert-error {
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
        <h1>Create you account!</h1>
        <h2>Please enter your details to create the account</h2>
        <div class="container">
            <form method="post" action="register.htm">
                <label>Enter your First Name: </label>
                <input type="text" name="fname"  value="${formValues['fname']}">
                <form:errors path="fname" cssClass="error"/>
                <label>Enter your Last Name: </label>
                <input type="text" name="lname" value="${formValues['lname']}">
                <form:errors path="lname" cssClass="error" />
                <label>Enter your Email: </label>
                <input type="text" name="email" value="${formValues['email']}">
                <form:errors path="email" cssClass="error" />
                <label>Enter your Role </label>
                <input type="text" name="role" value="${formValues['role']}">
                <label>Enter your password: </label>
                <input type="text" name="password" value="${formValues['password']}">
                <form:errors path="password" cssClass="error" />
                <label>Enter your password again: </label>
                <input type="text" name="confirmPassword" value="${formValues['confirmPassword']}">
                <form:errors path="confirmPassword" cssClass="error" />
                <h3>Enter your current residence address</h3><br />
                <label>Enter Street Number: </label>
                <input type="text" name="streetNum" value="${formValues['streetNum']}">
                <form:errors path="streetNum" cssClass="error"  />
                <label>Enter Street Name: </label>
                <input type="text" name="streetName" value="${formValues['streetName']}">
                <label>Enter City: </label>
                <input type="text" name="city" value="${formValues['city']}">
                <form:errors path="city" cssClass="error" />
                <label>Enter State: </label>
                <input type="text" name="state" value="${formValues['state']}">
                <form:errors path="state" cssClass="error" />
                <label>Enter Zip Code: </label>  
                <input type="text" name="zipcode" value="${formValues['zipcode']}">
                <form:errors path="zipcode" cssClass="error" />

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

                <input type="submit" Value="Submit">
                <input type="hidden" name="submission" value="submit">
            </form>
        </div>

        <%-- Display form errors --%>

    </body>
</html>
