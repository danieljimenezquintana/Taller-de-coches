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
    String usuario = request.getParameter("usuario");    
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coches",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from usuario where uname='" + usuario + "' and pass='" + password + "'");
    if (rs.next()) {
        session.setAttribute("userid", usuario);
         response.sendRedirect("Pagprin.jsp");
    } else {
        session.setAttribute("error", "Error, usuario o contraseña incorrecto.");
       response.sendRedirect("index.jsp");
    }
%>
