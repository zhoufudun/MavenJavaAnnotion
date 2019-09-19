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
		var myChart;
        // 路径配置
        require.config({
            paths: {
                echarts: '${pageContext.request.contextPath}/static/jquery/echarts-2.2.7/build/dist'
            }
        });
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/gauge' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('first')); 
                
                option = {
                	    tooltip: {
                	        formatter: "{a} <br/>{b} : {c}%"
                	    },
                	    toolbox: {
                	        feature: {
                	            restore: {},
                	            saveAsImage: {}
                	        }
                	    },
                	    series: [{
                	    	startAngle: 210, //开始角度 左侧角度
                            endAngle: -30, //结束角度 右侧
                	    	type: 'gauge',
                            detail: {formatter:'{value}%'},
                            axisLine: {            // 坐标轴线  
                                     lineStyle: {       // 属性lineStyle控制线条样式  
                                         color: [[0.04, '#91c7ae'], [0.07, '#63869e'], [1, 'red']]
                                                }  
                                            },      
                	        data: [{
                	            value: ${regionQualityLost},
                	            name: '${region}区质量损失率'
                	        }]
                	    }]
                };      
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        );
        
  
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
		    <a href="${pageContext.request.contextPath}/user/QualityAnalysis.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>质量分析</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="content" align="center">
		  		<table  width="100%" height="200" align="center" border="0" cellpadding="0" cellspacing="2" style="border-radius:0px;">
			   		<tr>
						<td bgcolor="#F6F6F6" align="center" >
							<div  style="height:320px; border:solid 1px black; width:94%;border-radius:8px 8px 8px 8px; background-color:white;">	
								<div style="height:20px;">
									<div style="float:left; padding-left:15px;"><img src="${pageContext.request.contextPath}/static/images/15.png"></div>	
									<div style="font-size:16px;font-weight:bold;float:left;margin-top:3px;">${region}区质量损失率</div>	
								</div><hr style="border:solid 1px #F6F6F6">
								<div id="first" style="height:300px; width:95%; margin-top:5px;" >
									<!--仪表盘-->
								</div>			
							</div>
						</td>	
					</tr>	
				
					<tr  style="height:40px;">
						<td align="center">
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">${region}区损失质量</label>	
								<label id="label2"  style="float:right;font-size:16px;">${totalLost}</label>	
							</div>
						</td>
					</tr>
					
					<tr  style="height:40px;">
						<td align="center">
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">${region}区消耗制品质量</label>	
								<label id="label2"  style="float:right;font-size:16px;">${totalConsumptionQuality}</label>	
							</div>
						</td>
					</tr>													
						
					<tr  style="height:40px;">
						<td align="center">
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">质量损失状态</label>	
								<c:choose>
									<c:when test="${regionQualityLost>=7.0}">
										<label id="label1"  style="float:right; font-size:16px;"><font color="red">质量损失较高</font></label>	
									</c:when>
									<c:when test="${regionQualityLost<7.0 && regionQualityLost>=4.0}">
										<label id="label1"  style="float:right; font-size:16px;"><font color="lightblue">质量损失较低</font></label>	
									</c:when>
									<c:otherwise>
										<label id="label1"  style="float:right; font-size:16px;"><font color="green">质量损失正常</font></label>	
						            </c:otherwise>
								</c:choose>							
							</div>
						</td>
					</tr>	
									
					
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