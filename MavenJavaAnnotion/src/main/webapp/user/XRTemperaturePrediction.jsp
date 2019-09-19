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
		var RXArray=[];//R图x横坐标
		var UCLrArray=[];//R图控制图上限
		var LCLrArray=[];//R图控制图下限
		var RFArray=[];//R图R实际值
		var RArray=[];//R图平均值
		//
		var XXArray=[];//X图x横坐标
		var UCLxArray=[];//X图控制图上限
		var LCLxArray=[];//X图控制图下限
		var XFArray=[];//X图X实际值
		var XArray=[];//X图平均值
		$(document).ready(function() {
			/////////////////R控制图
			<c:forEach var="RX" items="${RXList}">				
				RXArray.push('${RX}');
			</c:forEach>
			<c:forEach var="UCLr" items="${UCLrList}">				
				UCLrArray.push('${UCLr}');
			</c:forEach>
			<c:forEach var="LCLr" items="${LCLrList}">				
				LCLrArray.push('${LCLr}');
			</c:forEach>
			<c:forEach var="RF" items="${RFList}">				
				RFArray.push('${RF}');
			</c:forEach>
			<c:forEach var="R" items="${RList}">				
				RArray.push('${R}');
			</c:forEach>
			/////////////////X控制图
			<c:forEach var="XX" items="${XXList}">				
				XXArray.push('${XX}');
			</c:forEach>
			<c:forEach var="UCLx" items="${UCLxList}">				
				UCLxArray.push('${UCLx}');
			</c:forEach>
			<c:forEach var="LCLx" items="${LCLxList}">				
				LCLxArray.push('${LCLx}');
			</c:forEach>
			<c:forEach var="XF" items="${XFList}">				
				XFArray.push('${XF}');
			</c:forEach>
			<c:forEach var="X" items="${XList}">				
				XArray.push('${X}');
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
                		title : {
            		        text: '均值控制图',
            		        subtext: '',
            		        x:'right'
            			},
                	    tooltip : {
                	        trigger: 'axis',
                	        axisPointer : {
                	            type: 'shadow'
                	        }
                	    },
                	    legend: {
                	    	data:['UCLx','实际','LCLx','X']
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
                	            data : XXArray
                	        }
                	    ],
                	    yAxis : [
                	    	{
            		            type : 'value',
            		            axisLabel : {
            		                formatter: '{value} ℃'
            		            }
            		        	,splitLine: {
            	                  show: false
            		        	},
            		        	scale:true,/*按比例显示*/
            		        }
                	    ],
                	    grid: {
                	        x2:45
                	    },
                	    series : [
                	        {
                	            name:'UCLx',
                	            type:'line',
                	            stack: '总量',
                	            data:UCLxArray
                	        },
                	        {
                	            name:'实际',
                	            type:'line',
                	            stack: '总量',
                	            data:XFArray
                	        },
                	        {
                	            name:'LCLx',
                	            type:'line',
                	            stack: '总量',
                	            data:LCLxArray
                	        },
                	        {
                	            name:'X',
                	            type:'line',
                	            stack: '总量',
                	            data:XArray
                	        }
                	    ]
                	};     
                // 为echarts对象加载数据 
                myChart2.setOption(option2); 
            }
        );
        require(
                [
                    'echarts',
                    'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
                    'echarts/chart/bar'
                ],
                function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var myChart1 = ec.init(document.getElementById('first')); 
                    
                    var option1 = {
                    		title : {
                    		        text: '极差控制图',
                    		        subtext: '',
                    		        x:'right'
                    		 },
                    	    tooltip : {
                    	        trigger: 'axis',
                    	        axisPointer : {
                    	            type: 'shadow'
                    	        }
                    	    },
                    	    legend: {
                    	    	data:['UCLr','实际','LCLr','R']
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
                    	            data : RXArray
                    	        }
                    	    ],
                    	    yAxis : [
                    	        {
                    	            type : 'value',
                    	            splitArea : {show : true},
                    	            axisLabel : {
                    	                formatter: '{value}℃'
                    	            }
                    	        }
                    	    ],
                    	    grid: {
                    	        x2:45
                    	    },
                    	    series : [
                    	        {
                    	            name:'UCLr',
                    	            type:'line',
                    	            stack: '总量',
                    	            data:UCLrArray
                    	        },
                    	        {
                    	            name:'实际',
                    	            type:'line',
                    	            stack: '总量',
                    	            data:RFArray
                    	        },
                    	        {
                    	            name:'LCLr',
                    	            type:'line',
                    	            stack: '总量',
                    	            data:LCLrArray
                    	        },
                    	        {
                    	            name:'R',
                    	            type:'line',
                    	            stack: '总量',
                    	            data:RArray
                    	        }
                    	    ]
                    	};     
                    // 为echarts对象加载数据 
                    myChart1.setOption(option1); 
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
		    <a href="${pageContext.request.contextPath}/user/predictionAnalysis.do" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>机筒稳态温度分析</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="content" align="center">
		  		<table  width="100%" height="390" align="center" border="0" cellpadding="0" cellspacing="2" style="border-radius:0px;">
			          <tr>
						<td bgcolor="#F6F6F6" align="center" >
							<div  style="height:540px; border:solid 1px black; width:100%;border-radius:8px 8px 8px 8px; background-color:white;">	
								<div style="height:20px;">
									<div style="float:left; padding-left:15px;"><img src="${pageContext.request.contextPath}/static/images/15.png"></div>	
									<div style="font-size:16px;font-weight:bold;float:left;margin-top:3px;">&nbsp;机筒稳态温度分析</div>	
								</div><hr style="border:solid 1px #F6F6F6">									
								
									
								<div id="first" style="height:250px; width:98%; margin-top:-10px;" >
								
								</div>	
								<hr>
								<div id="second" style="height:250px; width:98%; margin-top:-10px;" >
								
								</div>
							</div>
						</td>	
					</tr>
					 <tr  style="height:15px;margin-top:-5px;">
						<td align="center">
							<div  style="height:15px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">当前机筒温度位置</label>	
								<label id="label2"  style="float:right;font-size:16px;">${macNum.id}-${macNum.factory}-机筒${barrelRegion}段</label>	
							</div>
						</td>
					</tr>	
					<tr  style="height:15px;margin-top:-5px;">
						<td align="center">
							<div  style="height:15px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">当前机筒稳态温度状态</label>	
								<label id="label2"  style="float:right;font-size:16px;">${barrelTempState}</label>	
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