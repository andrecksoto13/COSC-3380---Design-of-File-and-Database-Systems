<%-- 
    Document   : index
    Created on : Jun 21, 2020, 11:17:18 PM
    Author     : andre
--%>
<%@ page import= "java.sql.*"%>
<%@ page import= "java.io.*"%>
<%   Class.forName("oracle.jdbc.driver.OracleDriver");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>JSP Page connecting to Oracle 12c Table! </h1>

        <%
String url = "jdbc:oracle:thin:@129.7.240.3:1521:ORCL";

            
    //Establish Connection
    Connection conn = DriverManager.getConnection(url, "SOTOA", "SOTOA#");
                    
    Statement statement = conn.createStatement();
    ResultSet resultset = statement.executeQuery ("SELECT ts.sessionnum, ts.patientid,  ts.sessiondate, p.patienthlastname, p.patientfirstname FROM therapysession ts, patient p WHERE ts.patientID = p.patientID ORDER BY p.patienthlastname"); 

        %>
        <TABLE BORDER = "1" BGCOLOR = "CCFFFF" width = '50%' cellspacing = '1' cellpadding = '0' bordercolor ='black' border ='1'
               <TR>
                <TH bgcolor = '#DAA520'> <font size='2'/> Patient Number </TH>
                <TH bgcolor = '#DAA520'> <font size='2'/> Patient Last Name </TH>
                <TH bgcolor = '#DAA520'> <font size='2'/> Patient First Name </TH>
                <TH bgcolor = '#DAA520'> <font size='2'/> Session Date </TH>                  
                <TH bgcolor = '#DAA520'> <font size='2'/> Session Number </TH>
            </TR>
          <% while (resultset.next())     {%>

                 <TR>
                     <TD> <font size='2'/><center><%= resultset.getString(1)%></center></TD>
                     <TD> <font size='2'/><center><%= resultset.getString(2)%></center></TD>
                     <TD> <font size='2'/><center><%= resultset.getString(3)%></center></TD>
                     <TD> <font size='2'/><center><%= resultset.getString(4)%></center></TD>
                     <TD> <font size='2'/><center><%= resultset.getString(5)%></center></TD>
                           
            </TR>
<% } %>
    </table>

    </body>
</html>
