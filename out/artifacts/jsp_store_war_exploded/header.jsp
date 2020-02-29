<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.twy.com/jsp/jstl/myfn" prefix="myfn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>欢迎光临</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
		<meta charset="utf-8" />
		<title></title>
		<style type="text/css">
		a{text-decoration: none;
			color: purple;
			font-size: 15px;
			white-space: nowrap;
	
			}
			.b2 a{
			
			display: inline-block;
			text-align: center; 
			width:100px;
			height:20px;
			}
	     .a{
				height: 90px;
				width: 100%;
				padding-bottom:10px;
				
			}
			.b1{
				height: 40px;
				width:100%;
				font-color: purple;
			    font-size: 15px;
				background:lightgoldenrodyellow;
			}
			
			.b2{
				height: 40px;
				width: 100%;
				background:plum;
				padding-top:10px;
				font-color: white;
				
			}

		</style></head>

<body>
<div>
	<h1 align="center">杂货店</h1>
</div>
		<div class="a">
			<div class="b1" >
				${message}
	<br/>
	<a href="${pageContext.request.contextPath}">首页</a>
	<c:if test="${sessionScope.user==null}">
		<a href="${pageContext.request.contextPath}/regist.jsp">注册</a>
		<a href="${pageContext.request.contextPath}/login.jsp">登陆</a>
	</c:if>
<a href="${pageContext.request.contextPath}/client/ClientServlet?operation=j1">购物车
	<c:if test="${sessionScope.cart!=null}">
		(${sessionScope.cart.totalNum})</a>
	</c:if>
	<a href="${pageContext.request.contextPath}/client/ClientServlet?operation=judge">会员中心</a>
	<a href="${pageContext.request.contextPath}/client/ClientServlet?operation=showSelfOrders">我的订单</a>
		<c:if test="${sessionScope.user!=null}">
		<a href="${pageContext.request.contextPath}/client/ClientServlet?operation=logout">注销</a>
		欢迎您：${sessionScope.user.nick}
	</c:if>
	<br/>
			</div>
			
		    <div class="b2" >
		    <span>
		    商品分类：
		<c:forEach items="${applicationScope.cs}" var="c">
  				<a style="color: white;" href="${pageContext.request.contextPath}/client/ClientServlet?operation=showCategoryBooks&categoryId=${c.id}">${c.name}</a>
  		</c:forEach>
				</span>
		    </div>
</div>
</body>
</html>
