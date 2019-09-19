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
	function setValue(id,updateStableTemp,collectionTime){
		$("#collectionTime").val(collectionTime);
		$("#id").val(id);
		$("#updateStableTemp").val(updateStableTemp);
	}
	//保存修改的信息
	$(function () {       
        $("#saveUpdateStableTemp").on("click",function () {          	
        	$.post("${pageContext.request.contextPath}/admin/saveUpdateStableTemp.do",
        			{ 
        		      'id':$("#id").val(),
        		      'collectionTime':document.getElementById("collectionTime").value,
        		      'stableTemp':$("#updateStableTemp").val()
    			    },
    				function(result){
	    				if(result.success){
	    					alert("修改成功！");
	    					window.location.href="${pageContext.request.contextPath}/admin/barrelStableTempCollection.do?barrelRegion="+$('#barrelRegion').val()+"&macNumId="+$('#macNumId').val();	
	    				}else{	
	    					alert("修改失败！");
	    					//return ;
	    				}
    		},"json");                     
        });             
    });
   //保存添加的信息
	$(function () {       
        $("#saveAddStableTemp").on("click",function () {
        	if(document.getElementById("addCollectionTime").value==''){
        		alert("时间不能为空");
				window.location.href="${pageContext.request.contextPath}/admin/barrelStableTempCollection.do?barrelRegion="+$('#barrelRegion').val()+"&macNumId="+$('#macNumId').val();	
        	}else if($("#addStableTemp").val()==''){
        		alert("请填写温度！");
				window.location.href="${pageContext.request.contextPath}/admin/barrelStableTempCollection.do?barrelRegion="+$('#barrelRegion').val()+"&macNumId="+$('#macNumId').val();	
        	}else{
        		$.post("${pageContext.request.contextPath}/admin/saveAddStableTemp.do",
            			{        		      
            		      'collectionTime':document.getElementById("addCollectionTime").value,
            		      'stableTemp':$("#addStableTemp").val(),
            		      'macNumId':$("#macNumId").val(),
            		      'barrelRegion':$("#barrelRegion").val()
        			    },
        				function(result){
    	    				if(result.success){
    	    					alert("添加成功！");
    	    					window.location.href="${pageContext.request.contextPath}/admin/barrelStableTempCollection.do?barrelRegion="+$('#barrelRegion').val()+"&macNumId="+$('#macNumId').val();	
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
       		$.post("${pageContext.request.contextPath}/admin/deleteStableTemp.do",
           			{        		                 		      
           		      'id':$("#id-delete").val()
       			    },
       				function(result){
   	    				if(result.success){
   	    					alert("删除成功！");
   	    					window.location.href="${pageContext.request.contextPath}/admin/barrelStableTempCollection.do?barrelRegion="+$('#barrelRegion').val()+"&macNumId="+$('#macNumId').val();	
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
    			<h1>稳态机筒温度采集</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="main" align="center" style="margin: 5px;"> 
		  			
				    <!--  -->	
		  		 <table  data-role="table" data-mode="columntoggle" class="ui-responsive ui-shadow" id="myTable" style="font-size:10px;" data-column-btn-text="其他数据">
			      <thead>
			        <tr align="center">
			          <th data-priority="1">编号</th>
			          <th data-priority="1">采集时间</th>
			          <th data-priority="1">稳态温度</th>  
			          <th data-priority="1">添加</th>   
			          <th data-priority="1">修改</th>
			          <th data-priority="1">删除</th>   			         	          			         				          	      
			        </tr>
			      </thead>
			      <tbody>
			          <c:forEach items="${barrelStableTempList}" var="barrelStableTemp" varStatus="status">
				         <tr>
				          	<td>${status.index+1}</td>
				          	<td>
				          		<fmt:formatDate value="${barrelStableTemp.collectionTime}" pattern="yyyy-MM-dd HH:mm:ss"/> 				          		
				          	</td>	
				          	<td>${barrelStableTemp.stableTemp}℃</td>
				          	<td align="center">				          		
				          		<a href="#addBarrelStableTemp"  align="center" data-inline="true" data-rel="popup" data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:blue;">添加</a>
							</td>
				          	<td align="center">
				          		<a href="#updateBarrelStableTemp" align="center"  data-inline="true" data-rel="popup" data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:blue;" onclick="setValue(${barrelStableTemp.id},${barrelStableTemp.stableTemp},'<fmt:formatDate value="${barrelStableTemp.collectionTime}" pattern="yyyy-MM-dd HH:mm:ss"/>')">修改</a>
				          	</td>
				          	<td align="center">
				          		<a href="#deleteBarrelStableTemp" align="center"  data-inline="true" data-rel="popup" data-position-to="window" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:blue;" onclick="setId(${barrelStableTemp.id})">删除</a>
				          	</td>				            					           
				         </tr>
			          </c:forEach>
			      </tbody>
			    </table>
			    <!--修改机筒温度-->
		        <div data-role="popup" id="updateBarrelStableTemp" class="ui-content" style="min-width:250px;">				     
				    <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     				       
				      <form>
				        <div>	
				        	  <h3 align="center">修改温度信息</h3>
				        	  <input type="hidden" name="id" id="id">				        	  					         
					          
					          <label for="collectionTime" class="ui-hidden-accessible">采集时间:</label>
				          	  <input type="text" name="collectionTime" id="collectionTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" placeholder="采集时间">
	
					          <label for="updateStableTemp" class="ui-hidden-accessible">温度:</label>
					          <input type="text" name="updateStableTemp" id="updateStableTemp" placeholder="温度(℃)">
					          					          					          						          					          	          					          					          
					          <button  data-inline="true" value="保存"  id="saveUpdateStableTemp" name="saveUpdateStableTemp">保存修改</button>				          		          
				        </div>
				      </form>
				</div>
				<!--添加机筒测量温度-->
		        <div data-role="popup" id="addBarrelStableTemp" class="ui-content" style="min-width:250px;">				     
				    <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>			     				       
				      <form>
				        <div>	
				        	  <h3 align="center">添加机筒测量温度</h3>				        	 			        	  					         
					          
					          <label for="addCollectionTime" class="ui-hidden-accessible">采集时间:</label>
				          	  <input type="text" name="addCollectionTime" id="addCollectionTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" placeholder="采集时间">
	
					          <label for="addStableTemp" class="ui-hidden-accessible">温度:</label>
					          <input type="text" name="addStableTemp" id="addStableTemp" placeholder="温度(℃)">
					          					          					          						          					          	          					          					          
					          <button  data-inline="true" value="保存"  id="saveAddStableTemp">保存信息</button>				          		          
				        </div>
				      </form>
				</div>
				<!--删除机筒温度-->
		        <div data-role="popup" id="deleteBarrelStableTemp" class="ui-content" style="min-width:250px;">				     
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