<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=request.getContextPath()%>/static/jquery/jquery-3.1.1.js" type="text/javascript"></script>
<title>MES系统界面</title>
<style type="text/css">
	body{
		font-size:60px;
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
<body>
<form action="${pageContext.request.contextPath}/admin/lookLogin.do" method="POST" onsubmit="return checkForm();">
<h1 align="center">看板管理登录</h1>
	<table align="center">
		<tr>
			<td align="center">
				用户名：<input type="text" name="userName" id="userName" style="font-size:60px;" value="${user.userName}" placeholder="请输入用户名">
			</td>
		</tr>
		<tr>
			<td align="center">	
				密&nbsp;&nbsp;&nbsp;码：<input type="password" name="password" id="password" style="font-size:60px;" placeholder="请输入密码" value="${user.password}">
			</td>
		</tr>
		<tr>
			<td align="center" >
				<input type="submit" value="登录" style="font-size:60px;"/>
			    <input type="reset" value="取消" style="font-size:60px;"/>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
			    <font id="error" style="color:red;">${errorInfo}</font>
			</td>
		</tr>
	</table>
</form>
</body>
</html>