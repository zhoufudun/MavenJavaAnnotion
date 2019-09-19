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
$(function () {          
    $("#addForm").on("click",function () { //添加机器           	
    	$.post("${pageContext.request.contextPath}/admin/addEquipment.do",
    		 {  
    			'factory':$('#factory').val(),
    			'code':$('#code').val(),
    			'grade':$('#grade').val(),           			
			    'totPower':$('#totPower').val(),  				    
			    'etcCurrent':$('#etcCurrent').val(),
			    'maxInjStroke':$('#maxInjStroke').val(),
			    'screwD':$('#screwD').val(),
			    'injCapacty':$('#injCapacty').val(),
			    'maxInjSpeed':$('#maxInjSpeed').val(),
			    'maxConSect':$('#maxConSect').val(),
			    'maxInjPress':$('#maxInjPress').val(),
			    'region':$('#region option:selected').val(),
			    'core':$('#core option:selected').val()
			  },function(result){
			   if(result.success){                     
                       alert("添加成功！");   
                       window.location.href="${pageContext.request.contextPath}/admin/equipmentManage.jsp";	
                   }else{                      
                       alert("添加失败！");
                       window.location.href="${pageContext.request.contextPath}/admin/equipmentManage.jsp";	
                   }
		},"json");                     
    }); 	
});
//关闭添加生产线窗口后初始化
function closeAddDialog(){     		  		
	$('#factory').val("");
	$('#code').val("");
	$('#grade').val("");
	$('#totPower').val("");
	$('#etcCurrent').val("");
	$('#maxInjStroke').val("");
	$('#screwD').val(""); 	
	$('#injCapacty').val("");	
	$('#maxInjSpeed').val("");
	$('#maxConSect').val(""); 
	$('#maxInjPress').val(""); 
	$('#region').val("");
	///////////
	$('#yanzhengadd').attr("disabled",false);
	$('#addForm').attr("disabled",true);
}
function checkAddForm(){ //	
	if($("#factory").val()==""){
		alert("生产厂家不能为空！");		
	}else if($("#code").val()==""){
		alert("机器代号不能为空！");	
	}else if($("#grade").val()==""){
		alert("机器牌号不能为空！");	
	}else if($("#totPower").val()==""){
		alert("机器总功率不能为空！");	
	}else if($("#etcCurrent").val()==""){
		alert("机器电流不能为空！");	
	}else if($("#maxInjStroke").val()==""){
		alert("机器最大注射行程不能为空！");	
	}else if($("#screwD").val()==""){
		alert("机器螺杆直径不能为空！");	
	}else if($("#injCapacty").val()==""){
		alert("机器注射容量不能为空！");	
	}else if($("#maxInjSpeed").val()==""){
		alert("机器最大注射速度不能为空！");	
	}else if($("#maxConSect").val()==""){
		alert("机器最大螺杆速度控制段数不能为空！");	
	}else if($("#maxInjPress").val()==""){
		alert("机器最大注射压力不能为空！");	
	}else if($("#region").val()==""){
		alert("机器放置区域不能为空！");	
	}else{
		alert("验证通过!");
		$('#yanzhengadd').attr("disabled",true);
		$('#addForm').attr("disabled",false);
	}    		
}
</script>

<style type="text/css">
	img{
		border-radius:8px;
	}
</style>
</head>
<body>
	<div data-role="page" style="background-color:white;">
		  <div data-role="header" data-position="fixed">
		     <a href="${pageContext.request.contextPath}/admin/adminInterface.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>   
    		  <h1>设备管理</h1> 
    	  </div> 	  	  
		  <div data-role="content" >
		  	<div style="height:40px;">
		  	
		  	</div>
		    <table border="0" align="center" cellpadding="12">
		    	<tr>
		    		<td><a href="${pageContext.request.contextPath}/admin/EquipmentMaintain.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/33.png"></a></td>
		    		<td><a href="#AddMacNum" data-rel="popup" data-position-to="window"  align="center"><img src="${pageContext.request.contextPath}/static/images/32.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/admin/EquipmentRepair.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/31.png"></a></td>
		    	</tr>
		    	<tr align="center">
		    		<td>设备维护</td>
		    		<td>设备采购</td>
		    		<td>设备报修</td>		
		    	</tr>		    		    	
		    </table>
		    <!--设备采购 -->
		    	<!-- 设备采购信息面板-->		  		 	
				  <div data-role="popup" id="AddMacNum" class="ui-content" style="min-width:300px;" data-dismissible="false">
				    <a onclick="closeAddDialog();" data-rel="back"  id="close" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
				      <form >
					        <div >
					          <h3 align="center" >添加机器</h3>
					          <label for="region" class="ui-hidden-accessible">设备区域:</label>
					          <select id="region" name="region">
					          		<option value="1" selected>一区</option>
					          		<option value="2" >二区</option>
					          		<option value="3" >三区</option>
					          		<option value="4" >四区</option>						          					          	
					          </select>
					          
					          <label for="core" class="ui-hidden-accessible">是否关键设备:</label>
					          <select id="core" name="core">
					          		<option value="0" selected>普通设备</option>
					          		<option value="1" >关键设备</option>						          					          	
					          </select>
					          					          
					          <label for="factory" class="ui-hidden-accessible">厂家:</label>
					          <input type="text" name="factory" id="factory" placeholder="机器厂家...">				          				         
					          
					          <label for="code" class="ui-hidden-accessible">代号信息:</label>
					          <input type="text" name="code" id="code" placeholder="代号信息...">
					          
					          <label for="grade" class="ui-hidden-accessible">机器牌号:</label>
					          <input type="text" name="grade" id="grade" placeholder="机器牌号(整数)..." >	
					          
					          <label for="totPower" class="ui-hidden-accessible">机器功率（W）:</label>
					          <input type="text" name="totPower" id="totPower" placeholder="机器功率（W）..." >	
					          
					          <label for="etcCurrent" class="ui-hidden-accessible">机器电流:</label>
					          <input type="text" name="etcCurrent" id="etcCurrent" placeholder="机器电流..." >					          
					          
					          <label for="maxInjStroke" class="ui-hidden-accessible">最大注射行程:</label>
					          <input type="text" name="maxInjStroke" id="maxInjStroke" placeholder="最大注射行程（mm）..." >
					          
					          <label for="screwD" class="ui-hidden-accessible">螺杆直径:</label>
					          <input type="text" name="screwD" id="screwD" placeholder="螺杆直径（mm）..." >
					          
					          <label for="injCapacty" class="ui-hidden-accessible">注射容量:</label>
					          <input type="text" name="injCapacty" id="injCapacty" placeholder="注射容量（mm^3）..." >					         					          
					          
					          <label for="maxInjSpeed" class="ui-hidden-accessible">最大注射速度:</label>
					          <input type="text" name="maxInjSpeed" id="maxInjSpeed" placeholder="最大注射速度（mm/3）..." >
					          
					          <label for="maxConSect" class="ui-hidden-accessible">最大螺杆速度控制段数:</label>
					          <input type="text" name="maxConSect" id="maxConSect" placeholder="最大螺杆速度控制段数(正整数)..." >
					          
					          <label for="maxInjPress" class="ui-hidden-accessible">最大注射压力:</label>
					          <input type="text" name="maxInjPress" id="maxInjPress" placeholder="最大注射压力（Mpa）..." >
					          
					       </div>   					         
				           <button  data-inline="true" value="保存" disabled="disabled" id="addForm" name="addForm" disabled="disabled">保存</button>
				           <button  data-inline="true" value="验证" id="yanzhengadd" name="yanzhengadd" onclick="checkAddForm();">验证</button>					      
				     </form>
				 </div>
		  </div>
		  <!--  -->
		  <div data-role="footer" data-position="fixed">
			   <h1></h1>
		  </div>
		  <!--  -->
	</div>	
</body>
</html>