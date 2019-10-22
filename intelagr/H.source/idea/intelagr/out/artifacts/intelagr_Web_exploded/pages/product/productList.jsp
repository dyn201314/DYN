<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品列表-五常优质水稻溯源监管平台</title>
<link rel="stylesheet" type="text/css" href="../../style/index.css">
<link rel="stylesheet" type="text/css" href="../../js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../../js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="../../js/themes/color.css">
<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript" src="../../js/form2js.js"></script>
<script type="text/javascript" src="../../js/json2.js"></script>
<script type="text/javascript" src="../../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/ajaxfileupload.js"></script>
</head>
<body class="easyui-layout">
	<div region="center" border="false" style="padding:5px;">	
		<fieldset id="queryBlock" class="fieldset_common_style">
			<form id="productForm" name="productForm" method="post" action="../../product/list?flag=2">
				<table class="table_common_style">
					<tr>
						<td class="table_common_td_label_query_style">企业名称：</td>
						<td colspan="4">
							

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

							<input type='hidden' id="pageTotal" name="pageTotal" value="6" />
							<input type="hidden" id="page" name="page" value="1">
							<input type="hidden" id="pageSize" name="pageSize" value="15">
						</td>
						<td class="table_common_td_label_query_style">产品名称：</td>
						<td nowrap>
							<input name="productName" value="" class="easyui-textbox" style="width:200px;height:25px">
						</td>
						<td align="right" valign="bottom">
	                       	<a href="#" class="easyui-linkbutton" onclick="onSubmit()">
	                       	<span class="l-btn-left"><span class="l-btn-text icon-search l-btn-icon-left">查询</span></span></a>
	             		</td>
					</tr>
				</table>
			</form>
		</fieldset>
		<table id="data" class="easyui-datagrid" striped="true" singleSelect="true" pageSize="15" pageNumber="1">
			<thead>
				<tr>
					<th field="companyCode" width="250"  align="center">企业名称</th>
					<th field="productCode" width="200" align="center">产品编码</th>
					<th field="productName" width="250"  align="center">产品名称</th>
					<th field="unit" width="200"  align="center">包装单位</th>
					<th field="weight" width="150" align="center">产品净重</th>
				</tr>
			</thead>
			<tbody>
				
				<tr>
					<td height="120" align="center" nowrap><span>五常市金福粮油有限公司</span></td>
					<td height="30" align="center" nowrap>GS100-0001</td>
					<td height="30" align="center" nowrap>乔府大院-稻花香（1kg）</td>
					<td height="30" align="center" nowrap>袋</td>
					<td height="30" align="center" nowrap>1.0</td>
				</tr>
				
				<tr>
					<td height="120" align="center" nowrap><span>五常市金福粮油有限公司</span></td>
					<td height="30" align="center" nowrap>GS100-0002</td>
					<td height="30" align="center" nowrap>乔府大院-稻花香（2kg）</td>
					<td height="30" align="center" nowrap>袋</td>
					<td height="30" align="center" nowrap>2.0</td>
				</tr>
				
				<tr>
					<td height="120" align="center" nowrap><span>五常市金福粮油有限公司</span></td>
					<td height="30" align="center" nowrap>GS100-0003</td>
					<td height="30" align="center" nowrap>乔府大院-稻花香（2.5kg）</td>
					<td height="30" align="center" nowrap>袋</td>
					<td height="30" align="center" nowrap>2.5</td>
				</tr>
				
				<tr>
					<td height="120" align="center" nowrap><span>五常市金福粮油有限公司</span></td>
					<td height="30" align="center" nowrap>GS100-0004</td>
					<td height="30" align="center" nowrap>乔府大院-稻花香（5kg）</td>
					<td height="30" align="center" nowrap>袋</td>
					<td height="30" align="center" nowrap>5.0</td>
				</tr>
				
				<tr>
					<td height="120" align="center" nowrap><span>五常市金福粮油有限公司</span></td>
					<td height="30" align="center" nowrap>GS100-0005</td>
					<td height="30" align="center" nowrap>乔府大院-稻花香（10kg）</td>
					<td height="30" align="center" nowrap>袋</td>
					<td height="30" align="center" nowrap>10.0</td>
				</tr>
				
				<tr>
					<td height="120" align="center" nowrap><span>五常市金福粮油有限公司</span></td>
					<td height="30" align="center" nowrap>GS100-0006</td>
					<td height="30" align="center" nowrap>乔府大院-稻花香（20kg）</td>
					<td height="30" align="center" nowrap>袋</td>
					<td height="30" align="center" nowrap>20.0</td>
				</tr>
						
			</tbody>
		</table>
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

function onSubmit(){
	showLoading();
	$('#productForm').submit();
}
</script>
</body>
</html>