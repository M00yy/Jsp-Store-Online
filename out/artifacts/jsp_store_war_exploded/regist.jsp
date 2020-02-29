<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
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
<br>
<br>
<br>

<form action="${pageContext.request.contextPath}/client/ClientServlet?operation=regist" method="post">
    	<center>
    	<h3>注册</h3>
    	<hr>
    	<br>
    	*用户名：<input type="text" name="username"/><br/>
    	<br>
    	*昵称：<input type="text" name="nick"/><br/>
    	<br>
    	*密码：<input type="password" name="password"/><br/><br>
    	*电话：<input type="text" name="phonenum"/><br/><br>
    	*邮寄地址：<input type="text" name="address"/><br/><br>
    	*邮箱：<input type="text" name="email"/><br/><br>
    	<input type="submit" value="注册"/>
    	</center>
    </form>
</div>
 
    
    </div>

    </div>
    <%@include file="/foot.jsp" %>
    
  </body>
</html>


