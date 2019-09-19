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
function searchMacNum(){
	if($('#id option:selected')==null){
		alert("请选择机器");
	}else{
		window.location.href="${pageContext.request.contextPath}/user/GaoSiTemperaturePrediction.do?barrelRegion="+$('#barrelRegion option:selected').val()+"&id="+$('#id option:selected').val();
	}	
}
function searchMacNum2(){
	if($('#id2 option:selected')==null){
		alert("请选择机器");
	}else{
		window.location.href="${pageContext.request.contextPath}/user/XRTemperaturePrediction.do?barrelRegion2="+$('#barrelRegion2 option:selected').val()+"&id="+$('#id option:selected').val();
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
		     <a href="${pageContext.request.contextPath}/user/IntelligentAnalysis.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>   
    		  <h1>温度分析</h1>
    	  </div>	  	  
		  <div data-role="content" >
		  	<div style="height:15px;">
		  	
		  	</div>
		    <table border="0" align="center" cellpadding="8">		    				    	
		    	<tr align="center">
		    		<td>
		    			<a href="#GaoSiTemperaturePrediction" data-rel="popup" data-position-to="window" class="" align="center" ><img src="${pageContext.request.contextPath}/static/images/46.png"></a>
		    		</td>
		    		<td>
		    			<a href="#XRTemperaturePrediction" data-rel="popup" data-position-to="window" class="" align="center" ><img src="${pageContext.request.contextPath}/static/images/46.png"></a>
		    		</td>
		    				    				    		  		
		    	</tr>
		    	<tr align="center">		    		
		    		<td>高斯分布温度分析</td> 
		    		<td>XR控制图温度稳态分析</td> 		
		    	</tr>		    	    		    	
		    </table>
		    <!--高斯分布温度预测分析-->
		        <div data-role="popup" id="GaoSiTemperaturePrediction" class="ui-content" style="min-width:250px;">				     
				     <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     
				        <div align="center" style="color:red;">高斯分布温度机筒分析</div>
				        <div>
					          <h3 align="center">请选择机器</h3>					          
					          <label for="id"  class="ui-hidden-accessible" >id:</label>  
					          <select id="id" name="id">
					          	<c:forEach var="macNum" items="${runingMacNumList}">
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
					          					          	          					          
					          <button onclick="searchMacNum();">搜索</button> 				          		          
				        </div>
				</div>
		  </div>
		  <!--XR控制图稳态温度分析-->
		        <div data-role="popup" id="XRTemperaturePrediction" class="ui-content" style="min-width:250px;">				     
				     <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     
				        <div align="center" style="color:red;">X-R控制图稳态温度分析</div>
				        <div>
					          <h3 align="center">请选择机器</h3>					          
					          <label for="id2"  class="ui-hidden-accessible" >id:</label>  
					          <select id="id2" name="id2">
					          	<c:forEach var="macNum" items="${runingMacNumList}">
					          		<option value="${macNum.id}">${macNum.id}-${macNum.factory}-${macNum.code}</option>
					          	</c:forEach>					          	
					          </select>	
					          
					          <h3 align="center">请选择机筒区域</h3>					          
					          <label for="barrelRegion2"  class="ui-hidden-accessible" >id:</label>  
					          <select id="barrelRegion2" name="barrelRegion2">
					          		<option value="1" selected="selected">一段</option>
					          		<option value="2">二段</option>
					          		<option value="3">三段</option>
					          </select>	
					          					          	          					          
					          <button onclick="searchMacNum2();">搜索</button> 				          		          
				        </div>
				</div>
		  </div>
		  <!--  -->
		   <div data-role="footer" data-position="fixed">
		    	<div data-role="navbar">
				   <ul>
				       
				   </ul>
			  </div>
		  </div>
		  <!--  -->
	</div>	
</body>
</html>