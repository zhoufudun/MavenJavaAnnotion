<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1" />
<link href="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
<script src="${pageContext.request.contextPath}/static/jquery/jquery-3.1.1.js" type="text/javascript"></script>
<script type="text/javascript">	
function finish(addOrderId,employeeId){	
	if(confirm("确定工单完成了吗？")){
		$.post("${pageContext.request.contextPath}/user/orderFinished.do",
         		 {          			
         			'id':addOrderId,
         			'employeeId':employeeId
 				 },function(result){
 				   if(result.success){                     
	                       	   alert("更改成功！");   
	                           window.location.href="${pageContext.request.contextPath}/user/orderChoose.do?employeeId="+result.employee.id+"&AddOrderId="+result.chooseOrder.id;	
	                       }else{                      
	                           alert("更改失败！");
	                       }
 			},"json"); 
	}else{
		//alert();
		return;
	}
}
function passAddOne(addOrderId,employeeId){
	//alert(employeeId);
	//alert(addOrderId);
	if(confirm("合格数量加一？")){
		$.post("${pageContext.request.contextPath}/user/passAddOne.do",
         		 {          			
         			'addOrderId':addOrderId,
         			'employeeId':employeeId
 				 },function(result){
 				   if(result.success){                     
	                       	   alert("更改成功！");   
	                           window.location.href="${pageContext.request.contextPath}/user/orderChoose.do?employeeId="+result.employee.id+"&AddOrderId="+result.chooseOrder.id;	
	                       }else{                      
	                           alert("更改失败！");
	                       }
 			},"json"); 
	}else{
		//alert();
		return;
	}
}
function passSubstractOne(addOrderId,employeeId){
	//alert(employeeId);
	//alert(addOrderId);
	if(confirm("合格数量减一？")){
		$.post("${pageContext.request.contextPath}/user/passSubstractOne.do",
         		 {          			
         			'addOrderId':addOrderId,
         			'employeeId':employeeId
 				 },function(result){
 				   if(result.success){                     
	                       	   alert("更改成功！");   
	                           window.location.href="${pageContext.request.contextPath}/user/orderChoose.do?employeeId="+result.employee.id+"&AddOrderId="+result.chooseOrder.id;	
	                       }else{                      
	                           alert("更改失败！");
	                       }
 			},"json"); 
	}else{
		//alert();
		return;
	}
}
function xTypeSubstractOne(addOrderId,employeeId){
	//alert(employeeId);
	//alert(addOrderId);
	if(confirm("x类型不合格数量减一？")){
		$.post("${pageContext.request.contextPath}/user/xTypeSubstractOne.do",
         		 {          			
         			'addOrderId':addOrderId,
         			'employeeId':employeeId
 				 },function(result){
 				   if(result.success){                     
	                       	   alert("更改成功！");   
	                           window.location.href="${pageContext.request.contextPath}/user/orderChoose.do?employeeId="+result.employee.id+"&AddOrderId="+result.chooseOrder.id;	
	                       }else{                      
	                           alert("更改失败！");
	                       }
 			},"json"); 
	}else{
		//alert();
		return;
	}
}
function xTypeAddOne(addOrderId,employeeId){
	//alert(employeeId);
	//alert(addOrderId);
	if(confirm("x类型不合格数量加一？")){
		$.post("${pageContext.request.contextPath}/user/xTypeAddOne.do",
         		 {          			
         			'addOrderId':addOrderId,
         			'employeeId':employeeId
 				 },function(result){
 				   if(result.success){                     
	                       	   alert("更改成功！");   
	                           window.location.href="${pageContext.request.contextPath}/user/orderChoose.do?employeeId="+result.employee.id+"&AddOrderId="+result.chooseOrder.id;	
	                       }else{                      
	                           alert("更改失败！");
	                       }
 			},"json"); 
	}else{
		//alert();
		return;
	}
}
function yTypeSubstractOne(addOrderId,employeeId){
	//alert(employeeId);
	//alert(addOrderId);
	if(confirm("y类型不合格数量减一？")){
		$.post("${pageContext.request.contextPath}/user/yTypeSubstractOne.do",
         		 {          			
         			'addOrderId':addOrderId,
         			'employeeId':employeeId
 				 },function(result){
 				   if(result.success){                     
	                       	   alert("更改成功！");   
	                           window.location.href="${pageContext.request.contextPath}/user/orderChoose.do?employeeId="+result.employee.id+"&AddOrderId="+result.chooseOrder.id;	
	                       }else{                      
	                           alert("更改失败！");
	                       }
 			},"json"); 
	}else{
		//alert();
		return;
	}
}
function yTypeAddOne(addOrderId,employeeId){
	//alert(employeeId);
	//alert(addOrderId);
	if(confirm("y类型不合格数量加一？")){
		$.post("${pageContext.request.contextPath}/user/yTypeAddOne.do",
         		 {          			
         			'addOrderId':addOrderId,
         			'employeeId':employeeId
 				 },function(result){
 				   if(result.success){                     
	                       	   alert("更改成功！");   
	                           window.location.href="${pageContext.request.contextPath}/user/orderChoose.do?employeeId="+result.employee.id+"&AddOrderId="+result.chooseOrder.id;	
	                       }else{                      
	                           alert("更改失败！");
	                       }
 			},"json"); 
	}else{
		//alert();
		return;
	}
}
function zTypeSubstractOne(addOrderId,employeeId){
	//alert(employeeId);
	//alert(addOrderId);
	if(confirm("z类型不合格数量减一？")){
		$.post("${pageContext.request.contextPath}/user/zTypeSubstractOne.do",
         		 {          			
         			'addOrderId':addOrderId,
         			'employeeId':employeeId
 				 },function(result){
 				   if(result.success){                     
	                       	   alert("更改成功！");   
	                           window.location.href="${pageContext.request.contextPath}/user/orderChoose.do?employeeId="+result.employee.id+"&AddOrderId="+result.chooseOrder.id;	
	                       }else{                      
	                           alert("更改失败！");
	                       }
 			},"json"); 
	}else{
		//alert();
		return;
	}
}
function zTypeAddOne(addOrderId,employeeId){
	//alert(employeeId);
	//alert(addOrderId);
	if(confirm("z类型不合格数量加一？")){
		$.post("${pageContext.request.contextPath}/user/zTypeAddOne.do",
         		 {          			
         			'addOrderId':addOrderId,
         			'employeeId':employeeId
 				 },function(result){
 				   if(result.success){                     
	                       	   alert("更改成功！");   
	                           window.location.href="${pageContext.request.contextPath}/user/orderChoose.do?employeeId="+result.employee.id+"&AddOrderId="+result.chooseOrder.id;	
	                       }else{                      
	                           alert("更改失败！");
	                       }
 			},"json"); 
	}else{
		//alert();
		return;
	}
}
</script>
<style type="text/css">	
	tr {
    	border-bottom: 1px solid #d6d6d6;
	}
</style>
</head>
<body>
	<div data-role="page" data-position="fixed">
		  <div data-role="header" data-position="fixed">
		    <a href="${pageContext.request.contextPath}/productMessageLogin.jsp" rel="extenal" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>产品录入</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="main" align="center" style="margin: 5px;">
		   	<table  width="100%" height="450" align="center" border="0" cellpadding="0" cellspacing="2" style="border-radius:0px;">
					
					<tr  style="height:40px;">
						<td align="center">
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">录入员</label>	
								<label id="label2"  style="float:right;font-size:16px;">${employee.name}</label>
								<input type="hidden" name="id" id="id" value="${employee.id}">	
							</div>
						</td>
					</tr>
					
					<tr  style="height:40px;">
						<td align="center">
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">工单号</label>	
								<label id="label2"  style="float:right;font-size:16px;">${chooseOrder.orderNumber}</label>
								<input type="hidden" name="id" id="id" value="${chooseOrder.id}">	
							</div>
						</td>
					</tr>
					
					<tr  style="height:40px;">
						<td align="center">
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">机器编号</label>	
								<label id="label2"  style="float:right;font-size:16px;">${chooseOrder.macNum}</label>								
							</div>
						</td>
					</tr>
					
					<tr>
						<td bgcolor="#F6F6F6" align="center" >
							<div  style="height:270px; border:solid 1px black; width:94%;border-radius:8px 8px 8px 8px; background-color:white;">								
								<div id="first" style="height:250px; width:95%; margin-top:5px;" >
									<table border="0" align="center" cellpadding="1" cellspacing="1">
										<tr>
											<td>
											<a href="javascript:passAddOne(${chooseOrder.id},${employee.id});" data-role="button" class="ui-btn ui-corner-all"><font color="green">合格+1</font></a>
											</td>
											<td>
											<a href="javascript:passSubstractOne(${chooseOrder.id},${employee.id});" data-role="button" class="ui-btn ui-corner-all"><font color="gray">合格-1</font></a>
											</td>
										</tr>
										<tr>                               
											<td>
											<a href="javascript:xTypeAddOne(${chooseOrder.id},${employee.id});" data-role="button" class="ui-btn ui-corner-all"><font color="red">x类型不合格+1</font></a>
											</td>
											<td>
											<a href="javascript:xTypeSubstractOne(${chooseOrder.id},${employee.id});" data-role="button" class="ui-btn ui-corner-all"><font color="gray">x类型不合格-1</font></a>
											</td>
										</tr>
										<tr>                               
											<td>
											<a href="javascript:yTypeAddOne(${chooseOrder.id},${employee.id});" data-role="button" class="ui-btn ui-corner-all"><font color="red">y类型不合格+1</font></a>
											</td>
											<td>
											<a href="javascript:yTypeSubstractOne(${chooseOrder.id},${employee.id});" data-role="button" class="ui-btn ui-corner-all"><font color="gray">y类型不合格-1</font></a>
											</td>
										</tr>
										<tr>                               
											<td>
											<a href="javascript:zTypeAddOne(${chooseOrder.id},${employee.id});" data-role="button" class="ui-btn ui-corner-all"><font color="red">z类型不合格+1</font></a>
											</td>
											<td>
											<a href="javascript:zTypeSubstractOne(${chooseOrder.id},${employee.id});" data-role="button" class="ui-btn ui-corner-all"><font color="gray">z类型不合格-1</font></a>
											</td>
										</tr>
									</table>
								</div>			
							</div>
						</td>	
					</tr>
				
					<tr  style="height:40px;">
						<td align="center">
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">计划生产数</label>	
								<label id="label2"  style="float:right;font-size:16px;">${chooseOrder.number}</label>	
							</div>
						</td>
					</tr>
					
					<tr  style="height:40px;">
						<td align="center">
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4px; background-color:white;">	
								<label id="label1"  style="float:left; font-size:16px;">合格数</label>	
								<label id="label2"  style="float:right;font-size:16px;">${chooseOrder.finishNumber}</label>	
							</div>
						</td>
					</tr>
					
					<tr style="height:38px;border:1px solid black;">
						<td align="center" >
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4pxs; background-color:white;">	
								<label id="label3"  style="float:left; font-size:16px;">x类型不合格</label>	
								<label id="label4"  style="float:right;font-size:16px;">${chooseOrder.xDefectiveNum}</label>			
							</div>
						</td>
					</tr>
					
					<tr style="height:38px;border:1px solid black;">
						<td align="center" >
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4pxs; background-color:white;">	
								<label id="label3"  style="float:left; font-size:16px;">y类型不合格</label>	
								<label id="label4"  style="float:right;font-size:16px;">${chooseOrder.yDefectiveNum}</label>			
							</div>
						</td>
					</tr>
					
					<tr style="height:38px;border:1px solid black;">
						<td align="center" >
							<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4pxs; background-color:white;">	
								<label id="label3"  style="float:left; font-size:16px;">z类型不合格</label>	
								<label id="label4"  style="float:right;font-size:16px;">${chooseOrder.zDefectiveNum}</label>			
							</div>
						</td>
					</tr>	
					
									
					<c:choose>
						<c:when test="${chooseOrder.historyFinishId==1}">
							<tr style="height:38px;border:1px solid black;">
								<td align="center" >
									<div  style="height:30px; border:solid 1px white; width:95%;border-radius:4px 4px 4px 4pxs; background-color:white;">	
										<label id="label3"  style="float:left; font-size:16px;">工单状态</label>	
										<label id="label4"  style="float:right;font-size:16px;"><font color="red">已经完成</font></label>			
									</div>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr style="height:38px;border:1px solid black;">
							    <td>
				          	        <button onclick="finish(${chooseOrder.id},${employee.id});" >工单完成</button>							          							     
							    </td>	
							</tr>								
						</c:otherwise>
					</c:choose>										
				</table>
				
		  </div>
		  			
		  <!--  -->
		  <div data-role="footer" data-position="fixed">
			  <div data-role="navbar">
				   <ul>
				       <li><a href="${pageContext.request.contextPath}/user/zhuye.jsp" rel="external" data-icon="home" data-mini="true">首页</a></li>
				       <li><a href="#" data-icon="search" data-mini="true">搜索</a></li>
				       <li><a href="#" data-icon="info" data-mini="true">消息</a></li>
				   </ul>
			  </div>
		  </div>
		  <!--  -->
	</div>	
	
</body>


</html>