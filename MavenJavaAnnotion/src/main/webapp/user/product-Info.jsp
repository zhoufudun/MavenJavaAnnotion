<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1" />
<link href="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
<script src="${pageContext.request.contextPath}/static/jquery/echarts-2.2.7/build/dist/echarts.js"></script>
<title>主页</title>
<style type="text/css">
	
</style>
<script type="text/javascript">
        
</script>
</head>
<body>
	<div data-role="page">

		  <div data-role="header" data-position="fixed">
		    <a href="${pageContext.request.contextPath}/user/zhuye.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>产品信息</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="content" style="background-color:#f3f3f3" data-fullscreen="true">
			    <form method="post" action="${pageContext.request.contextPath}/productInfo/search.do">
				      <div data-role="fieldcontain" style="width:100%">
				         <input type="text" name="s_title" id="s_title" placeholder="输入标题..." class="ui-corner-all" value="${s_title}">
				         <input type="submit"  value="搜索" class="ui-corner-all" >
				      </div>
			    </form>
		  		<table  style="width:100%; height:100%"  border="0" cellpadding="0" cellspacing="3" align="center">
		  			<c:forEach items="${productInfoList}" var="productInfo">
			  			<tr align="center" >
							<td align="center">
								<img src="${pageContext.request.contextPath}/static/${productInfo.picPath}">
							</td>
							<td align="center" style="background:white">
								<h4>${productInfo.title}</h4>
								<p>${productInfo.content}</p>
							</td>
						</tr>
		  			</c:forEach>										
				</table>
		  </div>
		
		  <div data-role="footer" data-position="fixed">
		    	<div data-role="navbar">
				   <ul>
				       <li><a href="${pageContext.request.contextPath}/user/zhuye.jsp" rel="external" data-icon="home" data-mini="true">首页</a></li>
				       <li><a href="#" data-icon="search" data-mini="true">搜索</a></li>
				       <li><a href="#" data-icon="info" data-mini="true">消息</a></li>
				   </ul>
			  </div>
		  </div>
	</div>	
	
</body>

</html>