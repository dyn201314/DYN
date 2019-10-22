<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
</head>
<body class="easyui-layout">
	<div region="center" border="false" style="padding:5px;">	
		<form id="addFrom" class="easyui-form" method="post" data-options="novalidate:true">
			<input name="id" value="" type="hidden">
			<fieldset class="fieldset_common_style">
			<table class="table_common_style">
				<tr>
	    			<td class="table_common_td_label_style">监测日期：</td>
	    			<td class="table_common_td_txt_style">
	    				<input class="easyui-datebox" name="monitorDate"  value="Sun May 21 00:00:00 CST 2017"
            data-options="required:true,showSeconds:false" style="width:170px" editable="false">
	    			</td>
    			</tr>
    			<tr>
	    			<td class="table_common_td_label_style">监测点位：</td>
	    			<td class="table_common_td_txt_style">
	    				<select name="monitorPointCode" class="easyui-combobox" style="width:170px;" data-options="editable:false">

	<option value="PM2.5-01" >PM2.5 1号</option>

</select>
	    			</td>
    			</tr>
    			<tr>
	    			<td class="table_common_td_label_style">空气质量指数(mg/m³)：</td>
	    			<td class="table_common_td_txt_style">
	    				<input class="easyui-textbox" type="text" name="aqi" value="" style="width:170px;"></input>
	    				<span class="span_common_mustinput_style">*</span>
	    			</td>
    			</tr>
    			<tr>
	    			<td class="table_common_td_label_style">质量指数类别：</td>
	    			<td class="table_common_td_txt_style">
	    				<input class="easyui-textbox" type="text" name="aqiName" value=""  style="width:170px;"></input>
	    				<span class="span_common_mustinput_style">*</span>
	    			</td>
    			</tr>
    			<tr>
	    			<td class="table_common_td_label_style">细颗粒物(mg/m³)：</td>
	    			<td class="table_common_td_txt_style">
	    				<input class="easyui-textbox" type="text" name="pm2_5" value="" data-options="min:0,max:999999999.99,precision:2,groupSeparator:','"  style="width:170px;"></input>
	    				<span class="span_common_mustinput_style">*</span>
	    			</td>
    			</tr>
    			<tr>
	    			<td class="table_common_td_label_style">可吸入颗粒物(mg/m³)：</td>
	    			<td class="table_common_td_txt_style">
	    				<input class="easyui-textbox" type="text" name="pm10" value="" data-options="min:0,max:999999999.99,precision:2,groupSeparator:','"  style="width:170px;"></input>
	    				<span class="span_common_mustinput_style">*</span>
	    			</td>
    			</tr> 
    			<tr>
	    			<td class="table_common_td_label_style">一氧化碳(mg/m³)：</td>
	    			<td class="table_common_td_txt_style">
	    				<input class="easyui-textbox" type="text" name="co" value="" data-options="min:0,max:999999999.99,precision:2,groupSeparator:','"  style="width:170px;"></input>
	    				<span class="span_common_mustinput_style">*</span>
	    			</td>
    			</tr>
    			<tr>
	    			<td class="table_common_td_label_style">二氧化氮(mg/m³)：</td>
	    			<td class="table_common_td_txt_style">
	    				<input class="easyui-textbox" type="text" name="no2" value="" data-options="min:0,max:999999999.99,precision:2,groupSeparator:','"  style="width:170px;"></input>
	    				<span class="span_common_mustinput_style">*</span>
	    			</td>
    			</tr>
				<tr>		
	    			<td class="table_common_td_label_style">臭氧(mg/m³)：</td>
	    			<td class="table_common_td_txt_style">
	    				<input class="easyui-textbox" type="text" name="o3" value="" data-options="min:0,max:999999999.99,precision:2,groupSeparator:','"  style="width:170px;"></input>
	    				<span class="span_common_mustinput_style">*</span>
	    			</td>
    			</tr>
    			<tr>
	    			<td class="table_common_td_label_style">二氧化硫(mg/m³)：</td>
	    			<td class="table_common_td_txt_style">
	    				<input class="easyui-textbox" type="text" name="so2" value="" data-options="min:0,max:999999999.99,precision:2,groupSeparator:','"  style="width:170px;"></input>
	    				<span class="span_common_mustinput_style">*</span>
	    			</td>
    			</tr> 
    			<tr height="30">
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
	if(!check()) return ;
	var a = $('#addFrom').toObject();
	Public.ajaxPost('save', JSON.stringify(a), function(e) {
		if (200 == e.status) {
			$.messager.alert('提示','保存成功。','info');
			closeEdiDialog();
			$('#inputForm').submit();
		} else {
			$.messager.alert('错误','保存失败','error');
		}
	});
}

function closeEdiDialog(){
	$('#addDialog').dialog('close');
}

function check(){
	if($("input[name='aqi']").val()==""){
		$.messager.alert('警告','请填写空气质量指数！','warning');
		return false;
	}else if (!isNumber($("input[name='aqi']").val())){
		$.messager.alert('警告','空气质量指数输入数字！','warning');
		return false;
	}
	if($("input[name='aqiName']").val()==""){
		$.messager.alert('警告','请填写质量指数类别！','warning');
		return false;
	}else if (!isNumber($("input[name='aqiName']").val())){
		$.messager.alert('警告','质量指数类别请输入数字！','warning');
		return false;
	}
	if($("input[name='pm2_5']").val()==""){
		$.messager.alert('警告','请填写细颗粒物！','warning');
		return false;
	}else if (!isNumber($("input[name='pm2_5']").val())){
		$.messager.alert('警告','细颗粒物请输入数字！','warning');
		return false;
	}
	if($("input[name='pm10']").val()==""){
		$.messager.alert('警告','请填写可吸入颗粒物！','warning');
		return false;
	}else if (!isNumber($("input[name='pm10']").val())){
		$.messager.alert('警告','可吸入颗粒物请输入数字！','warning');
		return false;
	}
	if($("input[name='co']").val()==""){
		$.messager.alert('警告','请填写一氧化碳！','warning');
		return false;
	}else if (!isNumber($("input[name='co']").val())){
		$.messager.alert('警告','一氧化碳请输入数字！','warning');
		return false;
	}
	if($("input[name='no2']").val()==""){
		$.messager.alert('警告','请填写二氧化氮！','warning');
		return false;
	}else if (!isNumber($("input[name='no2']").val())){
		$.messager.alert('警告','二氧化氮请输入数字！','warning');
		return false;
	}
	if($("input[name='o3']").val()==""){
		$.messager.alert('警告','请填写臭氧！','warning');
		return false;
	}else if (!isNumber($("input[name='o3']").val())){
		$.messager.alert('警告','臭氧请输入数字！','warning');
		return false;
	}
	if($("input[name='so2']").val()==""){
		$.messager.alert('警告','请填写二氧化硫！','warning');
		return false;
	}else if (!isNumber($("input[name='so2']").val())){
		$.messager.alert('警告','请填写二氧化硫！','warning');
		return false;
	}
	return true;
}

</script>
</body>
</html>