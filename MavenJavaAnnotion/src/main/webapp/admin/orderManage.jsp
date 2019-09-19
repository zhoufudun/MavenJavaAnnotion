<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/static/My97DatePicker/WdatePicker.js"></script>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link href="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
<script src="${pageContext.request.contextPath}/static/jquery/jquery-3.1.1.js" type="text/javascript"></script>
<title>主页</title>
<script type="text/javascript">
	//表单校验
	function checkForm(){
		//alert($('input[name=""]:checked').val());
		var orderNumber=document.getElementById("orderNumber").value;
		var singleWeight=document.getElementById("singleWeight").value;
		var unitId=$('#unitId option:selected').val();	
		var number=document.getElementById("number").value;
		var materialId=$('#materialId option:selected').val();
		if(orderNumber==null||orderNumber==""){
			alert("工单号不能为空！");
			window.location.href="${pageContext.request.contextPath}/admin/orderManage/initComponent.do";
			return false;
		}
		if(singleWeight==null||singleWeight==""){
			alert("单个质量不能为空！");
			window.location.href="${pageContext.request.contextPath}/admin/orderManage/initComponent.do";	
			return ;
		}
		if(unitId==null||unitId=="-1"){
			alert("请选择单位！");
			window.location.href="${pageContext.request.contextPath}/admin/orderManage/initComponent.do";	
			return ;
		}
		if(number==null||number==""){
			alert("数量不能为空！");
			window.location.href="${pageContext.request.contextPath}/admin/orderManage/initComponent.do";	
			return ;
		}
		if(materialId==""||materialId=="-1"){
			alert("请选择材料！");
			window.location.href="${pageContext.request.contextPath}/admin/orderManage/initComponent.do";	
			return ;
		}
		//alert("全部验证通过！");
		//$('input').attr("disabled","disabled")
		$('#yanzheng').attr("disabled",true);
		$('#tijiao').attr("disabled",false);
		return true;
	}
	//form异步请求提交数据
	$(function () {
        //给id为ajaxSubmit的按钮提交表单
        $("#tijiao").on("click",function () {      
        	var orderNumber=document.getElementById("orderNumber").value;
    		var singleWeight=document.getElementById("singleWeight").value;
    		var unitId=$('#unitId option:selected').val();
    		var number=document.getElementById("number").value;
    		var materialId=$('#materialId option:selected').val();
    		var customerGrade=$('#customerGrade option:selected').val();
    		var urgent=$('#urgent option:selected').val();
    		var planDeliveryTime = document.getElementById("planDeliveryTime").value;
    		//alert(deliveryTime);
            $.post("${pageContext.request.contextPath}/admin/addOrder.do",{'orderNumber':orderNumber,'singleWeight':singleWeight,'unitId':unitId,
				'number':number,'materialId':materialId,'customerGrade':customerGrade,'urgent':urgent,'planDeliveryTime':planDeliveryTime},function(result){
				 if(result.success){                     
                       alert("添加成功！");   
                       window.location.href="${pageContext.request.contextPath}/admin/orderManage/initComponent.do";	
                   }else{                      
                       alert("添加失败！");
                   }
			},"json");
                       
        });
    });
	//input元素失去焦点激活函数
	function checkOrderNumber(){
		var orderNumber=$("#orderNumber").val();
		$.ajax({
	    	type:"POST",
	    	url:"${pageContext.request.contextPath}/admin/checkOrderNumber.do",
	    	async:false, //同步执行
	    	data: "orderNumber="+orderNumber,
	    	success:function(result){
	    		var result=eval('('+result+')');
	    		if(result.success){                     
	                   alert("该工单号可以用！");   	                   
	               }else{                      
	                   alert("该工单号已经存在！请换一个工单号！");
	                   //$("input:text[name='orderNumber']").focus();
	                   window.location.href="${pageContext.request.contextPath}/admin/orderManage/initComponent.do";
	               }
	    	}   	    			
	    }); 
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
		  <div data-role="header" data-position="fixed" >
		     <a href="${pageContext.request.contextPath}/admin/adminInterface.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>   
    		  <h1>订单管理</h1>
    	  </div> 
		  <div data-role="content" >
		  	<div style="height:40px;">		  	
		  	</div>
		    <table border="0" align="center" cellpadding="10">
		    	<tr>
		    		<td><a href="#myPopup" data-rel="popup" data-position-to="window"  align="center"><img src="${pageContext.request.contextPath}/static/images/38.png"></a></td>			    	
		    		<td><a href="${pageContext.request.contextPath}/admin/orderManage/productDispatch.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/34.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/admin/listEnsureExecution.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/47.png"></a></td>		    			    				    		
		    	</tr>
		    	<tr align="center">
		    		<td>添加订单</td>
		    		<td>生产派工</td>
		    		<td>确定执行</td>
		    	</tr> 
		    	<tr>
		    	    <!--添加订单链接-->
		    		<td><a href="${pageContext.request.contextPath}/admin/productAttention.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/35.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/admin/orderFinish.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/36.png"></a></td>
		    	</tr>
		    	<tr align="center">	    		
		    		<td>生产通知</td>
		    		<td>订单完成</td>			
		    	</tr>		    				    		    	
		    </table>
		  </div>
		  	   <!--添加订单-->
			   <div data-role="popup" id="myPopup" class="ui-content" style="min-width:250px;" data-dismissible="false">
				    <a href="#" data-rel="back"  class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
				      <form  id="ajaxForm">
				        <div>
				          <h3 align="center">添加订单</h3>
				          <label for="orderNumber" class="ui-hidden-accessible">填工单号:</label>
				          <input type="text" name="orderNumber" id="orderNumber" placeholder="填工单号" onblur="checkOrderNumber();"><font style="color:red;" id="error"></font>
				          
				          <label for="singleWeight" class="ui-hidden-accessible">单个质量:</label>
				          <input type="text" name="singleWeight" id="singleWeight" placeholder="单个质量(g)">
				          
				          <label for="planDeliveryTime" class="ui-hidden-accessible">交货日期:</label>
				          <input type="text" name="planDeliveryTime" id="planDeliveryTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" placeholder="交货日期...">
				          
				          <label for="customerGrade" class="ui-hidden-accessible">客户等级:</label>
				          <select id="customerGrade" name="customerGrade">
				          		<option value="0" selected>等级0</option>
				          		<option value="1" >等级1</option>	
				          		<option value="2" >等级2</option>
				          		<option value="3" >等级3</option>	
				          		<option value="4" >等级4</option>
				          		<option value="5" >等级5</option>	
				          		<option value="6" >等级6</option>
				          		<option value="7" >等级7</option>	
				          		<option value="8" >等级8</option>
				          		<option value="9" >等级9</option>			          	
				          </select>
				          
				          <label for="urgent" class="ui-hidden-accessible">是否加急:</label>
				          <select id="urgent" name="urgent">
				          		<option value="0" selected>不加急</option>
				          		<option value="1" >加急</option>					          				          	
				          </select> 
				          				          
				          
				          <label for="unitId" class="ui-hidden-accessible">单位选择:</label>				        
				          <select id="unitId" name="unitId">
				          		<option value="-1" selected>请选择...</option>
				          		<c:forEach items="${unitList}" var="unit">
				          			<option value="${unit.unitId}">${unit.unit}</option>
				          		</c:forEach>			          	
				          </select>
				          
				          <label for="number" class="ui-hidden-accessible">制品个数:</label>
				          <input type="text" name="number" id="number" placeholder="制品个数">
				          
				          <label for="materialId" class="ui-hidden-accessible">物料选择:</label>				        
				          <select id="materialId" name="materialId">
				          		<option value="-1" selected>请选择...</option>
				          		<c:forEach items="${materialList}" var="material">
				          			<option value="${material.materialId}">${material.name}</option>
				          		</c:forEach>			          	
				          </select>						          				        
				          <button  data-inline="true" value="保存" disabled="disabled" id="tijiao" name="tijiao">保存</button>
				          <button  data-inline="true" value="验证"  onclick="checkForm()" id="yanzheng" name="yanzheng">验证</button>				          
				       </div>
				     </form>
				 </div>
		  <!--  -->
		  <div data-role="footer" data-position="fixed">
			   <h1></h1>
		  </div>
		  <!--  -->
	</div>	
</body>
</html>