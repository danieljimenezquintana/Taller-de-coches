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
      request.setCharacterEncoding("UTF-8");

      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/coches", "root", "");
      Statement s = conexion.createStatement();

      String insercion = "INSERT INTO piezas (piezas, id_coche, descripcion) ";
      insercion += "VALUES ('";
      insercion += request.getParameter("piezas") + "', '";
      insercion += request.getParameter("id_coche") + "', '";
      insercion += request.getParameter("descripcion") + "')";

      //out.print(insercion);
      s.execute(insercion);
      conexion.close();
    %>

    <script>
      //Redirecciona a la página principal
      location.replace("reparar.jsp?id=<%=request.getParameter("id_coche")%>");
    </script>
  </body>
</html>