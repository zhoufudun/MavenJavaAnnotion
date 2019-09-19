<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>
<head>
<title>工单选择</title>
<meta name="viewport" content="width=device-width,initial-scale=1" />
<link href="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/jquery-3.1.1.js"></script>
<script src="${pageContext.request.contextPath}/static/jquery/echarts-2.2.7/build/dist/echarts.js"></script>
<title>工单选择</title>
<script type="text/javascript"> 
function checkId(){	        	    
    if($("#AddOrderId option:selected").val()!=-1){       	    	
	     $('#button').attr("disabled",false);
	 }else{
		 $('#button').attr("disabled",true);
	 }	   	    		
}	
function tijiao(){
	window.location.href="${pageContext.request.contextPath}/user/orderChoose.do?employeeId="+${employee.id}+"&AddOrderId="+$("#AddOrderId option:selected").val();
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
	<div data-role="page" >
		  <div data-role="header"  data-position="fixed">
		    <a href="${pageContext.request.contextPath}/user/zhuye.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>信息录入-工单选择</h1>
    		
		  </div>
		
		  <div data-role="content" align="center">
		  		     	
		  		   <!--信息录入生产线选择界面-->		  											     				     
				      <form>
				        <div>
					          <h3 align="center">请选择工单编号</h3>					          
					          <input type="hidden" name="employeeId" id="employeeId" value="${employee.id}">
					          <label for="AddOrderId"  class="ui-hidden-accessible" >工单:</label>   <!--工单id-->  
					          <select id="AddOrderId" name="AddOrderId" onblur="checkId();" >
					          	<option value="-1">请选择工单...</option>
					          	<c:forEach items="${orderList}" var="order" >
					          		<option value="${order.id}">${order.orderNumber}</option>
					          	</c:forEach>
					          </select>		          					          
					          <button id="button" disabled="disabled" onclick="tijiao();">选择</button> 				          		          
				        </div>
				     </form>				     
		  </div>				
		  <div data-role="footer" data-position="fixed">
			   <h1></h1>
		  </div>
	 </div>
</body>
</html>