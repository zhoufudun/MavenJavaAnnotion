<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>
<head>
<title>主页</title>
<meta name="viewport" content="width=device-width,initial-scale=1" />
<link href="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/jquery-3.1.1.js"></script>
<script src="${pageContext.request.contextPath}/static/jquery/echarts-2.2.7/build/dist/echarts.js"></script>
<title>主页</title>
<script type="text/javascript">		
	function barrelHeatingTempView(){
		window.location.href="${pageContext.request.contextPath}/machine/barrelHeatingTempLine.do?region="+$('#barrelRegion option:selected').val()+"&macNumId="+$("#macNumId").val()
	}
	    
</script>
<style type="text/css">
	#pie{
		box-shadow:-5px 5px 5px white;
	}
    #Equipment-HouseKeeper-images{
   		border-radius:8px 8px 8px 8px;
    }
</style>
</head>
<body>
	<div data-role="page">

		  <div data-role="header"  data-position="fixed">
		    <a href="${pageContext.request.contextPath}/user/EquipmentHouseKeeper.do" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>机器详情</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="content" align="center">
		  		<table  width="100%" height="200" align="center" border="0" cellpadding="0" cellspacing="1" style="border-radius:0px;">
			   <tr>
						<td bgcolor="#F6F6F6" align="center" >
							<div  style="height:160px; border:solid 1px black; width:94%;border-radius:8px 8px 8px 8px; background-color:white;">	
								<div style="height:20px;">
									<div style="float:left; padding-left:15px;"><img src="${pageContext.request.contextPath}/static/images/15.png"></div>	
									<div style="font-size:16px;font-weight:bold;float:left;margin-top:3px;">机器详情</div>	
								</div><hr style="border:solid 1px #F6F6F6">
								<div id="first" style="height:150px; width:95%; margin-top:5px;" >
									<img src="${pageContext.request.contextPath}/static/images/machine.png" style="width:338px;height:116px;">
								</div>			
							</div>
						</td>	
					</tr>	
				
					<tr  style="height:30px;">
						<td align="center">
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">机器状态</label>	
								<label id="label2"  style="float:right;font-size:16px;">
									<c:if test="${macNum.state==0}">
										<font color="green">已完成</font>
									</c:if>
									<c:if test="${macNum.state==1}">
										<font color="blue">运行中</font>
									</c:if>
									<c:if test="${macNum.state==2}">
										<font color="red">停止中</font>
									</c:if>
									<c:if test="${macNum.state==3}">
										<font color="red">修理中</font>
									</c:if>
									<c:if test="${macNum.state==4}">
										<font color="red">保养中</font>
									</c:if>
									<c:if test="${macNum.state==5}">
										<font color="red">已报废</font>
									</c:if>
									<c:if test="${macNum.state==6}">
										<font color="red">等待中</font>
									</c:if>
									<c:if test="${macNum.state==7}">
										<font color="blue">闲置中-未分配生产线</font>
									</c:if>								
								</label>	
							</div>
						</td>
					</tr>
					
					
					<tr style="height:30px;border:1px solid black;">
						<td align="center" >
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4pxs; background-color:white;">	
								<label id="label3"  style="float:left; font-size:16px;">机器区域</label>	
								<label id="label4"  style="float:right;font-size:16px;">${macNum.region}区</label>			
							</div>
						</td>
					</tr>
					
					<tr style="height:30px;border:1px solid black;">
						<td align="center" >
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4pxs; background-color:white;">	
								<label id="label3"  style="float:left; font-size:16px;">机器代号</label>	
								<label id="label4"  style="float:right;font-size:16px;">${macNum.code}</label>			
							</div>
						</td>
					</tr>
					
					<tr style="height:30px;border:1px solid black;">
						<td align="center" >
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4pxs; background-color:white;">	
								<label id="label3"  style="float:left; font-size:16px;">机器位置</label>	
								<label id="label4"  style="float:right;font-size:16px;">${macNum.lineNumber}生产线</label>			
							</div>
						</td>
					</tr>													
					
					<tr style="height:30px;border:1px solid black;">
						<td align="center" >
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4pxs; background-color:white;">	
								<label id="label3"  style="float:left; font-size:16px;">机器牌号</label>	
								<label id="label4"  style="float:right;font-size:16px;">${macNum.grade}</label>			
							</div>
						</td>
					</tr>
					
					<tr style="height:30px;border:1px solid black;">
						<td align="center" >
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4pxs; background-color:white;">	
								<label id="label3"  style="float:left; font-size:16px;">核心机器</label>
								<c:choose>
									<c:when test="${macNum.core==1}">
										<label id="label4"  style="float:right;font-size:16px;">核心机器</label>
									</c:when>
									<c:otherwise>
										<label id="label4"  style="float:right;font-size:16px;">非核心机器</label>	
									</c:otherwise>
								</c:choose>			
							</div>
						</td>
					</tr>	
					
					<tr style="height:30px;border:1px solid black;">
						<td align="center" >
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4pxs; background-color:white;">	
								<label id="label3"  style="float:left; font-size:16px;">一段温度</label>	
								<label id="label4"  style="float:right;font-size:16px;">${monTemp.firTempT}°C</label>			
							</div>
						</td>
					</tr>
					
					<tr style="height:30px;border:1px solid black;">
						<td align="center" >
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4pxs; background-color:white;">	
								<label id="label3"  style="float:left; font-size:16px;">二段温度</label>	
								<label id="label4"  style="float:right;font-size:16px;">${monTemp.secTempT}°C</label>			
							</div>
						</td>
					</tr>
					
					<tr style="height:30px;border:1px solid black;">
						<td align="center" >
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4pxs; background-color:white;">	
								<label id="label3"  style="float:left; font-size:16px;">三段温度</label>	
								<label id="label4"  style="float:right;font-size:16px;">${monTemp.thiTempT}°C</label>			
							</div>
						</td>
					</tr>																				
					
					<tr style="height:38px;border:1px solid red">
						<td align="center">
							<button  value="液压压力" style="width:354px;color:black;" onclick="javascript:window.location.href='${pageContext.request.contextPath}/user/TypeCavityPressureLine.jsp'">液压曲线</button>									
						</td>
					</tr>
					
					<tr style="height:38px;border:1px solid red;">
						<td align="center">
							<button  value="机筒加热温度曲线" style="width:354px;"><a href="#barrelRegion" data-rel="popup" data-position-to="window" style="text-decoration: none;color:black;" align="center" >温度曲线</a></button>			    										    				    	
						</td>		    		
					</tr>					
				</table>
				<!-- 机筒加热温度段选择查看-->
			        <div data-role="popup" id="barrelRegion" class="ui-content" style="min-width:250px;">				     
					     <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     
					        <div align="center" style="color:blue;">机筒加热温度曲线</div>
					        <div>						          
						          <h3 align="center">请选择机筒区域</h3>
						          <input type="hidden" id="macNumId" value="${macNum.id}">					          
						          <label for="barrelRegion"  class="ui-hidden-accessible" ></label>  
						          <select id="barrelRegion" name="barrelRegion">
						          		<option value="1" selected="selected">一段</option>
						          		<option value="2">二段</option>
						          		<option value="3">三段</option>
						          </select>							          					          	          					          
						          <button onclick="barrelHeatingTempView();">搜索</button> 				          		          
					        </div>
					</div>
				
		  </div>
		  <div data-role="footer" data-position="fixed">
		    	<div data-role="navbar">
				   <ul>
				       <li><a href="${pageContext.request.contextPath}/user/zhuye.jsp" rel="external" data-icon="home" data-mini="true">首页</a></li>
				       <li><a href="#" data-icon="search" data-mini="true">搜索</a></li>
				       <li><a href="#" data-icon="info" data-mini="true">消息</a></li>
				   </ul>
			  </div>
		  </div>
	</div>	
	
</body>


</html>