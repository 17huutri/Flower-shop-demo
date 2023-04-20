<%-- 
    Document   : AddCategories
    Created on : Mar 14, 2023, 7:14:49 PM
    Author     : TRI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <title>AddCategories Page</title>
    </head>
    <body>
        <c:import url="header_loginedAdmin.jsp"/> 
        
        <h1>Add Categories</h1>
        <form action="mainController" method="post">
            <table>
                <tr><td>Name Categories:</td><td><input type="text" name ="txtnameCategories" required=""></td></tr>
                <tr><td></td><td colspan="2"><input type="submit" value ="addCategories" name="action"></td></tr>
            </table>
        </form>
    </body>
</html>
