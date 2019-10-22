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
		    			<td class="table_common_td_label_style">监测点编号：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-textbox" name="monitorPointCode"  value="" style="width:170px;">
		    				<span class="span_common_mustinput_style">*</span>
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">监测点名称：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-textbox" name="monitorPointName"  value="" style="width:170px;">
		    				<span class="span_common_mustinput_style">*</span>
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">监测点类型：</td>
		    			<td class="table_common_td_txt_style">
		    				

		<select id="monitorPointType" name="monitorPointType" class="easyui-combobox" style="width:170px;px;height:25px" data-options="editable:true">

			<option value="01">大气</option>

			<option value="02">水质</option>

			<option value="03">土壤</option>

			<option value="04">PM2.5</option>

		</select>

		 <script type="text/javascript">

			 $(document).ready(function(){ 

				 $('#monitorPointType').combobox({ 

					 onChange:function(newValue,oldValue){

						 return false;

					 } 

				 });


			 });

		</script>

		    				<span class="span_common_mustinput_style">*</span>
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">监测点地址：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-textbox" type="monitorPointAddress" name="monitorPointAddress" value="" style="width:170px;">
		    				<span class="span_common_mustinput_style">*</span>
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">监测点描述：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-textbox" type="text" name="sectionDescription" value=""  style="width:170px;"></input>
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">经度：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-textbox" type="text" name="longitude" value=""  style="width:170px;"></input>
		    				<span class="span_common_mustinput_style">*</span>
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">纬度：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-textbox" type="text" name="latitude" value=""  style="width:170px;"></input>
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
	if($("input[name='monitorPointCode']").val()==""){
		alert("请填写监测点编号！");
		return false;
	}
	if($("input[name='monitorPointName']").val()==""){
		alert("请填写监测点名称！");
		return false;
	}
	if($("input[name='monitorPointAddress']").val()==""){
		alert("请填写监测点地址！");
		return false;
	}
	/**
	if($("input[name='sectionDescription']").val()==""){
		alert("请填写监测点描述！");
		return false;
	}
	**/
	if($("input[name='longitude']").val()==""){
		alert("请填写经度！");
		return false;
	}else if (!isNumber($("input[name='longitude']").val())){
		alert("经度请输入数字！");
		return false;
	}
	if($("input[name='latitude']").val()==""){
		alert("请填写纬度！");
		return false;
	}else if (!isNumber($("input[name='latitude']").val())){
		alert("纬度请输入数字！");
		return false;
	}
	
	return true;
}

</script>
</body>
</html>