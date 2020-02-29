<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/header.jsp"%>
	<br/>
<style type="text/css">
body{
background-image: url(images/p3.jpg);


}
	table
	{
		border-collapse:collapse;
	}
	table,th,td
	{
		border:1px solid black;
		background-color: aliceblue;
	}
</style>
<center>
	<h3>您购买的商品如下</h3>
	
	<c:if test="${empty sessionScope.cart.items}">
		<h4>您还没有购买任何商品</h4>
	</c:if>
	</center>
	<c:if test="${!empty sessionScope.cart.items}">
		<center>
	    <table style="font-size: 12px" width="68%" border="1">
	    	<tr>
				<th>商品</th>
				<th>书名</th>
	    		<th>单价</th>
	    		<th>数量</th>
	    		<th>小计</th>
	    		<th>操作</th>
	    	</tr>
	    	<c:forEach items="${sessionScope.cart.items}" var="me" varStatus="vs">
	    		<tr bgcolor="${vs.index%2==0?'#ADADAD':'#7DD96C'}" align="center">
					<td><img src="${pageContext.request.contextPath}/images/${me.value.book.photo}" width="200" height="200" alt="${b.name}"></img></td>
					<td>${me.value.book.name}</td>
<%--		    		<td>${me.value.book.author}</td>--%>
		    		<td>${me.value.book.price}</td>
		    		<td>${me.value.num}</td>
		    		<td>${me.value.price}</td>
		    		<td>
		    			[<a href="#">删除</a>]
		    		</td>
		    	</tr>
	    	</c:forEach>
	    	<tr>
	    		<td colspan="6" align="right">
	    			总计数量：${sessionScope.cart.totalNum}&nbsp;&nbsp;
	    			应付款：${sessionScope.cart.totalPrice}&nbsp;&nbsp;
	    			<a href="${pageContext.request.contextPath}/client/ClientServlet?operation=genOrders">生成订单</a>
					&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/index.jsp">继续购物</a>
	    		</td>
	    	</tr>
	    </table>
		</center>
    </c:if>
    </center>
    <br>
    <br>
    <br>
    <%@include file="/foot.jsp"%>
  </body>
</html>
