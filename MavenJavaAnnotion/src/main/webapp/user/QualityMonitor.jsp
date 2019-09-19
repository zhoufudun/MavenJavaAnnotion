<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
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
	window.onload=function(){
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
                var myChart_1 = ec.init(document.getElementById('first')); 
                
                var option = {
					tooltip : {
						trigger: 'item',
						formatter: "{a} <br/>{b} : {c} ({d}%)"
					},
					legend: {
						orient : 'vertical',
						x : 'left',
						data:['车间总制品数','车间总次品数']
					},
					toolbox: {
						show : true,
						feature : {
							mark : {show: false},
							dataView : {show: true, readOnly: false},
							magicType : {
								show: false, 
								type: ['pie'],
								option: {
									funnel: {
										x: '10%',
										width: '20%',
										funnelAlign: 'center',
										max: 1000
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
							name:'访问来源',
							type:'pie',
							radius : '55%',
							radius : ['50%', '60%'],
							itemStyle : {
								normal : {
									label : {
										show :true
									},
									labelLine : {
										show :true
									}
								},
								emphasis : {
									label : {
										show : true,
										position : 'center',
										textStyle : {
											fontSize : '18',
											fontWeight : 'bold'
										}
									},
									shadowBlur: 10,
				                    shadowOffsetX: 0,
				                    shadowColor: 'rgba(0, 0, 0, 0.5)'
								}
							},
							data:[
								{value:'${getresult2[0].numberOfProducts}', name:'车间总制品数'},
								{value:'${getresult2[0].numberOfDefective}', name:'车间总次品数'}
							]
						}
					]
				};
                // 为echarts对象加载数据 
                myChart_1.setOption(option); 
            }
        );
        ///////////
        require(
            [
                'echarts',
                'echarts/chart/pie' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart_2 = ec.init(document.getElementById('second')); 
                
                var option1 = {
					tooltip : {
						trigger: 'item',
						formatter: "{a} <br/>{b} : {c} ({d}%)"
					},
					legend: {
						orient : 'vertical',
						x : 'left',
						data:['单机制品数','单机次品数']
					},
					toolbox: {
						show : true,
						feature : {
							mark : {show: false},
							dataView : {show: true, readOnly: false},
							magicType : {
								show: false, 
								type: ['pie'],
								option: {
									funnel: {
										x: '10%',
										width: '20%',
										funnelAlign: 'center',
										max: 1000
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
							radius : ['50%', '60%'],
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
											fontSize : '18',
											fontWeight : 'bold'
										}
									},
									shadowBlur: 0,
				                    shadowOffsetX:0,
				                    shadowColor: 'rgba(0, 0, 0, 0.5)'
								}
							},
							data:[
								{value:'${getresult1[0].numberOfProduct}', name:'单机制品数'},
								{value:'${getresult1[0].numberOfDefective}', name:'单机次品数'}
							]
						}
					]
				};
                // 为echarts对象加载数据 
                myChart_2.setOption(option1); 
            }
        );
		
	}	
	function check(){
		var mN=document.getElementById("machineNumbers").value;
		if(mN==""){
			alert("请输入机器编号");
			return false;
		}
		if(isNaN(mN)){
			alert("必须是数字");
			return false;
		}		
		return true;
	}
	//机器编号验证
    function checkMacNum(){	
    	    ///ajax获取数据
    	    $.ajax({
    	    	type:"POST",
    	    	url:"${pageContext.request.contextPath}/oneMacNumOfProduct/searchMacByMacNum.do?macNum="+$('#macNum').val(),
    	    	async:false, //同步执行                	            		   	    	
    	    	success:function(result){
    	    		var result=eval('('+result+')');
    	    		if(result.success){
    	    			//alert("该机器编号验证通过！");
    	    			$('#button').attr("disabled",false);
					}else{		
						alert("该机器编号不存！");						
						$('#macNum').val("");	
					}
    	    	}   	    			
    	    });			   	    		
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
    	$('#macNum').val("");	
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

		  <div data-role="header" data-position="fixed">
		    <a href="${pageContext.request.contextPath}/user/zhuye.jsp"  rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>质量监控</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="content" align="center">
		  		<table  width="100%" height="500" align="center" border="0" cellpadding="0" cellspacing="3" style="border-radius:0px;">
					<tr>
						<td bgcolor="#F6F6F6" align="center" >
							<div  style="height:400px; border:solid 1px white; width:95%;border-radius:8px 8px 8px 8px; background-color:white;">	
								<div style="height:20px;">
									<div style="float:left; padding-left:20px;"><img src="${pageContext.request.contextPath}/static/images/15.png"></div>	
									<div style="font-size:16px;font-weight:bold;float:left;margin-top:3px;">生产总信息</div>	
								</div><hr style="border:solid 1px #F6F6F6">
								<div id="first" style="height:180px; width:95%; margin-top:5px;" >
									
								</div><hr style="border:solid 1px #F6F6F6">
								
								<div id="second" style="height:180px; width:95%; margin-top:5px;" >
									
								</div>				
							</div>
						</td>	
					</tr>				
					<tr>
						<td align="center">														
							<a href="#Quality-Monitor" data-rel="popup" data-position-to="window" class="" align="center" ><img src="${pageContext.request.contextPath}/static/images/11.png" style="width:330px;height:55px;" id="Equipment-HouseKeeper-images"></a>																						
						</td>
					</tr>					
				</table>
				<!--搜索面板-->		  				
				<div data-role="popup" id="Quality-Monitor" class="ui-content" style="min-width:250px;">
				     <a href="#" onclick="closeSearchMacNum();" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
				     <form method="post" action="${pageContext.request.contextPath}/oneMacNumOfProduct/getOneMacNumOfProductByMacNum.do" onsubmit="return checkForm();"  >
				        <div>
					          <h3 align="center">请输入机器编号</h3>
					          <label for="macNum" class="ui-hidden-accessible">机器编号</label>
					          <input type="hidden" name="action" id="action" value="-1">
					          <input type="text" name="macNum" id="macNum" placeholder="请输入机器编号... " onblur="checkMacNum();">			          					          
					          <button id="button" disabled="disabled" onclick="submit();" >搜索</button> 				          		          
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