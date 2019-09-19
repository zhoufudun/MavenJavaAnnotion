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
		var xArray=[];//温度
		var fArray=[];//概率	
		//var sArray=[];//概率
		$(document).ready(function() {						
			<c:forEach var="x" items="${xList}">			
				xArray.push('${x}');									
			</c:forEach>
			<c:forEach var="f" items="${fList}">				
				fArray.push('${f}');				
			</c:forEach>
		});	 
        // 路径配置
        require.config({
            paths: {
                echarts: '${pageContext.request.contextPath}/static/jquery/echarts-2.2.7/build/dist'
            }
        });
       
        //////////////////////////
        require(
            [
                'echarts',
                'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
                'echarts/chart/bar'
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart2 = ec.init(document.getElementById('second')); 
                
                var option2 = {
                	    tooltip : {
                	        trigger: 'axis'
                	    },
                	    toolbox: {
                	        show : true,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType: {show: true, type: ['line', 'bar']},
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    calculable : true,
                	    legend: {
                	        data:['概率','概率']
                	    },
                	    xAxis : [
                	        {
                	            type : 'category',
                	            data : xArray
                	        }
                	    ],
                	    yAxis : [
                	        {
                	            type : 'value',
                	            name : '概率',
                	            axisLabel : {
                	                formatter: '{value}'
                	            }
                	        },
                	        {
                	            type : 'value',
                	            name : '概率',
                	            axisLabel : {
                	                formatter: '{value} '
                	            }
                	        }
                	    ],
                	    series : [

                	        {
                	            name:'概率',
                	            type:'bar',
                	            data:${sArray}
                	        },
                	        
                	        {
                	            name:'概率',
                	            type:'line',
                	            yAxisIndex: 1,
                	            data:fArray
                	        }
                	    ]
                	};    
                // 为echarts对象加载数据 
                myChart2.setOption(option2); 
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
		    <a href="${pageContext.request.contextPath}/user/IntelligentAnalysis.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>预测报警</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="content" align="center">
		  		<table  width="100%" height="420" align="center" border="0" cellpadding="0" cellspacing="2" style="border-radius:0px;">
			          <tr>
						<td bgcolor="#F6F6F6" align="center" >
							<div  style="height:420px; border:solid 1px black; width:94%;border-radius:8px 8px 8px 8px; background-color:white;">	
								<div style="height:20px;">
									<div style="float:left; padding-left:15px;"><img src="${pageContext.request.contextPath}/static/images/15.png"></div>	
									<div style="font-size:16px;font-weight:bold;float:left;margin-top:3px;">&nbsp;温度预测报警</div>	
								</div><hr style="border:solid 1px #F6F6F6">							
								<div id="second" style="height:400px; width:95%; margin-top:0px;" >
								
								</div>		
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