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
    	//添加物料设置相应的信息
    	function setValues(materialId,hopeWeight,weight,lowWarningLevel,highWarningLevel){  		   		
    		$("#materialId").val(materialId);//材料materialId
    		$("#hopeWeight").val(hopeWeight);//
    		$("#weight").val(weight);//
    		$("#lowWarningLevel").val(lowWarningLevel);//
    		$("#highWarningLevel").val(highWarningLevel);//
    	}
	   	//材料参数更改异步提交
    	//form异步请求提交数据
    	$(function () {
            //给id为ajaxSubmit的按钮提交表单
            $("#tijiao").on("click",function () {      
            	$.post("${pageContext.request.contextPath}/material/materialParameterSettingSave.do",
                  		 {  
                  			'materialId':$("#materialId").val(),
                  			'hopeWeight':$("#hopeWeight").val(),
                  			'weight':$("#weight").val(),
                  			'lowWarningLevel':$("#lowWarningLevel").val(),
                  			'highWarningLevel':$("#highWarningLevel").val()
          				 },function(result){
          				   if(result.success){                     
      	                       	   alert("更改成功！");   
      	                           window.location.href="${pageContext.request.contextPath}/admin/materialParameterSetting.do";	
      	                       }else{                      
      	                           alert("更改失败！");
      	                       }
          			},"json");                      
            }); 
                 
        });   	
		//关闭设定窗口后初始化
    	function closeDialog(){ 
    		$("#materialId").val("");//材料materialId
    		$("#hopeWeight").val("");//
    		$("#weight").val("");//
    		$("#lowWarningLevel").val("");//
    		$("#highWarningLevel").val("");//    		
    		
    		$('#yanzheng').attr("disabled",false);
    		$('#tijiao').attr("disabled",true);
    		$('#hopeWeight').attr('readonly',false);
    		$('#lowWarningLevel').attr("readonly",false);
    		$('#highWarningLevel').attr("readonly",false);
    	}
    	function checkForm(){  //函数名字用checkForm可以，用其他的不行？？/奇怪
    		//alert($("#lowWarningLevel").val());
    		//alert($("#hopeWeight").val());
    		if($("#hopeWeight").val()==""){
    			alert("仓库上限质量不能为空！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialParameterSetting.do";
    			return ;
    		}if(isNaN($("#hopeWeight").val())){   //isNaN()判断是否非数字
    			alert("仓库上限质量只能数字！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialParameterSetting.do";
    			return ;
    		}if($("#hopeWeight").val()<=0){
    			alert("仓库上限质量只能正整数！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialParameterSetting.do";
    			return ;
    		}if($("#hopeWeight").val()>1000000){
    			alert("仓库上限质量最大不能超过1000000(g)！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialParameterSetting.do";
    			return ;
    		}if($("#lowWarningLevel").val()==""){
    			alert("质量不足轻度报警不能为空！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialParameterSetting.do";
    			return ;
    		}if(isNaN($("#lowWarningLevel").val())){   //isNaN()判断是否非数字
    			alert("质量不足轻度报警只能数字！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialParameterSetting.do";
    			return ;
    		}if($("#lowWarningLevel").val()<=0){
    			alert("质量不足轻度报警只能正整数！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialParameterSetting.do";
    			return ;
    		}if(($("#lowWarningLevel").val()-$("#hopeWeight").val())>0){
    			//alert($("#lowWarningLevel").val()-$("#hopeWeight").val());       		
    			alert("质量不足轻度报警不能超过仓库上限质量！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialParameterSetting.do";
    			return ;
    		}if($("#highWarningLevel").val()==""){
    			alert("质量不足高度报警不能为空！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialParameterSetting.do";
    			return ;
    		}if(isNaN($("#highWarningLevel").val())){   //isNaN()判断是否非数字
    			alert("质量不足高度报警只能数字！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialParameterSetting.do";
    			return ;
    		}if($("#highWarningLevel").val()<=0){
    			alert("质量不足高度报警只能正整数！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialParameterSetting.do";
    			return ;
    		}if($("#highWarningLevel").val()>$("#lowWarningLevel").val()){
    			alert("质量不足高度报警不能超过轻度报警质量！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialParameterSetting.do";
    			return ;
    		}if(($("#weight").val()-$("#hopeWeight").val())>0){
    			alert("仓库上限质量不能小于现有质量！");
    			window.location.href="${pageContext.request.contextPath}/admin/materialParameterSetting.do";
    			return ;
    		}
    		alert("验证通过!");
    		$('#yanzheng').attr("disabled",true);
    		$('#tijiao').attr("disabled",false);
    		$('#hopeWeight').attr('readonly',true);
    		$('#lowWarningLevel').attr("readonly",true);
    		$('#highWarningLevel').attr("readonly",true);
    		//window.location.href="${pageContext.request.contextPath}/admin/materialSearch.do"; 
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
    			<h1>物料报警参数设定界面</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="main" align="center" style="margin: 5px;"> 
		  		
		  		  <!--设置物料参数面板-->		  		 	
				  <div data-role="popup" id="materialParameterSetting" class="ui-content" style="min-width:250px;" data-dismissible="false">
				    <a onclick="closeDialog()" data-rel="back"  id="close" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
				      <form>
				        <div>
				          <h3 align="center"  align="center">设置物料报警参数</h3>				          			         
				          <input type="hidden" name="materialId" id="materialId"  readonly="readonly">
				          
				          <label for="weight"  align="center">当前质量(g):</label>
				          <input type="text" name="weight" id="weight"  readonly="readonly">				          				         
				          
				          <label for="hopeWeight"  align="center">仓库物料质量上限(g):</label>
				          <input type="text" name="hopeWeight" id="hopeWeight" >
				          
				          <label for="lowWarningLevel" align="center">物料轻度不足报警(g):</label>
				          <input type="text" name="lowWarningLevel" id="lowWarningLevel" >
				          
				          <label for="highWarningLevel"  align="center">物料高度不足报警(g):</label>
				          <input type="text" name="highWarningLevel" id="highWarningLevel" >				          
				          
				          <button  data-inline="true" value="保存" disabled="disabled" id="tijiao" name="tijiao">保存</button>
				          <button  data-inline="true" value="验证"  onclick="checkForm()" id="yanzheng" name="yanzheng">验证</button>			         			          
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
			          <th data-priority="1">物料上线</th>
			          <th data-priority="1">目前物料</th>
			          <th data-priority="1">物料低报警线</th>	
			          <th data-priority="1">物料高报警线</th>	
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
				          	<td>${material.hopeWeight}(g)</td>
				          	<td>${material.weight}(g)</td>
				          	<td>${material.lowWarningLevel}(g)</td>
				          	<td>${material.highWarningLevel}(g)</td>				          	
				          	<td>
				          		<a href="#materialParameterSetting" data-rel="popup" data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:blue;" onclick="setValues(${material.materialId},${material.hopeWeight},${material.weight},${material.lowWarningLevel},${material.highWarningLevel})">设定</a>				          	     				          		
				          	</td>				          	          			          				          
			          </c:forEach>
			      </tbody>
			    </table>
		  </div>	
		  <!--  -->
		  <div data-role="footer" data-position="fixed">
			   <h1></h1>
		  </div>		 
	</div>	
</body>
</html>