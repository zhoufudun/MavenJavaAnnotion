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
function searchRegionEquipmentUseRate(){
	window.location.href="${pageContext.request.contextPath}/machine/regionEquipmentUseRate.do?region="+$('#regionEquipmentUseRate option:selected').val();
}
function searchRegionEquipmentDrawBack(){
	window.location.href="${pageContext.request.contextPath}/machine/regionEquipmentDrawBack.do?region="+$('#regionEquipmentDrawBack option:selected').val();
}
function searchRegionEquipmentPercentOfPass(){
	window.location.href="${pageContext.request.contextPath}/machine/regionEquipmentPercentOfPass.do?region="+$('#regionEquipmentPercentOfPass option:selected').val();
}
function CControllerFigureBreakDownAnalysis(){
	window.location.href="${pageContext.request.contextPath}/machine/CControllerFigureBreakDownAnalysis.do?id="+$('#id option:selected').val();
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
    		  <h1>设备分析</h1>
    	  </div>	  
		  <div data-role="content" >
		  	
		    <table border="0" align="center" cellpadding="4">
		        
		    	<tr align="center">
		    		<td><a href="${pageContext.request.contextPath}/machine/totalEquipmentUseRate.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/44.png"></a></td>			    	
		    		<td><a href="${pageContext.request.contextPath}/machine/coreEquipmentUseRate.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/45.png"></a></td>
		    		<td><a href="#regionEquipmentUseRate" data-rel="popup" data-position-to="window" class="" align="center" ><img src="${pageContext.request.contextPath}/static/images/46.png"></a></td>
		    	</tr>
		    	<tr align="center">
		    		<td>总体设备利用率</td>
		    		<td>核心设备利用率</td>
		    		<td>分区设备利用率</td>
		    	</tr>
		    	<tr align="center">
		    		<td><a href="${pageContext.request.contextPath}/machine/totalEquipmentDrawBackRate.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/44.png"></a></td>			    	
		    		<td><a href="${pageContext.request.contextPath}/machine/coreEquipmentDrawBackRate.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/45.png"></a></td>
		    		<td><a href="#regionEquipmentDrawBack" data-rel="popup" data-position-to="window" class="" align="center" ><img src="${pageContext.request.contextPath}/static/images/46.png"></a></td>
		    	</tr>
		    	<tr align="center">
		    		<td>总体设备故障率</td>
		    		<td>核心设备故障率</td>
		    		<td>分区设备故障率</td>
		    	</tr> 
		    	<tr align="center">
		    		<td><a href="${pageContext.request.contextPath}/machine/totalEquipmentPercentOfPass.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/44.png"></a></td>			    	
		    		<td><a href="${pageContext.request.contextPath}/machine/coreEquipmentPercentOfPass.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/45.png"></a></td>
	    		   <td><a href="#regionEquipmentPercentOfPass" data-rel="popup" data-position-to="window" class="" align="center" ><img src="${pageContext.request.contextPath}/static/images/46.png"></a></td>
		    	</tr>
		    	<tr align="center">
		    		<td>总体设备合格率</td>
		    		<td>核心设备合格率</td>
		    		<td>分区设备合格率</td>
		    	</tr> 	    	
		    	<tr align="center">
		    		<td><a href="#CControllerFigureBreakDownAnalysis" data-rel="popup" data-position-to="window" class="" align="center" ><img src="${pageContext.request.contextPath}/static/images/46.png"></a>	</td>		    		
		    	</tr>
		    	<tr align="center">
		    		<td>故障次数分析</td>	    		
		    	</tr>    			    				    		    	
		    </table>
		     <!--C控制图设备故障分析-->
		        <div data-role="popup" id="CControllerFigureBreakDownAnalysis" class="ui-content" style="min-width:250px;">
				     <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     
				       	      <h3 align="center">C控制图设备故障次数分析</h3>
				        <div>
					          <h3 align="center">请选择机器</h3>					          
					          <label for="id"  class="ui-hidden-accessible" >id:</label>  
					          <select id="id" name="id">
					          	<c:forEach var="macNum" items="${macNumList}">
					          		<option value="${macNum.id}">${macNum.id}-${macNum.factory}-${macNum.code}</option>
					          	</c:forEach>
					          </select>		          					          
					          <button onclick="CControllerFigureBreakDownAnalysis();" >分析</button> 				          		          
				        </div>
				</div>
		        <!--分区设备利用率-->
		        <div data-role="popup" id="regionEquipmentUseRate" class="ui-content" style="min-width:250px;">
				     <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     
				        <div>
					          <h3 align="center">请选择区间</h3>					          
					          <label for="regionEquipmentUseRate"  class="ui-hidden-accessible" >id:</label>  
					          <select id="regionEquipmentUseRate" name="regionEquipmentUseRate">
					          	<option value="1" selected="selected">一区</option>
					          	<option value="2" >二区</option>
					          	<option value="3" >三区</option>
					          	<option value="4" >四区</option>
					          </select>		          					          
					          <button onclick="searchRegionEquipmentUseRate();" >搜索</button> 				          		          
				        </div>
				</div>
				<!--分区设备故障率-->
		        <div data-role="popup" id="regionEquipmentDrawBack" class="ui-content" style="min-width:250px;">
				     <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     
				        <div>
					          <h3 align="center">请选择区间</h3>					          
					          <label for="regionEquipmentDrawBack"  class="ui-hidden-accessible" >id:</label>  
					          <select id="regionEquipmentDrawBack" name="regionEquipmentDrawBack">
					          	<option value="1" selected="selected">一区</option>
					          	<option value="2" >二区</option>
					          	<option value="3" >三区</option>
					          	<option value="4" >四区</option>
					          </select>		          					          
					          <button onclick="searchRegionEquipmentDrawBack();" >搜索</button> 				          		          
				        </div>
				</div>
				<!--分区设备合格率-->
		        <div data-role="popup" id="regionEquipmentPercentOfPass" class="ui-content" style="min-width:250px;">
				     <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     
				        <div>
					          <h3 align="center">请选择区间</h3>					          
					          <label for="regionEquipmentPercentOfPass"  class="ui-hidden-accessible" >id:</label>  
					          <select id="regionEquipmentPercentOfPass" name="regionEquipmentPercentOfPass">
					          	<option value="1" selected="selected">一区</option>
					          	<option value="2" >二区</option>
					          	<option value="3" >三区</option>
					          	<option value="4" >四区</option>
					          </select>		          					          
					          <button onclick="searchRegionEquipmentPercentOfPass();" >搜索</button> 				          		          
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