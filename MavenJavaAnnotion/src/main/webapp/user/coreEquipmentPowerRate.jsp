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
                'echarts/chart/pie' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('first')); 
                
                var option = {
                	    tooltip : {
                	        trigger: 'item',
                	        formatter: "{a} <br/>{b} : {c} ({d}%)"
                	    },
                	    legend: {
                	        orient : 'vertical',
                	        x : 'left',
                	        data:['实际能耗功率','总体额定功率']
                	    },
                	    toolbox: {
                	        show : true,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType : {
                	                show: false, 
                	                type: ['pie'],
                	                option: {
                	                    funnel: {
                	                        x: '25%',
                	                        width: '50%',
                	                        funnelAlign: 'center',
                	                        max: 1548
                	                    }
                	                }
                	            },
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    calculable : true,
                	    series : [
                	        {
                	            name:'',
                	            type:'pie',
                	            radius : ['50%', '70%'],
                	            itemStyle : {
                	                normal : {
                	                    label : {
                	                        show : false
                	                    },
                	                    labelLine : {
                	                        show : false
                	                    }
                	                },
                	                emphasis : {
                	                    label : {
                	                        show : true,
                	                        position : 'center',
                	                        textStyle : {
                	                            fontSize : '30',
                	                            fontWeight : 'bold'
                	                        }
                	                    }
                	                }
                	            },
                	            data:[
                	                {value:${infactPower},name:'实际能耗功率'},
                	                {value:${rated},name:'总体额定功率'}
                	            ]
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
			window.location.href="${pageContext.request.contextPath}/machine/oneMacNumEnergyConsumptionAnalysis.do?id="+$('#id option:selected').val();
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
		    <a href="${pageContext.request.contextPath}/user/EnergyConsumptionAnalysis.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>能耗比率详情</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="content" align="center">
		  		<table  width="100%" height="500" align="center" border="0" cellpadding="0" cellspacing="2" style="border-radius:0px;">
					<tr>
						<td bgcolor="#F6F6F6" align="center" >
							<div  style="height:315px; border:solid 1px black; width:94%;border-radius:8px 8px 8px 8px; background-color:white;">	
								<div style="height:20px;">
									<div style="float:left; padding-left:15px;"><img src="${pageContext.request.contextPath}/static/images/15.png"></div>	
									<div style="font-size:16px;font-weight:bold;float:left;margin-top:3px;">核心设备能耗比率</div>	
								</div><hr style="border:solid 1px #F6F6F6">
								<div id="first" style="height:300px; width:95%; margin-top:-25px;" >
									
								</div>			
							</div>
						</td>	
					</tr>
				
					<tr  style="height:30px;">
						<td align="center">
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">实际消耗的功率</label>	
								<label id="label2"  style="float:right;font-size:16px;">${infactPower}W</label>	
							</div>
						</td>
					</tr>
					
					<tr style="height:30px;border:1px solid black;">
						<td align="center" >
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4pxs; background-color:white;">	
								<label id="label3"  style="float:left; font-size:16px;">总体额定功率</label>	
								<label id="label4"  style="float:right;font-size:16px;">${rated}W</label>			
							</div>
						</td>
					</tr>
					
					<tr style="height:30px;border:1px solid black;">
						<td align="center" >
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4pxs; background-color:white;">	
								<label id="label3"  style="float:left; font-size:16px;">核心机器台数</label>	
								<label id="label4"  style="float:right;font-size:16px;">${number}台</label>			
							</div>
						</td>
					</tr>
					
					<tr  style="height:30px;">
						<td align="center">
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">一区台数</label>	
								<label id="label2"  style="float:right;font-size:16px;">${regionOne}台</label>	
							</div>
						</td>
					</tr>
					
					<tr  style="height:30px;">
						<td align="center">
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">二区台数</label>	
								<label id="label2"  style="float:right;font-size:16px;">${regionTwo}台</label>	
							</div>
						</td>
					</tr>
					
					<tr  style="height:30px;">
						<td align="center">
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">三区台数</label>	
								<label id="label2"  style="float:right;font-size:16px;">${regionThree}台</label>	
							</div>
						</td>
					</tr>
					
					<tr  style="height:30px;">
						<td align="center">
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">四区台数</label>	
								<label id="label2"  style="float:right;font-size:16px;">${regionFouth}台</label>	
							</div>
						</td>
					</tr>
					
					<tr style="height:38px;border:1px solid red">
						<td align="center">
							<button  style="width:358px" ><a href="#oneMacNum" style="text-decoration: none;" data-rel="popup" data-position-to="window"  align="center" >具体机器功耗</a></button>							
						</td>
					</tr>
					
					
					
				</table>
				<!--某机器能耗查询-->		  				
				<div data-role="popup" id="oneMacNum" class="ui-content" style="min-width:250px;">
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