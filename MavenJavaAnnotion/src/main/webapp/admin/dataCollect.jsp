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
function barrelStableTempCollection(){
	if($('#id option:selected')==null){
		alert("请选择机器");
	}else{
		window.location.href="${pageContext.request.contextPath}/admin/barrelStableTempCollection.do?barrelRegion="+$('#barrelRegion option:selected').val()+"&macNumId="+$('#macNumId option:selected').val();
	}	
}
function barrelHeatingTempCollection(){
	if($('#id option:selected')==null){
		alert("请选择机器");
	}else{
		window.location.href="${pageContext.request.contextPath}/admin/barrelHeatingTempCollection.do?barrelRegion="+$('#barrelRegion-heating option:selected').val()+"&macNumId="+$('#macNumId-heating option:selected').val();
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
		   <a href="${pageContext.request.contextPath}/admin/dataManage.jsp" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    		<h1>数据采集</h1>
    	<!--	<a href="#moreInfo" data-role="button" data-rel="popup" data-icon="grid" data-iconpos="notext" class="ui-btn-right" data-transition="slide"></a>   -->
		  </div>
		   	  
		  <div data-role="content" >
		  	<div style="height:40px;">
		  	</div>
		    <table border="0" align="center" cellpadding="8" cellspacing="0" >
		    	<tr align="center">
		    		<td><a href="#barrelStableTempCollect" data-rel="popup" data-position-to="window" class="" align="center" ><img src="${pageContext.request.contextPath}/static/images/20.png"></a></td>
		    		<td><a href="#barrelHeatingTempCollect" data-rel="popup" data-position-to="window" class="" align="center" ><img src="${pageContext.request.contextPath}/static/images/20.png"></a></td>		    				    	</tr>
		    	<tr align="center">
		    		<td>采集机筒稳态温度</td>
		    		<td>采集机筒加热温度</td>		    		
		    	</tr>		    		    			    	
		    </table>
		    <!--采集稳态机筒温度-->
		        <div data-role="popup" id="barrelStableTempCollect" class="ui-content" style="min-width:250px;">				     
				     <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     
				        <div align="center" style="color:blue;">采集稳态机筒温度</div>
				        <div>
					          <h3 align="center">请选择机器</h3>					          
					          <label for="macNumId"  class="ui-hidden-accessible" ></label>  
					          <select id="macNumId" name="macNumId">
					          	<c:forEach var="macNum" items="${macNumList}">
					          		<option value="${macNum.id}">${macNum.id}-${macNum.factory}-${macNum.code}</option>
					          	</c:forEach>					          	
					          </select>	
					          
					          <h3 align="center">请选择机筒区域</h3>					          
					          <label for="barrelRegion"  class="ui-hidden-accessible" >id:</label>  
					          <select id="barrelRegion" name="barrelRegion">
					          		<option value="1" selected="selected">一段</option>
					          		<option value="2">二段</option>
					          		<option value="3">三段</option>
					          </select>	
					          					          	          					          
					          <button onclick="barrelStableTempCollection();">搜索</button> 				          		          
				        </div>
				</div>
				<!--采集机筒加热温度-->
		        <div data-role="popup" id="barrelHeatingTempCollect" class="ui-content" style="min-width:250px;">				     
				     <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     
				        <div align="center" style="color:blue;">采集机筒加热温度</div>
				        <div>
					          <h3 align="center">请选择机器</h3>					          
					          <label for="macNumId-heating"  class="ui-hidden-accessible" ></label>  
					          <select id="macNumId-heating" name="macNumId-heating">
					          	<c:forEach var="macNum" items="${macNumList}">
					          		<option value="${macNum.id}">${macNum.id}-${macNum.factory}-${macNum.code}</option>
					          	</c:forEach>					          	
					          </select>	
					          
					          <h3 align="center">请选择机筒区域</h3>					          
					          <label for="barrelRegion-heating"  class="ui-hidden-accessible" >id:</label>  
					          <select id="barrelRegion-heating" name="barrelRegion-heating">
					          		<option value="1" selected="selected">一段</option>
					          		<option value="2">二段</option>
					          		<option value="3">三段</option>
					          </select>	
					          					          	          					          
					          <button onclick="barrelHeatingTempCollection();">搜索</button> 				          		          
				        </div>
				</div>
		  </div>
		  <!--  -->
		  <div data-role="footer" data-position="fixed">
			   <h1></h1>
		  </div>
		  <!--  -->
	</div>	
</body>
</html>