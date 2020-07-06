<%@ page language="java" import="java.util.*,my.bean.*" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>My JSP 'modify.jsp' starting page</title>
  </head>
  
  <body>
        <jsp:useBean id="studentDao" class="my.dao.StudentDao"></jsp:useBean>
        <%
             int id = Integer.parseInt(request.getParameter("id"));
             Student student = studentDao.findStudentById(id);
         %>
         <center>
             <form action="modify1.jsp?id=<%= id %>" method="post">
                 <table border="1" cellspacing="0" width="320">
                    <tr>
                        <td>姓名</td>
                        <td><input type="text" name="name" value="<%=student.getName() %>"></td>
                    </tr>
                    <tr>
                        <td>年龄</td>
                        <td><input type="text" name="age" value="<%=student.getAge() %>"></td>
                    </tr>
                    <tr>
                        <td>性别</td>
                        <%
                            if(student.getSex().equals("男")){
                         %>
                               <td>
                                   <input type="radio" name="sex" value="男" checked="checked">男
                                   <input type="radio" name="sex" value="女" >女
                               </td>
                         <%}else{ %>
                                <td>
                                   <input type="radio" name="sex" value="男" >男
                                   <input type="radio" name="sex" value="女"  checked="checked">女
                               </td>
                         <%} %>
                    </tr>
                    <tr>
                       <td colspan="2" align="center">
                          <input type="submit" value="修改" name="submit">
                       </td>
                    </tr>
                 </table>
             </form>
         </center>
  </body>
</html>
