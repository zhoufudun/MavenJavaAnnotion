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
		var XArray=[];//机器编号
		var UCLArray=[];//c控制图上限
		var LCLArray=[];//c控制图下限
		var breakDownArray=[];//实际值
		var CArray=[];//平均值
		$(document).ready(function() {						
			<c:forEach var="X" items="${XList}">				
				XArray.push('${X}');
			</c:forEach>
			<c:forEach var="UCL" items="${UCLList}">				
				UCLArray.push('${UCL}');
			</c:forEach>
			<c:forEach var="LCL" items="${LCLList}">				
				LCLArray.push('${LCL}');
			</c:forEach>
			<c:forEach var="breakDownNmber" items="${breakDownNmberList}">				
				breakDownArray.push('${breakDownNmber}');
			</c:forEach>
			<c:forEach var="C" items="${CList}">				
				CArray.push('${C}');
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
                	        trigger: 'axis',
                	        axisPointer : {
                	            type: 'shadow'
                	        }
                	    },
                	    legend: {
                	    	data:['UCL','实际','LCL','C']
                	    },
                	    toolbox: {
                	        show : true,
                	        orient : 'vertical',
                	        y : 'center',
                	        feature : {
                	            mark : {show: false},
                	            magicType : {show: true, type: ['line', 'bar', 'stack','tiled' ] },  //stack--堆积   tiled--平铺
                	            restore : {show: false},
                	            saveAsImage : {show: false}
                	        }
                	    },
                	    calculable : true,
                	    xAxis : [
                	        {
                	            type : 'category',
                	            data : XArray
                	        }
                	    ],
                	    yAxis : [
                	        {
                	            type : 'value',
                	            splitArea : {show : true},
                	            axisLabel : {
                	                formatter: '{value}次 '
                	            }
                	        }
                	    ],
                	    grid: {
                	        x2:45
                	    },
                	    series : [
                	        {
                	            name:'UCL',
                	            type:'line',
                	            stack: '总量',
                	            data:UCLArray
                	        },
                	        {
                	            name:'实际',
                	            type:'line',
                	            stack: '总量',
                	            data:breakDownArray
                	        },
                	        {
                	            name:'LCL',
                	            type:'line',
                	            stack: '总量',
                	            data:LCLArray
                	        },
                	        {
                	            name:'C',
                	            type:'line',
                	            stack: '总量',
                	            data:CArray
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
		    <a href="${pageContext.request.contextPath}/machine/EquipmentAnalysis.do" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>设备故障分析</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="content" align="center">
		  		<table  width="100%" height="390" align="center" border="0" cellpadding="0" cellspacing="2" style="border-radius:0px;">
			          <tr>
						<td bgcolor="#F6F6F6" align="center" >
							<div  style="height:380px; border:solid 1px black; width:100%;border-radius:8px 8px 8px 8px; background-color:white;">	
								<div style="height:20px;">
									<div style="float:left; padding-left:15px;"><img src="${pageContext.request.contextPath}/static/images/15.png"></div>	
									<div style="font-size:16px;font-weight:bold;float:left;margin-top:3px;">&nbsp;设备故障分析</div>	
								</div><hr style="border:solid 1px #F6F6F6">									
								
								<div id="second" style="height:360px; width:98%; margin-top:-10px;" >
								
								</div>		
							</div>
						</td>	
					</tr>
					 <tr  style="height:15px;margin-top:-5px;">
						<td align="center">
							<div  style="height:15px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">当前设备</label>	
								<label id="label2"  style="float:right;font-size:16px;">${macNum.id}-${macNum.factory}-${macNum.code}</label>	
							</div>
						</td>
					</tr>	
				    <tr  style="height:15px;margin-top:-5px;">
						<td align="center">
							<div  style="height:15px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">当前设备故障次数</label>	
								<label id="label2"  style="float:right;font-size:16px;">${macNum.breakDownNumber}次</label>	
							</div>
						</td>
					</tr>
					<tr  style="height:15px;margin-top:-5px;">
						<td align="center">
							<div  style="height:15px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">当前设备故障状态</label>	
								<label id="label2"  style="float:right;font-size:16px;">
									<c:choose>
										<c:when test="${breakDownState==1}">
											<font color="green">正常</font>
										</c:when>
										<c:otherwise>
											<font color="red">超限</font>
										</c:otherwise>
									</c:choose>
								</label>	
							</div>
						</td>
					</tr>
				    <tr style="height:15px;border:1px solid black;">
				    	<td >
				    		
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