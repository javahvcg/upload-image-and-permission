<%@ page import="entity.Product" %>
<%@ page import="entity.calendar" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: xuanhung
  Date: 3/23/18
  Time: 6:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Product> listProduct = (List<Product>) request.getAttribute("listProduct");
    int totalPage = (int) request.getAttribute("totalPage");
    int currentPage = (int) request.getAttribute("currentPage");
    int limit = (int) request.getAttribute("limit");
%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <title>List Product</title>
</head>
<body>
<div align="center">
    <ul class="list-group">
        <%
            for (Product product : listProduct) {
        %>
        <li class="list-group-item" style=""width: 50%">
            <img class="img-circle" style="width: 50px; height: 50px;" src="<%=product.getPhotos()%>" alt="">
            Name: <%= product.getName() %><br>
            Created Date: <%= calendar.generateTime(product.getId())%><br>
            <a href="/admin/product/edit?id=<%=product.getId()%>">Edit</a>&nbsp;|&nbsp;
            <a href="/admin/product/delete?id=<%=product.getId()%>">Delete</a>
        </li>
        <%
            }
        %>
    </ul>
</div>
<div align="center" style="position: absolute; bottom: 10%; right: 25%; left:25%">
    <ul class="pagination">
        <% if (currentPage > 1) { %>
        <li><a href="/admin/product/list?page=1&limit=<%=limit%>">First</a></li>
        <li><a href="/admin/product/list?page=<%=currentPage - 1%>&limit=<%=limit%>">Previous</a></li>
        <%}%>
        <% if (currentPage > 2) {%>
        <li><a href="/admin/product/list?page=<%=currentPage - 1%>&limit=<%=limit%>"><%= currentPage - 1%>
        </a></li>
        <%}%>
        <li><a href="/admin/product/list?page=<%=currentPage%>&limit=<%=limit%>"><%=currentPage%>
        </a></li>
        <%if ((currentPage + 1) < totalPage) {%>
        <li><a href="/admin/product/list?page=<%=currentPage + 1%>&limit=<%=limit%>"><%= currentPage + 1%>
        </a></li>
        <%}%>
        <% if (currentPage < totalPage) { %>
        <li><a href="/admin/product/list?page=<%=currentPage + 1%>&limit=<%=limit%>">Next</a></li>
        <li><a href="/admin/product/list?page=<%=totalPage%>&limit=<%=limit%>">Last</a></li>
        <%}%>
    </ul>
</div>
</body>
</html>
