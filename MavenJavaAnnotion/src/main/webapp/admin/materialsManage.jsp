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
$(function(){	
});
	/*function logout(){
		if(confirm("确定要退出吗？")){
			window.location.href="${pageContext.request.contextPath}/User/System/logout.do";
		}
	}*/
	//关闭修改窗口后初始化
	function closeDialog2(){ 				
		$("#weight").val("");//材料id---编号
		$("#merchant").val("");//材料厂家
		//alert($("#merchant").val());
		$("#name").val("");//材料名称
		$("#alias").val("");//材料别名
		$("#character").val("");//材料名称
		$("#description").val("");//材料别名
		$("#meltingPoints").val("");
		$("#daimeter").val("");
		$("#dryingTemperature").val("");
		$("#acidBaseProperty").val("");
		$("#storageTemperature").val("");		
		////////
		$('#yanzheng2').attr("disabled",false);
		$('#tijiao2').attr("disabled",true);
		$('#weight').attr("readonly",false);
		$('#name').attr("readonly",false);
		$('#merchant').attr("readonly",false);
	}
	function checkForm2(){ 
		if(isNaN($("#weight").val())){   //isNaN()判断是否非数字
			alert("质量只能数字！");
			window.location.href="${pageContext.request.contextPath}/admin/materialsManage.jsp";
			//return ;
		}else if($("#weight").val()<=0){
			alert("质量只能正整数！");
			window.location.href="${pageContext.request.contextPath}/admin/materialsManage.jsp";
			//return;
		}
		else if($("#weight").val()>=100000000){
			alert("数字过大！");
			window.location.href="${pageContext.request.contextPath}/admin/materialsManage.jsp";
			//return ;
		}else if($("#name").val()==""){
			alert("物料名称不能为空");
			window.location.href="${pageContext.request.contextPath}/admin/materialsManage.jsp";
			//return ;
		}else if($("#merchant").val()==""){
			alert("物料厂家不能为空");
			window.location.href="${pageContext.request.contextPath}/admin/materialsManage.jsp";
			//return ;
		}else{
			alert("验证通过!");
    		$('#yanzheng2').attr("disabled",true);
    		$('#tijiao2').attr("disabled",false);
    		$('#weight').attr("readonly",true);
    		$('#name').attr("readonly",true);
    		$('#merchant').attr("readonly",true);
		}   		
		//window.location.href="${pageContext.request.contextPath}/admin/materialSearch.do"; 
	}
	//form异步请求提交数据
	$(function () {
        $("#tijiao2").on("click",function () {      
        	$.post("${pageContext.request.contextPath}/admin/addMaterial.do",
        		 {   
	        		'meltingPoints':$("#meltingPoints").val(),
	    			'daimeter':$("#daimeter").val(),           			
				    'dryingTemperature':$("#dryingTemperature").val(),  				    
				    'storageTemperature':$("#storageTemperature").val(),
				    'acidBaseProperty':$("#acidBaseProperty").val(),
        			'weight':$("#weight").val(),
        			'merchant':$("#merchant").val(),           			
				    'name':$("#name").val(),  				    
				    'alias':$("#alias").val(),
				    'character':$("#character").val(),
				    'description':$("#description").val()   		    		
				  },function(result){
				       if(result.success){                     
                       	   alert("物料入库成功！");                             	
                       }else{                      
                           alert("物料入库失败！");
                       }
				   	   window.location.href="${pageContext.request.contextPath}/admin/materialsManage.jsp";
			},"json");                     
        });                   
    });
</script>

<style type="text/css">
	img{
		border-radius:8px;
	}
</style>
</head>
<body >
	<div data-role="page" style="background-color:white;">
		  <div data-role="header" data-position="fixed">
		     <a href="${pageContext.request.contextPath}/admin/adminInterface.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>   
    		  <h1>物料管理</h1>
    	<!--	<a href="#moreInfo" data-role="button" data-rel="popup" data-icon="grid" data-iconpos="notext" class="ui-btn-right" data-transition="slide"></a>   -->
		  </div>
		  <!--      
		  <div data-role="popup" id="moreInfo" class="ui-content"  data-overlay-theme="b">		
		  	 <div data-role="main" class="ui-content">
			    <ul data-role="listview" data-inset="true">    		  
			    </ul>
			  </div>

			  <ul data-role="listview" data-inset="true">			      
			      <li>
			        <a href="#">			        
			        <h2>登陆后台</h2>		        
			        </a>
			        <a href="#download" data-transition="pop" data-icon="gear">下载浏览器</a>
			      </li>
			      <li>
			        <a href="#">		        
			        <h2>登陆后台</h2>		        
			        </a>
			        <a href="#download" data-transition="pop" data-icon="gear">下载浏览器</a>
			      </li>
			   </ul>
			   
		  </div>
			--> 	  	  
		  <div data-role="content" >
		  	<div style="height:40px;">
		  	
		  	</div>
		  		  <!--物料入库信息面板-->		  		 	
				  <div data-role="popup" id="myPopup2" class="ui-content" style="min-width:250px;" data-dismissible="false">
				    <a onclick="closeDialog2()" data-rel="back"  id="close" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
				      <form >
				        <div>
				          <h3 align="center" >物料入库</h3>				      				         
				          
				          <label for="merchant" class="ui-hidden-accessible" >生产厂家:</label>
				          <input type="text" name="merchant" id="merchant" placeholder="生产厂家...">				          				         
				          
				          <label for="weight" class="ui-hidden-accessible">物料质量:</label>
				          <input type="text" name="weight" id="weight" placeholder="物料质量(g)...">
				          
				          <label for="name" class="ui-hidden-accessible">物料名称:</label>
				          <input type="text" name="name" id="name"  placeholder="物料名称...">
				          
				          <label for="alias" class="ui-hidden-accessible">物料别名:</label>
				          <input type="text" name="alias" id="alias" placeholder="物料别名...">
				          
				          <label for="meltingPoints" class="ui-hidden-accessible">物料熔点:</label>
				          <input type="text" name="meltingPoints" id="meltingPoints" placeholder="物料熔点...">
				          
				          <label for="daimeter" class="ui-hidden-accessible">物料直径:</label>
				          <input type="text" name="daimeter" id="daimeter" placeholder="物料直径...">
				          
				          <label for="dryingTemperature" class="ui-hidden-accessible">干燥温度:</label>
				          <input type="text" name="dryingTemperature" id="dryingTemperature" placeholder="干燥温度...">
				          
				          <label for="storageTemperature" class="ui-hidden-accessible">存储温度:</label>
				          <input type="text" name="storageTemperature" id="storageTemperature" placeholder="存储温度...">
				          
				          <label for="acidBaseProperty" class="ui-hidden-accessible">酸碱度:</label>
				          <input type="text" name="acidBaseProperty" id="acidBaseProperty" placeholder="酸碱度...">
				          
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
		    <table border="0" align="center" cellpadding="4">
		    	<tr>
		    		<td><a href="${pageContext.request.contextPath}/admin/materialSearch.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/37.png"></a></td>
		    		<td><a href="#myPopup2" data-rel="popup" data-position-to="window" class="ui-corner-all ui-btn-inline" style="font-size:10px;color:blue;"><img src="${pageContext.request.contextPath}/static/images/38.png"></a></td>
		    		<td><a href="${pageContext.request.contextPath}/admin/materialScrap.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/39.png"></a></td>
		    	</tr>
		    	<tr align="center">
		    		<td>物料查询</td>
		    		<td>物料入库</td>
		    		<td>物料报废</td>		    				
		    	</tr>
		    	<tr align="center">
		    		<td><a href="${pageContext.request.contextPath}/admin/materialParameterSetting.do" rel="external"><img src="${pageContext.request.contextPath}/static/images/20.png"></a></td>
		    		<td></td>
		    		<td></td>
		    	</tr>
		    	<tr align="center">
		    		<td>参数设定</td>
		    		<td></td>
		    		<td></td>		    				
		    	</tr>		    		    	
		    </table>
		  </div>
		  <!--  -->
		   <div data-role="footer" data-position="fixed">
			 <h1>
			   	<a href="#"></a>								
			 </h1>
		  </div>
		  <!--  -->
	</div>	
</body>
</html>