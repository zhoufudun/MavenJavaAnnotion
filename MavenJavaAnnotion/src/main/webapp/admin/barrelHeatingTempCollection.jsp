<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/static/My97DatePicker/WdatePicker.js"></script>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1" />
<link href="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
<script src="${pageContext.request.contextPath}/static/jquery/jquery-3.1.1.js" type="text/javascript"></script>
<script type="text/javascript">		
	function setValue(id,temperature,collectionTime){
		$("#updateCollectionTime").val(collectionTime);
		$("#updateId").val(id);
		$("#updateHeatingTemp").val(temperature);
	}
	//保存修改的信息
	$(function () {       
        $("#saveUpdateHeatingTemp").on("click",function () {          	
        	$.post("${pageContext.request.contextPath}/admin/saveUpdateHeatingTemp.do",
        			{ 
        		      'id':$("#updateId").val(),
        		      'collectionTime':document.getElementById("updateCollectionTime").value,
        		      'temperature':$("#updateHeatingTemp").val()
    			    },
    				function(result){
	    				if(result.success){
	    					alert("修改成功！");
	    					window.location.href="${pageContext.request.contextPath}/admin/barrelHeatingTempCollection.do?barrelRegion="+$('#barrelRegion').val()+"&macNumId="+$('#macNumId').val();	
	    				}else{	
	    					alert("修改失败！");
	    				}
    		},"json");                     
        });             
    });
   //保存添加的信息
	$(function () {       
        $("#saveAddHeatingTemp").on("click",function () {
        	if(document.getElementById("addCollectionTime").value==''){
        		alert("时间不能为空");
				window.location.href="${pageContext.request.contextPath}/admin/barrelHeatingTempCollection.do?barrelRegion="+$('#barrelRegion').val()+"&macNumId="+$('#macNumId').val();	
        	}else if($("#addHeatingTemp").val()==''){
        		alert("请填写温度！");
				window.location.href="${pageContext.request.contextPath}/admin/barrelHeatingTempCollection.do?barrelRegion="+$('#barrelRegion').val()+"&macNumId="+$('#macNumId').val();	
        	}else{
        		$.post("${pageContext.request.contextPath}/admin/saveAddHeatingTemp.do",
            			{        		      
            		      'collectionTime':document.getElementById("addCollectionTime").value,
            		      'temperature':$("#addHeatingTemp").val(),
            		      'macNumId':$("#macNumId").val(),
            		      'region':$("#barrelRegion").val()
        			    },
        				function(result){
    	    				if(result.success){
    	    					alert("添加成功！");
    	    					window.location.href="${pageContext.request.contextPath}/admin/barrelHeatingTempCollection.do?barrelRegion="+$('#barrelRegion').val()+"&macNumId="+$('#macNumId').val();	
    	    				}else{	
    	    					alert("添加失败！");
    	    					//return ;
    	    				}
        		},"json");
        	}      	                     
        });             
    });
   function setId(id){
	   $("#id-delete").val(id);
   }
  //删除信息
	$(function () {       
       $("#delete").on("click",function () {   
       		$.post("${pageContext.request.contextPath}/admin/deleteHeatingTemp.do",
           			{        		                 		      
           		      'id':$("#id-delete").val()
       			    },
       				function(result){
   	    				if(result.success){
   	    					alert("删除成功！");
   	    					window.location.href="${pageContext.request.contextPath}/admin/barrelHeatingTempCollection.do?barrelRegion="+$('#barrelRegion').val()+"&macNumId="+$('#macNumId').val();	
   	    				}else{	
   	    					alert("删除失败！");
   	    					//return ;
   	    				}
       		},"json");     	                     
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
		    <a href="${pageContext.request.contextPath}/admin/dataCollect.do" rel="extenal" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>机筒加热温度采集</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="main" align="center" style="margin: 5px;"> 
		  			
				    <!--  -->	
		  		 <table  data-role="table" data-mode="columntoggle" class="ui-responsive ui-shadow" id="myTable" style="font-size:10px;" data-column-btn-text="其他数据">
			      <thead>
			        <tr align="center">
			          <th data-priority="1">编号</th>
			          <th data-priority="1">采集时间</th>
			          <th data-priority="1">采集温度</th>  
			          <th data-priority="1">添加</th>   
			          <th data-priority="1">修改</th>
			          <th data-priority="1">删除</th>   			         	          			         				          	      
			        </tr>
			      </thead>
			      <tbody>
			          <c:forEach items="${barrelTempCurveList}" var="barrelHeatingTemp" varStatus="status">
				         <tr>
				          	<td>${status.index+1}</td>
				          	<td>
				          		<fmt:formatDate value="${barrelHeatingTemp.collectionTime}" pattern="yyyy-MM-dd HH:mm:ss"/> 				          		
				          	</td>	
				          	<td>${barrelHeatingTemp.temperature}℃</td>
				          	<td align="center">				          		
				          		<a href="#addBarrelHeatingTemp"  align="center" data-inline="true" data-rel="popup" data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:blue;">添加</a>
							</td>
				          	<td align="center">
				          		<a href="#updateBarrelHeatingTemp" align="center"  data-inline="true" data-rel="popup" data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:blue;" onclick="setValue(${barrelHeatingTemp.id},${barrelHeatingTemp.temperature},'<fmt:formatDate value="${barrelHeatingTemp.collectionTime}" pattern="yyyy-MM-dd HH:mm:ss"/>')">修改</a>
				          	</td>
				          	<td align="center">
				          		<a href="#deleteBarrelHeatingTemp" align="center"  data-inline="true" data-rel="popup" data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:blue;" onclick="setId(${barrelHeatingTemp.id})">删除</a>
				          	</td>				            					           
				         </tr>
			          </c:forEach>
			      </tbody>
			    </table>
			    <!--修改机筒加热温度-->
		        <div data-role="popup" id="updateBarrelHeatingTemp" class="ui-content" style="min-width:250px;">				     
				    <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     				       
				      <form>
				        <div>	
				        	  <h3 align="center">修改温度信息</h3>
				        	  <input type="hidden" name="updateId" id="updateId">				        	  					         
					          
					          <label for="updateCollectionTime" class="ui-hidden-accessible">采集时间:</label>
				          	  <input type="text" name="updateCollectionTime" id="updateCollectionTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" placeholder="采集时间">
	
					          <label for="updateHeatingTemp" class="ui-hidden-accessible">温度:</label>
					          <input type="text" name="updateHeatingTemp" id="updateHeatingTemp" placeholder="温度(℃)">
					          					          					          						          					          	          					          					          
					          <button  data-inline="true" value="保存"  id="saveUpdateHeatingTemp" name="saveUpdateHeatingTemp">保存修改</button>				          		          
				        </div>
				      </form>
				</div>
				<!--添加机筒加热时的温度-->
		        <div data-role="popup" id="addBarrelHeatingTemp" class="ui-content" style="min-width:250px;">				     
				    <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     				       
				      <form>
				        <div>	
				        	  <h3 align="center">添加机筒测量温度</h3>				        	 			        	  					         
					          
					          <label for="addCollectionTime" class="ui-hidden-accessible">采集时间:</label>
				          	  <input type="text" name="addCollectionTime" id="addCollectionTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:false})" placeholder="采集时间">
	
					          <label for="addHeatingTemp" class="ui-hidden-accessible">温度:</label>
					          <input type="text" name="addHeatingTemp" id="addHeatingTemp" placeholder="温度(℃)">
					          					          					          						          					          	          					          					          
					          <button  data-inline="true" value="保存"  id="saveAddHeatingTemp">保存信息</button>				          		          
				        </div>
				      </form>
				</div>
				<!--删除机筒加热温度-->
		        <div data-role="popup" id="deleteBarrelHeatingTemp" class="ui-content" style="min-width:250px;">				     
				    <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     				       
				      <form>
				        <div>	
				        	  <h3 align="center">确认删除该条数据？</h3>				        	 			        	  					         
					          <input type="hidden" id="id-delete">						          					         
					          <button  data-inline="true" value=""  id="delete">确定删除</button>					          					          						          					          	          					          					          
					          <button  data-inline="true" value=""  id="giveUp">取消删除</button>				          		          
				        </div>
				      </form>
				</div>
		  </div>	
		  <!--  -->
		  <div data-role="footer" data-position="fixed">
			   <h1 align="center">
			   		<input type="hidden" id="macNumId" value="${macNumId}">
			   		<input type="hidden" id="barrelRegion" value="${barrelRegion}">	
			   		${macNum.factory}---${macNum.code}---机筒${barrelRegion}段
			   </h1>
		  </div>
		  <!--  -->
	</div>	
	
</body>


</html>