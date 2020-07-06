<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>My JSP 'delete.jsp' starting page</title>
    
  </head>
  
  <body>
     <jsp:useBean id="studentDao" class="my.dao.StudentDao" />
     <%
         int id=Integer.parseInt(request.getParameter("id"));
         studentDao.deleteStudent(id);
         out.print("<script>alert('删除成功！')</script>");
         out.print("<a href='all.jsp'>返回</a>");
      %>
  </body>
</html>
