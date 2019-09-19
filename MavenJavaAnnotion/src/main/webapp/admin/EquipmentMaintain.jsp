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
    	//设置相应的信息
    	function setValue(id){
    		if(confirm("确定该机器维修成功了吗？")){
    			$.ajax({
        	    	type:"POST",
        	    	url:"${pageContext.request.contextPath}/admin/maintainSuccess.do",
        	    	async:false, //同步执行
        	    	data: "id="+id,
        	    	success:function(result){
        	    		var result=eval('('+result+')');
        	    		if(result.success){                     
                            alert("维修成功!");   
                            //刷新界面  
                        }else{                      
                            alert("维修失败！");                          
                        }
						window.location.href="${pageContext.request.contextPath}/admin/EquipmentMaintain.do";
        	    	}   	    			
        	    }); 
    		}else{
    			return ;
    		}
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
		    <a href="${pageContext.request.contextPath}/admin/equipmentManage.jsp" rel="extenal" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
    			<h1>设备维护</h1>
    		<a href="#" data-role="button" data-icon="grid" data-iconpos="notext"></a>
		  </div>
		
		  <div data-role="main" align="center" style="margin: 5px;"> 
		  			
				    <!--  -->	
		  		 <table  data-role="table" data-mode="columntoggle" class="ui-responsive ui-shadow" id="myTable" style="font-size:10px;" data-column-btn-text="其他数据">
			      <thead>
			        <tr >
			          <th data-priority="1">编号</th>
			          <th data-priority="1">机器厂家</th>
			          <th data-priority="1">机器代号</th>        
			          <th data-priority="1">机器牌号</th>
			          <th data-priority="1">生产线编号</th>
			          <th data-priority="1">操作</th>         	      
			        </tr>
			      </thead>
			      <tbody>
			          <c:forEach items="${macNumList}" var="macNum" varStatus="status">
				         <tr>
				          	<td>${status.index+1}</td>
				          	<td>${macNum.factory}</td>
				            <td>${macNum.code}</td>
				          	<td>${macNum.grade}</td>
				          	<td>${macNum.lineNumber}</td>
				          	<td>
				          		<a href="javascript:setValue(${macNum.id});" class="ui-btn ui-icon-delete ui-corner-all ui-btn-inline" style="font-size:10px;color:blue;">维修成功</a>					          			
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