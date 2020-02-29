<%--
  Created by IntelliJ IDEA.
  User: m00yy
  Date: 2020/2/20
  Time: 3:46 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>会员中心</title>
</head>
<body>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <br/>
<style type="text/css">
    table,th,td
    {
        background-color: aliceblue;
        padding: 10px;
    }
    body{
background-image: url(images/p3.jpg);


}
</style>
<head>
<style type="text/css">
body{
background-image: url(images/p3.jpg);


}
.aa{
height:800px;
width:100%;
}
.left{
height:800px;
width:35%;
float:left;
}
.right{
height:800px;
float:right;
width:60%;
padding-left:4%;
}

	</style>
</head>
<body>
<%@include file="/header.jsp"%>
<div class="aa">
    <div class="left">
     <%@include file="/left.jsp" %>
    </div>
    
<div class="right">
<div>
<img alt="" src="images/p2.jpg" style="height:25% ;width:80%">
<br>
<img alt="" src="images/p4.jpg" style="height:25% ;width:80%">
</div>
<div>
<h1 align="center">个人信息修改</h1>
<hr>
    <form action="${pageContext.request.contextPath}/client/ClientServlet?operation=update" method="post">
        <center>
        <table>
            <tr>
                <td>*昵称</td>
                <td><input type="text" required="required" name="nick"/></td>
            </tr>
            <tr></tr>
            <tr>
                <td>*真实姓名</td>
                <td><input type="text" required="required" name="username"></td>
            </tr>
            <tr></tr>
            <tr>
                <td>*邮寄地址</td>
                <td><input type="text" name="address" required="required"/></td>
            </tr>
            <tr></tr>
            <tr>
                <td>*邮箱</td>
                <td><input type="email" required="required" name="email"/></td>
            </tr>
            <tr></tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="保存"></td>
            </tr>
        </table>
        </center>
    </form>
    <br>
    <br>
    </div>
 
    
    </div>

    </div>
    <%@include file="/foot.jsp" %>
</body>
</html>

