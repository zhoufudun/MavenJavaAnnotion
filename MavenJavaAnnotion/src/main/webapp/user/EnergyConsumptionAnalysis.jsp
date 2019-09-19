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
	function search(){
		window.location.href="${pageContext.request.contextPath}/machine/regionEnergyConsumptionAnalysis.do?region="+$('#region option:selected').val();
	}
	function searchCore(){
		window.location.href="${pageContext.request.contextPath}/machine/regionCoreEnergyConsumptionAnalysis.do?region="+$('#regionCore option:selected').val();
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
		     <a href="${pageContext.request.contextPath}/user/IntelligentAnalysis.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>   
    		  <h1>能耗分析</h1>
    	  </div>	  	  
		  <div data-role="content" >
		  	<div style="height:20px;">
		  	
		  	</div>
		    <table border="0" align="center" cellpadding="3">
		    	<tr align="center">
		    		<td><a href="${pageContext.request.contextPath}/machine/totalEnergyConsumptionAnalysis.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/44.png"></a></td>
		    		<td><a href="#divideRegion" data-rel="popup" data-position-to="window" class="" align="center" ><img src="${pageContext.request.contextPath}/static/images/45.png"></a>	</td>
		    		<td><a href="${pageContext.request.contextPath}/machine/coreEquipmentEnergyConsumptionAnalysis.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/44.png"></a></td>		    		
		    	</tr>
		    	<tr align="center">
		    		<td>总体设备能耗</td>
		    		<td>分区设备能耗</td>
		    		<td>核心设备能耗</td>		    		  		
		    	</tr>
		    	<tr align="center">
		    		<td><a href="#regionCore" data-rel="popup" data-position-to="window" class="" align="center" ><img src="${pageContext.request.contextPath}/static/images/45.png"></a>	</td>
		    	</tr>
		    	<tr align="center">	    		
		    		<td>分区核心能耗</td>	    		  		
		    	</tr>			    		    	    		    	
		    </table>
		    <!--分区总体能耗查询-->		  				
				<div data-role="popup" id="divideRegion" class="ui-content" style="min-width:250px;">
				     <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     
				        <div>
					          <h3 align="center">请选择区间</h3>					          
					          <label for="region"  class="ui-hidden-accessible" >id:</label>   <!--员工id-->  
					          <select id="region" name="region">
					          	<option value="1" selected="selected">一区</option>
					          	<option value="2" >二区</option>
					          	<option value="3" >三区</option>
					          	<option value="4" >四区</option>
					          </select>		          					          
					          <button onclick="search();" >搜索</button> 				          		          
				        </div>
				</div>
				
				<!--分区核心能耗查询-->		  				
				<div data-role="popup" id="regionCore" class="ui-content" style="min-width:250px;">
				     <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     
				        <div>
					          <h3 align="center">请选择区间</h3>					          
					          <label for="regionCore"  class="ui-hidden-accessible" >id:</label>   <!--员工id-->  
					          <select id="regionCore" name="regionCore">
					          	<option value="1" selected="selected">一区</option>
					          	<option value="2" >二区</option>
					          	<option value="3" >三区</option>
					          	<option value="4" >四区</option>
					          </select>		          					          
					          <button onclick="searchCore();" >搜索</button> 				          		          
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