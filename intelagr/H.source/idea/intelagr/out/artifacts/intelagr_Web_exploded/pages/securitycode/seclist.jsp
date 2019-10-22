<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>防伪码管理-五常优质水稻溯源监管平台</title>
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
			<form id="seclistform" name="seclistform" method="post" action="${pageContext.request.contextPath}/securityCode/seclist?flag=2">
			<table class="table_common_style">
				<tr>
					<td class="table_common_td_label_query_style">年度：</td>
					<td class="table_common_td_txt_query_style">
						

		<select id="year" name="year" class="easyui-combobox" style="width:170px;height:25px" data-options="editable:false">

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
				</tr>
				<tr>
					<td class="table_common_td_label_query_style">生产日期：</td>
             		<td colspan="2" class="table_common_td_txt_query_style">
             			<input name="produceDate" id="produceDate" class="easyui-datebox" value="" data-options="required:false,showSeconds:false" style="width:120px" editable="false"/>
             		</td>
					<td align="right" valign="bottom">
                       	<a href="#" class="easyui-linkbutton" onclick="return form_check();">
							<span class="l-btn-left"><span class="l-btn-text icon-search l-btn-icon-left">查询</span></span>
						</a>
             		</td>
				</tr>
			</table>
			</form>
		</fieldset>
		<fieldset id="toolBlock" class="fieldset_common_style">
			<table class="table_common_style">
				<tr>
					<td class="table_common_td_label_style">总产量（斤）：</td>
					<td class="table_common_td_txt_style">
						<input id="evalYield" value="0.0" class="easyui-textbox" style="width:100px;height:25px" readonly></td>
					<td class="table_common_td_label_style">已预报产量（斤）：</td>
					<td class="table_common_td_txt_style">
						<input id="predictedYield" value="0.0" class="easyui-textbox" style="width:100px;height:25px" readonly></td>
					<td class="table_common_td_label_style">已激活产量（斤）：</td>
					<td class="table_common_td_txt_style">
						<input id=sameleYield value="0.0" class="easyui-textbox" style="width:100px;height:25px" readonly></td>
				</tr>
				<tr>
					<td class="table_common_td_label_style">未申请产量（斤）：</td>
					<td class="table_common_td_txt_style">
						<input id="noApplyCodeCount" value="0.0" class="easyui-textbox" style="width:100px;height:25px" readonly></td>
					<td class="table_common_td_label_style">已申请数量：</td>
					<td class="table_common_td_txt_style">
						<input id="applyCodeCount" value="0" class="easyui-textbox" style="width:100px;height:25px" readonly></td>
					<td class="table_common_td_label_style">已激活数量：</td>
					<td class="table_common_td_txt_style">
						<input id="activateCodeCount" value="0" class="easyui-textbox" style="width:100px;height:25px" readonly></td>
				</tr>
			</table>
		</fieldset>
		<table id="data" class="easyui-datagrid" striped="true" checkbox="true" singleSelect="true" pageSize="15" pageNumber="1">
			<thead>
				<tr>
					<th field="year" width="70" align="center">年度</th>
					<th field="companyCode" width="300" align="center">企业名称</th>
					<th field="batchNo" width="120" align="center">批次</th>
					<th field="productName" width="200"  align="center">产品名称</th>
					<th field="productNum" width="80" align="center">产品数量</th>
					<th field="weight" width="120" align="center">激活产量（斤）</th>
					<th field="useDate" width="150" align="center">生产日期</th>
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
  var toolBlockHeight =$("#toolBlock").height();
	$("#data").datagrid({ 
	  height:winHeight -queryBlockHeight - toolBlockHeight -50,
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
		showRefresh:false,
	    onSelectPage: function(pageNumber, pageSize){
	    	$('#page').val(pageNumber);
	    	$('#pageSize').val(pageSize);
	    	$('#seclistform').submit();
	    }
	});
	
});

function form_check()
{

  var companyCode = $('#year').combobox('getValue');
  if(companyCode == ''){
      $.messager.alert('警告','请选择年度。','warning');
      return false;
  }
  
  var companyCode = $('#companyCode').combobox('getValue');
  if(companyCode == ''){
      $.messager.alert('警告','请选择企业。','warning');
      return false;
  }
	showLoading();
	$('#seclistform').submit();
}
</script>
</body>
</html>