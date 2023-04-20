<%-- 
    Document   : viewCart
    Created on : Mar 1, 2023, 3:28:55 PM
    Author     : TRI
--%>

<%@page import="sample.dao.PlantDAO"%>
<%@page import="sample.dto.Plant"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
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
            String name = (String) session.getAttribute("name");
            if (name!=null) {
            %>
            <h3>Welcome <%= session.getAttribute("name") %> come back</h3>
            <h3><a href="mainController?action=logout">Logout</a></h3>
            <h3><a href="personalPage.jsp">Personal Page</a></h3>
            <%
            }
            %>
            <font style='color:red;'><%= (request.getAttribute("WARNING")==null)?"":(String)request.getAttribute("WARNING") %> </font>
            
            <table width="100%" class="shopping" >
                
                <%
                float total = 0;
                
                HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
                if(cart!=null){
                %>
                <tr><td>Product id</td><td>Image</td><td>Quantity</td><td>Price</td><td>Action</td></tr>
                <%
                    Set<String> pids = cart.keySet();                   
                    for (String pid : pids) {
                        Plant p = PlantDAO.getPlant(Integer.parseInt(pid));
                        int quantity = cart.get(pid);
                %>
                        <form action="mainController" method="post">
                            <tr>
                                <td><input type="hidden" value="<%= pid %>" name="pid"><a href="getPlantServlet?pid=<%= pid %>"><%= pid %></a></td>
                                <td><img src='<%= p.getImgpath() %>' class="plantimg"></td>
                                <td><input type="number" value="<%= quantity %>" name="quantity"></td>
                                <td><%= p.getPrice()*quantity %> VND</td>
                                <td><input type="submit" value="update" name="action">
                                <input type="submit" value="delete" name="action"></td>
                            </tr>
                        </form>
                <%
                        total = total + quantity*p.getPrice();
                    }
                }
                else{
                %>
                <tr><td style="font-size: x-large">Your cart is empty</td></tr>
                <%
                }
                %>
                <tr><td>Total money: <%= total%> VND</td></tr>
                <tr><td>Order Date: <%= (new Date()).toString() %></td></tr>
                <tr><td>Ship Date: N/A </td></tr>
            </table>
        </section>
        <section>
            <form action="mainController" method="post">
                <input type="submit" value="saveOrder" name="action" class="submitorder">
            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
