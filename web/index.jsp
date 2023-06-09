<%-- 
    Document   : index
    Created on : Feb 28, 2023, 1:10:33 PM
    Author     : TRI
--%>

<%@page import="sample.dao.PlantDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.dto.Plant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section>
            <%
                String keyword = request.getParameter("txtsearch");
                String searchby = request.getParameter("searchby");
                ArrayList<Plant> list;
                String [] tmp = {"out of stock", "availble"};
                if (keyword==null && searchby==null) {
                    list = PlantDAO.getPlants("", "");
                } else {
                    list = PlantDAO.getPlants(keyword, searchby);
                }
                if (list!=null && !list.isEmpty()) {
                    for (Plant p : list) { 
            %>
                    <table class="product">
                        <tr>
                            <td><img src='<%= p.getImgpath() %>' class="plantimg"></td>
                            <td>Product ID:<%= p.getId() %></td>
                            <td>Product Name:<%= p.getName()%></td>
                            <td>Price:<%= p.getPrice()%></td>
                            <td>Status:<%= p.getStatus()%></td>
                            <td>Category:<%= p.getCatename()%></td>
                            <td><a href="mainController?action=addtocart&pid=<%= p.getId() %>&img=<%= p.getImgpath()%>">add to cart</a></td>
                        </tr>
                    </table>
            <%
                    }
                }

            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
