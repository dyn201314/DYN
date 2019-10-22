<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
<title>添加年度-五常优质水稻溯源监管平台</title>
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
		<form id="addYearForm" class="easyui-form" method="post" data-options="novalidate:true">
			<input name="id" value="" type="hidden">
			<fieldset class="fieldset_common_style">
				<table class="table_common_style">
					<tr>
		    			<td class="table_common_td_label_style">实际年度：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-numberbox" id="yearCode" name="yearCode" style="width:170px;">
		    				<span class="span_common_mustinput_style">*</span>
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">显示年度：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-textbox" id="yearName" name="yearName" style="width:170px;">
		    				<span class="span_common_mustinput_style">*</span>
		    			</td>
	    			</tr>
	    			<tr>
		    			<td align="right">备注：</td>
		    			<td colspan="3">
		    				<textarea  class="easyui-textbox" rows="2" id="remark" name="remark" style="width:350px;height:60px" data-options="multiline:true" ></textarea>
		    			</td>
	    			</tr>
	    			<tr height="50">
		    			<td colspan="2" align="center">
		    			<a href="#" class="easyui-linkbutton" onclick="formCheck()" data-options="iconCls:'icon-save'">保存</a>
		    			<a href="#" class="easyui-linkbutton" style="margin-left:15px;" onclick="closeEdiDialog()" data-options="iconCls:'icon-cancel'">取消</a>
		    			</td>
	    			</tr>
				</table>
			</fieldset>
		</form>
	</div>
<script type="text/javascript">
function formCheck(){
	var yearCode = $.trim($("#yearCode").val());
	var yearName = $.trim($("#yearName").val());
	if(yearCode == ""){
		$.messager.alert('警告','实际年度不能为空。','warning');
		return false;
	}else if(yearCode.length != 4){
		$.messager.alert('警告','实际年度格式错误。','warning');
		return false;
	}
	if(yearName == ""){
		$.messager.alert('警告','显示年度不能为空。','warning');
		return false;
	}
	var a = $('#addYearForm').toObject();
	Public.ajaxPost('${pageContext.request.contextPath}/year/save', JSON.stringify(a), function(e) {
		if (200 == e.status) {
			$.messager.alert('提示','保存成功。','info');
			closeEdiDialog();
			$('#yearForm').submit();
		} else {
			$.messager.alert('错误','失败，'+e.msg,'error');
		}
	});
}
function closeEdiDialog(){
	$('#addDialog').dialog('close');
}

</script>
</body>
</html>