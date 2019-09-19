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
		var id;//全局变量，派工的id  
		var orderNum;//全局工单号
    	//用户名验证--没用到该函数
/*    	function checkUserName(){	
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
    	//获取派工单的id,
    	function setValues(id,orderNumber,materialId){
    		//alert();//测试
    		$("#id").val(id);//工单id
    		$("#orderNumber").val(orderNumber);//工单编号
    	    $("#materialId").val(materialId);//对应的物料编号
    		//alert($("#orderNumber").val());//测试
    	}
    	//表单校验
    	function checkForm(){
    		var macId=$('#macId option:selected').val();   		
    		//alert("工单编号"+$("#id").val());
    		if(macId==null||macId=="-1"){
    			alert("请选择机器！");
    			window.location.href="${pageContext.request.contextPath}/admin/orderManage/productDispatch.do";	
    			
    		}else{
    			var id=$("#id").val();
    			var materialId=$("#materialId").val();  			
    	     /**$.post("${pageContext.request.contextPath}/admin/checkMaterialIfEnough.do",{'id':$("#id").val(),'materialId': $("#materialId").val()},function(result){
    				   if(result.success){                     
                           alert("校验成功！"); 
                           $('#yanzheng').attr("disabled",true);
                   		   $('#tijiao').attr("disabled",false);
                   		   
                       }else{                      
                           alert("物料不足！请及时采购！");
                           window.location.href="${pageContext.request.contextPath}/admin/orderManage/productDispatch.do";	
                           return false;
                       }
    			},"json"); */
    			$.ajax({
        	    	type:"POST",
        	    	url:"${pageContext.request.contextPath}/admin/checkMaterialIfEnough.do",
        	    	async:false, //同步执行
        	    	data: "id="+id+"&materialId="+materialId,
        	    	success:function(result){
        	    		var result=eval('('+result+')');
        	    		if(result.success){
        	    			 alert("校验成功！"); 
                             $('#yanzheng').attr("disabled",true);
                     		 $('#tijiao').attr("disabled",false);
    					}else{		
    						 alert("物料不足！请及时采购！");
                             window.location.href="${pageContext.request.contextPath}/admin/orderManage/productDispatch.do";	
                             return false;	
    					}
        	    	}   	    			
        	    });
    		} 		
    	}
    	//form异步请求提交数据
    	//提交派工单号，为数据库的表t_macNum修改和t_addOrder表进行操作
    	$(function () {
            //给id为ajaxSubmit的按钮提交表单
            $("#tijiao").on("click",function () {      
            	var id=$("#id").val();//添加工单表的id
    			var macId=$("#macId option:selected").val();//机器编号表对应的主键id
    			//alert("id="+id+"&macId="+macId);
        		$.ajax({
        	    	type:"POST",
        	    	url:"${pageContext.request.contextPath}/admin/EnsureDispatch.do",
        	    	async:false, //同步执行
        	    	data: "id="+id+"&macId="+macId,
        	    	success:function(result){
        	    		var result=eval('('+result+')');
        	    		if(result.success){                     
                            alert("派工成功！");   
                            //刷新界面
                            window.location.href="${pageContext.request.contextPath}/admin/orderManage/productDispatch.do";
                        }else{                      
                            alert("派工失败！");
                        }
        	    	}   	    			
        	    });                       
            });
        });
    	//关闭窗口后初始化
    	function closeDialog(){   
    		$("#id").val("");//工单id
    		$("#orderNumber").val("");//工单编号
    	    $("#materialId").val("");//对应的物料编号
    	    $('#yanzheng').attr("disabled",false);
    		$('#tijiao').attr("disabled",true);
    	}
    	function setFactorValues(){
    		$("#points1").val(${factor.qualificationFactor}); 
    		$("#points2").val(${factor.breakdownFactor});
    		$("#points3").val(${factor.coreMacNumFactor});
    		$("#points4").val(${factor.onTimeDeliveryFactor});
    	}
    	function giveUp(){
    		$("#close").click();
    		window.location.href="${pageContext.request.contextPath}/admin/orderManage/productDispatch.do";
    	}
    	$(function () {
            //给id为ajaxSubmit的按钮提交表单
            $("#save").on("click",function () {                 	
        		$.ajax({
        	    	type:"POST",
        	    	url:"${pageContext.request.contextPath}/admin/saveFactorSetting.do",
        	    	async:false, //同步执行
        	    	data: "qualificationFactor="+$("#points1").val()+"&breakdownFactor="+$("#points2").val()+"&coreMacNumFactor="+$("#points3").val()+"&onTimeDeliveryFactor="+$("#points4").val(),
        	    	success:function(result){
        	    		var result=eval('('+result+')');
        	    		if(result.success){                     
                            alert("设置成功!");   
                            //刷新界面  
                        }else{                      
                            alert("设置失败！");                          
                        }
						window.location.href="${pageContext.request.contextPath}/admin/orderManage/productDispatch.do";
        	    	}   	    			
        	    });                       
            });
        });
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
    			<h1>生产派工</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="main" align="center" style="margin: 5px;"> 
		  			<!--派工面板-->		  		 	
				    <div data-role="popup" id="myPopup" class="ui-content" style="min-width:250px;" data-dismissible="false">
				    <a href="#" data-rel="back" onclick="closeDialog();" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
				      <form  id="ajaxForm">
				        <div>
				          <h3 align="center" >订单派工</h3>
				          <input type="hidden" name="id" id="id"  readonly="readonly">
				          <input type="hidden" name="materialId" id="materialId"  readonly="readonly">
				          
				          <label for="orderNumber" class="ui-hidden-accessible" readonly="readonly">工单号:</label>
				          <input type="text" name="orderNumber" id="orderNumber"  readonly="readonly"><font style="color:red;" id="error"></font>
				          
				          <label for="macId" class="ui-hidden-accessible">机器选择:</label>				        
				          <select id="macId" name="macId">
				          		<option value="-1" selected>请选择...</option>
				          		<c:forEach items="${macNumList}" var="macNum">
				          			<option value="${macNum.id}">${macNum.factory}-${macNum.code}</option>
				          		</c:forEach>			          	
				          </select>
				          					          				        
				          <button  data-inline="true" value="保存" disabled="disabled" id="tijiao" name="tijiao">保存</button>
				          <button  data-inline="true" value="验证"  onclick="checkForm()" id="yanzheng" name="yanzheng">验证</button>				          
				       </div>
				     </form>
				 </div>
				    <!--  -->	
		  		 <table  data-role="table" data-mode="columntoggle" class="ui-responsive ui-shadow" id="myTable" style="font-size:10px;" data-column-btn-text="其他数据">
			      <thead>
			        <tr >
			          <th data-priority="1">编号</th>
			          <th data-priority="1">单个质量</th>
			          <th data-priority="1">单位</th>
			          <th data-priority="1">数量</th>
			          <th data-priority="1">材料</th>
			          <th data-priority="2">添加时间</th>
			          <th data-priority="1">工单编号</th>			         	
			          <th data-priority="1">操作</th>			      
			        </tr>
			      </thead>
			      <tbody>
			          <c:forEach items="${addOrderList}" var="addOrder" varStatus="status">
				         <tr>
				          	<td>${status.index+1}</td>
				          	<td>${addOrder.singleWeight}g</td>
				          	<td>${addOrder.unit.unit}</td>
				          	<td>${addOrder.number}</td>
				          	<td>${addOrder.material.name}</td>
				          	<td>${addOrder.addTime}</td>
				          	<td>${addOrder.orderNumber}</td>				          				          
				          	<td >
				          	     <a href="#myPopup" data-rel="popup" data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:blue;" onclick="setValues(${addOrder.id},'${addOrder.orderNumber}',${addOrder.materialId})">派工</a>								          							     
							     <!--<a href="${pageContext.request.contextPath}/admin/id=${addOrder.id}" rel="external" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:red;">派工</a>-->      	                 		
							</td>
				         </tr>
			          </c:forEach>
			          
			      </tbody>	      
			    </table>
			    <table> 
			      <tr style="height:38px;">
					<td align="center">
						<button  style="width:380px;"><a href="${pageContext.request.contextPath}/admin/order/ganTeTu.do"  style="text-decoration: none;color:black;" >甘特图排产结果</a></button>			    										    				    	
					</td>		    		
			      </tr>
			   </table>
			    
		  </div>
		  <!--影响因子设定-->
		  <div data-dismissible="false" data-role="popup" id="factorSetting"  class="ui-content" style="min-width:320px;">
				  <a href="#" onclick="closeDialog();" id="close" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			
				  <div>				       
						<label for="points1">机器产品合格率影响因子:</label>
						<input type="range" name="points1" id="points1" value="0.5" min="0" max="1" data-popup-enabled="true" step="0.01" data-show-value="true" data-highlight="true"> 
						<label for="points2">机器故障率影响因子:</label>
						<input type="range" name="points2" id="points2" value="0.5" min="0" max="1" data-popup-enabled="true" step="0.01" data-show-value="true" data-highlight="true">
						<label for="points3">是否核心机器影响因子:</label>
						<input type="range" name="points3" id="points3" value="0.5" min="0" max="1" data-popup-enabled="true" step="0.01" data-show-value="true" data-highlight="true">
						<label for="points4">机器工单准时交货率影响因子:</label>
						<input type="range" name="points4" id="points4" value="0.5" min="0" max="1" data-popup-enabled="true" step="0.0" data-show-value="true" data-highlight="true"> 						          			         			          		          			 
				 		<button  data-inline="true" value="save"  id="save" name="save">保存</button>	
				        <button  data-inline="true" value="giveUp"  onclick="giveUp();">取消</button>
				 </div>	 			        	
			</div>	
		  <!--  -->
		  <div data-role="footer" data-position="fixed">
			 <h1>
			   	<a href="#factorSetting" class="ui-btn"  data-rel="popup" data-position-to="window" class="" align="center" style="text-decoration: none" onclick="setFactorValues()">设置影响因子</a>								
			 </h1>
		  </div>
		  <!--  -->
	</div>	
	
</body>


</html>