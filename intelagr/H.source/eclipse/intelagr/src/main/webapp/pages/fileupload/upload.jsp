<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="width:100%;height:100%;overflow:hidden">
<head>
<title>文件上传-五常优质水稻溯源监管平台</title>
<link rel="stylesheet" type="text/css" href="${ctx}/style/index.css">
<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${ctx}/js/themes/color.css">
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/form2js.js"></script>
<script type="text/javascript" src="${ctx}/js/json2.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/js/ajaxfileupload.js"></script>
</head>
<body>
	<div style="margin-top:5px;margin-left:5px;margin-right:5px;">
		<fieldset id="queryBlock" class="fieldset_common_style">
			<form>
			<input type="hidden" id="bizType" name="bizType" value="${bizType}" />
			<input type="hidden" id="uploadDlgId" name="uploadDlgId" value="${uploadDlgId}" />
			<table style="width:98%;">
				<tr>
					<td width="100" height="25" nowrap align="right">选择文件：</td>
					<td ><input type="file" id="file" name="file" style="height:25px;width:300px;"/></td>
				</tr>
				<tr>
					<td width="50" nowrap="nowrap"  align="right">文件说明：</td>
					<td width="100">
						<textarea  class="easyui-textbox" rows="2" id="fileInfo" name="remark" style="width:300px;height:60px" data-options="multiline:true" ></textarea>
					</td>
				</tr>
				<tr height="50">
					<td colspan="2" align="center">
						<a href="javascript:void(0)" id="uploadDiv" class="easyui-linkbutton" style="height:30px; width:80px;" onclick="upload()">上传</a>
						<a href="javascript:void(0)" id="uploadDiv" class="easyui-linkbutton" style="margin-left:40px;height:30px; width:80px;" onclick="closeUploadDialog()">关闭</a>
					</td>
				</tr>
			</table>
			<div id="pbar" class="easyui-progressbar" style="width:485px; margin-top:5px; display:none;"></div> 
			</form>
		</fieldset>
		<table id="uploadFileList" class="easyui-datagrid" striped="true" singleSelect="true" style="height:180px;">
			<thead>
				<tr>
					<th field="originalName" width="280"  align="center">文件名</th>
					<th field="fileInfo" width="160" align="center">文件说明</th>
					<th field="op" width="60"  align="center">操作</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		
		<div id="fileList"></div>
    </div>
<script type="text/javascript">
var timer;
var finish = false;
$(document).ready(function(){
	getTmpFileList();
});
function upload(){
	var file = $("#file").val();
	if(file == ''){
		$.messager.alert('警告','请先选择文件。','warning');
		return false;
	}
	//文件类型较验
	var index = file.lastIndexOf(".");
	if(index == -1){
		$.messager.alert('警告','只支持PNG、JPEG、JPG、GIF格式的图片文件。','warning');
		return false;
	}
	var extName = file.substring(index+1,file.length).toUpperCase();
	if(extName != 'PNG' && extName != 'JPEG' && extName != "JPG" && extName != "GIF"){
		$.messager.alert('警告','只支持PNG、JPEG、JPG、GIF格式的图片文件。','warning');
		return false;
	}
	var bizType = "${bizType}";
	$("#pbar").show();
	$('#pbar').progressbar('setValue', 0); 
	getUploadStatus();
	var fileInfo = encodeURIComponent($("#fileInfo").val());
	showLoading();
	finish = false;
	$.ajaxFileUpload({
		url:"${ctx}/file/upload?id=file&bizType="+bizType+"&fileInfo=" + fileInfo,
		secureuri:false,
		fileElementId:'file',
		dataType: 'text',
		success: function (data, status){
			hideLoading();
			var jsonObj = JSON.parse(data);
			if(jsonObj.status == 200){
				finish = true;
				clearInterval(timer);
				$("#file").val("");
				$("#fileInfo").textbox('setValue',"");
				$('#pbar').progressbar('setValue', 100); 
				getTmpFileList();
			}else{
				$('#pbar').progressbar('setValue', 0); 
				$.messager.alert('错误','上传失败, ' + jsonObj.msg , 'error');
	        	clearInterval(timer);
			}
			$("#uploadDiv").linkbutton("enable");
		},
		error: function (data, status, e){
			hideLoading();
			$('#pbar').progressbar('setValue', 0); 
        	$.messager.alert('错误','上传失败。', 'error');
        	$("#uploadDiv").linkbutton("enable");
        	clearInterval(timer);
		}
	});
}

function getUploadStatus(){
	timer = setInterval(function(){
		Public.ajaxGet('${ctx}/file/getUploadStatus', {}, function(e) {
			if (200 == e.status && finish == false) {
				$('#pbar').progressbar('setValue', e.data); 
			} else clearInterval(timer);
		});
	},100);
}

function getTmpFileList(){
	var bizType = "${bizType}"; //$("#bizType").val();
	showLoading();
	$.ajax({
		url: "${ctx}/file/fileList?bizType="+bizType,
		type: 'post',
		dataType: 'text',
		contentType : 'text/html',
		error: function (result){
			$.messager.alert('错误','获取文件列表失败。', 'error');
		},
	    async: true,
		success: function (result){
			hideLoading();
			$('#uploadFileList').datagrid('loadData', { total: 0, rows: [] });
			var obj = JSON.parse(result);
			for(var k in obj.data){
				var mfile = obj.data[k];
				var opHtml = "<a href='javascript:void(0);return false;' onclick='deleteFile(\""+  mfile.filePath + "\")'>删除</a>";
				 $('#uploadFileList').datagrid('appendRow', {
					originalName: mfile.originalName,
					fileInfo : mfile.fileInfo,
					op: opHtml
				});
			}
		}
    });
}

function deleteFile(filePath){
	var bizType = $("#bizType").val();
	showLoading();
	$.messager.confirm("确认", "您确认要删除所选文件吗？", function (deleteAction) {
		if (deleteAction) {
			showLoading();
			Public.ajaxGet('${ctx}/file/deleteFile', {filePath : filePath, bizType : bizType}, function(e) {
				hideLoading();
				if (200 == e.status) {
					$.messager.alert('提示','操作成功。','info');
					getTmpFileList();
				} else {
					$.messager.alert('错误',e.msg,'error');
				}
			});
		}
	});
}

function closeUploadDialog(){
	var uploadDlgId = $("#uploadDlgId").val();
	$('#'+uploadDlgId).dialog('close');
}
</script>
</body>
</html>