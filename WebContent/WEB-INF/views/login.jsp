<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
       <style>
       body{
   background-color: rgb(58, 87, 149);
	font-family: Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    
}
h1{
    color: white;
}
       
       </style>
    </head>
       <body class="bg">
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <form:form action="login" method="POST" commandName="login">
            <p>&nbsp;</p>
            <table width="350" border="0" align="left">
                <thead>
                    <tr>
                        <th colspan="2"><h1>Login</h1></th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr>
                        <td><form:label path="username"><font color="white">Username</font></form:label></td>
                        <td><form:input type="text"  path="username" /></td>
                    </tr>
                    <tr>
                        <td><form:label path="password"><font color="white">Password</font></form:label></td>
                        <td><form:input type="password"  path="password" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Login!" name="submit"  /><input type="reset" value="reset" name="reset" /></td>
                    </tr>
                     <tr>
                       <td></td>
                     
                     </tr>
                     <tr><td><font color="white"><label><input type="checkbox" name="remember">Stay Logged-in</label></font></td></tr>
                     <tr>
                        <td></td>
                        <td><%
                            
                            %></td>
                    </tr>
                </tbody>
          </table>
       </form:form>
    </body>
</html>