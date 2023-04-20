<%-- 
    Document   : ManagePlants
    Created on : Mar 12, 2023, 6:39:56 PM
    Author     : TRI
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <title>ManagePlants Page</title>
    </head>
    <body>
        <c:import url="header_loginedAdmin.jsp"/> 
        
        <form action="managePlansServlet" method="post" class="formsearch">
            <input type="text" name="txtsearch" value="<%= (request.getParameter("txtsearch")==null)?"": request.getParameter("txtsearch") %>">
            <select name="searchby">
                <option value="byname">by name</option>
                <option value="bycate">by category</option>
            </select>
            <input type="submit" value="search" name="action">
        </form>
        
        <a href="AddPlant.jsp">__Add Plant__</a>                      
        
        <h1></h1>
        <table class="order">
            <tr><th> ID</th>
                <th> Name</th>
                <th> Image</th>
                <th> Price</th>
                <th> Categories</th>
                <th> Description</th>
                <th> Status</th>
                <th> Action</th>
            </tr>

            <c:set var="listPlants" value="${requestScope.listPlants}"/>      
            
            <c:forEach var="pla" items="${listPlants}">
                <tr><th><c:out value="${pla.getId()}"></c:out></th>
                    <th><c:out value="${pla.getName()}"></c:out></th>
                    <th><img src="${pla.getImgpath()}" class="plantimg"></th>
                    <th><c:out value="${pla.getPrice()}"></c:out></th>
                    <th><c:out value="${pla.getCatename()}"></c:out></th>
                    <th><c:out value="${pla.getDescription()}"></c:out></th>
                    <th><c:choose >
                            <c:when test="${pla.getStatus() eq 1}"> Availability</c:when>
                            <c:when test="${pla.getStatus() eq 0}"> Out of stock</c:when>
                        </c:choose>
                    </th>
                    <th>
                        <c:url var="mylink" value="updatePlantsByAdmin.jsp">
                            <c:param name="plantid" value="${pla.getId()}"></c:param>
                            <c:param name="action" value="updatePlants"></c:param>
                        </c:url>
                        <a href="${mylink}">Update Plant</a>                       
                    </th>
                </c:forEach>
            </table>
        </body>
</html>
