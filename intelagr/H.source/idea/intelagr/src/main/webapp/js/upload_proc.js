/**
 *
 * @param bizType  标识
 * @param title    列表显示时的头名称
 */
function showUploadDialog( bizType, bizCode ){
	$('#uploadDialog').dialog({
	    title: '文件上传',
	    width: 540,
	    height: 400,
	    closed: false,
	    cache: false,
	    href: root + '/file/uploadInit?bizType=' + bizType + "&t=" + (new Date()).getTime(),
	    modal: true,
	    onClose : function(){
	    	showFileList( bizType, bizCode);
	    }
	});
}

function showFileList( bizType, bizCode ){
	var url = "";
	if( bizCode == "" ){
		url = "/file/getTmpFile?bizType="+bizType+"&bizCode="+bizCode;
	}else{
		url = "/file/fileList?bizType="+bizType+"&bizCode="+bizCode;
	}
	$.ajax({
		url: root + url,
		type: 'post',
		dataType: 'text',
		contentType : 'text/html',
		error: function (result){
	        alert('获得文件列表失败');
		},
	    async: true,
		success: function (result){
			$('#imgList').datagrid('loadData', { total: 0, rows: [] });
			$('#videoList').datagrid('loadData', { total: 0, rows: [] });
			var obj = JSON.parse(result);
			//预览数组
			var imgPathArray = new Array();
			var imgDescArray = new Array();
			var i = 0;
			//视频信息
			var videoArray = new Array();
			var videoDescArray = new Array();
			var j = 0;
			for(var k in obj.data){
				var mfile = obj.data[k];
				if( mfile.fileType == "01" || mfile.fileType == "" || (typeof(mfile.fileType) == "undefined") ){
					var opHtml = "<a href='javascript:void(0);return false;' onclick='delUploadFile(\"" + bizType + "\",\""+ mfile.bizCode+ "\",\"" +  mfile.filePath + "\")'>删除</a>";
					$('#imgList').datagrid('appendRow', {
						originalName: mfile.originalName,
						fileInfo : mfile.fileInfo,
						op: opHtml
					});

					var fileID  = mfile.id;
					if( fileID == 0 || fileID < 1 ){
						imgPathArray[i] = root + "/uploadtmp/" + mfile.filePath;
					}else{
						imgPathArray[i] = root + "/upload/" + mfile.filePath;
					}
					imgDescArray[i] = mfile.fileInfo;
					i++;
				}else{
					var opHtml = "<a href='javascript:void(0);return false;' onclick='delVideoFile(\"" + bizType + "\",\""+ mfile.bizCode+ "\",\"" +  mfile.filePath + "\",\"" + mfile.fileInfo + "\")'>删除</a>";
					$('#videoList').datagrid('appendRow', {
						videoURL: mfile.filePath,
						urlDesc : mfile.fileInfo,
						op: opHtml
					});
					
					videoArray[j] = mfile.filePath;
					videoDescArray[j] = mfile.fileInfo;
					j++;
				}
			}
			
			//显示图片预览
			if( imgPathArray.length >= 0 ){
				var previewHtml = "";
				for(j=0; j<imgPathArray.length; j++){
					previewHtml += '<li><img src="'+imgPathArray[j] + '" title="' + videoDescArray[j] + '"/></li>';
				}
				$("#imgUl").html(previewHtml);
			}
			imgList("#imglist01", "#imgbtn01");
			
			//显示视频预览
			if(videoArray.length > 0){
				var previewHtml = "";
				for(j=0; j<videoArray.length; j++){
					previewHtml += '<li><param name="wmode" value="opaque" /> ';
					previewHtml += '<embed runat="server" id="embedLnk" style="z-index:0;" src="' + videoArray[j] + '" ';
					previewHtml += ' type="application/x-shockwave-flash" ';
					previewHtml += ' allowscriptaccess="always" wmode="opaque"';
					previewHtml += ' allowfullscreen="true" width="320" height="250">';
					previewHtml += '</embed></li>';
				}
				$("#videoUl").html(previewHtml);
			}
			videoList("#video01");
		}
    });
}

//bizCode如果没有就传空串
function delUploadFile(bizType, bizCode, filePath){
	//bizCode 为空时，传空串
	$.messager.confirm("确认", "您确认要删除吗？", function (deleteAction) {
	    if (!deleteAction) {
	    	return false;
	    }
		Public.ajaxGet(root + '/file/deleteFile?t=' + (new Date).getTime(), {bizType : bizType, bizCode : bizCode, filePath : filePath},
			function(e) {
			if (200 == e.status) {
				//重新更新本地列表
				$.messager.alert('提示','删除成功。','info');
				showFileList(bizType, $('#bizCode').val());
			} else {
				$.messager.alert('提示','删除失败。' + e.msg,'info');
			}
		});
	});
}

//删除视频
function delVideoFile(bizType, bizCode, filePath, fileInfo){
	$.messager.confirm("确认", "您确认要删除吗？", function (deleteAction) {
	    if (!deleteAction) {
	    	return false;
	    }
		Public.ajaxGet(root + '/file/deleteVideoFile?t=' + (new Date).getTime(), {bizType : bizType, bizCode : bizCode, filePath : filePath, fileInfo:fileInfo},
			function(e) {
			if (200 == e.status) {
				//重新更新本地列表
				$.messager.alert('提示','删除成功。','info');
				showFileList(bizType, $('#bizCode').val());
			} else {
				$.messager.alert('提示','删除失败。' + e.msg,'info');
			}
		});
	});
}