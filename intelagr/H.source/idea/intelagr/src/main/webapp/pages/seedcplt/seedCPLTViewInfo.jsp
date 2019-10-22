<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head> 
<title>用户管理-五常优质水稻溯源监管平台</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/index.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/table.css">
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
	<script>
		var root = "${pageContext.request.contextPath}";
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/upload.js"></script>
</head>
<body class="easyui-layout">
	<div region="center" border="false" style="padding:0 10px;">
		<input type="hidden" name="id" id="id" value="1"/>
		
		<fieldset class="fieldset_common_style">
			<table class="table_common_style">
				<tr>
					<td  align="right"  style="width:60px">企业名称：</td>
					<td>
						<span>五常市长盛种业有限公司</span>
					</td>
				</tr>
				<tr>
					<td align="right">投诉人：</td>
					<td>
						张福贵
					</td>
				</tr>
				<tr>
					<td align="right">投诉日期：</td>
					<td>
						2017-05-22 08:00:00.0
					</td>
				</tr>
				<tr>
					<td align="right">投诉内容：</td>
					<td>
						<textarea class="easyui-textbox" style="width:400px;height:60px" data-options="multiline:true" readOnly>种子质量问题</textarea>
					</td>
				</tr>
				<tr>
					<td align="right">处理状态：</td>
					<td>
						未处理
					</td>
				</tr>
				<tr>
					<td align="right">处理人：</td>
					<td>
						
					</td>
				</tr>
				<tr>
					<td align="right">处理日期：</td>
					<td>
						
					</td>
				</tr>
				<tr>
					<td align="right">处理方式：</td>
					<td>
						
					</td>
				</tr>
				<tr>
					<td align="right">处理结果：</td>
					<td>
						<textarea class="easyui-textbox" rows="2" style="width:400px;height:60px" data-options="multiline:true" readOnly></textarea>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset class="fieldset_common_style">
			<table id="pzlist" width="100%" class="easyui-datagrid" striped="true" singleSelect="true" style="height:100px;">
				<thead>
					<tr>
						<th field="originalName" width="50%"  align="center">处理凭证</th>
						<th field="fileInfo" width="50%" align="center">说明</th>
					</tr>
				</thead>
			</table>
		</fieldset>
		<fieldset class="fieldset_common_style">
			<table id="fileDiv" class="table_common_style">
				<tr>
					<td>
						

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/jquery.scrollpic.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/jquery.fancybox.css" media="screen" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/jquery.fancybox-buttons.css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ScrollPic.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.fancybox.js"></script>	

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.fancybox-buttons.js"></script>

<script type="text/javascript">

	$(function(){

	$('.yiz-slider-3').ScrollPic({

		Time: 0,

		speed: 500,

		autoscrooll: false,

		arrowcontrol: true,

		numbercontrol: false

	});

})

$(document).ready(function() {

$('.fancybox-buttons').fancybox({

	openEffect  : 'none',

	closeEffect : 'none',

	prevEffect : 'none',

	nextEffect : 'none',

	closeBtn  : true,

	helpers : {

		title : {

			type : 'inside'

		},

		buttons	: {}

	},

	afterLoad : function() {

		this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');

	}

});

});

</script>

<style>
.t1 a:link, .t1 a:visited{}t1 a:hover{}
</style>

<div id='imgPriviewOuter'><div class="yiz-slider-3 yiz-slider" id="imgPriviewInner" data-yiz-slider="3" style="width:450px;height:450px">

 <ul>

<li><img src="${pageContext.request.contextPath}/images/nothing.png" alt="There is nothing to View." /></li>

</ul>

</div></div>

					</td>
				</tr>
			</table>
		</fieldset>
	</div>
	<div id="addDialog"></div>
	<div id="uploadDialog"></div>
	
<script type="text/javascript">
	
$(document).ready(function(){
	var id = $("#id").val(); 
	if(id != ""){
		showFileListView("19", id, '处理凭证', 'imgPriviewOuter', 'imgPriviewInner' );
	}
	//动态调整预览图片位置
	var width = $("#fileDiv").width();
	var picWidth = $("#imgPriviewInner").width();
	var paddingLeft = (width - picWidth)/2 + "px";
	$("#fileDiv").css("padding-left", paddingLeft);
});
function showFileListView(bizType, bizCode, title, viewDivIdOuter, viewDivIdInner){
	$.ajax({
		url: "${pageContext.request.contextPath}/file/fileList?bizType="+bizType+"&bizCode="+bizCode,
		type: 'post',
		dataType: 'text',
		contentType : 'text/html',
		error: function (result){
	        $.messager.alert('错误','获得文件列表失败。','error');
		},
	    async: true,
		success: function (result){
			var obj = JSON.parse(result);
			//预览数组
			var imgPathArray = new Array();
			var imgDescArray = new Array();
			var i = 0;
			for(var k in obj.data){
				var mfile = obj.data[k]; 
				if( mfile.fileType == "01" || mfile.fileType == "" ){
					$('#pzlist').datagrid('appendRow', {
						originalName: mfile.originalName,
						fileInfo : mfile.fileInfo
					});
					
					var fileID  = mfile.id;
					if( fileID == 0 || fileID < 1 ){
						imgPathArray[i] = "${pageContext.request.contextPath}/uploadtmp/" + mfile.filePath;
					}else{
						imgPathArray[i] = "${pageContext.request.contextPath}/upload/" + mfile.filePath;
					}
					imgDescArray[i] = mfile.fileInfo;
					i++;
				}
			}
			if( imgPathArray.length > 0 ){
				reloadImageView( viewDivIdOuter, viewDivIdInner, imgPathArray, imgDescArray, 450, 500 );
			}
		}
    });
}
</script>
	
</body>
</html>