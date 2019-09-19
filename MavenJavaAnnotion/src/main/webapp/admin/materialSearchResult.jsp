varchar(50)<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> 
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
    	//添加物料设置相应的信息
    	function setValues(materialId,id,merchant,name,alias){
    		//alert();//测试
    		$("#id").val(id);//材料id---编号
    		$("#materialId").val(materialId);//材料materialId
    		$("#merchant").val(merchant);//材料厂家
    		$("#name").val(name);//材料名称
    		$("#alias").val(alias);//材料别名
    	}
		//修改物料设置相应的信息
    	function setValues2(materialId,id,weight,merchant,name,alias,character,description){
    		//alert();//测试
    		$("#id-modify").val(id);//材料id---编号
    		$("#materialId-modify").val(materialId);//材料materialId
    		$("#weight").val(weight);//材料id---编号
    		$("#merchant-modify").val(merchant);//材料厂家
    		//alert($("#merchant").val());
    		$("#name-modify").val(name);//材料名称
    		$("#alias-modify").val(alias);//材料别名
    		$("#character").val(character);//材料名称
    		$("#description").val(description);//材料别名
    	}
    	//表单校验    	
    	//form异步请求提交数据
    	$(function () {
            //给id为ajaxSubmit的按钮提交表单
            $("#tijiao").on("click",function () {      
        		$.ajax({
        	    	type:"POST",
        	    	url:"${pageContext.request.contextPath}/admin/addWeightByMaterialId.do",
        	    	async:false, //同步执行
        	    	data: "materialId="+ $("#materialId").val()+"&addWeight="+$("#addWeight").val(),
        	    	success:function(result){
        	    		var result=eval('('+result+')');
        	    		if(result.success){                     
                            alert("物料添加成功!");  
                            //刷新界面  
                        }else{                      
                            alert("物料添加失败！");                          
                        }
						window.location.href="${pageContext.request.contextPath}/admin/materialSearch.do";
        	    	}   	    			
        	    });                       
            }); 
            $("#tijiao2").on("click",function () {      
            	$.post("${pageContext.request.contextPath}/admin/modifyMaterialByMaterialId.do",
            		 {  
            			'materialId':$("#materialId-modify").val(),
            			'weight':$("#weight").val(),
            			'merchant':$("#merchant-modify").val(),           			
    				    'name':$("#name-modify").val(),  				    
    				    'alias':$("#alias-modify").val(),
    				    'character':$("#character").val(),
    				    'description':$("#description").val()   		    		
    				  },function(result){
    				   if(result.success){                     
	                       alert("修改成功！");   
	                           window.location.href="${pageContext.request.contextPath}/admin/materialSearch.do";	
	                       }else{                      
	                           alert("修改失败！");
	                       }
    			},"json");                     
            }); 
            //删除已经报废的物料
            $("#delete").on("click",function () {
            	if(confirm("确认删除该物料？")){
            		$.post("${pageContext.request.contextPath}/admin/deleteScrapMaterial.do",
                   		 {  
                   			'materialId':materialId  //全局变量          			  		    		
           				 },function(result){
           				   if(result.success){                     
       	                       	   alert("删除成功！");   
       	                           window.location.href="${pageContext.request.contextPath}/admin/materialSearch.do";	
       	                       }else{                      
       	                           alert("删除失败！");
       	                       }
           			},"json"); 
            	}
            	else{
            		 window.location.href="${pageContext.request.contextPath}/admin/materialSearch.do";	
            	}                   
            });            
        });
    	//关闭添加窗口后初始化
    	function closeDialog(){   
    		$("#id").val("");//材料id---编号
    		$("#materialId").val("");//材料materialId
    		$("#merchant").val("");//材料厂家
    		$("#name").val("");//材料名称
    		$("#alias").val("");//材料别名
    		$('#addWeight').attr("disabled",false);
    		$('#yanzheng').attr("disabled",false);
    		$('#tijiao').attr("disabled",true);
    		$('#addWeight').attr("readonly",false);
    		$('#addWeight').val("");
    	}
		//关闭修改窗口后初始化
    	function closeDialog2(){ 
    		$("#id-modify").val("");//材料id---编号
    		$("#materialId-modify").val("");//材料materialId
    		$("#weight").val("");//材料id---编号
    		$("#merchant-modify").val("");//材料厂家
    		//alert($("#merchant").val());
    		$("#name-modify").val("");//材料名称
    		$("#alias-modify").val("");//材料别名
    		$("#character").val("");//材料名称
    		$("#description").val("");//材料别名
			
    		$('#yanzheng2').attr("disabled",false);
    		$('#tijiao2').attr("disabled",true);
    		$('#weight').attr("readonly",false);
    		$('#name-modify').attr("readonly",false);
    		$('#merchant-modify').attr("readonly",false);
    	}
    	function checkForm(){  //函数名字用checkForm可以，用其他的不行？？/奇怪
    		//alert("s");
    		if($("#addWeight").val()==""){
    			alert("不能为空！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialSearch.do";
    			return ;
    		}else if(isNaN($("#addWeight").val())){   //isNaN()判断是否非数字
    			alert("质量只能数字！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialSearch.do";
    			return ;
    		}else if($("#addWeight").val()<=0){
    			alert("质量只能正整数！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialSearch.do";
    			return ;
    		}
    		else if($("#addWeight").val()>=1000000){
    			alert("数字过大！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialSearch.do";
    			return ;
    		}
    		alert("验证通过!");
    		$('#yanzheng').attr("disabled",true);
    		$('#tijiao').attr("disabled",false);
    		$('#addWeight').attr("readonly",true);
    		//window.location.href="${pageContext.request.contextPath}/admin/materialSearch.do"; 
    	}
    	//修改验证
    	function checkForm2(){ 
    		if(isNaN($("#weight").val())){   //isNaN()判断是否非数字
    			alert("质量只能数字！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialSearch.do";
    			//return ;
    		}else if($("#weight").val()<=0){
    			alert("质量只能正整数！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialSearch.do";
    			//return;
    		}
    		else if($("#weight").val()>=100000000){
    			alert("数字过大！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialSearch.do";
    			//return ;
    		}else if($("#name-modify").val()==""){
    			alert("物料名称不能为空");
    			window.location.href="${pageContext.request.contextPath}/admin/materialSearch.do";
    			//return ;
    		}else if($("#merchant-modify").val()==""){
    			alert("物料厂家不能为空");
    			window.location.href="${pageContext.request.contextPath}/admin/materialSearch.do";
    			//return ;
    		}else{
    			alert("验证通过!");
        		$('#yanzheng2').attr("disabled",true);
        		$('#tijiao2').attr("disabled",false);
        		$('#weight').attr("readonly",true);
        		$('#name-modify').attr("readonly",true);
        		$('#merchant-modify').attr("readonly",true);
    		}   		
    		//window.location.href="${pageContext.request.contextPath}/admin/materialSearch.do"; 
    	}
    	var materialId;
    	function setDeleteMaterialId(material){
    		materialId=material;
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
    			<h1>物料查询界面</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="main" align="center" style="margin: 5px;"> 
		  		 <!--搜索-->	
				 <form method="post" action="${pageContext.request.contextPath}/admin/materialSearch.do" style="margin-bottom:-20px;">
				      <div data-role="fieldcontain" style="width:100%"> 
				         <input type="text" name="s_name" id="s_name" placeholder="输入名称..." class="ui-corner-all" value="${s_name}"/>   				         
				         <input type="submit"  value="搜索" class="ui-corner-all"/>
				      </div>
			     </form>
		  		  <!--添加已经存在的物料面板-->		  		 	
				  <div data-role="popup" id="myPopup" class="ui-content" style="min-width:250px;" data-dismissible="false">
				    <a onclick="closeDialog()" data-rel="back"  id="close" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
				      <form>
				        <div>
				          <h3 align="center" >添加物料</h3>
				          <input type="hidden" name="id" id="id"  readonly="readonly">				         
				          <input type="hidden" name="materialId" id="materialId"  readonly="readonly">
				          
				          <label for="merchant" class="ui-hidden-accessible" >生产厂家:</label>
				          <input type="text" name="merchant" id="merchant"  readonly="readonly">				          				         
				          
				          <label for="name" class="ui-hidden-accessible">物料名称:</label>
				          <input type="text" name="name" id="name"  readonly="readonly">
				          
				          <label for="alias" class="ui-hidden-accessible">物料别名:</label>
				          <input type="text" name="alias" id="alias"  readonly="readonly">
				          
				          <label for="addWeight" class="ui-hidden-accessible">添加质量:</label>
				          <input type="text" name="addWeight" id="addWeight" placeholder="添加质量(g)">	
				          
				          <button  data-inline="true" value="保存" disabled="disabled" id="tijiao" name="tijiao">保存</button>
				          <button  data-inline="true" value="验证"  onclick="checkForm()" id="yanzheng" name="yanzheng">验证</button>			         			          
				       </div>
				     </form>
				 </div>
				  <!--修改物料信息面板-->		  		 	
				  <div data-role="popup" id="myPopup2" class="ui-content" style="min-width:250px;" data-dismissible="false">
				    <a onclick="closeDialog2()" data-rel="back"  id="close" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
				      <form >
				        <div>
				          <h3 align="center" >修改物料</h3>
				          <input type="hidden" name="id-modify" id="id-modify"  >				         
				          <input type="hidden" name="materialId-modify" id="materialId-modify"  >
				          
				          <label for="merchant-modify" class="ui-hidden-accessible" >生产厂家:</label>
				          <input type="text" name="merchant-modify" id="merchant-modify" placeholder="生产厂家...">				          				         
				          
				          <label for="name-modify" class="ui-hidden-accessible">物料名称:</label>
				          <input type="text" name="name-modify" id="name-modify"  placeholder="物料名称...">
				          
				          <label for="alias-modify" class="ui-hidden-accessible">物料别名:</label>
				          <input type="text" name="alias-modify" id="alias-modify" placeholder="物料别名...">
				          
				          <label for="weight" class="ui-hidden-accessible">库存质量:</label>
				          <input type="text" name="weight" id="weight" placeholder="库存质量(g)...">
				          
				          <label for="character" class="ui-hidden-accessible">物料特性:</label>
				    <!--  <input type="text" name="character" id="character" placeholder="物料特性(g)...">	  -->
				          <textarea name="character" id="character" placeholder="物料特性(g)..." rows="20" cols="8"></textarea>
				          
				          <label for="description" class="ui-hidden-accessible">备注:</label>
				          <!--   <input type="text" name="description" id="description" placeholder="备注...">-->
				          <textarea name="description" id="description" placeholder="备注..." rows="20" cols="8"></textarea>		
				          
				          <button  data-inline="true" value="保存" disabled="disabled" id="tijiao2" name="tijiao2">保存</button>
				          <button  data-inline="true" value="验证"  onclick="checkForm2()" id="yanzheng2" name="yanzheng2">验证</button>			         			          
				       </div>
				     </form>
				 </div>
				 
		  		 <table  data-role="table" data-mode="columntoggle" class="ui-responsive ui-shadow" id="myTable" style="font-size:8px;" data-column-btn-text="其他数据">
			      <thead>
			        <tr >
			          <th data-priority="1">编号</th>
			          <th data-priority="1">名称</th>
			          <th data-priority="2">厂家</th>        
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
				          	    	<c:when test="${material.scrapId==0}">
				          	    		 <button data-inline="true" onclick="setDeleteMaterialId(${material.materialId})" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:red;" value="删除" id="delete" name="delete">删除</button>
				          	    	</c:when>
				          	    	<c:otherwise>
				          	    		 <a href="#myPopup" data-rel="popup" data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:blue;" onclick="setValues(${material.materialId},${material.id},'${material.merchant}','${material.name}','${material.alias}')">添加</a>				          	     
				          	    		 <a href="#myPopup2" data-rel="popup" data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:blue;" onclick="setValues2(${material.materialId},${material.id},${material.weight},'${material.merchant}','${material.name}','${material.alias}','${material.character}','${material.description}')">修改</a>	
				          	    	</c:otherwise>
				          	    </c:choose>
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