<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
	<title>文件上传-五常优质水稻溯源监管平台</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/index.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/color.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/form2js.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/json2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>
</head>
<body>
	<div region="center" border="false" style="padding:5px;">
		
		<form>
			<fieldset class="fieldset_common_style">
				<input type="hidden" id="bizType" name="bizType" value="${bizType}" />
				<table class="table_common_style">
					<tr>
						<td class="table_common_td_label_style">请选择要导入的Excel文件：</td>
						<td class="table_common_td_txt_style">
							<input type="file" id="file" name="file" size="25"/>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<div id="pbar" align="center" style="width:300px;height:50px; margin-top:10px;"></div>
						</td>
					</tr>
					<tr height="30">
						<td colspan="2" align="center">
							<a href="#" id="uploadDiv1" class="easyui-linkbutton" style="height:30px; width:100px;" onclick="importTempDown()">导入模板下载</a>
							<a href="#" id="uploadDiv" class="easyui-linkbutton" style="margin-left:40px;height:30px; width:80px;" onclick="upload()">上传</a>
							<a href="#" id="uploadDiv" class="easyui-linkbutton" style="margin-left:40px;height:30px; width:80px;" onclick="closeUploadDialog()">关闭</a>
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset class="fieldset_common_style" id="teID">
				<table width="100%">
					<tr>
						<td width="90%">
							<table id="errorData" height="100px;" class="easyui-datagrid" striped="true" style="table-layout:fixed;border-collapse: collapse;">
								<thead> 
									<tr>
										<th field="idNumber" width="40%" align="center">身份证号</th>
										<th field="eInfo" width="50%"  align="center">错误信息</th> 
									</tr>
								</thead>
								<tbody id="dataBody">
								</tbody>								
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
		<div id="uploadDiv" style="100%" align="center"></div>
    </div>
<script type="text/javascript">
	var timer;
	$(document).ready(function(){
		$("#errorData").datagrid({ 
	        rownumbers: true,
	        fitColumns: false
		});
		
		$("#teID").css('display','none'); 
	});
	function upload(){
		$('#errorData').datagrid('loadData', { total: 0, rows: [] });
	
		var file = $("#file").val();
		if(file == ''){
			alert('请先选择文件！');
			return false;
		}
		var year = "${year}";
		var companyCode = "${companyCode}";
		var companyName = "${companyName}";
		$("#pbar").html("正在努力导入中，请稍候...");
		showLoading();
		$.ajaxFileUpload({
			url:"${pageContext.request.contextPath}/geneLandReg/uploadExcel?year="+year+"&companyCode=" + companyCode + "&companyName=" + companyName,
			secureuri:false,
			fileElementId:'file',
			dataType: 'text',
			dataType : 'json', //返回值类型 一般设置为json
			success: function (data, status){
				$.messager.alert("提示", data.msg, "info", function () {
					if(data.status == 200){
						$("#pbar").html("");
				        hideLoading();	
				        var datas = data.data.data;
						appendImportData( datas );   //导入数据
						appendErrorInfo( data.data.errorData );   //错误数据
					} else {
						$("#pbar").html("");
					}
		        });
			},
			error: function (data, status){ 
				$("#pbar").html("");
				hideLoading();	
				var jsonObj = JSON.parse(data);
	        	$.messager.alert('错误','导入失败！\n' + jsonObj.msg, 'error');
			}
		});
	}
	function appendErrorInfo( eData ){
		if( eData.length > 0 ){
			$("#teID").css('display','block'); 
			$("#errorData").datagrid('resize');
			$('#errorData').datagrid('loadData', { total: 0, rows: [] });
			var i = 1;
			for( var data in eData ){
				$('#errorData').datagrid('appendRow', {
					idNumber: eData[data].idNumber,
					eInfo: eData[data].info
				});	
				i++;
			}
		}else{
			closeUploadDialog();
		}
	}
	
	function closeUploadDialog(){
		$('#importDialog').dialog('close');
		hideLoading();
	}
	function importTempDown(){
		document.location.href = "${pageContext.request.contextPath}/temp/普通土地备案导入模板.xls";
	}
</script>
</body>
</html>