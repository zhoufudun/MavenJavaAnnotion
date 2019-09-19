<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1" />
<link href="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
<script src="${pageContext.request.contextPath}/static/jquery/jquery-3.1.1.js" type="text/javascript"></script>
<title>主页</title>
<style type="text/css">
	body{
		font-size:16px;
	}
</style>
<script type="text/javascript">
	function checkForm(){
		var userName=$("#userName").val();
		var password=$("#password").val();
		if(userName==null||userName==""){
			$("#error").html("用户名不能为空！");
			return false;
		}
		if(password==null||password==""){
			$("#error").html("密码不能为空！");
			return false;
		}
		return true;
	}
</script>
</head>
<body >
	<div data-role="page" style="background-color:white;">
		  <div data-role="header" data-position="fixed">
		   	 <a href="${pageContext.request.contextPath}/productMessageLogin.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
   		  	 <h1>系统登陆</h1>
 		  </div>
 		  <div data-role="content" >
		  	<form action="${pageContext.request.contextPath}/user/user/login.do" method="POST" onsubmit="return checkForm();">
				<h1 align="center">用户登录</h1>
					<table align="center">
						<tr>
							<td align="center">
								用户名：<input type="text" name="userName" id="userName" style="font-size:20px;" value="${user.userName}" placeholder="请输入用户名">
							</td>
						</tr>
						<tr>
							<td align="center">	
								密&nbsp;&nbsp;&nbsp;码：<input type="password" name="password" id="password" style="font-size:20px;" placeholder="请输入密码" value="${user.password}">
							</td>
						</tr>
						<tr>
							<td align="center" >
								<input type="submit" value="登录" style="font-size:24px;"/>
							    <input type="reset" value="取消" style="font-size:24px;"/>
							</td>
						</tr>
						<tr>
							<td align="center" colspan="2">
							    <font id="error" style="color:red;">${errorInfo}</font>
							</td>
						</tr>
					</table>
				</form>
		  </div>
		  <!--  -->
		  <div data-role="footer" data-position="fixed">
			   <h1></h1>
		  </div>
		  <!--  -->
	</div>	
</body>
</html>