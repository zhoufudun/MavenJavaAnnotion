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
    	var myChart1;////！！！！！！！这里一定要全局变量 ，因为在后面的refresh中用到了
    	var myChart2;////！！！！！！！这里一定要全局变量 ，因为在后面的refresh中用到了
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
                'echarts/chart/pie' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                myChart1 = ec.init(document.getElementById('first')); 
                
                var option1 = {
                	    title : {
                	        text: '',
                	        subtext: '',
                	        x:'center'
                	    },
                	    tooltip : {
                	        trigger: 'item',
                	        formatter: "{a} <br/>{b} : {c} ({d}%)"
                	    },
                	    legend: {
                	        orient : 'vertical',
                	        x : 'left',
                	        data:['${region}区核心设备故障次数','${region}区非核心设备故障次数','其他区设备故障次数']
                	    },
                	    toolbox: {
                	        show : false,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType : {
                	                show: true, 
                	                type: ['pie', 'funnel'],
                	                option: {
                	                    funnel: {
                	                        x: '25%',
                	                        width: '50%',
                	                        funnelAlign: 'left',
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
                	            name:'数据库',
                	            type:'pie',
                	            radius : '55%',
                	            center: ['50%', '60%'],
                	            data:[
                	                {value:'${regionCoreDrawBack}',name:'${region}区核心设备故障次数'},
                	                {value:'${regionUnCoreDrawBack}',name:'${region}区非核心设备故障次数'},
                	                {value:'${otherRegionTotalBreakDown}',name:'其他区设备故障次数'},               	                
                	            ]
                	        }
                	    ]
                	};
                // 为echarts对象加载数据 
                myChart1.setOption(option1); 
            }
        );
      ///////////第二个图标
        require(
            [
                'echarts',
                'echarts/chart/pie' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                myChart2=ec.init(document.getElementById('second')); 
                
                var option2 = {
                	    title : {
                	        text: '',
                	        subtext: '',
                	        x:'center'
                	    },
                	    tooltip : {
                	        trigger: 'item',
                	        formatter: "{a} <br/>{b} : {c} ({d}%)"
                	    },
                	    legend: {
                	        orient : 'vertical',
                	        x : 'left',
                	        data:['${region}区核心设备台数','${region}区非核心设备台数','其他区设备台数']
                	    },
                	    toolbox: {
                	        show : false,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType : {
                	                show: true, 
                	                type: ['pie'],
                	                option: {
                	                    funnel: {
                	                        x: '25%',
                	                        width: '50%',
                	                        funnelAlign: 'left',
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
                	            name:'数据库',
                	            type:'pie',
                	            radius : '55%',
                	            center: ['50%', '60%'],
                	            data:[
                	                {value:${regionCoreMacNumList},name:'${region}区核心设备台数'},
                	                {value:${regionUnCoreMacNumList},name:'${region}区非核心设备台数'},
                	                {value:${otherMacNumList},name:'其他区设备台数'},               	                
                	            ]
                	        }
                	    ]
                	};
                // 为echarts对象加载数据 
                myChart2.setOption(option2); 
            }
        );
 /*  
      //第一个图标刷新
        function refreshUp(){			
        	var arr=[];   
        	///ajax获取数据
        	$.ajax({
        		type:"POST",
        		url:"${pageContext.request.contextPath}/user/totalOneDayPlayProduct.do",
        		async : false, //同步执行                	            		
        		data:"action=play",//给服务器传数据
        		dataType:"json",//返回数据形式为json
        		success:function(result){          	
        			if(result.success){            	     	            	            	            	            				
            				arr.push({													
    							name:"日计划产量",
    							value:result.getresult[0].totalPlanNumber
    						});
            				arr.push({													
    							name:"日实际产量",
    							value:result.getresult[0].totalFinishNumber
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
        			myChart1.hideLoading();
        		}
        	});
        	//更新数据       
        	var option1 = myChart1.getOption();            	
            option1.series[0].data =arr ;   
            myChart1.setOption(option1); 
		} 
   
        //第二个图标刷新
        function refreshDown(){			
        	var arr=[];   
        	///ajax获取数据
        	$.ajax({
        		type:"POST",
        		url:"${pageContext.request.contextPath}/user/totalOneDayPlayProduct.do",
        		async : false, //同步执行                	            		
        		data:"action=pruduct",//给服务器传数据
        		dataType:"json",//返回数据形式为json
        		success:function(result){          	
        			if(result.success){            	     	            	            	            	            				
        				arr.push({													
							name:"总制品数",
							value:result.getresult[0].totalFinishNumber
						});
        				arr.push({													
							name:"总次品数",
							value:result.getresult[0].totalDefectiveNumber
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
        			myChart2.hideLoading();
        		}
        	});
        	//更新数据       
        	var option2 = myChart2.getOption();            	
            option2.series[0].data =arr ;   
            myChart2.setOption(option2); 
		}       
		////////////////函数5秒执行一次
    	function autoRefresh()
    	{
    		refreshUp();
    		setTimeout('refreshDown()',3000);	
    	}
    	setInterval('autoRefresh()',6000);*/
    	/////////////////////////////
    	//机器编号验证
        function checkMacNum(){	        	    
             if($("#id option:selected").val()!=-1){       	    	
        	     $('#button').attr("disabled",false);
    		 }else{
    			 $('#button').attr("disabled",true);
    		 }	   	    		
        }
        function checkForm(){
        	var macNum=$('#macNum').val();
        	if(macNum==null|| macNum==""){
        		alert("机器编号不能为空！");
        		return false;
        	}
        	return true;
        }
        function closeSearchMacNum(){
        	//$('#id').val('-1');
        }      
        ///////////////////////////
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
		    <a href="${pageContext.request.contextPath}/user/EquipmentAnalysis.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>核心设备故障详情</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="content" align="center">
		        <div style="height:25px;">
		        </div> 
		  		<table  width="99%" height="500" align="center" border="0" cellpadding="0" cellspacing="3" style="border-radius:0px;">
					<tr>
						<td bgcolor="#F6F6F6" align="center" >
							<div  style="height:500px; border:solid 2px black; width:98%;border-radius:8px 8px 8px 8px; background-color:white;">	
								<div style="height:20px;">
									<div style="float:left; padding-left:20px;"><img src="${pageContext.request.contextPath}/static/images/15.png"></div>	
									<div style="font-size:16px;font-weight:bold;float:left;margin-top:3px;">${region}区核心设备故障详情</div>	
								</div><hr style="border:solid 1px #F6F6F6">
								<div id="first" style="height:220px; width:100%; margin-top:5px;" >
									
								</div><hr style="border:solid 2px #F6F6F6">
								
								<div id="second" style="height:220px; width:100%; margin-top:5px;" >
									
								</div>				
							</div>
						</td>	
					</tr>
				<!--  
					<tr>
						<td align="center">
							<a href="#order-Execution" data-rel="popup" data-position-to="window" class="" align="center" ><img src="${pageContext.request.contextPath}/static/images/11.png" style="width:340px;height:55px;" id="Equipment-HouseKeeper-images"></a>								
						</td>
					</tr>
					-->
				</table>
				<!--搜索面板-->		  				
				<div data-role="popup" id="order-Execution" class="ui-content" style="min-width:250px;">
				     <a href="#" onclick="closeSearchMacNum();" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
				     <form method="post" action="${pageContext.request.contextPath}/workExecuStu/getWorkExecuStuByMacNum.do"  >
				        <div>
					          <h3 align="center">请选择机器编号</h3>					          
					          <label for="id"  class="ui-hidden-accessible" >员工编号:</label>   <!--工单id-->  
					          <select id="id" name="id" onblur="checkMacNum();" >
					          	<option value="-1">请选择机器...</option>
					          	<c:forEach items="${addOrderList}" var="addOrder" >
					          		<option value="${addOrder.id}">${addOrder.macNum}</option>
					          	</c:forEach>
					          </select>		          					          
					          <button id="button" disabled="disabled" onclick="submit();" >搜索</button> 				          		          
				        </div>
				     </form>
				</div>
		  </div>		
		  <div data-role="footer" data-position="fixed">
		    	<div data-role="navbar">
				   <ul>
				       <li><a href="zhuye.jsp" rel="external" data-icon="home" data-mini="true">首页</a></li>
				       <li><a href="#" data-icon="search" data-mini="true">搜索</a></li>
				       <li><a href="#" data-icon="info" data-mini="true">消息</a></li>
				   </ul>
			  </div>
		  </div>
	</div>	
	
</body>


</html>