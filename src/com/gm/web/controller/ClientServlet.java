package com.gm.web.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gm.domain.Book;
import com.gm.domain.Category;
import com.gm.domain.Orders;
import com.gm.domain.OrdersItem;
import com.gm.domain.User;
import com.gm.service.BusinessService;
import com.gm.service.impl.BusinessServiceImpl;
import com.gm.util.IdGenerator;
import com.gm.util.PaymentUtil;
import com.gm.util.PropertyUtil;
import com.gm.util.WebUtil;
import com.gm.web.bean.Cart;
import com.gm.web.bean.CartItem;
import com.gm.web.bean.Page;

public class ClientServlet extends HttpServlet {
	private BusinessService s = new BusinessServiceImpl();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String operation = request.getParameter("operation");
		if("showAllBooks".equals(operation)){
			showAllBooks(request,response);
		}else if("showCategoryBooks".equals(operation)){
			showCategoryBooks(request,response);
		}else if("buy".equals(operation)){
			buy(request,response);
		}else if("genOrders".equals(operation)){
			genOrders(request,response);
		}else if("regist".equals(operation)){
			regist(request,response);
		}else if("login".equals(operation)){
			login(request,response);
		}else if("active".equals(operation)){
			active(request,response);
		}else if("logout".equals(operation)){
			logout(request,response);
		}else if("showSelfOrders".equals(operation)){
			showSelfOrders(request,response);
		}else if("paySuccess".equals(operation)){
			paySuccess(request,response);
		}else if("showOrdersDetail".equals(operation)){
			showOrdersDetail(request,response);
		}else if("judge".equals(operation)){
			judge(request,response);
		}else if("update".equals(operation)){
			update(request,response);
		}else if("j1".equals(operation)){
			j1(request,response);
		}else if ("showDetail".equals(operation)){
			showDetail(request,response);
		}
	}
	//根据订单的id查询订单项
	private void showOrdersDetail(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String ordersId = request.getParameter("ordersId");
		//查订单项
		List<OrdersItem> items = s.findOrdersItemByOrdersId(ordersId);
		request.setAttribute("items", items);
		request.getRequestDispatcher("/showOrdersDetail.jsp").forward(request, response);
	}
	//处理支付结果的：根据支付结果该订单状态
	private void paySuccess(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String p1_MerId = request.getParameter("p1_MerId");
		String r0_Cmd = request.getParameter("r0_Cmd");
		String r1_Code = request.getParameter("r1_Code");//支付结果：1才是成功
		String r2_TrxId = request.getParameter("r2_TrxId");
		String r3_Amt = request.getParameter("r3_Amt");
		String r4_Cur = request.getParameter("r4_Cur");
		String r5_Pid = request.getParameter("r5_Pid");
		String r6_Order = request.getParameter("r6_Order");
		String r7_Uid = request.getParameter("r7_Uid");
		String r8_MP = request.getParameter("r8_MP");
		String r9_BType = request.getParameter("r9_BType");
//		为“1”: 浏览器重定向;
//		 为“2”: 服务器点对点通讯.
		String  hmac= request.getParameter("hmac");
		
		//验证数据是否正确
		boolean b = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, PropertyUtil.getValue("keyValue"));
		if(!b){
			response.getWriter().write("交易失败！可能存在风险！");
			return;
		}
		//数据没有问题
		if("1".equals(r1_Code)){
			//支付成功：找到订单，更改订单的状态。防止表单的重复提交r6_Order
			
//			if("2".equals(r9_BType)){
//				response.getWriter().write("success");
//			}
			//找到订单，更改状态为1 已付款
			s.paiedOrders(r6_Order);
			response.getWriter().write("支付成功！2秒后将自动转向该网站的主页");
			response.setHeader("Refresh", "2;url="+request.getContextPath());
		}
	}
	//查看当前用户的订单
	private void showSelfOrders(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		//判断用户是否登录
		User user = (User) request.getSession().getAttribute("user");
		if(user==null){
			//没有登陆：转向登陆页面
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}else{
			//已登录：查看订单的信息。按照日期进行排序 降序
			List<Orders> orders = s.findOrdersByUserId(user.getId());
			request.setAttribute("os", orders);
			request.getRequestDispatcher("/showOrders.jsp").forward(request, response);
		}
	}
	//注销
	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().removeAttribute("user");
		response.getWriter().write("注销成功！2秒后将自动转向该网站的主页");
		response.setHeader("Refresh", "2;url="+request.getContextPath());
	}
	//激活
	private void active(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		if(code!=null){
			User user = s.findUserByCode(code);
			if(user==null){
				request.setAttribute("message", "<script type='text/javascript'>alert('激活码不正确或已失效')</script>");
				request.getRequestDispatcher("/").forward(request, response);
			}else{
				s.active(user);//激活账户
				response.getWriter().write("激活成功！2秒后将自动转向该网站的主页");
				response.setHeader("Refresh", "2;url="+request.getContextPath());
			}
		}
	}
	//用户登陆
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = s.login(username,password);
		if(user==null){
			request.setAttribute("message", "<script type='text/javascript'>alert('错误的用户名或密码，或者您的账户还木有激活')</script>");
		}else{
			request.getSession().setAttribute("user", user);
		}
		request.getRequestDispatcher("/").forward(request, response);
	}
	//新用户注册
	private void regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = WebUtil.findFormData(User.class, request);
		String code = IdGenerator.genPK();
		user.setCode(code);

		user.setActived(true);
		
		s.regist(user);
		request.setAttribute("message", "<script type='text/javascript'>alert('注册成功')</script>");
		request.getRequestDispatcher("/").forward(request, response);
		
	}
	private void judge(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		//判断用户是否登录
		User user = (User) request.getSession().getAttribute("user");
		if(user==null){
			//没有登陆：转向登陆页面
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}else{
			//已登录
			response.sendRedirect(request.getContextPath()+"/info.jsp");
		}
	}
	private void j1(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		//判断用户是否登录
		User user = (User) request.getSession().getAttribute("user");
		if(user==null){
			//没有登陆：转向登陆页面
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}else{
			//已登录
			response.sendRedirect(request.getContextPath()+"/showCart.jsp");
		}
	}
	private void update(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		//判断用户是否登录
		User user = (User) request.getSession().getAttribute("user");
		s.active(user);
		request.setAttribute("message", "<script type='text/javascript'>alert('修改成功')</script>");
		request.getRequestDispatcher("/").forward(request, response);
	}
	//生成用户的订单
	private void genOrders(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		//判断用户是否登录
		User user = (User) request.getSession().getAttribute("user");
		if(user!=null){
			//登陆了：把购物车及购物项的内容信息保存到数据库中
				//把购物车中的信息取出来，存到实体中
				Cart cart = (Cart)request.getSession().getAttribute("cart");
				if(cart!=null){
					//保存实体数据到数据库中
					Orders o = new Orders();
					o.setNum(cart.getTotalNum());
					o.setMoney(cart.getTotalPrice());
					o.setUser(user);//建立与用户的关系
					//订单项
					for(Map.Entry<String, CartItem> me:cart.getItems().entrySet()){
						OrdersItem item = new OrdersItem();
						item.setNum(me.getValue().getNum());
						item.setPrice(me.getValue().getPrice());
						item.setBook(me.getValue().getBook());
						o.getItems().add(item);//把订单项加入到订单中
					}
					s.genOrders(o);//生成订单
					
				}else{
					throw new RuntimeException("购物车有误");
				}
				request.setAttribute("message", "<script type='text/javascript'>alert('订单生成成功')</script>");
				request.getRequestDispatcher("/").forward(request, response);
		}else{
			//没有登陆：转向登陆页面
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
	}
	//把购买的书籍放入购物车中
	private void buy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//得到购买的商品的id
		String bookId = request.getParameter("bookId");
		//得到哪个商品
		Book book = s.findBookById(bookId);
		//先得购物车,没有，创建一个弄进去
		HttpSession session = request.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		if(cart==null){
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		cart.addBook(book);
		//提示购买成功
		request.setAttribute("message", "<script type='text/javascript'>alert('添加成功')</script>");
		request.getRequestDispatcher("/").forward(request, response);
	}
	//按照分类查询分页数据
	private void showCategoryBooks(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String pagenum = request.getParameter("pagenum");
		String categoryId = request.getParameter("categoryId");
		Page page = s.findAllBooksByCategory(pagenum,categoryId);
		page.setUrl("/client/ClientServlet?operation=showCategoryBooks&categoryId="+categoryId);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/listBooks.jsp").forward(request, response);
	}
	//显示所有商品的分页数据，查询分类信息
	private void showAllBooks(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String pagenum = request.getParameter("pagenum");
		Page page = s.findAllBooks(pagenum);
		page.setUrl("/client/ClientServlet?operation=showAllBooks");
		request.setAttribute("page", page);
		//查询所有分类信息
		List<Category> cs = (List<Category>) getServletContext().getAttribute("cs");
		if(cs==null||cs.size()<1){
			cs = s.findAllCategories();
			getServletContext().setAttribute("cs", cs);
		}
		request.getRequestDispatcher("/listBooks.jsp").forward(request, response);
	}
	private void showDetail(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		String bookId = request.getParameter("bookId");

		Book id = s.findBookById(bookId);
//		System.out.println(id.getId());
//		System.out.println(id.getPrice());
//		System.out.println(id.getDescription());
		HttpSession session = request.getSession();

		session.setAttribute("id",id.getId());
		session.setAttribute("name",id.getName());
		session.setAttribute("img",id.getPhoto());
		session.setAttribute("author",id.getAuthor());
		session.setAttribute("price",id.getPrice());
		session.setAttribute("des",id.getDescription());
		request.getRequestDispatcher("/show.jsp").forward(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
