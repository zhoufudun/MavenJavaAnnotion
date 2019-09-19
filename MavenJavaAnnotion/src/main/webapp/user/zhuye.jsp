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

	function logout(){
		if(confirm("确定要退出吗？")){
			window.location.href="${pageContext.request.contextPath}/User/System/logout.do";
		}
	}
</script>

<style type="text/css">
	img{
		border-radius:8px;
	}
</style>
</head>
<body>
	<div data-role="page" >
		  <div data-role="header" data-position="fixed">
		    <a href="javascript:logout();" class="ui-btn ui-icon-alert ui-btn-icon-left">退出</a>	   
    		  <h1>主 页</h1>
    		<a href="#moreInfo" data-role="button"  data-rel="popup" data-icon="grid" data-iconpos="notext" class="ui-btn-right" data-transition="slide"></a>
		  </div>
		  
			  <div data-role="popup" id="moreInfo" class="ui-content"  data-overlay-theme="b">		
			  	 <div data-role="main" class="ui-content">
				    <ul data-role="listview" data-inset="true">    
				      <li data-icon="plus"><a href="${pageContext.request.contextPath}/admin/adminLogin.jsp" rel="external">登陆后台</a></li>
				      <li data-icon="plus"><a href="${pageContext.request.contextPath}/admin/lookManageLogin.jsp" rel="external">看板管理</a></li>			   
				    </ul>
				  </div>			  
			  </div>
		       	  	  
		  <div data-role="content" >
		  	<div style="height:20px;">
		  	</div>
		    <table border="0" align="center" cellpadding="6" cellspacing="1">
		    	<tr>
		    		<td><a href="${pageContext.request.contextPath}/user/EquipmentHouseKeeper.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/1.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/productInfo/search.do?s_title" rel="external"><img src="${pageContext.request.contextPath}/static/images/2.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/user/MaunfacturingStatistics.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/3.png"></a></td>		    		
		    	</tr>
		    	<tr align="center">
		    		<td>设备管家</td>
		    		<td>产品信息</td>
		    		<td>生产统计</td>		    		
		    	</tr>
		    	<tr>
		    		<td><a href="${pageContext.request.contextPath}/user/resourceMonitor.jsp" rel="external"><img src="${pageContext.request.contextPath}/static/images/4.png"></a></td>		    			    		
		    		<td><a href="${pageContext.request.contextPath}/totalWorkDetail/getTotalWorkDetail.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/5.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/user/IntelligentAnalysis.jsp" rel="external"><img src="${pageContext.request.contextPath}/static/images/6.png"></a></td>		    		
		    	</tr>
		    	<tr align="center">
		    		<td>资源监控</td>
		    		<td>工单详情</td>
		    		<td>智能分析</td>		    		
		    	</tr>
		    	<tr>		    		
	                <td><a href="${pageContext.request.contextPath}/order/orderFinishAttention.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/16.png"></a></td>
		    		<td><a href="#" rel="external"><img src="${pageContext.request.contextPath}/static/images/19.png"></a></td>	
		    		<td><img src="${pageContext.request.contextPath}/static/images/7.png"></td>	
		    	</tr>
		    	<tr align="center">		    		
		    		<td>完工提醒</td>
		    		<td>看板信息</td> 
		    		<td>个人中心</td>   		
		    	</tr>
		    	
		    </table>
		  </div>
		
		  <div data-role="footer" data-position="fixed" style="background-color:#1874CD;">
		    	<div data-role="navbar">
				   <ul>
				       <li><a href="zhuye.jsp" data-icon="home" data-mini="true">首页</a></li>
				       <li><a href="#" data-icon="search" data-mini="true">搜索</a></li>		      
				       <li><a href="#" data-icon="info" data-mini="true">信息</a></li>	
				   </ul>
			  </div>
		  </div>

	</div>	
</body>
</html>