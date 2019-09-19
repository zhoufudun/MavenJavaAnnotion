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
		////
		var Time=[];
		var TempValue=[];
		$(document).ready(function() {						
			<c:forEach var="barrelTempCurve" items="${barrelTempCurveList}">				
				Time.push('${barrelTempCurve.timeString}');	
				TempValue.push('${barrelTempCurve.temperature}');
			</c:forEach>
		});	    
		////
		var myChart2;
        require.config({
            paths: {
                echarts: '${pageContext.request.contextPath}/static/jquery/echarts-2.2.7/build/dist'
            }
        });      
        require(
                [
                    'echarts',
                    'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
                    'echarts/chart/bar',
                    
                ],
                function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var myChart2 = ec.init(document.getElementById('second')); 
                    
                    var option2 = {
                    	    tooltip : {
                    	        trigger: 'axis'
                    	    },
                    	    legend: {
                    	        data:['测试温度']
                    	    },
                    	    toolbox: {
                    	        show : true,
                    	        feature : {
                    	            mark : {show: true},
                    	            dataView : {show: true, readOnly: false},
                    	            magicType : {show: true, type: ['line', 'bar','stack']},
                    	            restore : {show: true},
                    	            saveAsImage : {show: true}
                    	        }
                    	    },
                    	    calculable : true,
                    	    xAxis : [
                    	        {
                    	            type : 'category',
                    	            boundaryGap : true,
                    	            data :Time
                    	        }
                    	    ],
                    	    yAxis : [
                    	        {
                    	            type : 'value',
                    	            axisLabel : {
                    	                formatter: '{value} °C'
                    	            }
                    	        }
                    	    ],
                    	    series : [               	        
                    	        {
                    	            name:'测试温度',
                    	            type:'line',
                    	            stack: '总量',
                    	            data:TempValue
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
		    <a href="${pageContext.request.contextPath}/user/EquipmentHouseKeeper.do" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>机筒${region}段温度曲线</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="content" align="center">
		  		<table  width="100%" height="440" align="center" border="0" cellpadding="0" cellspacing="2" style="border-radius:0px;">
					<tr>
						<td bgcolor="#F6F6F6" align="center" >
							<div style="height:380px; border:solid 1px black; width:94%;border-radius:8px 8px 8px 8px; background-color:white;">	
								<div style="height:20px;">
									<div style="float:left; padding-left:15px;"><img src="${pageContext.request.contextPath}/static/images/15.png"></div>	
									<div style="font-size:16px;font-weight:bold;float:left;margin-top:3px;">机筒温度曲线</div>	
								</div>								
						        <hr style="border:solid 1px #F6F6F6;margin-top:10px;">
								<div id="second" style="height:370px; width:95%; margin-top:-30px;" >
									
								</div>
										
							</div>
						</td>	
					</tr>
														
				</table>				
		  </div>	
					
		  <div data-role="footer" data-position="fixed">
		    	 <div data-role="footer" data-position="fixed">
				   <h1 align="center">
				   		<input type="hidden" id="macNumId" value="${macNum.id}">				   		
				   		${macNum.factory}---${macNum.code}---机筒${region}段
				   </h1>
			     </div>
		  </div>
	</div>	
	
</body>


</html>