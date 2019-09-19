<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1" />
<<link href="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
<script src="${pageContext.request.contextPath}/static/jquery/echarts-2.2.7/build/dist/echarts.js"></script>
<script type="text/javascript">
</script>
<style>
th {
    border-bottom: 1px solid #d6d6d6;
}

tr:nth-child(even) {
    background: #e9e9e9;
}
</style>
</head>
<body>
	<div data-role="page">

		  <div data-role="header"  data-position="fixed">
		    <a href="${pageContext.request.contextPath}/user/Equipment-HouseKeeper.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>设备信息</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="content" align="center" style="background-color:#f3f3f3;font-size:12px;">
		  
		  <table data-role="table" data-mode="columntoggle" class="ui-responsive ui-shadow" id="myTable" data-column-btn-text="其他数据">
			      <thead>
			        <tr>
			         <th data-priority="1">机器名称</th>
			         <th data-priority="1">机器编号</th>
			         <th data-priority="2">工单名称</th>
			         <th data-priority="2">工单号</th>
			         <th data-priority="1">料筒温度</th>
			         <th data-priority="1">喷嘴温度</th>
			         <th data-priority="1">模具温度</th>
			         <th data-priority="2">塑化压力</th>
			         <th data-priority="2">注射压力</th>
			         <th data-priority="2">成型周期</th>
			         <th data-priority="2">注射时间</th>
			         <th data-priority="2">产量</th>
			         <th data-priority="2">作业时间</th>
			        </tr>
			      </thead>
			      <tbody>
			        <tr>
			          <td>${equipmentInfo.macName}</td>
			          <td>${equipmentInfo.macNum}</td>
			          <td>${equipmentInfo.workName}</td>
			          <td>${equipmentInfo.workNum}</td>
			          <td>${equipmentInfo.barrelTem}</td>
			          <td>${equipmentInfo.nozzleTem}</td>
			          <td>${equipmentInfo.moldTem}</td>
			          <td>${equipmentInfo.plasticPres}</td>
			          <td>${equipmentInfo.injectionPres}</td>
			          <td>${equipmentInfo.moldingCyc}</td>
			          <td>${equipmentInfo.injectionTime}</td>
			          <td>${equipmentInfo.output}</td>
			          <td>${equipmentInfo.workTime}</td>
			        </tr>			        			
			      </tbody>
			    </table>
				  	
				  						  		  						  						  				
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