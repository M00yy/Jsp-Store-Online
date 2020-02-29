<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/header.jsp"%>
<head>
<style type="text/css">
body{
background-image: url(images/p3.jpg);


}
	table
	{
		border-collapse:collapse;
        text-align: center;
	}
	table,th,td
	{
		border:1px solid black;
		background-color: aliceblue;
	}

</style>
</head>
<html>
<body>
	<br/>
	<center>
	<h3>订单详情</h3>
	收货地址：${sessionScope.user.address }<br/>
	收件人：${sessionScope.user.nick }<br/>
	电话：${sessionScope.user.phonenum }<br/><br/>
    <table style="font-size: 12px" width="68%" border="1">
	    	<tr>
	    		<th>商品名称</th>
	    		<th>单价</th>
	    		<th>数量</th>
	    		<th>小计</th>
	    		<th>操作</th>
	    	</tr>
	    	<c:forEach items="${items}" var="i" varStatus="vs">
	    		<tr bgcolor="${vs.index%2==0?'#ADADAD':'#7DD96C'}">
		    		<td>
		    				<img width="100" height="100" src="${pageContext.request.contextPath}/images/${i.book.photo}"/>
		    				<br>${i.book.name}
		    		</td>
		    		<td>${i.book.price}</td>
		    		<td>${i.num}</td>
		    		<td>${i.price}</td>
		    		<td>
		    			[<a href="#">修改</a>]
		    			[<a href="#">删除</a>]
		    		</td>
		    	</tr>
	    	</c:forEach>
	    </table>
	    </center>
	    <br>
	    <br>
	    <%@include file="/foot.jsp"%>
  </body>
</html>
