<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1" />
<link href="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
<script src="${pageContext.request.contextPath}/static/jquery/jquery-3.1.1.js" type="text/javascript"></script>
<title>主页</title>
<script type="text/javascript">

	function logout(){
		if(confirm("确定要退出吗？")){
			window.location.href="${pageContext.request.contextPath}/user/zhuye.jsp";
		}
	}
	//提交数据
	function submitData(){
		var idsChoose = new Array();
		idsChoose = $("#settingDisplay option:selected");
	    //此处取到了每个item，items[i].text则取到的是option中的文字，下面取到的是value属性
	    if(idsChoose.length==0){
	    	alert("至少选择一个项目");
	    	return false;
	    }else{
	    	var ids=[];
	    	for(var i=0;i<idsChoose.length;i++){
	    		ids.push(idsChoose[i].value);
	    	}
	    	var idsStr=ids.join(","); 
	    	$.ajax({
    	    	type:"POST",
    	    	url:"${pageContext.request.contextPath}/admin/lookManage.do",
    	    	async:false, //同步执行
    	    	data: "ids="+idsStr,//+"&macNumId="+ $("#MacNum").val(),
    	    	success:function(result){
    	    		var result=eval('('+result+')');
    	    		if(result.success){
    					alert("设置成功！");
    					//alert("ss");
    					//closeDialog();
    					//$("#lookManage").popup("close");
    				}else{   
    					alert("设置失败！请联系管理员！");
    					//closeDialog();
    					//$("#lookManage").popup('close');
    				}
    	    		window.location.href="${pageContext.request.contextPath}/admin/lookManageInterface.jsp";
    	    	}   	    			
    	    }); 
	    	
	    }
	}
/*	function closeDialog(){
		$("#clo").click();
		alert("ss");
	}*/
</script> 

<style type="text/css">
	img{
		border-radius:8px;
	}
</style>
</head>
<body >
	<div data-role="page" style="background-color:white;">
		  <div data-role="header" data-position="fixed">
		    <a href="javascript:logout();" class="ui-btn ui-icon-alert ui-btn-icon-left">退出</a>	   
    		  <h1>MES看板管理</h1>
    	<!--	<a href="#moreInfo" data-role="button" data-rel="popup" data-icon="grid" data-iconpos="notext" class="ui-btn-right" data-transition="slide"></a>   -->
		  </div>
		  <!--      
		  <div data-role="popup" id="moreInfo" class="ui-content"  data-overlay-theme="b">		
		  	 <div data-role="main" class="ui-content">
			    <ul data-role="listview" data-inset="true">    		  
			    </ul>
			  </div>
			  
			  
			  <ul data-role="listview" data-inset="true">			      
			      <li>
			        <a href="#">			        
			        <h2>登陆后台</h2>		        
			        </a>
			        <a href="#download" data-transition="pop" data-icon="gear">下载浏览器</a>
			      </li>
			      <li>
			        <a href="#">		        
			        <h2>登陆后台</h2>		        
			        </a>
			        <a href="#download" data-transition="pop" data-icon="gear">下载浏览器</a>
			      </li>
			   </ul>
			   
		  </div>
			--> 	  	  
		  <div data-role="content" >
		  	<div style="height:40px;">
		  	</div>
		    <table border="0" align="center" cellpadding="8" cellspacing="0" >
		    	<tr>
		    		<td><a href="${pageContext.request.contextPath}/user/EquipmentHouseKeeper.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/25.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/productInfo/search.do?s_title" rel="external"><img src="${pageContext.request.contextPath}/static/images/26.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/user/Maunfacturing-Statistics.jsp" rel="external"><img src="${pageContext.request.contextPath}/static/images/27.png"></a></td>
		    	</tr>
		    	<tr align="center">
		    		<td>工单进度</td>
		    		<td>考勤情况</td>
		    		<td>物料信息</td>	    
		    	</tr>
		    	<tr>	    		
		    		<td><a href="${pageContext.request.contextPath}/user/EquipmentHouseKeeper.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/28.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/productInfo/search.do?s_title" rel="external"><img src="${pageContext.request.contextPath}/static/images/29.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/user/Maunfacturing-Statistics.jsp" rel="external"><img src="${pageContext.request.contextPath}/static/images/30.png"></a></td>
		    	</tr>
		    	<tr align="center">
		    		<td>异常信息</td>
		    		<td>制品信息</td>
		    		<td>实时状态</td>	   
		    	</tr>
		    	
		    </table>
		    <!--搜索面板-->		  				
			<div data-dismissible="false" data-role="popup" id="lookManage"  class="ui-content" style="min-width:250px;">
				     <a href="#" onclick="closeDialog();" id="clo" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			
				        <div>				       
								<label for="settingDisplay" align="center">您可以选择多个项目</label>
								<select name="settingDisplay" id="settingDisplay" multiple="multiple" data-native-menu="false">								
									<option value="1">工单</option>
									<option value="2">考勤</option>
									<option value="3">物料</option>
									<option value="4">异常</option>
									<option value="5">制品</option>
									<option value="6">状态</option>				
								</select>	          					          
					          	<button id="button" onclick="submitData();">提交设置</button> 						          			         			          		          
				        </div>				        	
			</div>
		  </div>
		  <!--  -->
		  <div data-role="footer" data-position="fixed">
			 <h1>
			   	<a href="#lookManage"class="ui-btn"  data-rel="popup" data-position-to="window" class="" align="center" style="text-decoration: none">设置看板显示项目</a>								
			 </h1>
		  </div>
		  <!--  -->
	</div>	
</body>
</html>