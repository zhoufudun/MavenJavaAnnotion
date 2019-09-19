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
$(function(){	
});
	function logout(){
		if(confirm("确定要退出吗？")){
			window.location.href="${pageContext.request.contextPath}/user/zhuye.jsp";
		}
	}
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
		    <a href="javascript:logout();" class="ui-btn ui-icon-alert ui-btn-icon-left">退出</a>	   
    		  <h1>MES系统后台管理</h1>
    	<!--	<a href="#moreInfo" data-role="button" data-rel="popup" data-icon="grid" data-iconpos="notext" class="ui-btn-right" data-transition="slide"></a>   -->
		  </div>
		  <!--      
		  <div data-role="popup" id="moreInfo" class="ui-content"  data-overlay-theme="b">		
		  	 <div data-role="main" class="ui-content">
			    <ul data-role="listview" data-inset="true">    		  
			    </ul>
			  </div>
			  
			  
			  <ul data-role="listview" data-inset="true">			      
			      <li>
			        <a href="#">			        
			        <h2>登陆后台</h2>		        
			        </a>
			        <a href="#download" data-transition="pop" data-icon="gear">下载浏览器</a>
			      </li>
			      <li>
			        <a href="#">		        
			        <h2>登陆后台</h2>		        
			        </a>
			        <a href="#download" data-transition="pop" data-icon="gear">下载浏览器</a>
			      </li>
			   </ul>
			   
		  </div>
			--> 	  	  
		  <div data-role="content" >
		  	<div style="height:40px;">
		  	</div>
		    <table border="0" align="center" cellpadding="8" cellspacing="0" >
		    	<tr>
		    		<td><a href="${pageContext.request.contextPath}/admin/orderManage/initComponent.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/20.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/admin/equipmentManage.jsp" rel="external"><img src="${pageContext.request.contextPath}/static/images/21.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/admin/productLine.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/24.png"></a></td>	    		
		    	</tr>
		    	<tr align="center">
		    		<td>订单管理</td>
		    		<td>设备管理</td>
		    		<td>生产线管理</td>	    		
		    	</tr>
		    	<tr>
		    		<td><a href="${pageContext.request.contextPath}/admin/materialsManage.jsp" rel="external"><img src="${pageContext.request.contextPath}/static/images/23.png"></a></td>	    		
		    		<td><a href="${pageContext.request.contextPath}/admin/materialsManage.jsp" rel="external"><img src="${pageContext.request.contextPath}/static/images/7.png"></a></td>	    		
		    		<td><a href="${pageContext.request.contextPath}/admin/materialSearch.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/26.png"></a></td>		    		
		    	</tr>
		    	<tr align="center">
		    		<td>物料管理</td>
		    		<td>员工管理</td>
		    		<td>产品管理</td>		    	
		    	</tr>
		    	<tr>
		    		<td><a href="${pageContext.request.contextPath}/admin/dataManage.jsp" rel="external"><img src="${pageContext.request.contextPath}/static/images/26.png"></a></td>		    		
		    	</tr>
		    	<tr align="center">
		    		<td>数据管理</td>		    			    	
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