<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">
<title>用户管理-五常优质水稻溯源监管平台</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/color.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/form2js.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/json2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
</head>
<body class="easyui-layout">
	<div region="center" border="false" style="padding:5px;">
		<table id="toDoListData" class="easyui-datagrid" striped="true" singleSelect="false">
			<thead>
				<tr>
					<th field="toDoList" width="500" align="center">待办事项类型</th>
					<th field="toDoCount" width="200" align="center">待办事项数量</th>
				</tr>
			</thead>
			<tbody>
				
				<tr>
					<td height="30" align="center" nowrap>普通土地备案信息待提交申请数量</td>
					<td height="30" align="center" nowrap>0</td>
				</tr>
				
			</tbody>
		</table>
	</div>
	
	
<script type="text/javascript">
$(document).ready(function(){
	var winHeight = $(window).height();
	$("#toDoListData").datagrid({
		height:winHeight - 50,
        rownumbers: true,
        fitColumns: false,
        checkOnSelect:false
	});
});

</script>
</body>
</html>