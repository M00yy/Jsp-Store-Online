<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
    <title>My JSP 'add.jsp' starting page</title>
  </head>
  
  <body>
       <center>
           <form action="add1.jsp" method="get">
              <table border="1" cellspacing="0"  width="240">
                <tr>
                    <td>姓名</td>
                    <td><input type="text" name="name"></td>
                </tr>
                 <tr>
                    <td>年龄</td>
                    <td><input type="text" name="age"></td>
                </tr>
                 <tr>
                    <td>性别</td>
                    <td>
                          <input type="radio" name="sex"  value="男" checked="checked">男
                          <input type="radio" name="sex"  value="女" >女
                    </td>
                </tr>
                <tr>
                   <td colspan="2" align="center">
                       <input type="submit" value="添加" name="submit">
                   </td>
                </tr>
              </table>
           </form>
       </center>
  </body>
</html>
