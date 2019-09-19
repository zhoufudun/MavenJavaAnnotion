<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
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
/*		////
		var arrayName=[];
		var arrayValue=[];
		$(document).ready(function() {						
			<c:forEach var="Material" items="${totalMaterialList}">
				arrayName.push('${Material.name}');	
				arrayValue.push('${Material.weight}');
			</c:forEach>
		});	    
		////
	*/
		var myChart2;
        require.config({
            paths: {
                echarts: '${pageContext.request.contextPath}/static/jquery/echarts-2.2.7/build/dist'
            }
        });      
        require(
                [
                    'echarts',
                    'echarts/chart/gauge' // 使用柱状图就加载bar模块，按需加载
                ],
                function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var myChart2 = ec.init(document.getElementById('second')); 
                    
                    var option2 = {
                    	    tooltip : {
                    	        formatter: "{a} <br/>{b} : {c}%"
                    	    },
                    	    toolbox: {
                    	        show : false,
                    	        feature : {
                    	            mark : {show: true},
                    	            restore : {show: true},
                    	            saveAsImage : {show: true}
                    	        }
                    	    },
                    	    series : [
                    	        {
                    	            name:'个性化仪表盘',
                    	            type:'gauge',
                    	            center : ['50%', '50%'],    // 默认全局居中
                    	            radius : [0, '75%'],
                    	            startAngle: 140,
                    	            endAngle : -140,
                    	            min: 0,                     // 最小值
                    	            max: 100,                   // 最大值
                    	            precision: 0,               // 小数精度，默认为0，无小数点
                    	            splitNumber: 10,             // 分割段数，默认为5
                    	            axisLine: {            // 坐标轴线
                    	                show: true,        // 默认显示，属性show控制显示与否
                    	                lineStyle: {       // 属性lineStyle控制线条样式
                    	                    color: [[0.3, 'red'],[0.6, 'skyblue'],[1, 'lightgreen']], 
                    	                    width: 30
                    	                }
                    	            },
                    	            axisTick: {            // 坐标轴小标记
                    	                show: true,        // 属性show控制显示与否，默认不显示
                    	                splitNumber: 10,    // 每份split细分多少段
                    	                length :8,         // 属性length控制线长
                    	                lineStyle: {       // 属性lineStyle控制线条样式
                    	                    color: '#eee',
                    	                    width: 1,
                    	                    type: 'solid'
                    	                }
                    	            },
                    	            axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                    	                show: true,
                    	                formatter: function(v){
                    	                    switch (v+''){
                    	                        case '0': return '低';
                    	                        case '10': return '10';
                    	                        case '20': return '20';
                    	                        case '30': return '中';
                    	                        case '40': return '40';
                    	                        case '50': return '50';
                    	                        case '60': return '高';
                    	                        case '70': return '70';
                    	                        case '80': return '80';
                    	                        case '90': return '90';
                    	                        case '100': return '100';
                    	                        default: return '';
                    	                    }
                    	                },
                    	                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                    	                    color: '#333'
                    	                }
                    	            },
                    	            splitLine: {           // 分隔线
                    	                show: true,        // 默认显示，属性show控制显示与否
                    	                length :30,         // 属性length控制线长
                    	                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                    	                    color: '#eee',
                    	                    width: 2,
                    	                    type: 'solid'
                    	                }
                    	            },
                    	            pointer : {
                    	                length : '80%',
                    	                width : 8,
                    	                color : 'auto'
                    	            },
                    	            title : {
                    	                show : true,
                    	                offsetCenter: ['-65%', -10],       // x, y，单位px
                    	                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                    	                    color: '#333',
                    	                    fontSize : 15
                    	                }
                    	            },
                    	            detail : {
                    	                show : true,
                    	                backgroundColor: 'rgba(0,0,0,0)',
                    	                borderWidth: 0,
                    	                borderColor: '#ccc',
                    	                width: 100,
                    	                height: 40,
                    	                offsetCenter: ['-60%', 10],       // x, y，单位px
                    	                formatter:'{value}%',
                    	                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                    	                    color: 'auto',
                    	                    fontSize : 30
                    	                }
                    	            },
                    	            data:[{value: ${urgentOrderRate}, name: '加急工单占比率'}]
                    	        }
                    	    ]
                    	};      
                    // 为echarts对象加载数据 
                    myChart2.setOption(option2); 
                }
            );
   /*     //第一个图标刷新
        function refreshUp(){			
        	var arr=[];   
        	///ajax获取数据
        	$.ajax({
        		type:"POST",
        		url:"${pageContext.request.contextPath}/totalWorkDetail/getTotalWorkDetail.do",
        		async : false, //同步执行                	            		
        		data:"",//给服务器传数据
        		dataType:"json",//返回数据形式为json
        		success:function(result){          	
        			if(result.success){            	     	            	            	            	            				
            				arr.push({													
    							name:"总计划生产量",
    							value:result.getresult[0].totalPlayProNum
    						});
            				arr.push({													
    							name:"总实际生产量",
    							value:result.getresult[0].totalInfactProNum
    						});
            				           	 	            	            				
    					}else{
    						alert(result.errorMsg);
    					}	
        		},
        		error:function(errorMsg){
        			if(alert_count>2){
        				return ;
        			}
        			alert_count++;
        			alert("不好意思,图表请求数据失败啦!");
        			return false;
        			myChart.hideLoading();
        		}
        	});
        	//更新数据       
        	var option = myChart.getOption();            	
            option.series[0].data =arr;   
            myChart.setOption(option); 
		} 
		////////////////函数30秒执行一次
    	function autoRefresh()
    	{
    		refreshUp();
    	}
    	setInterval('autoRefresh()',6000);	
    	
    	*/
    	
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
		    <a href="${pageContext.request.contextPath}/user/orderAnalysis.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>工单分析</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="content" align="center">
		  		<table  width="100%" height="400" align="center" border="0" cellpadding="0" cellspacing="2" style="border-radius:0px;">
					<tr>
						<td bgcolor="#F6F6F6" align="center" >
							<div style="height:340px; border:solid 1px black; width:94%;border-radius:8px 8px 8px 8px; background-color:white;">	
								<div style="height:20px;">
									<div style="float:left; padding-left:15px;"><img src="${pageContext.request.contextPath}/static/images/15.png"></div>	
									<div style="font-size:16px;font-weight:bold;float:left;margin-top:3px;">加急工单占比率</div>	
								</div>								
						        <hr style="border:solid 1px #F6F6F6;margin-top:10px;">
								<div id="second" style="height:330px; width:95%; margin-top:-30px;" >
									
								</div>
										
							</div>
						</td>	
					</tr>
					
					<tr  style="height:30px;margin-top:-5px;">
						<td align="center">
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">加急工单数量</label>	
								<label id="label2"  style="float:right;font-size:16px;">${urgentAddOrderSize}个</label>	
							</div>
						</td>
					</tr>
					
					<tr  style="height:30px;margin-top:-5px;">
						<td align="center">
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">总工单数量</label>	
								<label id="label2"  style="float:right;font-size:16px;">${allAddOrderSize}个</label>	
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