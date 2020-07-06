<%@ page language="java" import="java.util.*,my.bean.*" pageEncoding="UTF-8"%>

<html>
  <head>
    <title>My JSP 'all.jsp' starting page</title>
    <script type="text/javascript">
        function del(){
             if(confirm("确定要删除吗？")==true){
                 return true;
             }else{
                  return false;
             }
        }
    </script>
  </head>
  
  <body>
  <div style="border:3px  solid  green; padding:10px;background:lightblue;text-align:right; margin-bottom:30px">
     <a href="add.jsp">添加学生信息</a>
  </div>
      <%--显示所有学生记录 --%>
      <jsp:useBean id="studentDao" class="my.dao.StudentDao"></jsp:useBean>
      <%
           ArrayList<Student> list=studentDao.getAllStudent();
       %>
       <center>
           <table border="1" cellspacing="0" width="500">
                <caption>学生信息表2</caption>
                <th>学号</th><th>姓名</th><th>年龄</th><th>性别</th><th>操作</th>
                <%
                    for(int i=0;i<list.size();i++){
                %>
                       <tr align="center">
                           <td><%=list.get(i).getId() %></td>
                           <td><%=list.get(i).getName() %></td>
                           <td><%=list.get(i).getAge() %></td>
                           <td><%=list.get(i).getSex() %></td>
                           <td>
                           <a href="modify.jsp?id=<%=list.get(i).getId()%>">修改</a>
                           <a href="delete.jsp?id=<%=list.get(i).getId()%>" onclick="javascript: return del();">删除</a>
                           </td>
                       </tr>
                <%       
                    }
                 %>
           </table>
       
       </center>
  </body>
</html>
