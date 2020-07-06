<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
		function refresh() {  
        	//IE存在缓存,需要new Date()实现更换路径的作用  
        	document.getElementById("image").src="image.jsp?"+new Date();  
    	}
	</script>

  </head>
  
  <body>
   	 计算阶乘
    <form action="/train/servlet/result" method="post">
    	<input type="text" name="num"/><br/>
    	<input type="submit" value="提交"/>
    </form>
              计算X的Y次方
    <form action="/train/servlet/result2" method="post">
    	X<input type="text" name="X"/><br/>
    	Y<input type="text" name="Y"/><br/>
    	<input type="submit" value="提交"/>
    </form>
              生成随机数
    <form action="/train/servlet/result3" method="post">
    	<input type="submit" value="跳转"/>
    </form>
    <form action="train1/check.jsp">
    	用户名<input type="text" name="username"/><br/>
    	密码<input type="text" name="password"/><br/>
    	验证码<input type="text" name="code" onclick="refresh" maxlength="4"/>
    	<img id="image" src="/train/train1/image.jsp" /><br/>
    	<input type="submit" value="提交"/>
    </form>
  </body>
</html>
