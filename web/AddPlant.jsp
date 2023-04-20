<%-- 
    Document   : AddPlant
    Created on : Mar 14, 2023, 6:28:15 PM
    Author     : TRI
--%>

<%@page import="sample.dto.Categories"%>
<%@page import="sample.dao.CategoriesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.dao.PlantDAO"%>
<%@page import="sample.dto.Plant"%><%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <title>AddPlants Page</title>
    </head>
    <body>
        <c:import url="header_loginedAdmin.jsp"/> 
        <%  
            ArrayList<Plant> plantall= PlantDAO.getAllPlants();
            ArrayList<Categories> cateall= CategoriesDAO.getAllCategories();
            String report =(String) request.getAttribute("report");
        %>
        <form action="mainController" method="post" >
            <table>
                <%
                    if (report != null) {%>
                    <h1><%= report %></h1>
                <%     
                    }
                %>
                <tr><td>Name:</td><td><input type="text" name ="txtname" required=""></td></tr>
                <tr><td>Price:</td><td><input type="text" name ="txtprice" required=""></td></tr>
                <tr><td>Image:</td><td><input type="text" name ="txtimage" required=""></td></tr>                  
                <tr><td>Description:</td>
                    <td>
                        <select name="txtdescription:" id="txtdescription:">
                        <%             
                            for (Plant plant : plantall) {
                        %>
                                <option value="<%= plant.getDescription() %>"><%= plant.getDescription() %></option>
                        <%
                            }
                        %>
                        </select>
                    </td>
                </tr>
                <tr><td>Status:</td>
                    <td>
                        <select name="txtstatus" id="txtstatus">
                            <option value="1">Availability</option>
                            <option value="0">Out of stock</option>
                        </select>
                    </td>
                </tr>
                <tr><td>Categories</td>
                    <td>
                        
                        <select name="txtcateName" id="txtcateid">
                        <%             
                            for (Categories cate : cateall) {
                        %>
                                <option value="<%= cate.getCateName() %>"><%= cate.getCateName() %></option>
                        <%
                            }
                        %>
                        </select>
                    </td>
                </tr>
                <tr><td></td><td colspan="2"><input type="submit" value ="addPlant" name="action"></td></tr>
            </table>
        </form>
    </body>
</html>
