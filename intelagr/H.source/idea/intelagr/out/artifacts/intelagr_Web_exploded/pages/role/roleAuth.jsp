<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
</head>
<body class="easyui-layout">
	<div region="center" border="false" style="padding:5px;">	
		<fieldset class="fieldset_common_style">
			<form id="roleform" name="roleform" method="post" action="${pageContext.request.contextPath}/role/list">
			<table class="table_common_style">
				<tr>
					<td class="table_common_td_label_style">角色编号：</td>
					<td class="table_common_td_txt_style">
						<input name="roleCode" id="roleCode" value="${role.roleCode }" class="easyui-textbox" style="width:200px;height:25px;" readonly>
						<input type='hidden' id="jsonData" value="[{"attributes":{},"checked":"","children":[{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00010001","pid":"","state":"","text":"修改密码"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00010002","pid":"","state":"","text":"待办事项"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00010003","pid":"","state":"","text":"个人信息维护"}],"iconCls":"","id":"CS0001","pid":"","state":"","text":"我的操控台"},{"attributes":{},"checked":"","children":[{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00020001","pid":"","state":"","text":"普通土地备案申请"},{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00020002","pid":"","state":"","text":"普通土地备案一览"},{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00020003","pid":"","state":"","text":"特殊土地备案申请"},{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00020004","pid":"","state":"","text":"特殊土地备案一览"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00020005","pid":"","state":"","text":"特殊土地备案审核"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00020006","pid":"","state":"","text":"土地备案变更申请"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00020007","pid":"","state":"","text":"土地备案变更申请一览"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00020008","pid":"","state":"","text":"土地备案变更处理"}],"iconCls":"","id":"CS0002","pid":"","state":"","text":"土地备案"},{"attributes":{},"checked":"","children":[{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00030001","pid":"","state":"","text":"购种备案申请"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00030002","pid":"","state":"","text":"购种备案信息一览"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00030003","pid":"","state":"","text":"购种认证备案审批"}],"iconCls":"","id":"CS0003","pid":"","state":"","text":"购种备案"},{"attributes":{},"checked":"","children":[{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00040001","pid":"","state":"","text":"投入品备案登记"},{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00040002","pid":"","state":"","text":"投入品备案一览"}],"iconCls":"","id":"CS0004","pid":"","state":"","text":"投入品备案"},{"attributes":{},"checked":"","children":[{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00050001","pid":"","state":"","text":"大气监测数据管理"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00050002","pid":"","state":"","text":"水质监测数据管理"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00050003","pid":"","state":"","text":"土壤监测数据管理"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00050004","pid":"","state":"","text":"PM2.5监测数据采集"},{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00050005","pid":"","state":"","text":"五常环境监测"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00050006","pid":"","state":"","text":"监测点管理"}],"iconCls":"","id":"CS0005","pid":"","state":"","text":"五常环境监测"},{"attributes":{},"checked":"","children":[{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00060001","pid":"","state":"","text":"收粮预报"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00060002","pid":"","state":"","text":"收粮预报统计"},{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00060003","pid":"","state":"","text":"收粮备案登记"},{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00060004","pid":"","state":"","text":"收粮备案一览"}],"iconCls":"","id":"CS0006","pid":"","state":"","text":"收粮备案"},{"attributes":{},"checked":"","children":[{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00070001","pid":"","state":"","text":"过程监控资料管理"},{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00070002","pid":"","state":"","text":"过程监控"}],"iconCls":"","id":"CS0007","pid":"","state":"","text":"过程管理"},{"attributes":{},"checked":"","children":[{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00080001","pid":"","state":"","text":"种源评估参数维护"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00080002","pid":"","state":"","text":"种源产量评估管理"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00080003","pid":"","state":"","text":"粮食评估参数维护"},{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00080004","pid":"","state":"","text":"粮食产量评估管理"}],"iconCls":"","id":"CS0008","pid":"","state":"","text":"产量评估"},{"attributes":{},"checked":"","children":[{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00090001","pid":"","state":"","text":"企业产量预报"},{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00090002","pid":"","state":"","text":"企业产量预报一览"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00090003","pid":"","state":"","text":"企业产量预报分析"},{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00090004","pid":"","state":"","text":"企业防伪码申请记录"},{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00090005","pid":"","state":"","text":"防伪码"}],"iconCls":"","id":"CS0009","pid":"","state":"","text":"防伪码管理"},{"attributes":{},"checked":"","children":[{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00100001","pid":"","state":"","text":"抽检记录"},{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00100002","pid":"","state":"","text":"质检记录"}],"iconCls":"","id":"CS0010","pid":"","state":"","text":"质检管理"},{"attributes":{},"checked":"","children":[{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00120001","pid":"","state":"","text":"企业投诉登记"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00120002","pid":"","state":"","text":"企业投诉处理"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00120003","pid":"","state":"","text":"种子公司投诉登记"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00120004","pid":"","state":"","text":"种子公司投诉处理"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00120005","pid":"","state":"","text":"召回一览"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00120006","pid":"","state":"","text":"企业黑名单一览"}],"iconCls":"","id":"CS0012","pid":"","state":"","text":"黑名单管理"},{"attributes":{},"checked":"","children":[{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00140001","pid":"","state":"","text":"企业档案管理"},{"attributes":{},"checked":"true","children":[],"iconCls":"","id":"CS00140002","pid":"","state":"","text":"企业土地资料管理"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00140003","pid":"","state":"","text":"产品管理"},{"attributes":{},"checked":"","children":[],"iconCls":"","id":"CS00140004","pid":"","state":"","text":"年度管理"}],"iconCls":"","id":"CS0014","pid":"","state":"","text":"档案管理"}]" />
					</td>
				</tr>
				<tr>
					<td class="table_common_td_label_style">角色名称：</td>
					<td class="table_common_td_txt_style">
						<input name="roleName" value="${role.roleName }" class="easyui-textbox" style="width:200px;height:25px" readonly>
					</td>
				<tr>
				<tr>
    			<td class="table_common_td_label_comment_style">备注:</td>
    			<td class="table_common_td_txt_style">
    				<textarea name="remark" rows="2" style="width:250px;" readonly>${role.remark }</textarea>
    			</td>
	   			</tr>
	   			<tr>
	   				<td class="table_common_td_label_comment_style">角色权限:</td>
	    			<td heigth="50px">
	    				<div class="easyui-panel" style="padding:5px">
						<ul id="authTree" class="easyui-tree" data-options='data:${jsonData },animate:true,checkbox:true'></ul>
						</div>	
			    	</td>
				</tr>
				<tr height="60">
					<td colspan="2" align="center">
		    			<a href="#" id="saveBt" class="easyui-linkbutton" onclick="save()" data-options="iconCls:'icon-save'">保存</a>
		    			<a href="#" id="cancalBt" class="easyui-linkbutton" style="margin-left:30px;" onclick="closeDialog()" data-options="iconCls:'icon-cancel'">取消</a>
	    			</td>
				</tr>
			</table>
			</form>
		</fieldset>
	</div>
<script type="text/javascript">
function save()
{
	var funIds = [];
	var nodes = $('#authTree').tree('getChecked');	
	for(var i=0; i< nodes.length; i++) { 
		funIds.push(nodes[i].id);
	}
	var roleCode = $("#roleCode").val();
	$("#saveBt").linkbutton("disable");
	$("#cancalBt").linkbutton("disable");
	alert(JSON.stringify(funIds));
	showLoading();
 	$.ajax({
		url:"${pageContext.request.contextPath}/role/saveRoleAuth",
		data:{roleCode : roleCode, funIds : funIds},
		type:"post",
		success:function(e){
			hideLoading();
			$("#saveBt").linkbutton("enable");
			$("#cancalBt").linkbutton("enable");
			if (200 == e.status) {
				$.messager.alert('提示','操作成功。','info');
				closeDialog();
			} else {
				$.messager.alert('错误',e.msg,'error');
			}
		},
		dataType:"json"
	}); 
/* 	Public.ajaxGet('${pageContext.request.contextPath}/role/saveRoleAuth', {roleCode : roleCode, funIds : funIds}, function(e) {
		hideLoading();
		$("#saveBt").linkbutton("enable");
		$("#cancalBt").linkbutton("enable");
		if (200 == e.status) {
			$.messager.alert('提示','操作成功。','info');
			closeDialog();
		} else {
			$.messager.alert('错误',e.msg,'error');
		}
	});  */
}

function closeDialog()
{
	$('#addDialog').dialog('close');
}

</script>
</body>
</html>