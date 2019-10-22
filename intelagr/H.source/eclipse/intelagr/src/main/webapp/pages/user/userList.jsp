<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/tags/simple" %>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>
</head>
<body class="easyui-layout">
	<div region="center" border="false" style="padding:5px;">	
		<fieldset id="queryBlock" class="fieldset_common_style">
			<form id="userform" name="userform" method="post" action="${pageContext.request.contextPath}/user/list?flag=2">
				<table class="table_common_style">
					<tr>
						<td class="table_common_td_label_query_style">用户名：</td>
						<td class="table_common_td_txt_query_style">
							<input name="userID" value="${pageModel.data.userID }" class="easyui-textbox" style="width:200px;height:25px;">
							<input type='hidden' id="pageTotal" name="pageTotal" value="${pageModel.totalCount }" />
							<input type="hidden" id="page" name="page" value="${pageModel.page }">
							<input type="hidden" id="pageSize" name="pageSize" value="${pageModel.pageSize }">
						</td>
						<td class="table_common_td_label_query_style">用户姓名：</td>
						<td class="table_common_td_txt_query_style">
							<input name="userName" value="${pageModel.data.userName }" class="easyui-textbox" style="width:200px;height:25px">
						</td>
					</tr>
					<tr>
						<td class="table_common_td_label_query_style">用户类型：</td>
						<td class="table_common_td_txt_query_style">
					<s:select name="userType" id="uType" entityName="CommonData" value="${pageModel.data.userType }" codeKey="UserType" hasPleaseSelectOption="true"></s:select>		
		

						</td>
						<td colspan="2" align="right" valign="bottom">
	                       	<a href="#" class="easyui-linkbutton" onclick="onSubmit()">
	                       	<span class="l-btn-left"><span class="l-btn-text icon-search l-btn-icon-left">查询</span></span></a>
	             		</td>
					</tr>
				</table>
			</form>
		</fieldset>
		<fieldset id="toolBlock" class="fieldset_common_style">
			<table>
				<tr>
					<td>
						<a href="#" class="easyui-linkbutton" onclick="detail();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-view l-btn-icon-left">查看</span>
							</span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="addUser();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-add l-btn-icon-left">添加</span>
							</span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="editUser();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-edit l-btn-icon-left">修改</span>
							</span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="deleteUser();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-remove l-btn-icon-left">删除</span>
							</span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="resetPassword();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-lock l-btn-icon-left">重置密码</span>
							</span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="startUse();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-redo l-btn-icon-left">启用</span>
							</span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="endUse();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-cancel l-btn-icon-left">禁用</span>
							</span>
						</a>
					</td>
				</tr>
			</table>
		</fieldset>
		<table id="data" class="easyui-datagrid" striped="true" checkbox="true" singleSelect="true" pageSize="${pageModel.pageSize }" pageNumber="${pageModel.page }">
			<thead>
				<tr>
					<th field="id" width="150" checkbox="true"  align="center"></th>
					<th field="userId" width="150"  align="center">用户名</th>
					<th field="realName" width="150" align="center">姓名</th>
					<th field="userType" width="150"  align="center">用户类型</th>
					<th field="companyCode" width="300"  align="center">单位名称</th>
					<th field="tel" width="200" align="center">手机</th>
					<th field="email" width="200" align="center">邮箱</th>
					<th field="loginStatus" width="150" align="center">状态</th>
					<th field="remark" width="150" align="center">备注</th>
				</tr>
			</thead>
			<tbody>
				
				<c:forEach items="${pageModel.result }" var="user">
				<tr>
					<td height="30" align="center" nowrap>${user.id }</td>
					<td height="30" align="center" nowrap>${user.userID }</td>
					<td height="30" align="center" nowrap>${user.userName }</td>
					<td height="30" align="center" nowrap><s:showName entityName="CommonData" codeKey="UserType" value="${user.userType }"></s:showName> </td>
					<td height="30" align="center" nowrap>${user.companyName }</td>
					<td height="30" align="center" nowrap>${user.tel }</td>
					<td height="30" align="center" nowrap>${user.email }</td>
					<td height="30" align="center" nowrap><s:showName entityName="CommonData" codeKey="LoginStatus" value="${user.loginStatus }"></s:showName></td>
					<td height="30" align="center" nowrap></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="addDialog"></div>
<script type="text/javascript">
	var winHeight = $(window).height();
	var queryBlockHeight = $("#queryBlock").height();
	var toolBlock = $("#toolBlock").height();

	$(document).ready(function(){
		$("#data").datagrid({
			height:winHeight -queryBlockHeight -toolBlock-45,
			pagination: true,
	        rownumbers: true,
	        fitColumns: false,
	        //fit: true,
	        pageList: [10,15,20],
	        pagePosition: "top"
	});
	
	var pagger = $('#data').datagrid('getPager');  
	$(pagger).pagination({
		total: $("#pageTotal").val(),
		pageNumber: parseInt($("#page").val()),
		showPageList: true,
		showRefresh: false,
	    onSelectPage: function(pageNumber, pageSize){
	    	$('#page').val(pageNumber);
	    	$('#pageSize').val(pageSize);
	    	onSubmit();
	    }
	});
});
	
function addUser(){
	$('#addDialog').dialog({
	    title: '添加新用户',
	    width: 580,
	    height: 310,
	    closed: false,
	    cache: false,
	    href: '${pageContext.request.contextPath}/user/add',
	    modal: true
	});
}

function editUser(){
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	if(length == 0)
	{
		$.messager.alert('警告','至少选择一个用户。','warning');
		return false;
	}
	if(length > 1)
	{
		$.messager.alert('警告','只能选择一个用户。','warning');
		return false;
	}
	var id = rows[0].id;
	if(rows[0].userId == 'admin'){
		$.messager.alert('警告','管理员账号不能修改。','warning');
		return false;
	}
	$('#addDialog').dialog({
	    title: '修改用户信息',
	    width: 580,
	    height: 310,
	    closed: false,
	    cache: false,
	    href: '${pageContext.request.contextPath}/user/edit?userID='+rows[0].userId,
	    modal: true
	});
}

function resetPassword(){
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	if(length == 0)
	{
		$.messager.alert('警告','至少选择一个用户。','warning');
		return false;
	}
	if(length > 1)
	{
		$.messager.alert('警告','只能选择一个用户。','warning');
		return false;
	}
	var id = rows[0].userId;
	$('#addDialog').dialog({
	    title: '重置密码',
	    width: 320,
	    height: 200,
	    closed: false,
	    cache: false,
	    href: '${pageContext.request.contextPath}/user/resetPwdInit?userID='+id,
	    modal: true
	});
}

function detail(){
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	if(length == 0)
	{
		$.messager.alert('警告','至少选择一个用户。','warning');
		return false;
	}
	if(length > 1)
	{
		$.messager.alert('警告','只能选择一个用户。','warning');
		return false;
	}
	var id = rows[0].id;
	$('#addDialog').dialog({
	    title: '查看用户信息',
	    width: 550,
	    height: 290,
	    closed: false,
	    cache: false,
	    href: '${pageContext.request.contextPath}/user/detail?id='+id,
	    modal: true
	});
}

function deleteUser(){
	var ids = [];
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	for(var i=0; i<rows.length; i++) ids.push(rows[i].userID);
	if(ids.length == 0){
		$.messager.alert('警告','至少选择一个用户。','warning');
		return false;
	}
	if(rows[0].userId == 'admin'){
		$.messager.alert('警告','管理员账号不能删。','warning');
		return false;
	}
	var userID = rows[0].userId;
	$.messager.confirm("确认", "您确认删除选定的记录吗？", function (deleteAction) {
		if (deleteAction) {
			showLoading();
			$.ajax({
				url:"${pageContext.request.contextPath}/user/delete",
				type:"post",
				data:{userID :userID},
				success:function(e){
					if (200 == e.status) {
						$.messager.alert('提示','操作成功。','info');
						$('#userform').submit();
					} else
						$.messager.alert('错误',e.msg,'error');
				},
				dataType:"json"
			});
		}
	});
}
function startUse(){
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	if(length == 0)
	{
		$.messager.alert('警告','至少选择一个用户。','warning');
		return false;
	}
	if(length > 1)
	{
		$.messager.alert('警告','管理员账号不能删。','warning');
		return false;
	}
	if(rows[0].userId == 'admin'){
		$.messager.alert('警告','管理员账号不支持此操作。','warning');
		return false;
	}
	var id = rows[0].userId;
	showLoading();
	$.ajax({
		url:"${pageContext.request.contextPath}/user/startUse",
		type:"post",
		data:{userID :id},
		success:function(e){
			if (200 == e.status) {
				$.messager.alert('提示','操作成功。','info');
				$('#userform').submit();
			} else
				$.messager.alert('错误',e.msg,'error');
		},
		dataType:"json"
	});
}
function endUse(){
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	if(length == 0)
	{
		$.messager.alert('警告','至少选择一个用户。','warning');
		return false;
	}
	if(length > 1)
	{
		$.messager.alert('警告','管理员账号不能删。','warning');
		return false;
	}
	if(rows[0].userId == 'admin'){
		$.messager.alert('警告','管理员账号不支持此操作。','warning');
		return false;
	}
	var id = rows[0].userId;
	
	showLoading();
	$.ajax({
		url:"${pageContext.request.contextPath}/user/endUse",
		type:"post",
		data:{userID :id},
		success:function(e){
			if (200 == e.status) {
				$.messager.alert('提示','操作成功。','info');
				$('#userform').submit();
			} else
				$.messager.alert('错误',e.msg,'error');
		},
		dataType:"json"
	});
}

function onSubmit(){
	showLoading();
	$('#userform').submit();
}
</script>
</body>
</html>