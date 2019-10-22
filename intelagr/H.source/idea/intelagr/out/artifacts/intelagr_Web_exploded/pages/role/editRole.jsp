<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
<title>添加角色-五常优质水稻溯源监管平台</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/color.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/form2js.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/json2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
</head>
<body class="easyui-layout">
	<div region="center" border="false" style="padding:5px;">
		<fieldset class="fieldset_common_style">	
			<form id="addroleform" action="${pageContext.request.contextPath}/role/addRole" class="easyui-form" method="post" data-options="novalidate:true">
				<input type="hidden" name="id" value="${role.id}"/>
				<table class="table_common_style">
					<tr>
		    			<td class="table_common_td_label_style">角色编号:</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-textbox" type="text" id="roleCode" name="roleCode" style="width:200px;" value="${role.roleCode}"></input>
		    				<span class="span_common_mustinput_style">*</span>
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">角色名:</td>
		    			<td class="table_common_td_txt_style">
	    					<input class="easyui-textbox" type="text" id="roleName" name="roleName" style="width:200px;" value="${role.roleName}"></input>
	    					<span class="span_common_mustinput_style">*</span>
	    				</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_comment_style">备注:</td>
		    			<td class="table_common_td_txt_style">
		    				<textarea  class="easyui-textbox" rows="2" id="remark" name="remark" style="width:200px;height:60px" data-options="multiline:true" >${role.remark}</textarea>
		    			</td>
	    			</tr>
	    			<tr height="50">
		    			<td colspan="2" align="center">
		    			<a href="#" class="easyui-linkbutton" onclick="addForm_check()" data-options="iconCls:'icon-save'">保存</a>
		    			<a href="#" class="easyui-linkbutton" style="margin-left:40px;" onclick="closeDialog()" data-options="iconCls:'icon-cancel'">取消</a>
		    			</td>
	    			</tr>
				</table>
			</form>
		</fieldset>
	</div>
<script type="text/javascript">
function addForm_check()
{
	var roleCode = $.trim($("#roleCode").val());
	var roleName = $.trim($("#roleName").val());
	
	if(roleCode == '') {
		$.messager.alert('警告','角色编号不能为空。','warning');
		return false;
	}
	if(roleName == ''){
		$.messager.alert('警告','角色名不能为空。','warning');
		return false;
	}
	var a = $('#addroleform').toObject();
	showLoading();
	$.ajax({
		url:"${pageContext.request.contextPath}/role/update",
		type:"post",
		data:a,
		success:function(e){
			hideLoading();
			if (200 == e.status) {
				$.messager.alert('提示','操作成功。','info');
				$('#addDialog').window('close');
				$('#roleform').submit();
			} else {
				parent.parent.Public.tips({
					type : 1,
					content : "失败！" + e.msg
				});
			}
		},
		dataType:"json"
	});
}

function closeDialog()
{
	$('#addDialog').dialog('close');
}
</script>
</body>
</html>