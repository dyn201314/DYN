<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品列表-五常优质水稻溯源监管平台</title>
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
			<form id="yearForm" name="yearForm" method="post" action="${pageContext.request.contextPath}/year/list?flag=2">
				<table class="table_common_style">
					<tr>
						<td class="table_common_td_label_query_style">显示年度：</td>
						<td nowrap>
							<input name="yearName" value="" class="easyui-textbox" style="width:200px;height:25px">
							<input type='hidden' id="pageTotal" name="pageTotal" value="2" />
							<input type="hidden" id="page" name="page" value="1">
							<input type="hidden" id="pageSize" name="pageSize" value="15">
						</td>
						<td align="right" valign="bottom">
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
						<a href="#" class="easyui-linkbutton" onclick="addYear();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-add l-btn-icon-left">添加</span>
							</span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="deleteYear();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-remove l-btn-icon-left">删除</span>
							</span>
						</a>
					</td>
				</tr>
			</table>
		</fieldset>
		<table id="data" class="easyui-datagrid" striped="true" checkbox="true" singleSelect="true" pageSize="15" pageNumber="1">
			<thead>
				<tr>
					<th field="id" width="150" checkbox="true"  align="center"></th>
					<th field="yearCode" width="250"  align="center">实际年度</th>
					<th field="yearName" width="200" align="center">显示年度</th>
				</tr>
			</thead>
			<tbody>
				
				<tr>
					<td height="30" align="center" nowrap>1</td>
					<td height="30" align="center" nowrap>2015</td>
					<td height="30" align="center" nowrap>2015</td>
				</tr>
				
				<tr>
					<td height="30" align="center" nowrap>2</td>
					<td height="30" align="center" nowrap>2014</td>
					<td height="30" align="center" nowrap>2014</td>
				</tr>
						
			</tbody>
		</table>
		<div id="addDialog"></div>
	</div>
<script type="text/javascript">
	var winHeight = $(window).height();
	var queryBlockHeight = $("#queryBlock").height()

	$(document).ready(function(){
		$("#data").datagrid({
			height:winHeight -queryBlockHeight-45,
			pagination: true,
	        rownumbers: true,
	        fitColumns: false,
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

function addYear(){
		$('#addDialog').dialog({
	    title: '添加年度',
	    width: 500,
	    height: 260,
	    closed: false,
	    cache: false,
	    href: 'yearcodeAdd.jsp',
	    modal: true
	});
}

function deleteYear(){
	var ids = [];
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	for(var i=0; i<rows.length; i++) ids.push(rows[i].id);
	if(ids.length == 0){
		$.messager.alert('警告','至少选择一个用户。','warning');
		return false;
	}
	if(rows[0].userId == 'admin'){
		$.messager.alert('警告','管理员账号不能删。','warning');
		return false;
	}
	$.messager.confirm("确认", "您确认删除选定的记录吗？", function (deleteAction) {
		if (deleteAction) {
			showLoading();
			Public.ajaxGet('${pageContext.request.contextPath}/year/delete', {ids : ids}, function(e) {
				hideLoading();
				if (200 == e.status) {
					$.messager.alert('提示','操作成功。','info');
					onSubmit();
				} else
					$.messager.alert('错误',e.msg,'error');
			});
		}
	});
}
	
function onSubmit(){
	showLoading();
	$('#yearForm').submit();
}
</script>
</body>
</html>