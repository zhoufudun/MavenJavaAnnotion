<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>
<head>
<title>主页</title>
<meta name="viewport" content="width=device-width,initial-scale=1" />
<link href="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
<script src="${pageContext.request.contextPath}/static/jquery/echarts-2.2.7/build/dist/echarts.js"></script>
<title>主页</title>
<script type="text/javascript">
	/////////////////
	var myChart ;////！！！！！！！这里一定要全局变量 ，因为在后面的refresh中用到了
	var alert_count = 0 ; 
	///////////
	///////////
	/////////
	//////////
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
	        'echarts/chart/pie',// 使用柱状图就加载bar模块，按需加载	       
	    ],
	    function (ec) {
        // 基于准备好的dom，初始化echarts图表
         myChart = ec.init(document.getElementById('main')); 
        	var option = {
            	    title : {
            	        text: '',
            	        subtext: ' ',
            	        x:'center'
            	    },
            	    tooltip : {
            	        trigger: 'item',
            	        formatter: "{a} <br/>{b} : {c} ({d}%)"
            	    },
            	    legend: {
            	        orient : 'vertical',
            	        x : 'left',
            	        data:['完成','运行','停止','修理','保养','报废','等待','闲置']
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: false},
            	            dataView : {show: true, readOnly: true},
            	            magicType : {
            	                show: true, 
            	                type: ['pie'],
            	                option: {
            	                    funnel: {
            	                        x: '70%',
            	                        width: '70%',
            	                        funnelAlign: 'left',
            	                        max: 500
            	                    }
            	                }
            	            },
            	            restore : {show: false},
            	            saveAsImage : {show: false}
            	        }
            	    },
            	    calculable : true,
            	    series : [
            	        {
            	            name:'访问来源-数据库',
            	            type:'pie',
            	            radius : '50%',
            	            center: ['50%', '50%'],
            	            data:(function(){   // data:[{},{},{},{}]
            	            	var arr=[];                	            	
            	            	$.ajax({
            	            		type:"POST",
            	            		url:'${pageContext.request.contextPath}/user/machineState.do',
            	            		async : false, //同步执行                	            		
            	            		data:"",//给服务器传数据
            	            		dataType:"json",//返回数据形式为json
            	            		success:function(result){    //{'success':true,'available':2}
            	            			//var result=eval('('+result+')');
            	            			if(result.success){            	     	            	            	            	            				
            	                				arr.push({													
            	        							name:"完成",
            	        							value:result.available
            	        						});
            	                				arr.push({													
            	        							name:"运行",
            	        							value:result.running
            	        						});
            	                				arr.push({													
            	        							name:"停止",
            	        							value:result.stop
            	        			 			});
            	                				arr.push({													
            	        							name:"修理",
            	        							value:result.maintain
            	        						});
            	                				arr.push({													
            	        							name:"保养",
            	        							value:result.upkeep
            	        						});
            	                				arr.push({													
            	        							name:"报废",
            	        							value:result.scrap
            	        						});
            	                				arr.push({													
            	        							name:"等待",
            	        							value:result.standby
            	        						});
            	                				arr.push({													
            	        							name:"闲置",
            	        							value:result.unused
            	        						});
            	        					}	
            	            		},
            	            		error:function(errorMsg){
            	            			alert("不好意思,图表请求数据失败啦!");
            	            			return;
            	            			myChart.hideLoading();
            	            		}
            	            	});                    	            	
            	            	return arr;                   	            	
            	            })() //（）表示立刻执行                  	              
            	        }
            	    ]
            	};
            // 为echarts对象加载数据 
            myChart.setOption(option);  
    }          
);  
function refresh(){			
		//document.getElementById('main').setAttribute('_echarts_instance_', '');\
    	var arr=[];   
    	///ajax获取数据
    	$.ajax({
    		type:"POST",
    		url:"${pageContext.request.contextPath}/user/machineState.do",
    		async : false, //同步执行                	            		
    		data:"",//给服务器传数据
    		dataType:"json",//返回数据形式为json
    		success:function(result){  
    			//var result=eval('('+result+')');
    			if(result.success){            	     	            	            	            	            				
	    				arr.push({													
							name:"完成",
							value:result.available
						});
	    				arr.push({													
							name:"运行",
							value:result.running
						});
	    				arr.push({													
							name:"停止",
							value:result.stop
			 			});
	    				arr.push({													
							name:"修理",
							value:result.maintain
						});
	    				arr.push({													
							name:"保养",
							value:result.upkeep
						});
	    				arr.push({													
							name:"报废",
							value:result.scrap
						});
	    				arr.push({													
							name:"等待",
							value:result.standby
						});
	    				arr.push({													
							name:"闲置",
							value:result.unused
						});           	 	            	            				
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
////////////////////////////////jquery语法		
/*	$(function(){
		$("#refresh").click(function(){      	
		refresh();
		});	
	}) */
	////////////////函数30秒执行一次
	function autoRefresh()
	{
		refresh();
	}
	setInterval('autoRefresh()',30000);
	
	///////////
 /* function myrefresh(){ 
    	window.location.reload(); 
    } 
    setTimeout('myrefresh()',5000); //整个页面指定5秒刷新一次 
    */
    ///////////////////////////////////////////////////////
    //机器选择验证
    function checkId(){	        	    
             if($("#id option:selected").val()!=-1){       	    	
        	     $('#button').attr("disabled",false);
    		 }else{
    			 $('#button').attr("disabled",true);
    		 }	   	    		
     }
    function getByMachineId(){
    	window.location.href='${pageContext.request.contextPath}/machine/getByMachineId.do?macNumId='+$("#id option:checked").val()
    }
  
    ///////////////////////////////////////////////////////
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

		  <div data-role="header" data-position="fixed">
		    <a href="${pageContext.request.contextPath}/user/zhuye.jsp" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>设备管家</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="content" align="center" data-fullscreen="true">
		  		<table  width="100%" height="100%" align="center" border="0" cellpadding="5" cellspacing="3" style="border-radius:0px;">
					<tr>
						<td bgcolor="#F6F6F6" align="center" >
							<div  style="height:80%; border:solid 2px black; width:90%;border-radius:8px 8px 8px 8px; background-color:white;">	
								<div style="height:20px;border-color:1px solid black;">
									<div style="float:left; padding-left:20px;"><img src="${pageContext.request.contextPath}/static/images/15.png"></div>	
									<div style="font-size:16px;font-weight:bold;float:left;margin-top:3px;">设备总信息</div>	
								</div>
								<div id="main" style="height:320px; width:300px; margin-top:10px;" >
									<!-- 饼状图 -->
								</div>			
							</div>
						</td>
					</tr>
					<!--  
					<tr style="border:none;">
						<td align="center">
							<a href="#" rel="external"><img src="${pageContext.request.contextPath}/static/images/10.png" style="width:330px;height:55px;" id="Equipment-HouseKeeper-images"/></a>
						</td>
					</tr> -->
					
					<tr>
						<td align="center">		
							<a href="#oneMachine"  data-rel="popup" data-position-to="window" class="" align="center"><img src="${pageContext.request.contextPath}/static/images/11.png" style="width:330px;height:55px;" id="Equipment-HouseKeeper-images"></a>	
						</td>
					</tr>
					
				</table>
				<!--机器状态查询-->		  				
				<div data-role="popup" id="oneMachine" class="ui-content" style="min-width:250px;">
				     <a href="#" onclick="closeSelectMaterialId();" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
				     <form >
				        <div>
					          <h3 align="center">请机器名称</h3>					          
					          <label for="id"  class="ui-hidden-accessible" >id:</label> 
					          <select id="id" name="id" onblur="checkId();" >
					          	<option value="-1">请选择机器</option>
					          	<c:forEach items="${selectMacNumList}" var="selectMacNum" >
					          		<option value="${selectMacNum.id}">${selectMacNum.id}-${selectMacNum.factory}-${selectMacNum.code}</option>
					          	</c:forEach>
					          </select>		          					          
					          <button id="button" disabled="disabled" onclick="getByMachineId();">搜索</button> 				          		          
				        </div>
				     </form>
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