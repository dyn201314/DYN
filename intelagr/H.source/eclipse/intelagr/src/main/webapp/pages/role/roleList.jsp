<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理-五常优质水稻溯源监管平台</title>
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
		<fieldset id="queryBlock" class="fieldset_common_style">
			<form id="roleform" name="roleform" method="post" action="${pageContext.request.contextPath}/role/list">
			<table class="table_common_style">
				<tr>
					<td class="table_common_td_label_query_style">角色编号：</td>
					<td class="table_common_td_txt_query_style">
						<input name="roleCode" value="${pageModel.data.roleCode }" class="easyui-textbox" style="width:200px;height:25px;">
						<input type='hidden' id="pageTotal" name="pageTotal" value="${pageModel.totalCount }" />
						<input type="hidden" id="page" name="page" value="${pageModel.page }">
						<input type="hidden" id="pageSize" name="pageSize" value="${pageModel.pageSize }">
					</td>
					<td class="table_common_td_label_query_style">角色色称：</td>
					<td class="table_common_td_txt_query_style">
						<input name="roleName" value="${pageModel.data.roleName }" class="easyui-textbox" style="width:200px;height:25px">
					</td>
					<td align="right" valign="bottom">
                       	<a href="#" class="easyui-linkbutton" onclick="onSubmit()">
                       		<span class="l-btn-left"><span class="l-btn-text icon-search l-btn-icon-left">查询</span></span>
                       	</a>
             		</td>
				</tr>
			</table>
			</form>
		</fieldset>
		<fieldset id="toolBlock" class="fieldset_common_style">
			<table>
				<tr>
					<td>
						<!--  
						<a href="#" class="easyui-linkbutton" onclick="detail();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-view l-btn-icon-left">查看</span>
							</span>
						</a>
						-->
						<a href="#" class="easyui-linkbutton" onclick="addRole();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-add l-btn-icon-left">添加</span>
							</span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="editRole();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-edit l-btn-icon-left">修改</span>
							</span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="deleteRole();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-remove l-btn-icon-left">删除</span>
							</span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="roleAuth();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-settings l-btn-icon-left">权限设置</span>
							</span>
						</a>
					</td>
				</tr>
			</table>	
		</fieldset>
		<table id="data" class="easyui-datagrid" striped="true" checkbox="true" singleSelect="false" singleSelect="true" pageSize="${pageModel.pageSize }" pageNumber="${pageModel.page }">
			<thead>
				<tr>
					<th field="id" width="140" checkbox="true" align="center">id</th>
					<th field="roleCode" width="140" align="center">角色编码</th>
					<th field="roleName" width="140"  align="center">角色名称</th>
					<th field="remark" width="140" align="center">备注</th>
				</tr>
			</thead>
			<tbody>

			<c:forEach items="${pageModel.result }" var="r">
				<tr>
					<td height="30" align="center" nowrap>${r.id }</td>
					<td height="30" align="center" nowrap>${r.roleCode }</td>
					<td height="30" align="center" nowrap>${r.roleName }</td>
					<td height="30" align="center" nowrap>${r.remark }</td>
				</tr>
			</c:forEach>	
				
			</tbody>
		</table>
	</div>
	<div id="addDialog"></div>
<script type="text/javascript">
	$(document).ready(function(){
		var winHeight = $(window).height();
	    var queryBlockHeight = $("#queryBlock").height();
	    var toolBlock = $("#toolBlock").height();
		$("#data").datagrid({ 
			height:winHeight -queryBlockHeight -toolBlock-48,
			pagination: true,
	        rownumbers: true,
	        fitColumns: true,
	        //fit: true,
	        pageList: [15,20,25],
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

function addRole()
{
	$('#addDialog').dialog({
	    title: '添加角色',
	    width: 400,
	    height: 260,
	    closed: false,
	    cache: false,
	    href: '${pageContext.request.contextPath}/role/add',
	    modal: true
	});
}
	
function editRole()
{
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	if(length == 0)
	{
		$.messager.alert('警告','至少选择一个角色。','warning');
		return false;
	}
	if(length > 1)
	{
		$.messager.alert('警告','只能选择一个角色。','warning');
		return false;
	}
	if(rows[0].roleCode == 'admin'){
		$.messager.alert('警告','系统管理组不能修改。','warning');
		return false;
	}
	var id = rows[0].id;
	$('#addDialog').dialog({
	    title: '修改角色信息',
	    width: 400,
	    height: 260,
	    closed: false,
	    cache: false,
	    href: '${pageContext.request.contextPath}/role/editRoleInit?id='+id,
	    modal: true
	});
}

function detail()
{
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	if(length == 0)
	{
		$.messager.alert('警告','至少选择一个角色。','warning');
		return false;
	}
	if(length > 1)
	{
		$.messager.alert('警告','只能选择一个角色。','warning');
		return false;
	}
	var id = rows[0].id;
	$('#addDialog').dialog({
	    title: '查看角色信息',
	    width: 430,
	    height: 230,
	    closed: false,
	    cache: false,
	    href: '${pageContext.request.contextPath}/role/detail?id='+id,
	    modal: true
	});
}

function deleteRole(){
	var ids = [];
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	for(var i=0; i<rows.length; i++) ids.push(rows[i].id);
	if(ids.length == 0)
	{
		$.messager.alert('警告','至少选择一个角色。','warning');
		return false;
	}
	if(rows[0].roleCode == 'admin'){
		$.messager.alert('警告','系统管理组不能删除。','warning');
		return false;
	}

	$.messager.confirm("确认", "您确认删除选定的记录吗？", function (deleteAction) {
		if (deleteAction) {
			showLoading();
			Public.ajaxGet('delete', {ids : ids}, function(e) {
				hideLoading();
				if (200 == e.status) {
					$.messager.alert('提示','操作成功。','info');
					$('#roleform').submit();
				} else
					$.messager.alert('错误',e.msg,'error');
			});
		}
	});
}

function roleAuth(){
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	if(length == 0)
	{
		$.messager.alert('警告','至少选择一个角色。','warning');
		return false;
	}
	if(length > 1)
	{
		$.messager.alert('警告','只能选择一个角色。','warning');
		return false;
	}
	if(rows[0].roleCode == 'admin'){
		$.messager.alert('警告','系统管理组不需要设置角色权限。','warning');
		return false;
	}
	var id = rows[0].id;
		$('#addDialog').dialog({
	    title: '设置角色权限',
	    width: 400,
	    height: 450,
	    closed: false,
	    cache: false,
	    href: '${pageContext.request.contextPath}/role/roleAuth?id='+id,
	    modal: true
	});
}

function onSubmit()
{
	showLoading();
	$('#roleform').submit();
}
</script>
</body>
</html>