<%--
  Created by IntelliJ IDEA.
  User: m00yy
  Date: 2020/2/27
  Time: 9:38 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品详情</title>
    <style type="text/css">
        body
        {
            background: url(images/login-bg.png);
        }
		.aa
		{
			background-image: url(images/p3.jpg);
			height:800px;
			width:100%;
		}
		.left
		{
			height:800px;
			width:35%;
			float:left;
		}
		.right
		{
			height:800px;
			float:right;
			width:60%;
			padding-left:4%;
		}

	</style>
</head>
<body background="images/login-bg.png">

<%@include file="/header.jsp"%>
<div class="aa">
<div class="left">
 <%@include file="/left.jsp" %>
</div>
<div class="right">
<center>
<h3 align="center">商品详情</h3>
<hr>

<img width="300" height="450" src="${pageContext.request.contextPath}/images/${sessionScope.img}"/>
<br>
<table>
    <tr>
        <td>商品名：</td>
        <td>${sessionScope.name}</td>
    </tr>
    <tr>
        <td>商品简介：</td>
        <td>${sessionScope.des}</td>
    </tr>
    <tr>
        <td>价格：</td>
        <td>¥ ${sessionScope.price}</td>
    </tr>
    <tr>
        <td>厂商/作者：</td>
        <td>${sessionScope.author}</td>
    </tr>
    <tr aria-colspan="4">
        <td align="center" style="font-size: xx-large" ><a href="${pageContext.request.contextPath}/client/ClientServlet?operation=buy&bookId=${b.id}">加入购物车</a></td>
        <td align="center" style="font-size: xx-large" ><a href="${pageContext.request.contextPath}/index.jsp">返回</a></td>
    </tr>
</table>
</center>
</div>
</div>

    <%@include file="/foot.jsp" %>
</body>
</html>
