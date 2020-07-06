<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
    <title>My JSP 'modify1.jsp' starting page</title>
  </head>
  
  <body>
   <jsp:useBean id="studentDao" class="my.dao.StudentDao"></jsp:useBean>
   <jsp:useBean id="student" class="my.bean.Student"></jsp:useBean>
   <jsp:setProperty property="*" name="student"/>
        <%
             int id=Integer.parseInt(request.getParameter("id"));
             studentDao.modifyStudent(student, id);
             out.print("<script>alert('修改成功！')</script>");
             out.print("<a href='all.jsp'>返回</a>");
         %>
  </body>
</html>
