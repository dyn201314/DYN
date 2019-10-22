<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>登录</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/default/easyui.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/form2js.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/json2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
<script type="text/javascript">
if(window!=top){
	top.location.href=location.href;
}
</script>
<style type="text/css">
	 *{margin:0;padding:0;font-family:"Microsoft Yahei";}
	 ul,li{list-style:none;}
	 body{ background:url("${pageContext.request.contextPath}/images/loginbg.jpg") no-repeat top center;overflow:hidden;}
	 .loginC{width:1000px;margin:0 auto;position:relative;}
	 .login{width:256px;height:276px;background:url("/images/loginInputBg.png") no-repeat center center;position:absolute;color:#6b6b6b;font-size:14px;top:186px;left:728px;}
	 .login ul{position:absolute;left:30px;top:70px;}
	 .login ul li{margin-bottom:25px;}
	 .login ul li input.text{background:#FFF;border:1px solid #616365;width:190px;text-indent:0px!important;font-size:14px;padding:8px 0;height:14px;padding-left:10px;color:#6b6b6b;}
	 .login ul li input.smallText{background:#FFF;border:1px solid #dfdfdf;width:60px;text-indent:10px;font-size:14px;padding:8px 0;border-radius:4px;color:#6b6b6b;}
	 .login ul li input.btn{border:0;cursor:pointer;width:200px;height:38px;background:#5aa35e;color:#FFF;font-size:16px;font-weight:bold;}
	 .login ul li.btnContain{}
</style>
</head>
<body>
	<div class="loginC">
		<div class="login">
			<form id="login-form" method="post" >
				<ul>
					<li>
						<span><input name="userID" id="userID" type="text" class="text" placeholder="用户名" /></span>
					</li>
					<li>
						<span><input name="password" id="password" type="password" class="text" placeholder="密码" /></span>
					</li>
					<li class="btnContain">
						<input type="button" class="btn" value="登 陆" onclick="onSubmit()" />
					</li>
				</ul>
			</form>	
		</div>
	</div>
</body>
<script type="text/javascript">
$(function() {
	$('#userName').focus();
	
	$('#userID').validatebox({
        required: true,
        missingMessage: "请输入帐号！"
    });
    $('#password').validatebox({
        required: true,
        missingMessage: "请输入密码！"
    });
    
    if($.cookie('userID') != null && $.cookie('userID') != ''){
		$('#userID').val($.cookie('userID'));
	}

});
function onSubmit(){
	//AJax请求
	var obj = $("#login-form").toObject();
	Public.ajaxPost("/user/login",JSON.stringify(obj),function(data){
	    if(data.status==200){
	        location.href="/user/main";
		}else{
	        $.messager.alert("错误",data.msg,"info");
		}
	});
}

document.onkeydown = function(e) {
	// 兼容FF和IE和Opera
	var theEvent = e || window.event;
	var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
	var activeElementId = document.activeElement.id;//当前处于焦点的元素的id
	if (code == 13 && activeElementId == "password") {
		onSubmit();//要触发的方法
		return false;
	}
	return true;
}
</script>
</html>