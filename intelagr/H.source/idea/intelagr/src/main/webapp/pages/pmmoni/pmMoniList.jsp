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
</head>
<body class="easyui-layout">
	<div region="center" border="false" style="padding:5px;">	
		<fieldset id="queryBlock" class="fieldset_common_style">
			<form id="inputForm" name="inputForm" method="get" action="${pageContext.request.contextPath}/pmMoni/search">
				<input type='hidden' id="pageTotal" name="pageTotal" value="0" />
				<input type="hidden" id="page" name="page" value="1">
				<input type="hidden" id="pageSize" name="pageSize" value="15">
				
				<table class="table_common_style">
					<tr>
						<td class="table_common_td_label_query_style">监测日期：</td>
						<td class="table_common_td_txt_query_style">
							<input class="easyui-datebox" id="beginDate" name="beginDate" value=""
		           				data-options="required:false,showSeconds:false" style="width:150px" editable="false"/>
							~
							<input class="easyui-datebox" id="endDate" name="endDate" value=""
		           				data-options="required:false,showSeconds:false" style="width:150px" editable="false"/>
						</td>
						<td align="right" valign="bottom">
	                      	<a href="#" class="easyui-linkbutton" onclick="return form_check();">
	                      		<span class="l-btn-left">
	                      			<span class="l-btn-text icon-search l-btn-icon-left">查询</span>
	                      		</span>
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
					<a href="#" class="easyui-linkbutton" onclick="view();">
						<span class="l-btn-left">
							<span class="l-btn-text icon-view l-btn-icon-left">查看</span>
						</span>
					</a>
					<a href="#" class="easyui-linkbutton" onclick="add();">
						<span class="l-btn-left">
							<span class="l-btn-text icon-add l-btn-icon-left">添加</span>
						</span>
					</a>
					<a href="#" class="easyui-linkbutton" onclick="edit();">
						<span class="l-btn-left">
							<span class="l-btn-text icon-edit l-btn-icon-left">修改</span>
						</span>
					</a>
					<a href="#" class="easyui-linkbutton" onclick="return deleteRecord();">
						<span class="l-btn-left">
							<span class="l-btn-text icon-remove l-btn-icon-left">删除</span>
						</span>
					</a>
					</td>
				</tr>
			</table>	
		</fieldset>
		<table id="data" class="easyui-datagrid" striped="true" singleSelect="false" pageSize="15" pageNumber="1">
			<thead>
				<tr>
					<th field="id" width="140" align="center" checkbox="true"></th>
					<th field="monitorDate" width="120" align="center">监测日期</th>
					<th field="monitorPoint" width="120" align="center">监测点位</th>
					<th field="tsp" width="120" align="center">空气质量指数</th>
					<th field="so2" width="120" align="center">空气质量指数类别</th>
					<th field="no2" width="120" align="center">细颗料物</th>
					<th field="kx" width="120" align="center">可吸入颗粒物</th>
					<th field="yy" width="120" align="center">一氧化碳</th>
					<th field="ey" width="120" align="center">二氧化碳</th>
					<th field="cy" width="120" align="center">臭氧</th>
					<th field="yl" width="120" align="center">一氧化硫</th>
					<th field="createDate" width="120" align="center">创建人</th>
					<th field="operatorName" width="120" align="center">创建日期</th>
				</tr>
			</thead>
			<tbody>
						
			</tbody>
		</table>
	</div>
	<div id="addDialog"></div>
	
<script type="text/javascript">
	$(document).ready(function(){
		var winHeight = $(window).height();
	    var queryBlockHeight = $("#queryBlock").height();
	    var toolBlock = $("#toolBlock").height();
	    height:winHeight -queryBlockHeight -toolBlock-28,
		$("#data").datagrid({ 
			height:winHeight -queryBlockHeight -toolBlock-46,
			pagination: true,
	        rownumbers: true,
	        fitColumns: false,
	       // fit: true,
	        pageList: [15,20,25],
	        pagePosition: "top"
		});
	
		var pagger = $('#data').datagrid('getPager');  
		$(pagger).pagination({
			total: $("#pageTotal").val(),
			pageNumber: parseInt($("#page").val()),
			showPageList: true,
		    onSelectPage: function(pageNumber, pageSize){
		    	$('#page').val(pageNumber);
		    	$('#pageSize').val(pageSize);
		    	showLoading();
		    	$('#inputForm').submit();
		    }
		});
	});

function deleteRecord(id){
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	if(length < 1){
		$.messager.alert('警告','请至少选择一条记录！','warning');
		return false;
	}
	  $.messager.confirm("确认", "您确定要删除选中的记录吗？", function (deleteAction) {
		    if (deleteAction) {
				var ids = [];
				var rows = $('#data').datagrid('getSelections');
				var length = rows.length;
				for (var i = 0; i < rows.length; i++)
					ids.push(rows[i].id);
				Public.ajaxGet('delete', {
					ids : ids
				}, function(e) {
					if (200 == e.status) {

						form_check();
					} else{
						$.messager.alert('错误','删除失败！' + e.msg,'error');
					}
					
				});
		    }
		});
}

function edit(id){
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	if (length == 0 ) {
		$.messager.alert('警告','必须选择一条记录！','warning');
		return false;
	}
	if (length > 1) {
		$.messager.alert('警告','只能选择一条记录！','warning');
		return false;
	}
	var id = rows[0].id;
	$('#addDialog').dialog({
	    title: '编辑PM2.5监测数据',
	    width: 400,
	    height: 425,
	    closed: false,
	    cache: false,
	    href: 'editInput?id='+ id,
	    modal: true
	});
}

function view(){
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	if(length == 0 || length > 1){
		$.messager.alert('警告','必须且只能一条记录！','warning');
		return false;
	}
	var id = rows[0].id;
	$('#addDialog').dialog({
	    title: '查看PM2.5监测数据',
	    width: 400,
	    height: 370,
	    closed: false,
	    cache: false,
	    href: 'view?id='+ id,
	    modal: true
	});
}
function add(){
	$('#addDialog').dialog({
	    title: '添加PM2.5监测数据',
	    width: 400,
	    height: 425,
	    closed: false,
	    cache: false,
	    href: 'pmMoniEdit.html',
	    modal: true
	});
}

function closeEdiDialog(){
	$('#graiEvalEditDlg').dialog('close');
}

function form_check(){
	var beginDate =$.trim($("#beginDate").datebox('getValue'));
	var endDate =$.trim($("#endDate").datebox('getValue'));
	if(!dateCompare(beginDate,endDate)){
		$.messager.alert('警告','监测日期开始日不能大于结束日！。','warning');
		return false;
	}
	showLoading();
	$('#inputForm').submit();
}
</script>
</body>
</html>