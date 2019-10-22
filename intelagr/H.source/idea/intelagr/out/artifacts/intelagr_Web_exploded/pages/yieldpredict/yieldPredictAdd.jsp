<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
<title>添加预报-五常优质水稻溯源监管平台</title>
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
		<form id="addUserFrom" class="easyui-form" method="post" data-options="novalidate:true">
			<fieldset id="queryBlock" class="fieldset_common_style">
			<table class="table_common_style">
				<tr>
	    			<td class="table_common_td_label_style">产品名称：</td>
	    			<td class="table_common_td_txt_style editableFalse">
	    				<input type="hidden" id="companyCode" value="GS100" />
		    			<select id="productCode" name="productCode" class="easyui-combobox" editable="false" style="width:200px;height:25px">
		    				<option value="">请选择产品</option>
		    				
		    					<option value="GS100-0001|1.0|袋">乔府大院-稻花香（1kg）</option>
		    				
		    					<option value="GS100-0002|2.0|袋">乔府大院-稻花香（2kg）</option>
		    				
		    					<option value="GS100-0003|2.5|袋">乔府大院-稻花香（2.5kg）</option>
		    				
		    					<option value="GS100-0004|5.0|袋">乔府大院-稻花香（5kg）</option>
		    				
		    					<option value="GS100-0005|10.0|袋">乔府大院-稻花香（10kg）</option>
		    				
		    					<option value="GS100-0006|20.0|袋">乔府大院-稻花香（20kg）</option>
		    				
		    			</select>
		    			<span class="span_common_mustinput_style">*</span>
					</td>
    			</tr>
    			<tr>
	    			<td class="table_common_td_label_style">数量：</td>
	    			<td class="table_common_td_txt_style">
						<input class="easyui-numberbox" type="text" id="num" name="num" style="width:200px;height:25px" data-options="min:0,max:99999999999" ></input>
	    				<span class="span_common_mustinput_style">*</span>
	    			</td>
    			</tr>
    			<tr height="50">
	    			<td colspan="2" align="center">
		    			<a href="#" class="easyui-linkbutton" onclick="save()" data-options="iconCls:'icon-save'">保存</a>
		    			<a href="#" style="margin-left:50px;" class="easyui-linkbutton" style="margin-left:15px;" onclick="closeDialog()" data-options="iconCls:'icon-cancel'">关闭</a>
	    			</td>
    			</tr>
			</table>
			</fieldset>
		</form>
	</div>
<script type="text/javascript">
function save()
{
	var productCode = $('#productCode').combobox('getValue');
	var num = $.trim($("#num").val());
	if(productCode == '') {
		$.messager.alert('警告','请选择产品。','warning');
		return false;
	}
  if(num == ''){
    $.messager.alert('警告','请输入数量。','warning');
    return false;
}
  
	if(!isInt(num)){
		$.messager.alert('警告','数量只能输入整数。','warning');
		return false;
	}
	var productName = $('#productCode').combobox('getText');
	var prtArr = productCode.split("|");
	productCode = prtArr[0];
	var unitWeight = parseFloat(prtArr[1]);
	var weight = parseInt(num) * unitWeight * 2;
	var unit = prtArr[2];
	$('#data').datagrid('appendRow', {
		productName: productName,
		productCode : productCode,
		unitWeight: unitWeight,
		unit :unit,
		num : num,
		weight : weight
    });
	updateCurrentWeight();
	//$.messager.alert('提示','添加成功。','info');
	closeDialog();
}

function closeDialog()
{
	$('#addDialog').dialog('close');
}
</script>
</body>
</html>