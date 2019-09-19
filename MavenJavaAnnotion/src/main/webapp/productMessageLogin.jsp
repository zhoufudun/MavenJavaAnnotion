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
<style type="text/css">
	body{
		font-size:16px;
	}
</style>
<script type="text/javascript">
$(function () {           
    //绑定机器
    $("#login").on("click",function () { 
    	if($("#name").val()==''){
    		alert("请输入姓名！");
    		window.location.href="${pageContext.request.contextPath}/productMessageLogin.jsp";
    		return ;
    	}
    	if($("#code").val()==''){
    		alert("请输入代号！");
    		window.location.href="${pageContext.request.contextPath}/productMessageLogin.jsp";
    		return ;
    	}
    	/*
    	if(isNaN($("#code").val())){
    		alert("请输入整数！");
    		window.location.href="${pageContext.request.contextPath}/user/zhuye.jsp";
    		return ;
    	} */
    	$.post("${pageContext.request.contextPath}/user/checkEmployees.do",
         		 {  
         			"name":$("#name").val(), 
         			"code":$("#code").val()
 				 },function(result){
 				   //alert("!!");
 				      // result=eval('('+result+')'); 
 				       if(result.success){                     
	                       alert("验证成功！");	                       
	                       window.location.href="${pageContext.request.contextPath}/user/productInfoTypeIn.do?name="+$("#name").val();
	                   }else{                      
	                       alert("验证失败！"); 
	                       window.location.href="${pageContext.request.contextPath}/productMessageLogin.jsp";
	                   }
 			},"json"); 
    });          	
});
	
</script>
</head>
<body >
	<div data-role="page" style="background-color:white;">
		  <div data-role="header" data-position="fixed">
		    <a href="${pageContext.request.contextPath}/login.jsp" rel="external" data-role="button" data-icon="arrow-l" data-iconpos="notext"></a>
   		 	 <h1>信息录入登陆</h1>
   		  
 		  </div>
 		  
		  <div data-role="content" >	
		  		<div>		  
			   	  <button><a href="#productMessageTypeIn" data-rel="popup"  data-position-to="window" style="text-decoration: none">录入员工选择</a></button>													
			   </h1>
		  		</div>		  	
				<!-- 信息录入面板-->		  		 	
				  <div data-role="popup" id="productMessageTypeIn" class="ui-content" style="min-width:300px;" data-dismissible="false">
				    <a onclick="closeBlindMachineDialog();" data-rel="back"  id="close" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
				      <form>
					        <div  class="ui-field-contain">
					          <h3 align="center" >产品录入员信息</h3>
					          
					          <label for="name"></label>
					          <input type="text" name="name" id="name" placeholder="录入员姓名...">
					          
					          <label for="code"></label>         
					          <input type="text" name="code" id="code"  placeholder="录入员代号...">				          				         					          					          				         					      		
					          					         		         			          
					       </div>
				           <button  data-inline="true" value="登录" id="login" name="login" >登录</button>			           				      
				     </form>
				 </div>		 				
		  </div>
		  <!--  -->
		  <div data-role="footer" data-position="fixed">
			  
		  </div>
		  <!--  -->
	</div>	
</body>
</html>