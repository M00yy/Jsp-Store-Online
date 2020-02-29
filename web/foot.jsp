<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

	<style type="text/css">
	
		a{text-decoration: none;
			color: purple;
			font-size: 15px;
			font-weight:bolder;
			white-space: nowrap;
			display: inline-block;
			text-align: center; 
			width:100px;
			height:20px;
			}
.foot{
height:150px;
width:100%;

}
.footer{
padding-top:15px;
text-align: center; 
height:50px;
width:100%;
background:burlywood;
}
.footer2{
padding-top:15px;

height:100px;
width:100%;
background:palegoldenrod;
}
	
		</style>
  </head>
  
  <body>
    <div class="foot">
    <div class="footer">
     <span>
                   <nav> 
                   <a href="#" style="color: white;">关于我们</a>
					<a href="#" style="color: white;">版权声明</a>
					<a href="#" style="color: white;">联系我们</a>
					<a href="#" style="color: white;">网站声明</a>
					<a href="#" style="color: white;">来购联盟</a>
					<a href="${pageContext.request.contextPath}/login/login.jsp" style="color: white;">后台管理</a>
					</nav>
				</span>
    </div>
     
    </div>
  </body>
</html>
