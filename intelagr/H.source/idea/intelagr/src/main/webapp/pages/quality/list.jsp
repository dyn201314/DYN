<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
</head>
<body class="easyui-layout">
	<div region="center" border="false" style="padding:5px;">
		<fieldset id="queryBlock" class="fieldset_common_style">
			<form id="qualityform" name="qualityform" method="post" action="${pageContext.request.contextPath}/quality/list?flag=2">
				<table class="table_common_style">
					<tr>
						<td class="table_common_td_label_query_style">年度：</td>
						<td class="table_common_td_txt_query_style editableFalse">
							

		<select id="year" name="year" class="easyui-combobox" style="width:120px;height:25px" data-options="editable:false">
<option value="" selected>-=请选择=-</option>
			<option value="2015">2015年</option>

			<option value="2014">2014年</option>

		</select>

		 <script type="text/javascript">

			 $(document).ready(function(){ 

				 $('#year').combobox({ 

					 onChange:function(newValue,oldValue){

						 return false;

					 } 

				 });


			 });

		</script>

							<input type='hidden' id="pageTotal" name="pageTotal" value="0" />
							<input type="hidden" id="page" name="page" value="1">
							<input type="hidden" id="pageSize" name="pageSize" value="15">
						</td>
						<td class="table_common_td_label_query_style">企业名称：</td>
						<td class="table_common_td_txt_query_style">
							

		<select id="companyCode" name="companyCode" class="easyui-combobox" style="width:200px;height:25px" data-options="editable:true">
<option value="" selected>-=请选择=-</option>
			<option value="GS100">五常市金福粮油有限公司</option>

			<option value="GS101">五常市汤洪斌水稻种植农民专业合作社</option>

			<option value="GS102">五常市农之坊水稻种植农民专业合作社</option>

			<option value="GS103">五常市浩海水稻种植农民专业合作社</option>

			<option value="GS104">五常市首誉水稻种植农民专业合作社</option>

			<option value="GS105">五常市百谷香水稻种植农民专业合作社</option>

			<option value="GS106">五常市雪国粮仓水稻种植专业合作社</option>

			<option value="GS107">五常市明栎水稻种植专业合作社</option>

			<option value="GS108">五常市永顺丰水稻种植农民专业合作社</option>

			<option value="GS109">五常市秋然稻香水稻种植农民专业合作社</option>

			<option value="GS110">五常市千盈水稻种植专业合作社</option>

			<option value="GS111">五常裕禾田水稻种植农民专业合作社</option>

			<option value="GS112">五常市曾氏水稻种植专业合作社</option>

			<option value="GS113">五常市官仓稻场水稻种植农民专业合作社</option>

			<option value="GS114">五常市海兴水稻种植农民专业合作社</option>

			<option value="GS115">五常市积养源水稻种植农民专业合作社</option>

			<option value="GS116">五常市那军水稻种植农民专业合作社</option>

			<option value="GS117">五常市德双水稻种植专业合作社</option>

			<option value="GS118">五常市康基水稻种植专业合作社</option>

			<option value="GS119">双涛水稻种植合作社</option>

			<option value="GS120">五常市小稻夫水稻种植农民专业合作社</option>

			<option value="GS121">五常市郑文波水稻种植专业合作社</option>

			<option value="GS122">文龙水稻种植专业合作社</option>

		</select>

		 <input type="hidden" id="companyCode_companyName" name="companyName" value="">

		 <script type="text/javascript">

			 $(document).ready(function(){ 

				 $('#companyCode_companyName').val($('#companyCode option:selected').text());

				 $('#companyCode').combobox({ 

					 onChange:function(newValue,oldValue){

						 var ops = document.getElementById('companyCode').options;

						 for(var i=0;i<ops.length;i++){ 

							 if(ops[i].value == newValue){ 

								 $('#companyCode_companyName').val(ops[i].text); 

								 break; 

							 } 

						 } 

						 return false;; 

					 } 

				 });


				 $('#companyCode').combobox('textbox').bind('focus',function(){
					 var value = $('#companyCode').combobox('getValue');
					 var opts = $('#companyCode').combobox('getData');
						 if(value != ''){
							 var findFlag = false;
							 for(var i=0; i<opts.length; i++){
								 if(opts[i].value == value){
									 findFlag = true;
									 break;
								 }
							 }
							 if(!findFlag){
								 value = '';
								 $('#companyCode').combobox('setValue', '');
							 }
						 }
					 if(value == ''){
						 $('#companyCode').combobox('setText','');
					 }
				 }); 
				 $('#companyCode').combobox('textbox').bind('blur',function(){  
					 var value = $('#companyCode').combobox('getValue');
					 if(value == ''){
						 $('#companyCode').combobox('setText','-=请选择=-');
					 }
				 });
			 });

		</script>

						</td>
						<td class="table_common_td_label_query_style">质检状态：</td>
						<td class="table_common_td_txt_query_style">
							

		<select id="qualityStatus" name="qualityStatus" class="easyui-combobox" style="width:120px;height:25px" data-options="editable:true">
<option value="" selected>-=请选择=-</option>
			<option value="01">未检</option>

			<option value="02">合格</option>

			<option value="03">不合格</option>

		</select>

		 <script type="text/javascript">

			 $(document).ready(function(){ 

				 $('#qualityStatus').combobox({ 

					 onChange:function(newValue,oldValue){

						 return false;

					 } 

				 });


			 });

		</script>

						</td>
					</tr>
					<tr>
						
						<td class="table_common_td_label_query_style">质检日期：</td>
						<td colspan="4" class="table_common_td_txt_query_style editableFalse">
							<input id="beginDate" comboname="beginDate" textboxname="beginDate" class="easyui-datebox datebox-f combo-f textbox-f" value="" data-options="required:false,showSeconds:false" style="width: 100px; display: none;" editable="false">
							~
							<input id="endDate" comboname="endDate" textboxname="endDate" class="easyui-datebox datebox-f combo-f textbox-f" value="" data-options="required:false,showSeconds:false" style="width: 100px; display: none;" editable="false">
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
		<table id="data" class="easyui-datagrid" striped="true" checkbox="true" singleSelect="false" pageSize="15" pageNumber="1">
			<thead>
				<tr>
					<th field="year" width="60" align="center">年度</th>
					<th field="companyName" width="200" align="center">企业名称</th>
					<th field="checkCode" width="180" align="center">质检编号</th>
					<th field="deliveryPerson" width="80"  align="center">企业送检人</th>
					<th field="deliveryDate" width="100"  align="center">送检日期</th>
					<th field="handoverPerson" width="80"  align="center">质检中心交接人</th>
					<th field="handoverTime" width="150"  align="center">质检中心交接时间</th>
					<th field="inspectPerson" width="80" align="center">质检员</th>
					<th field="inspectDate" width="150" align="center">质检时间</th>
					<th field="inspectStatus" width=80 align="center">质检结论</th>
					<th field="path" width="100" align="center">质检报告</th>
				</tr>
			</thead>
			<tbody>
						
			</tbody>
		</table>
		<div id="addDialog"></div>
	</div>
<script type="text/javascript">
$(document).ready(function(){
    var winHeight = $(window).height();
    var queryBlockHeight = $("#queryBlock").height();

	$("#data").datagrid({ 
		height:winHeight -queryBlockHeight -32,
		pagination: true,
        rownumbers: true,
        fitColumns: false,
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

//预览质检报告
function showPic(qualityId){
	$('#addDialog').dialog({
	    title: '查看质检报告',
	    width: 600,
	    height: 500,
	    closed: false,
	    cache: false,
	    href: '${pageContext.request.contextPath}/quality/report?id='+qualityId,
	    modal: true
	});
}

function onSubmit(){
	var beginDate = $('#beginDate').datebox('getValue');
	var endDate = $('#endDate').datebox('getValue');
	if(beginDate!= '' && endDate != '' && beginDate > endDate){
		$.messager.alert('警告','开始日期不能大于结束日期！','warning');
		return false;
	}
	showLoading();
	$('#qualityform').submit();
}
</script>
</body>
</html>