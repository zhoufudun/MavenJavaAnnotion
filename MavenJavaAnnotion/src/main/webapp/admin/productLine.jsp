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
    	//表单校验    	
    	//form异步请求提交数据
    	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    	$(function () {          
            $("#addForm").on("click",function () { //添加生产线           	
            	$.post("${pageContext.request.contextPath}/admin/saveProductLine.do",
            		 {  
            			'lineNumber':$("#lineNumber").val(),
            			'remarks':$("#remarks").val(),
            			'workOne':$("#workOne").val(),           			
    				    'workTwo':$("#workTwo").val(),  				    
    				    'workThree':$("#workThree").val(),
    				    'operationOneId':$("#operationOneId option:selected").val(),
    				    'operationTwoId':$("#operationTwoId option:selected").val(),
    				    'operationThreeId':$("#operationThreeId option:selected").val()   				    
    				  },function(result){
    				   if(result.success){                     
	                           alert("添加成功！");   
	                           window.location.href="${pageContext.request.contextPath}/admin/productLine.do";	
	                       }else{                      
	                           alert("添加失败！");
	                           window.location.href="${pageContext.request.contextPath}/admin/productLine.do";	
	                       }
    			},"json");                     
            }); 
            //绑定机器
            $("#blind").on("click",function () {    
            	$.post("${pageContext.request.contextPath}/admin/blindMachine.do",
                 		 {  
                 			'productLine-id':$("#blindMachineId").val(), 
                 			'macNum-id':$("#bindMacNumber option:selected").val(),//获取选中的值
                 			'lineNumber':$("#blindLineNumber").val()
         				 },function(result){
         				   if(result.success){                     
     	                       	   alert("绑定成功！");        	                          
     	                       }else{                      
     	                           alert("绑定失败！");     	                         
     	                       }
         				window.location.href="${pageContext.request.contextPath}/admin/productLine.do";   
         			},"json"); 
            });          
            //保存修改的工位信息
            $("#saveModifyWorkOrder").on("click",function () {    
            	$.post("${pageContext.request.contextPath}/admin/saveModifyWorkOrder.do",
                 		 {  
                 			'id':$('#modifyWorkOrder-id').val(),
                 			'remarks':$('#modifyWorkOrder-remarks').val(),
                 			'workOne':$('#modifyWorkOrder-workOne').val(),
                 			'workTwo':$('#modifyWorkOrder-workTwo').val(),
                 			'workThree':$('#modifyWorkOrder-workThree').val()
         				 },function(result){
         				   if(result.success){                     
     	                       	   alert("工序修改成功！");        	                          
     	                       }else{                      
     	                           alert("共需修改失败！");     	                         
     	                       }
         				window.location.href="${pageContext.request.contextPath}/admin/productLine.do";   
         			},"json"); 
            });
           //保存修改的工位操作员信息
            $("#saveBlindEmployees").on("click",function () {    
            	$.post("${pageContext.request.contextPath}/admin/saveBlindEmployees.do",
                 		 {  
            		        'id':$('#blindEmployees-id').val(),
                 			'operationOneId':$('#blindEmployees-operationOneId option:selected').val(),
                 			'operationTwoId':$('#blindEmployees-operationTwoId option:selected').val(),
                 			'operationThreeId':$('#blindEmployees-operationThreeId option:selected').val()
         				 },function(result){
         				   if(result.success){                     
     	                       	   alert("工序绑定操作员成功！");        	                          
     	                       }else{                      
     	                           alert("工序绑定操作员失败！");     	                         
     	                       }
         				window.location.href="${pageContext.request.contextPath}/admin/productLine.do";   
         			},"json"); 
            });
  		
        });   	
    	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    	//绑定窗口设置值
    	function setValue(id,lineNumber){  		
    		$('#blindMachineId').val(id);//设置生产线id
    		$('#blindLineNumber').val(lineNumber);//设置生产线lineNumber
    	};
    	//关闭添加生产线窗口后初始化
    	function closeAddDialog(){     		  		
    		$('#remarks').val("");
    		$('workOne').val("");
    		$('workTwo').val("");
    		$('#workThree').val("");
    		$('#operationTwoId').val("-1");
    		$('#operationOneId').val("-1");
    		$('#operationOneId').val("-1"); 
    		////
    		$('#yanzhengadd').attr("disabled",false);
    		$('#addForm').attr("disabled",true);
    		$('#lineNumber').attr("disabled",false);
    		$('#lineNumber').val("");
    	}		
    	function checkAddForm(){ //	
    		if($("#lineNumber").val()==""){
    			alert("生产线编号不能为空！");
    			//$('#lineNumber').focus();
    		}else{
    			alert("验证通过!");
        		$('#yanzhengadd').attr("disabled",true);
        		$('#addForm').attr("disabled",false);
    		}    		
    	}
    	//验证绑定表单
    	function checkBlindForm(){ 
    		if($("#bindMacNumber").val()==-1){
    			//alert($("#bindMacNumber").val());
    			alert("请选择要绑定的机器！"); 
    			window.location.href="${pageContext.request.contextPath}/admin/productLine.do";   
    		}else{
    			//alert($("#bindMacNumber").val());
    			$('#blind').attr('disabled',false);//绑定按钮可用
    			$('#blindyanzheng').attr('disabled',true);//验证按钮不可用
    			$('#bindMacNumber').attr('disabled',true);//绑定按钮选择项不可用   	
    			//alert($("#bindMacNumber").val());
    		}
    	}
    	//关闭绑定窗口
    	function closeBlindMachineDialog(){
    		$('#blind').attr('disabled',true);//绑定按钮不可用
			$('#blindyanzheng').attr('disabled',false);//验证按钮可用
			$('#bindMacNumber').attr('disabled',false);//绑定按钮选择项可用   	
    	}
    	//input元素失去焦点激活函数
    	function checkLineNumber(){
    		if($('#lineNumber').val()==""){
    			alert("编号不能为空！");
    			window.location.href="${pageContext.request.contextPath}/admin/productLine.do";
    		}else{
    			$.ajax({
        	    	type:"POST",
        	    	url:"${pageContext.request.contextPath}/admin/checkLineNumber.do",
        	    	async:false, //同步执行
        	    	data: "lineNumber="+$("#lineNumber").val(),
        	    	success:function(result){
        	    		result=eval('('+result+')');
        	    		if(result.success){                     
        	                   alert("该生产线编号可以用！"); 
        	                   $('#lineNumber').attr("disabled",true);
        	               }else{                      
        	                   alert("该生产线编号已经存在！请换一个编号！");
        	                   closeDialog();
        	                   //$("input:text[name='orderNumber']").focus();
        	                   window.location.href="${pageContext.request.contextPath}/admin/productLine.do";
        	               }
        	    	}   	    			
        	    }); 
    		}   					
    	}
    	function deleteProductLine(id){ //生产线id
    		//alert(id);
    		if(confirm("确定删除该生产线吗？")){ //确认
    			$.ajax({
    				type:"post",
    				url:"${pageContext.request.contextPath}/admin/deleteProductLine.do",
    				async:false,
    				data:"id="+id,
    				success:function(result){
    					result=eval('('+result+')');
    					if(result.success){                     
     	                   alert("删除成功！");     	                  
     	                }else{                      
     	                   alert("删除失败！");    	                  
     	                }
    					window.location.href="${pageContext.request.contextPath}/admin/productLine.do";
    				}
    			});
    		}
    	}
    	//设置修改窗口的值
    	function setProductLineValue(id,workOne,operationOneId,workTwo,operationTwoId,workThree,operationThreeId,remarks){
    		$('#modify-remarks').val(remarks);
    		$('#id').val(id);
    		$('#modify-workOne').val(workOne);
    		$('#modify-workTwo').val(workTwo);
    		$('#modify-workThree').val(workThree);
    		$('#modify-operationTwoId').val(operationOneId);
    		$('#modify-operationOneId').val(operationTwoId);
    		$('#modify-operationOneId').val(operationThreeId);
    	}
    	//关闭修改窗口
    	function closeModifyDialog(){
    		$('#modify-remarks').val("");
    		$('#id').val("");
    		$('#modify-workOne').val("");
    		$('#modify-workTwo').val("");
    		$('#modify-workThree').val("");
    		$('#modify-operationTwoId').val("");
    		$('#modify-operationOneId').val("");
    		$('#modify-operationOneId').val("");
    	}
    	//解除员工绑定（绑定员工之前必须的步骤）
    	function unblindEmployees(id){
    		if(confirm("确定要解除该生产线的员工吗？")){ //确认
    			$.ajax({
    				type:"post",
    				url:"${pageContext.request.contextPath}/admin/unblindEmployees.do",
    				async:false,
    				data:"id="+id,
    				success:function(result){
    					result=eval('('+result+')');
    					if(result.success){                     
     	                   alert("员工解绑成功！");     	                  
     	                }else{                      
     	                   alert("员工解绑失败！");    	                  
     	                }
    					window.location.href="${pageContext.request.contextPath}/admin/productLine.do";
    				}
    			});
    		}
    	}
    	//工位绑定员工（员工解除绑定后的操作步骤）
    	function blindEmployees(id){
    		$('#blindEmployees-id').val(id);
    	}
    	//解除机器的绑定
    	function unblindMachine(id){
    		if(confirm("确定要解除该生产线的机器吗？")){ //确认
    			$.ajax({
    				type:"post",
    				url:"${pageContext.request.contextPath}/admin/unblindMachine.do",
    				async:false,
    				data:"id="+id,
    				success:function(result){
    					result=eval('('+result+')');
    					if(result.success){                     
     	                   alert("机器解绑成功！");     	                  
     	                }else{                      
     	                   alert("机器解绑失败！");    	                  
     	                }
    					window.location.href="${pageContext.request.contextPath}/admin/productLine.do";
    				}
    			});
    		}
    	}
    	//设置修改窗口数据
    	function modifyWorkOrder(id,workOne,workTwo,workThree,remarks){
    		$('#modifyWorkOrder-remarks').val(remarks);
    		$('#modifyWorkOrder-id').val(id);
    		$('#modifyWorkOrder-workOne').val(workOne);
    		$('#modifyWorkOrder-workTwo').val(workTwo);
    		$('#modifyWorkOrder-workThree').val(workThree);
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
		    <a href="${pageContext.request.contextPath}/admin/adminInterface.jsp" rel="extenal" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>生产线管理</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="main" align="center" style="margin: 5px;"> 
		  		 <!--搜索-->	
				 <form method="post" action="${pageContext.request.contextPath}/admin/productLine.do" style="margin-bottom:-20px;">
				      <div data-role="fieldcontain" style="width:100%"> 
				         <input type="text" name="s_lineNumber" id="s_lineNumber" placeholder="输入生产线名称..." class="ui-corner-all" value="${s_lineNumber}"/>   				         
				         <input type="submit"  value="搜索" class="ui-corner-all"/>
				      </div>
			     </form>		  		 
				 									          							     
				 <!-- 添加生产线 -->
				 <a href="#AddProductLine" data-rel="popup"  data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline">添加生产线</a>
		  		 <!-- 添加生产线信息面板-->		  		 	
				  <div data-role="popup" id="AddProductLine" class="ui-content" style="min-width:300px;" data-dismissible="false">
				    <a onclick="closeAddDialog();" data-rel="back"  id="close" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
				      <form >
					        <div >
					          <h3 align="center" >添加生产线</h3>
					          
					          <label for="lineNumber" class="ui-hidden-accessible">生产线编号:</label>
					          <input type="text" name="lineNumber" id="lineNumber" placeholder="生产线编号..." onblur="checkLineNumber();">				          				         
					          
					          <label for="remarks" class="ui-hidden-accessible">备注信息:</label>
					          <textarea name="remarks" id="remarks" placeholder="备注信息..." rows="20" cols="4" ></textarea>	
					          
					          <label for="workOne" class="ui-hidden-accessible">工位1:</label>
					          <input type="text" name="workOne" id="workOne" placeholder="工位1信息..." >
					          
					          <label for="operationOneId"  class="ui-hidden-accessible" >员工编号:</label>   <!--员工id-->  
					          <select id="operationOneId" name="operationOneId">
					          	<option value="-1">请选择员工...</option>
					          	<c:forEach items="${unDispatchEmployeesList}" var="unDispatchEmployees" >
					          		<option value="${unDispatchEmployees.id}">${unDispatchEmployees.name}</option>
					          	</c:forEach>
					          </select>
					          
					          <label for="workTwo" class="ui-hidden-accessible">工位2:</label>
					          <input type="text" name="workTwo" id="workTwo" placeholder="工位2信息..." >
					          
					          <label for="operationTwoId"  class="ui-hidden-accessible" >员工编号:</label>   <!--员工id-->  
					          <select id="operationTwoId" name="operationTwoId">
					          	<option value="-1">请选择员工...</option>
					          	<c:forEach items="${unDispatchEmployeesList}" var="unDispatchEmployees" >
					          		<option value="${unDispatchEmployees.id}">${unDispatchEmployees.name}</option>
					          	</c:forEach>
					          </select>
					          
					          <label for="workThree" class="ui-hidden-accessible">工位3:</label>
					          <input type="text" name="workThree" id="workThree" placeholder="工位3信息..." >	
					          
					          <label for="operationThreeId"  class="ui-hidden-accessible" >员工编号:</label>   <!--员工id-->  
					          <select id="operationThreeId" name="operationThreeId">
					          	<option value="-1">请选择员工...</option>
					          	<c:forEach items="${unDispatchEmployeesList}" var="unDispatchEmployees" >
					          		<option value="${unDispatchEmployees.id}">${unDispatchEmployees.name}</option>
					          	</c:forEach>
					          </select>			         					      		
					          					         		         			          
					       </div>
				           <button  data-inline="true" value="保存" disabled="disabled" id="addForm" name="addForm" disabled="disabled">保存</button>
				           <button  data-inline="true" value="验证" id="yanzhengadd" name="yanzhengadd" onclick="checkAddForm();">验证</button>					      
				     </form>
				 </div>
				 <!-- 绑定机器信息面板-->		  		 	
				  <div data-role="popup" id="blindMachine" class="ui-content" style="min-width:300px;" data-dismissible="false">
				    <a onclick="closeBlindMachineDialog();" data-rel="back"  id="close" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
				      <form >
					        <div  class="ui-field-contain">
					          <h3 align="center" >绑定机器信息</h3>
					          
					          <label for="blindLineNumber">生产线编号</label> <!--生产线生产线编号（lineNumber）-->
					          <input type="text" name="blindLineNumber" id="blindLineNumber" disabled="disabled">
					          
					          <label for="blindMachineId"></label>         <!--生产线id-->
					          <input type="hidden" name="blindMachineId" id="blindMachineId">				          				         
					          
					          <label for="bindMacNumber" >机器编号:</label>   <!--机器id-->  
					          <select id="bindMacNumber" name="bindMacNumber" style="width:225px;">
					          	<option value="-1">请选择绑定的机器...</option>
					          	<c:forEach items="${unDispatchMacNumList}" var="unDispatchMacNum" >
					          		<option value="${unDispatchMacNum.id}">${unDispatchMacNum.factory}-${unDispatchMacNum.code}</option>
					          	</c:forEach>
					          </select>						          				         					      		
					          					         		         			          
					       </div>
				           <button  data-inline="true" value="保存" disabled="disabled" id="blind" name="blind" disabled="disabled">绑定</button>
				           <button  data-inline="true" value="验证" id="blindyanzheng" name="blindyanzheng" onclick="checkBlindForm();">验证</button>					      
				     </form>
				 </div>
				 <!-- 修改工序面板信息-->		  		 	
				  <div data-role="popup" id="modifyWorkOrder" class="ui-content" style="min-width:300px;" data-dismissible="false">
				    <a onclick="closeModifyWorkOrderDialog()" data-rel="back"  id="close" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
				      <form >
					        <div >
					          <h3 align="center" >修改生产线工位信息面板</h3>
					          <input type="hidden" name="modifyWorkOrder-id" id="modifyWorkOrder-id" disabled="disabled">		          					         		          				         
					          
					          <label for="modifyWorkOrder-remarks" class="ui-hidden-accessible">备注信息:</label>
					          <textarea name="modifyWorkOrder-remarks" id="modifyWorkOrder-remarks" placeholder="备注信息..." rows="20" cols="4" ></textarea>	
					          
					          <label for="modifyWorkOrder-workOne" class="ui-hidden-accessible">工位1:</label>
					          <input type="text" name="modifyWorkOrder-workOne" id="modifyWorkOrder-workOne" placeholder="工位1信息..." >
					          
					          					          
					          <label for="modifyWorkOrder-workTwo" class="ui-hidden-accessible">工位2:</label>
					          <input type="text" name="modifyWorkOrder-workTwo" id="modifyWorkOrder-workTwo" placeholder="工位2信息..." >
					          
					         					          
					          <label for="modifyWorkOrder-workThree" class="ui-hidden-accessible">工位3:</label>
					          <input type="text" name="modifyWorkOrder-workThree" id="modifyWorkOrder-workThree" placeholder="工位3信息..." >	
					          
					          		         		         			          
					       </div>
				           <button  data-inline="true" value="保存" id="saveModifyWorkOrder" name="saveModifyWorkOrder">保存</button>				           				      
				     </form>
				 </div>
				  <!-- 工位绑定操作员信息面板-->		  		 	
				  <div data-role="popup" id="blindEmployees" class="ui-content" style="min-width:300px;" data-dismissible="false">
				    <a onclick="closeBlindEmployeesDialog()" data-rel="back"  id="close" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
				      <form >
					        <div >
					          <h3 align="center" >生产线工序绑定员工</h3>
					          <input type="hidden" name="blindEmployees-id" id="blindEmployees-id" disabled="disabled">					         
					          
					          <label for="blindEmployees-operationOneId"   >工序1操作员:</label>     
					          <select id="blindEmployees-operationOneId" name="blindEmployees-operationOneId">
					          	<option value="-1">请选择员工...</option>
					          	<c:forEach items="${unDispatchEmployeesList}" var="unDispatchEmployees" >
					          		<option value="${unDispatchEmployees.id}">${unDispatchEmployees.name}</option>
					          	</c:forEach>
					          </select>
					          
					          
					          
					          <label for="blindEmployees-operationTwoId"  >工序2操作员:</label>    
					          <select id="blindEmployees-operationTwoId" name="blindEmployees-operationTwoId">
					          	<option value="-1">请选择员工...</option>
					          	<c:forEach items="${unDispatchEmployeesList}" var="unDispatchEmployees" >
					          		<option value="${unDispatchEmployees.id}">${unDispatchEmployees.name}</option>
					          	</c:forEach>
					          </select>
					          
					        
					          
					          <label for="blindEmployees-operationThreeId"   >工序3操作员:</label>    
					          <select id="blindEmployees-operationThreeId" name="blindEmployees-operationThreeId">
					          	<option value="-1">请选择员工...</option>
					          	<c:forEach items="${unDispatchEmployeesList}" var="unDispatchEmployees" >
					          		<option value="${unDispatchEmployees.id}">${unDispatchEmployees.name}</option>
					          	</c:forEach>
					          </select>			         					      		
					          					         		         			          
					       </div>
				           <button  data-inline="true" value="保存" id="saveBlindEmployees" name="saveBlindEmployees">保存</button>				           				      
				     </form>
				 </div>
		  		 <table  data-role="table" data-mode="columntoggle" class="ui-responsive ui-shadow" id="myTable" style="font-size:8px;" data-column-btn-text="其他数据">
			      <thead>
			        <tr >
			          <th data-priority="2">编号</th>			          
			          <th data-priority="2">机器编号</th>        
			          <th data-priority="1">工序1</th>
			          <th data-priority="1">操作员</th>
			          <th data-priority="1">工序2</th>
			          <th data-priority="1">操作员</th>
			          <th data-priority="1">工序3</th>
			          <th data-priority="1">操作员</th>	
			          <th data-priority="1">生产线编号</th>	
			          <th data-priority="2">备注</th>	
			          <th data-priority="1">状态</th>
			          <th data-priority="1">操作</th>				          			      
			        </tr>
			      </thead>
			      <tbody>
			          <c:forEach items="${productLineList}" var="productLine" varStatus="status">
				         <tr>
				          	<td>${status.index+1}</td>				          	
				          	<td>
				          		<c:choose>
				          			<c:when test="${productLine.macNumber==0}">				          			
				          				<font color="red">未绑定机器</font>             			
				          			</c:when>
				          			<c:otherwise>
				          				${productLine.macNumber}
				          			</c:otherwise>
				          		</c:choose>	
				          	</td>				           
				          	<td>
				          		<c:choose>
				          			<c:when test="${productLine.workOne==''||productLine.workOne==null}">
				          				空		          			
				          			</c:when>
				          			<c:otherwise>
				          				${productLine.workOne}
				          			</c:otherwise>
				          		</c:choose>	
				          	</td>
				          	<td>
				          		<c:choose>
				          			<c:when test="${productLine.employeesOne==''||productLine.employeesOne==null}">
				          				空		          			
				          			</c:when>
				          			<c:otherwise>
				          				${productLine.employeesOne.name}
				          			</c:otherwise>
				          		</c:choose>
				          	</td>
				          	<td>
				          		<c:choose>
				          			<c:when test="${productLine.workTwo==''||productLine.workTwo==null}">
				          				空		          			
				          			</c:when>
				          			<c:otherwise>
				          				${productLine.workTwo}
				          			</c:otherwise>
				          		</c:choose>	
				          	</td>
				          	<td>
				          		<c:choose>
				          			<c:when test="${productLine.employeesTwo==''||productLine.employeesTwo==null}">
				          				空		          			
				          			</c:when>
				          			<c:otherwise>
				          				${productLine.employeesTwo.name}
				          			</c:otherwise>
				          		</c:choose>
				          	</td>
				          	<td>
				          		<c:choose>
				          			<c:when test="${productLine.workThree==''||productLine.workThree==null}">
				          				空		          			
				          			</c:when>
				          			<c:otherwise>
				          				${productLine.workThree}
				          			</c:otherwise>
				          		</c:choose>	
				          	</td>
				          	<td>
				          		<c:choose>
				          			<c:when test="${productLine.employeesThree==''||productLine.employeesThree==null}">
				          				空		      			
				       				</c:when>
				          			<c:otherwise>
				          				${productLine.employeesThree.name}
				          			</c:otherwise>
				          		</c:choose>
				          	</td>
				          	<td>${productLine.lineNumber}</td>
				          	<td>${productLine.remarks}</td>
				          	<td>
				          		<c:choose>
				          			<c:when test="${productLine.status==0}">
				          				<font color="red">停止</font>      			
				          			</c:when>
				          			<c:otherwise>
				          				<font color="green">运行</font>
				          			</c:otherwise>
				          		</c:choose>	
				          	</td>				          	
				          	<td>
				          		<c:choose>
				          			<c:when test="${productLine.macNumber==0}">
				          				<a href="#blindMachine"  data-inline="true" data-rel="popup" data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:blue;" onclick="setValue(${productLine.id},'${productLine.lineNumber}')">绑定机器</a>
				          				<a href="javascript:deleteProductLine(${productLine.id})"  data-inline="true" data-rel="popup" data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:red;" >删除</a>	      			
				          			</c:when>
				          			<c:otherwise>
				          				<c:choose>
						          			<c:when test="${productLine.employeesThree==null&&productLine.employeesTwo==null&&productLine.employeesOne==null}">
						          				<a href="#blindEmployees" data-inline="true" data-rel="popup" data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:blue;" onclick="blindEmployees(${productLine.id});">绑定操作员</a>	    										          				
						          			</c:when>
						          			<c:otherwise>
					          					<a  data-inline="true" data-rel="popup" data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:blue;" onclick="unblindEmployees(${productLine.id});"><font color="green">解除操作员</font></a>	  
							          		</c:otherwise>
						          		</c:choose>				        				
				          				<a href="#deleteBlind"  data-inline="true" data-rel="popup" data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:red;" onclick="unblindMachine(${productLine.id});">解绑机器</a>				          	     					          		      				
				          			</c:otherwise>
				          		</c:choose>	
				          		<a href="#modifyWorkOrder" data-inline="true" data-rel="popup" data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:blue;" onclick="modifyWorkOrder(${productLine.id},'${productLine.workOne}','${productLine.workTwo}','${productLine.workThree}','${productLine.remarks}');"><font color="black">修改工序</font></a>	    										          								          			     
				          						          	
				          	</td>				          	          			          				          
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