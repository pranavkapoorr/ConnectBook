<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
         <link href="css/loginsignup.css" type="text/css" rel="stylesheet" />
    </head>

       
       <body class="bg">
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <form name="login" action="/enter" method="POST" >
            <p>&nbsp;</p>
            <table width="350" border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2"><h1>Login</h1></th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr>
                        <td><font color="white">Username</font></td>
                        <td><input type="text" name="username" value="" /></td>
                    </tr>
                    <tr>
                        <td><font color="white">Password</font></td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Login!" name="submit"  /><input type="reset" value="reset" name="reset" /></td>
                    </tr>
                     <tr>
                     <!--  <td></td>
                       <td><input type="submit" name="signup" id="signup" value="Signup!"/></td>-->
                     </tr>
                     <tr><td><font color="white"><label><input type="checkbox" name="remember"/>Stay Logged-in</label></font></td></tr>
                     <tr>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
          </table>
       </form>
    </body>
</html>
