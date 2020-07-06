<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>My JSP 'add1.jsp' starting page</title>
  </head>
  
  <body>
       <jsp:useBean id="student" class="my.bean.Student"></jsp:useBean>
       <jsp:setProperty property="*" name="student"/>
       <jsp:useBean id="studentDao" class="my.dao.StudentDao"></jsp:useBean>
       <%
           studentDao.addStudent(student);
           out.print("添加成功!&nbsp;&nbsp;&nbsp;");
           out.print("<a href='all.jsp'>返回</a>");
        %>
  </body>
</html>
