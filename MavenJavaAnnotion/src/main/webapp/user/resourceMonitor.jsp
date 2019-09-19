<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
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
<body>
	<div data-role="page" style="background-color:white;">
		  <div data-role="header" data-position="fixed" >
		     <a href="${pageContext.request.contextPath}/user/zhuye.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>   
    		  <h1>资源监控</h1>
    	  </div>	  
		  <div data-role="content" >
		  	<div style="height:40px;">		  	
		  	</div>
		    <table border="0" align="center" cellpadding="10">
		    	<tr>
		    		<td><a href="${pageContext.request.contextPath}/employees/totalEmployeesSituation.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/7.png"></a></td>			    	
		    		<td><a href="${pageContext.request.contextPath}/material/totalMaterialSituation.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/38.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/user/EquipmentHouseKeeper.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/21.png"></a></td>		    			    				    		
		    	</tr>
		    	<tr align="center">
		    		<td>人力资源</td>
		    		<td>物料资源</td>
		    		<td>设备资源</td>
		    	</tr> 		    			    				    		    	
		    </table>
		  </div>
		  	  
		  <div data-role="footer" data-position="fixed" style="background-color:#1874CD;">
		    	<div data-role="navbar">
				   <ul>
				       <li><a href="zhuye.jsp" data-icon="home" data-mini="true">首页</a></li>
				       <li><a href="#" data-icon="search" data-mini="true">搜索</a></li>
				       <li><a href="#" data-icon="info" data-mini="true">消息</a></li>
				   </ul>
			  </div>
		  </div>
		  <!--  -->
	</div>	
</body>
</html>