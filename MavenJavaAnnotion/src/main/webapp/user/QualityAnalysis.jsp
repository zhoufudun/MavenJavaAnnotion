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
function searchRegionQualityPercentOfPass(){
	window.location.href="${pageContext.request.contextPath}/order/regionQualityPercentOfPass.do?region="+$('#regionQualityPercentOfPass option:selected').val();
}
function searchRegionQualityTranslateRate(){
	window.location.href="${pageContext.request.contextPath}/order/regionQualityTranslateRate.do?region="+$('#regionQualityTranslateRate option:selected').val();
}
function searchRegionQualityLost(){
	window.location.href="${pageContext.request.contextPath}/order/regionQualityLost.do?region="+$('#regionQualityLost option:selected').val();
}
function PControllerFigurePassOfRateAnalysis(){
	window.location.href="${pageContext.request.contextPath}/order/defectiveAnalysis.do?id="+$('#id option:selected').val();
}
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
		     <a href="${pageContext.request.contextPath}/user/IntelligentAnalysis.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>   
    		  <h1>质量分析</h1>
    	  </div>	  
		  <div data-role="content" >
		  	<div style="height:30px;">		  	
		  	</div>
		    <table border="0" align="center" cellpadding="2">
		    	<tr align="center">
		    		<td><a href="${pageContext.request.contextPath}/order/totalOrderPercentOfPass.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/44.png"></a></td>			    	
		    		<td><a href="${pageContext.request.contextPath}/order/totalOrderTranslateRate.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/45.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/order/totalQualityLost.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/46.png"></a></td>		    			    				    		
		    	</tr>
		    	<tr align="center">
		    		<td>总体产品合格率</td>
		    		<td>总体产品转换率</td>
		    		<td>总体质量损失率</td>
		    		
		    	</tr>
		    	<tr align="center">
	    		    <td><a href="#regionQualityPercentOfPass" data-rel="popup" data-position-to="window" class="" align="center" ><img src="${pageContext.request.contextPath}/static/images/46.png"></a></td>
	    		    <td><a href="#regionQualityTranslateRate" data-rel="popup" data-position-to="window" class="" align="center" ><img src="${pageContext.request.contextPath}/static/images/46.png"></a></td>
	    		    <td><a href="#regionQualityLost" data-rel="popup" data-position-to="window" class="" align="center" ><img src="${pageContext.request.contextPath}/static/images/46.png"></a></td>
		    	</tr>
		    	<tr align="center">
		    		<td>分区产品合格率</td>
		    		<td>分区产品转换率</td>
		    		<td>分区质量损失率</td>
		    	</tr>
		    	<tr align="center">
		    		<td><a href="#PControllerFigurePassOfRateAnalysis" data-rel="popup" data-position-to="window" class="" align="center" ><img src="${pageContext.request.contextPath}/static/images/46.png"></a>	</td>		    		
		    	</tr>
		    	<tr align="center">
		    		<td>制品次品率分析</td>	    		
		    	</tr>	   			    				    		    	
		    </table>
		     <!--P控制图制品合格率分析-->
		        <div data-role="popup" id="PControllerFigurePassOfRateAnalysis" class="ui-content" style="min-width:250px;">
				     <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     
				       	      <h3 align="center">P控制图制品次品率分析</h3>
				        <div>
					          <h3 align="center">请选择工单</h3>					          
					          <label for="id"  class="ui-hidden-accessible" >id:</label>  
					          <select id="id" name="id">
					          	<c:forEach var="addOrder" items="${addOrderList}">
					          		<option value="${addOrder.id}">${addOrder.id}-${addOrder.orderNumber}</option>
					          	</c:forEach>
					          </select>		          					          
					          <button onclick="PControllerFigurePassOfRateAnalysis();" >分析</button> 				          		          
				        </div>
				</div>
		    <!--分区产品合格率-->
		        <div data-role="popup" id="regionQualityPercentOfPass" class="ui-content" style="min-width:250px;">
				     <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     
				        <div>
					          <h3 align="center">请选择区间</h3>					          
					          <label for="regionQualityPercentOfPass"  class="ui-hidden-accessible" >id:</label>  
					          <select id="regionQualityPercentOfPass" name="regionQualityPercentOfPass">
					          	<option value="1" selected="selected">一区</option>
					          	<option value="2" >二区</option>
					          	<option value="3" >三区</option>
					          	<option value="4" >四区</option>
					          </select>		          					          
					          <button onclick="searchRegionQualityPercentOfPass();" >搜索</button> 				          		          
				        </div>
				</div>
				<!--分区产品转换率-->
		        <div data-role="popup" id="regionQualityTranslateRate" class="ui-content" style="min-width:250px;">
				     <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     
				        <div>
					          <h3 align="center">请选择区间</h3>					          
					          <label for="regionQualityTranslateRate"  class="ui-hidden-accessible" >id:</label>  
					          <select id="regionQualityTranslateRate" name="regionQualityTranslateRate">
					          	<option value="1" selected="selected">一区</option>
					          	<option value="2" >二区</option>
					          	<option value="3" >三区</option>
					          	<option value="4" >四区</option>
					          </select>		          					          
					          <button onclick="searchRegionQualityTranslateRate();" >搜索</button> 				          		          
				        </div>
				</div>
				<!--分区质量损失率-->
		        <div data-role="popup" id="regionQualityLost" class="ui-content" style="min-width:250px;">
				     <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     
				        <div>
					          <h3 align="center">请选择区间</h3>					          
					          <label for="regionQualityLost"  class="ui-hidden-accessible" >id:</label>  
					          <select id="regionQualityLost" name="regionQualityLost">
					          	<option value="1" selected="selected">一区</option>
					          	<option value="2" >二区</option>
					          	<option value="3" >三区</option>
					          	<option value="4" >四区</option>
					          </select>		          					          
					          <button onclick="searchRegionQualityLost();" >搜索</button> 				          		          
				        </div>
				</div>
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