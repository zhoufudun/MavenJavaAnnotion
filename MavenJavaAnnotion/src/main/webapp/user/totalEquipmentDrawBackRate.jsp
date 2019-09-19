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
		    
		////
		var myChart;
        require.config({
            paths: {
                echarts: '${pageContext.request.contextPath}/static/jquery/echarts-2.2.7/build/dist'
            }
        });
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
                'echarts/chart/line'
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('first'));               
                var option = {
                	    title : {
                	        text: '',
                	        subtext: ''
                	    },
                	    tooltip : {
                	        trigger: 'axis'
                	    },
                	    legend: {
                	        data:[]
                	       // textStyle:{fontSize:4}
                	    },
                	    toolbox: {
                	        show : false,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType: {show: true, type: ['line', 'bar']},
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    calculable : true,
                	    xAxis : [
                	        {
                	            type : 'value',
                	            boundaryGap : [0, 0.001]
                	        }
                	    ],
                	    yAxis : [
                	        {
                	            type : 'category',
                	            data : arrayY
                	        }
                	    ],
                	    series : [
                	        {
                	            name:'',
                	            type:'bar',
                	            data:arraySeries
                	        }
                	    ]
                	};       
                // 为echarts对象加载数据 
                myChart.setOption(option); 
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
    	//////////////////////////////
   		function search(){
			window.location.href="${pageContext.request.contextPath}/machine/OneMacNumDrawBack.do?id="+$('#id option:selected').val();
	    }
    ////文档加载完毕后执行赋值
		var arrayY=[];
		var arraySeries=[];
		$(document).ready(function() {						
			<c:forEach var="macNum" items="${macNumList}">
			    arrayY.push('${macNum.code}');					
				arraySeries.push('${macNum.breakDownNumber}');
			</c:forEach>
		});	
		
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
		    <a href="${pageContext.request.contextPath}/user/EquipmentAnalysis.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>总设备故障详情</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="content" align="center">
		  		<table  width="100%" height="530" align="center" border="0" cellpadding="0" cellspacing="2" style="border-radius:0px;">
					<tr>
						<td bgcolor="#F6F6F6" align="center" >
							<div  style="height:520px; border:solid 1px black; width:95%;border-radius:8px 8px 8px 8px; background-color:white;">	
								<div style="height:20px;">
									<div style="float:left; padding-left:15px;"><img src="${pageContext.request.contextPath}/static/images/15.png"></div>	
									<div style="font-size:16px;font-weight:bold;float:left;margin-top:3px;">总设备故障详情</div>	
								</div><hr style="border:solid 1px #F6F6F6">
								<div id="first" style="height:480px; width:98%;" >
									
								</div>			
							</div>
						</td>	
					</tr>
				
					
					<tr  style="height:20px;">
						<td align="center">
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">出现故障的次数</label>	
								<label id="label2"  style="float:right;font-size:16px;">${totalBreakDown}次</label>	
							</div>
						</td>
					</tr>
					
					<tr style="height:38px;border:1px solid red">
						<td align="center">
							<button  style="width:358px" ><a href="#oneMacNumDrawBack" style="text-decoration: none;" data-rel="popup" data-position-to="window"  align="center" >某设备故障情况</a></button>							
						</td>
					</tr>
										
				</table>
				<!--某机器故障次数查询-->		  				
				<div data-role="popup" id="oneMacNumDrawBack" class="ui-content" style="min-width:250px;">
				     <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     
				        <div>
					          <h3 align="center">请选择机器</h3>					          
					          <label for="id"  class="ui-hidden-accessible" >id:</label> 
					          <select id="id" name="id">
					            <c:forEach items="${macNumList}" var="macNum">
					            	<option value="${macNum.id}">${macNum.factory}-${macNum.code}</option>
					            </c:forEach>					          						          	
					          </select>		          					          
					          <button onclick="search();" >搜索</button> 				          		          
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