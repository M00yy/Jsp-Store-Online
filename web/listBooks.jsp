<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<style type="text/css">
	body
	{
		background-image: url(images/p3.jpg);
	}
	table
	{
		text-align:center
	}
	.aa
	{
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
<h3 style="text-align:center"> 最新商品</h3>
<hr>
   <table style="font-size: 12px" align="center">
	<tr>
    		<c:forEach items="${page.records}" var="b">
	    		<td>
	    			<img width="150px" height="200px" src="${pageContext.request.contextPath}/images/${b.photo}" alt="${b.name}"><br/>
	    			书名：${b.name}&nbsp;&nbsp;<br>
	    			价格：￥${b.price}<br/>
	    			<a href="${pageContext.request.contextPath}/client/ClientServlet?operation=buy&bookId=${b.id}">购买</a>
					&nbsp;<a href="${pageContext.request.contextPath}/client/ClientServlet?operation=showDetail&bookId=${b.id}">详情</a>
	    		</td>
    		</c:forEach>
    	</tr>
    	<tr>
    	<td colspan="3"><%@include file="/commons/page.jsp"%></td>
    	</tr>
    </table>
        
</div>
 
    
    </div>

    </div>
    <%@include file="/foot.jsp" %>
    
  </body>
</html>
