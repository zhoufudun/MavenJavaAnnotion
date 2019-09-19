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
	/*function logout(){
		if(confirm("确定要退出吗？")){
			window.location.href="${pageContext.request.contextPath}/User/System/logout.do";
		}
	}*/
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
		     <a href="${pageContext.request.contextPath}/user/zhuye.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>   
    		  <h1>智能分析</h1>
    	  </div>	  	  
		  <div data-role="content" >
		  	<div style="height:15px;">
		  	
		  	</div>
		    <table border="0" align="center" cellpadding="8">
		    	<tr>
		    		<td><a href="${pageContext.request.contextPath}/machine/EquipmentAnalysis.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/44.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/order/QualityAnalysis.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/45.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/user/DrawBackAnalysis.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/46.png"></a></td>
		    	</tr>
		    	<tr align="center">
		    		<td>设备分析</td>
		    		<td>质量分析</td>
		    		<td>缺陷分析</td>  		
		    	</tr>	
		    	<tr>
		    		<td><a href="${pageContext.request.contextPath}/user/EnergyConsumptionAnalysis.jsp" rel="external"><img src="${pageContext.request.contextPath}/static/images/44.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/user/predictionAnalysis.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/46.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/user/orderAnalysis.jsp" rel="external"><img src="${pageContext.request.contextPath}/static/images/46.png"></a></td>
		    	</tr>
		    	<tr align="center">
		    		<td>能耗分析</td>
		    		<td>温度分析</td>
		    		<td>工单分析</td>  	
		    	</tr>		    	    		    	
		    </table>
		    <!--温度预测分析-->
		        <div data-role="popup" id="AlarmPrediction" class="ui-content" style="min-width:250px;">				     
				     <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     
				        <div align="center" style="color:red;">温度分析</div>
				        <div>
					          <h3 align="center">请选择机器</h3>					          
					          <label for="id"  class="ui-hidden-accessible" >id:</label>  
					          <select id="id" name="id">
					          	<option value="1" selected="selected">一区</option>
					          	<option value="2" >二区</option>
					          	<option value="3" >三区</option>
					          	<option value="4" >四区</option>
					          </select>		          					          
					          <button onclick="searchRegionEquipmentDrawBack();" >搜索</button> 				          		          
				        </div>
				</div>
		  </div>
		  <!--  -->
		   <div data-role="footer" data-position="fixed">
			 <h1>
			   	<a href="#"></a>								
			 </h1>
		  </div>
		  <!--  -->
	</div>	
</body>
</html>