<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Garaje</title>
  </head>
  <body>
<%
    session.removeAttribute("uname");
    session.removeAttribute("error");
%>
    <script>
            location.replace("index.jsp");
    </script>