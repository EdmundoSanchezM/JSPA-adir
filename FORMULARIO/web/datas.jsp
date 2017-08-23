<%-- 
    Document   : datas
    Created on : 22/08/2017, 08:11:03 AM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.io.*" %>
        <%@page import="java.sql.*" %>
        
        <%
        String nom;
        String am;
        String ap;
        String es;
        
        nom=request.getParameter("nombre");
        am=request.getParameter("AM");
        ap=request.getParameter("AP");
        es=request.getParameter("Esc");
        
        String connectionURL="jdbc:mysql://localhost:3306/form";
            Connection connection=null;
            java.sql.Statement statement=null;
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection= DriverManager.getConnection("jdbc:mysql://localhost/form","root","n0m3l0");
                statement=connection.createStatement();
            }
            catch(SQLException error){
            out.print(error.toString());
            }
            try {
                statement.executeUpdate("INSERT INTO formularioweb(Nombre,AM,AP,Esc)"+ "VALUES"+ "('"+nom+"','"+am+"','"+ap+"','"+es+"')");
                out.println("<script> alert('Registro dado de alta exitosamente.');</script>");
                connection.close();
                out.println("<META HTTP-EQUIV='REFRESH' CONTENT='.0000001;URL=http://localhost:8080/FORMULARIO/'>");
                } 
            catch (Exception e) {
                    out.println(e.toString());
            }
            connection.close();
        %>
    </body>
</html>
