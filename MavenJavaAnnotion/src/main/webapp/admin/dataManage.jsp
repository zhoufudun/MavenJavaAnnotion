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

<script type="text/javascript">
</script>

<style type="text/css">
	img{
		border-radius:8px;
	}
</style>
</head>
<body >
	<div data-role="page" style="background-color:white;">
		  <div data-role="header" data-position="fixed">
		   <a href="${pageContext.request.contextPath}/admin/adminInterface.jsp" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    		<h1>数据管理</h1>
    	<!--	<a href="#moreInfo" data-role="button" data-rel="popup" data-icon="grid" data-iconpos="notext" class="ui-btn-right" data-transition="slide"></a>   -->
		  </div>
		   	  
		  <div data-role="content" >
		  	<div style="height:40px;">
		  	</div>
		    <table border="0" align="center" cellpadding="8" cellspacing="0" >
		    	<tr>
		    		<td><a href="${pageContext.request.contextPath}/admin/dataCollect.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/20.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/admin/dataMonitor.jsp" rel="external"><img src="${pageContext.request.contextPath}/static/images/4.png"></a></td>
		    	</tr>
		    	<tr align="center">
		    		<td>数据采集</td>
		    		<td>数据监控</td>	    		
		    	</tr>		    	
		    	
		    </table>
		  </div>
		  <!--  -->
		  <div data-role="footer" data-position="fixed">
			   <h1></h1>
		  </div>
		  <!--  -->
	</div>	
</body>
</html>