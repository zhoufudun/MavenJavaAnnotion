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
 /*   	//用户名验证--没用到该函数
    	function checkUserName(){	
    	    	///ajax获取数据
    	    	$.ajax({
    	    		type:"POST",
    	    		url:"user?action=checkUserName&userName="+$('#userName').val(),
    	    		async:false, //同步执行                	            		   	    	
    	    		success:function(result){
    	    			var result=eval('('+result+')');
    	    			if(result.success){
							alert("该用户名已存在不能使用！");
							//$('#error').val("该用户名已存在不能使用！");
							//$("input[name=userName]").focus();
							//return false;
							$('#userName').val("");
						}else{
							//$('#error').val("验证通过！");
							alert("用户名验证通过！");
							//return true;
						}
    	    		}   	    			
    	    	});			   	    		
    	}
		
		*/
    	//设置相应的信息
    	function setValues(id,orderNumber,MacNum){
    		//alert();//测试
    		$("#id").val(id);//工单id
    		$("#orderNumber").val(orderNumber);//工单编号
    	    $("#MacNum").val(MacNum);//对应的物料编号
    	    // $("#macId").val(macId);//对应的物料编号
    		//alert($("#orderNumber").val());//测试
    	}
    	//表单校验
    	
    	//form异步请求提交数据
    	//提交派工单号，为数据库的表t_macNum修改和t_addOrder表进行操作
    	$(function () {
            //给id为ajaxSubmit的按钮提交表单
            $("#cancel").on("click",function () {      
            	$("#id").val();//工单id SE=1 attId=1
        		//$("#orderNumber").val(orderNumber);//工单编号
        	    //$("#MacNum").val();//机器编号 state改为1
    			//alert("id="+id+"&macId="+macId);
        		$.ajax({
        	    	type:"POST",
        	    	url:"${pageContext.request.contextPath}/admin/cancelAttention.do",
        	    	async:false, //同步执行
        	    	data: "id="+$("#id").val(),//+"&macNumId="+ $("#MacNum").val(),
        	    	success:function(result){
        	    		var result=eval('('+result+')');
        	    		if(result.success){                     
                            alert("取消通知成功!");   
                            //刷新界面  
                        }else{                      
                            alert("取消通知失败！");                          
                        }
						window.location.href="${pageContext.request.contextPath}/admin/orderFinish.do";
        	    	}   	    			
        	    });                       
            });
        });
    	//关闭窗口后初始化
    	function closeDialog(){   
    		$("#id").val("");//工单id
    		$("#orderNumber").val("");
    	    $("#MacNum").val("");
    	}
    	function giveUp(){
    		$("#close").click();
    		window.location.href="${pageContext.request.contextPath}/admin/productAttention.do";
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
		    <a href="${pageContext.request.contextPath}/admin/orderManage/initComponent.do" rel="extenal" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>生产通知</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="main" align="center" style="margin: 5px;"> 
		  			<!--派工面板-->		  		 	
				    <div data-role="popup" id="myPopup" class="ui-content" style="min-width:250px;" data-dismissible="false">
				    <a href="#" data-rel="back" onclick="closeDialog();" id="close" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
				      <form  id="ajaxForm">
				        <div>
				          <h3 align="center" >该工单已经执行！请选择是否取消通知！</h3>
				          <input type="hidden" name="id" id="id"  readonly="readonly">				         
				          
				          <label for="orderNumber" class="ui-hidden-accessible" >工单编号:</label>
				          <input type="text" name="orderNumber" id="orderNumber"  readonly="readonly"><font style="color:red;"></font>				          				         
				          
				          <label for="MacNum" class="ui-hidden-accessible">机器编号:</label>
				          <input type="text" name="MacNum" id="MacNum"  readonly="readonly"><font style="color:red;" id="error"></font>	
				          				          				        
				          <button  data-inline="true" value="cancel"  id="cancel" name="cancel">确定取消</button>	
				          <button  data-inline="true" value="giveUp"  onclick="giveUp();">保持通知</button>			         			          
				       </div>
				     </form>
				 </div>
				    <!--  -->	
		  		 <table  data-role="table" data-mode="columntoggle" class="ui-responsive ui-shadow" id="myTable" style="font-size:10px;" data-column-btn-text="其他数据">
			      <thead>
			        <tr >
			          <th data-priority="1">编号</th>
			          <th data-priority="1">派工时间</th>
			          <th data-priority="1">机器编号</th>        
			          <th data-priority="2">材料</th>
			          <th data-priority="2">添加时间</th>
			          <th data-priority="1">工单编号</th>			         	
			          <th data-priority="1">操作</th>			      
			        </tr>
			      </thead>
			      <tbody>
			          <c:forEach items="${addOrderList}" var="addOrder" varStatus="status">
				         <tr>
				          	<td>${status.index+1}</td>
				          	<td>${addOrder.dispatchingTime}</td>
				            <td>${addOrder.macNum}</td>
				          	<td>${addOrder.material.name}</td>
				          	<td>${addOrder.addTime}</td>
				          	<td>${addOrder.orderNumber}</td>
				          					          			          				          
				          	<td>
				          	     <a href="#myPopup" data-rel="popup" data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:blue;" onclick="setValues(${addOrder.id},'${addOrder.orderNumber}',${addOrder.macNum})">操作</a>								          							     
							     <!--<a href="${pageContext.request.contextPath}/admin/id=${addOrder.id}" rel="external" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:red;">派工</a>-->      	                 		
							</td>
				         </tr>
			          </c:forEach>
			      </tbody>
			    </table>
		  </div>	
		  <!--  -->
		  <div data-role="footer" data-position="fixed">
			   <h1></h1>
		  </div>
		  <!--  -->
	</div>	
	
</body>


</html>