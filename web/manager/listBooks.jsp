<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/login/header.jsp"%>
<style type="text/css">
	table
	{
		text-align: center;
	}
</style>
<center>
	<table frame="border" width="68%" text-align="center">
		<tr>
			<th>商品名</th>
<%--			<th>作者</th>--%>
			<th>单价</th>
			<th>描述</th>
			<th>所属分类</th>
			<th>图片</th>
			<th>操作</th>
		</tr>
		 <c:forEach items="${page.records}" var="b" varStatus="vs">
	    	<tr bgcolor="${vs.index%2==0?'#ADADAD':'#7DD96C'}">
				<td nowrap="nowrap">${b.name}</td>
<%--				<td nowrap="nowrap">${b.author}</td>--%>
				<td nowrap="nowrap">${b.price}</td>
				<td nowrap="nowrap">${b.description}</td>
				<td nowrap="nowrap">${myfn:showCategoryName(b.categoryId)}</td>
				<td nowrap="nowrap">
					<a href="${pageContext.request.contextPath}/images/${b.photo}">查看图片</a>
				</td>
				<td nowrap="nowrap">
					[<a href="#">修改</a>]
					[<a href="${pageContext.request.contextPath}/manager/ManagerServlet?operation=delBook&book_id=${b.id}">删除</a>]
				</td>
			</tr>
    	</c:forEach>
	</table>
	</center>
    <%@include file="/commons/page.jsp" %>
  </body>
</html>
