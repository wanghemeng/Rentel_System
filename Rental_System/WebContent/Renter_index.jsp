<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import="java.sql.*" import="java.util.*"
	import="jdbcfunction.*"%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>欢迎！尊敬的用户！</title>
<style type="text/css">
input {
	border: 1px solid #ccc;
	padding: 7px 0px;
	border-radius: 3px;
	padding-left: 5px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
}

input:focus {
	border-color: #66afe9;
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6)
}

body {
	background: #3299cc;
}

select {
	width: auto;
	padding: 0 2%;
	margin: 0;
	background: transparent;
	font-size: 16px;
	border: 1px solid #ccc;
	height: 34px;
	-webkit-appearance: none;
	bgcolor: text-align:center;
	text-align-last: center;
}
table {
				background: #FFFFF;
				margin: 10px auto;
				border-collapse: collapse;/*border-collapse:collapse合并内外边距(去除表格单元格默认的2个像素内外边距*/	
			}
</style>
<style>
* {
	padding: 0;
	margin: 0;
} /* 先重置一下html，消除HTML标签默认的内外边距 */
.wrap {
	width: 800px;
	margin: 0 auto;
} /* 对导航的内容设置一个主体为800px的宽并使其居中 */
.clear {
	clear: both;
} /* 清除浮动 */
a {
	text-decoration-line: none;
} /* 去掉默认a标签的下划线 */
ul, li {
	list-style: none;
	 position:relative;
	 
}
nav .level>li {
	float: left;
	width: 16.66%;
	text-align: center;
	background: AliceBlue;
	padding: 10px 0;
	font-size: 16px;
	transition: .4s;
}

nav .level>li a {
	color: black;
}

nav .level>li:hover {
	background: Aquamarine;
} /* 设置鼠标滑过后的样式 */
nav .two {
	display: none;
	margin-top: 10px;
} /* 先使二级菜单的内容隐藏 */
nav .level>li:hover .two {
	display: block;
} /* 鼠标滑过一级菜单后的显示二级菜单 */
nav .two li {
	padding: 5px 0;
	transition: .4s;
	cursor: pointer;
}

nav .two li:hover {
	background: AliceBlue;
}
</style>

<%
	//获取登陆的账号和密码信息
	String code = request.getParameter("username");
	String password = request.getParameter("password");
	//out.print("用户账号为"+code);
	//out.print("密码为"+password);
%>

<%
	ResultSet rs = new select_table().read_car();
%>
<script type="text/javascript">
	function Personal_Message() {
<%rs = new select_table().read_car();
			out.print("<table border=2 align=center >");
			out.print("<tr><td>车辆编号</td><td>车型</td><td>车辆租赁状态（0/1）</td><td>管理员编号</td><td>异常描述</td></tr>");
			while (rs.next()) {
				String car_code = rs.getString("Car_Code");
				String model = rs.getString("Model");
				String rent = rs.getString("rent");
				String manager = rs.getString("Manager_Code");
				String note = rs.getString("note");
				out.print("<tr><td>" + car_code + "</td>");
				out.print("<td>" + model + "</td>");
				out.print("<td align = center >" + rent + "</td>");
				out.print("<td>" + manager + "</td>");
				out.print("<td>" + note + "</td></tr>");

			}
			out.print("</table>");%>
	}
</script>
</head>

<body>
	<div align="center">
		<table width="670" border="0" align="center" bgcolor=#ffffff>
			<tr>
				<td height="10" valign="top" align="center"><nav>
					<div class="wrap" align="center"  style="position:absolute" >
						<ul class="level">
							<li><a href="">首页</a></li>
							<li><a href="">个人信息</a>
								<ul class="two">
									<li><a href="Renter_index.jsp?value=1&username=<%=code%>">用户个人信息</a></li>
									<li><a href="Renter_index.jsp?value=2&username=<%=code%>">个人信息修改</a></li>
								</ul></li>
							<li><a href="">账单信息</a>
								<ul class="two">
									<li><a href="Renter_index.jsp?value=4&username=<%=code%>">新增订单信息</a></li>
									<li><a href="Renter_index.jsp?value=5&username=<%=code%>">订单信息查询</a></li>
									<li><a href="Renter_index.jsp?value=8&username=<%=code%>">账单信息查询</a></li>
									<li><a href="Renter_index.jsp?value=9&username=<%=code%>">账单信息申诉</a></li>
								</ul></li>
							<li><a href="">财务信息</a>
								<ul class="two">
									<li><a href="Renter_index.jsp?value=6&username=<%=code%>">个人余额查询</a></li>
									<li><a href="Renter_index.jsp?value=7&username=<%=code%>">个人余额充值</a></li>
									<li><a href="Renter_index.jsp?value=13&username=<%=code%>">个人余额提现</a></li>
								</ul></li>
							<li><a href="">综合查询</a>
								<ul class="two">
									<li>公司简介</li>
									<li>公司位置</li>
									<li>工作机会</li>
									<li>联系我们</li>
								</ul></li>
						</ul>
					</div>
					</nav></td>
			</tr>
			<tr>
				<td height="544" align="center" valign="center"><jsp:include flush="true"
						page="Renter_content.jsp"></jsp:include></td>
			</tr>
		</table>
	</div>
</body>
</html>