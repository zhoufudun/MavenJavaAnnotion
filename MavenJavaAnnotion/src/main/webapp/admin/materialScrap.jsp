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
		//物料报废设置相应的信息
    	function setValues(materialId,merchant,name){   		
    		$("#materialId").val(materialId);//材料materialId   		
    		$("#merchant").val(merchant);//材料厂家
    		$("#name").val(name);//材料名称   	
    	}
    	//表单校验    	
    	//form异步请求提交数据
    	$(function () {          
            $("#tijiao").on("click",function () { 
            	if(confirm("确认报废该物料吗？")){
            		$.post("${pageContext.request.contextPath}/admin/materialScrapByMaterialId.do",
                   		 {  
                   			materialId:$("#materialId").val()
           				 },function(result){
           				   if(result.success){                     
       	                       	   alert("报废成功！");   
       	                           window.location.href="${pageContext.request.contextPath}/admin/materialScrap.do";	
       	                       }else{                      
       	                           alert("报废失败！");
       	                           window.location.href="${pageContext.request.contextPath}/admin/materialScrap.do";
       	                       }
           			},"json"); 
            	}
            	else{         		
            		window.location.href="${pageContext.request.contextPath}/admin/materialScrap.do";
            	}                    
            });                        
        });
    	//关闭报废窗口后初始化
    	function closeDialog(){      	
    		$("#materialId").val("");//材料materialId
    		$("#merchant").val("");//材料厂家
    		$("#name").val("");//材料名称    		
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
		    <a href="${pageContext.request.contextPath}/admin/materialsManage.jsp" rel="extenal" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>物料报废界面</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="main" align="center" style="margin: 5px;"> 
		  		   <!--搜索-->	
				 <form method="post" action="${pageContext.request.contextPath}/admin/materialScrap.do" style="margin-bottom:-20px;">
				      <div data-role="fieldcontain" style="width:100%"> 
				         <input type="text" name="s_name" id="s_name" placeholder="输入名称..." class="ui-corner-all" value="${s_name}"/>   				         
				         <input type="submit"  value="搜索" class="ui-corner-all"/>
				      </div>
			     </form>		  		 
				  <!--报废物料信息面板-->		  		 	
				  <div data-role="popup" id="myPopup" class="ui-content" style="min-width:250px;" data-dismissible="false">
				    <a onclick="closeDialog()" data-rel="back"  id="close" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
				      <form >
				        <div>
				          <h3 align="center" >报废物料</h3>				        		         
				          <input type="hidden" name="materialId" id="materialId"  >
				          
				          <label for="merchant" class="ui-hidden-accessible" >生产厂家:</label>
				          <input type="text" name="merchant" id="merchant" readonly="readonly" placeholder="生产厂家...">				          				         
				          
				          <label for="name" class="ui-hidden-accessible">物料名称:</label>
				          <input type="text" name="name" id="name"  readonly="readonly"  placeholder="物料名称...">				          	
				          
				          <button  data-inline="true" value="报废"  id="tijiao" name="tijiao">报废</button>		         			          
				       </div>
				     </form>
				 </div>
				 
		  		 <table  data-role="table" data-mode="columntoggle" class="ui-responsive ui-shadow" id="myTable" style="font-size:8px;" data-column-btn-text="其他数据">
			      <thead>
			        <tr >
			          <th data-priority="1">编号</th>
			          <th data-priority="1">名称</th>
			          <th data-priority="1">厂家</th>        
			          <th data-priority="2">别名</th>
			          <th data-priority="2">特性</th>
			          <th data-priority="2">熔点</th>	
			          <th data-priority="2">直径</th>	
			          <th data-priority="2">干燥温度</th>	
			          <th data-priority="2">存储温度</th>	
			          <th data-priority="2">酸碱度</th>	
			          <th data-priority="2">备注</th>				         	
			          <th data-priority="1">状态</th>
			          <th data-priority="1">操作</th>				          			      
			        </tr>
			      </thead>
			      <tbody>
			          <c:forEach items="${materialList}" var="material" varStatus="status">
				         <tr>
				          	<td>${status.index+1}</td>
				          	<td>${material.name}</td>
				          	<td>${material.merchant}</td>
				            <td>${material.alias}</td>
				          	<td>${material.character}</td>
				          	<td>${material.meltingPoints}</td>
				          	<td>${material.daimeter}</td>
				          	<td>${material.dryingTemperature}</td>
				          	<td>${material.storageTemperature}</td>
				          	<td>${material.acidBaseProperty}</td>
				          	<td>${material.description}</td>
				          	<td>
				          		<c:if test="${material.attId==1&&material.scrapId==1}">
				          			<font color="green">充足</font>
				          		</c:if>
				          		<c:if test="${material.attId==0&&material.scrapId==1}">
				          			<font color="red">不足</font>
				          		</c:if>
				          		<c:if test="${material.scrapId==0}">
				          			<font color="red">报废</font>
				          		</c:if>
				          	</td>
				          	<td> 
				          		<c:choose>
				          			<c:when test="${material.scrapId!=0}">
				          				<a href="#myPopup" data-rel="popup" data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:blue;" onclick="setValues(${material.materialId},'${material.merchant}','${material.name}')">报废</a>				          							          				
				          			</c:when>
				          			<c:otherwise>
				          				<a disabled="disabled" data-rel="popup" data-position-to="window"   class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:red;" onclick="setValues(${material.materialId},'${material.merchant}','${material.name}')">报废</a>				          							          				
				          			</c:otherwise>
				          		</c:choose>				          		
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