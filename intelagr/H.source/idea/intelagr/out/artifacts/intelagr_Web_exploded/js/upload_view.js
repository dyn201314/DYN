/**
 *
 * @param bizType  标识
 * @param title    列表显示时的头名称
 */
function showUploadDialog( bizType, bizCode,  title, viewDivIdOuter, viewDivIdInner ){
	$('#uploadDialog').dialog({
	    title: '文件上传',
	    width: 540,
	    height: 400,
	    closed: false,
	    cache: false,
	    href: root + '/file/uploadInit?bizType=' + bizType + "&t=" + (new Date()).getTime(),
	    modal: true,
	    onClose : function(){
	    	showFileList( bizType, bizCode, title, viewDivIdOuter, viewDivIdInner, '' );
	    }
	});
}

function showFileList( bizType, bizCode, title, viewDivIdOuter, viewDivIdInner, divCode ){
	$.ajax({
		url: root + "/file/fileList?bizType="+bizType+"&bizCode="+bizCode,
		type: 'post',
		dataType: 'text',
		contentType : 'text/html',
		error: function (result){
	        alert('获得文件列表失败');
		},
	    async: true,
		success: function (result){
			$('#imgList').datagrid('loadData', { total: 0, rows: [] });
			var obj = JSON.parse(result);
			//var html = '<table class="t1" width="100%" height="30px;" style="margin-top:10px;table-layout:fixed;border-collapse:collapse;">';
			//html += '<tr height="30px;"><td align="center">'+ title +'</td><td align="center">文件说明</td><td align="center">操作</td></tr>';  //回显字符串

			//预览数组
			var imgPathArray = new Array();
			var imgDescArray = new Array();
			var i = 0;
			//视频信息
			var videoArray = new Array();
			var j = 0;
			for(var k in obj.data){
				var mfile = obj.data[k];
				if( mfile.fileType == "01" || mfile.fileType == "" ){
					var opHtml = "<a href='javascript:void(0);return false;' onclick='delUploadFile(\"" + bizType + "\",\""+ mfile.bizCode+ "\",\"" +  mfile.filePath + "\", this, \"" + viewDivIdOuter + "\", \"" + viewDivIdInner + "\")'>删除</a>";
					//html += "<tr height='30px;'><td>" + mfile.originalName + "</td>";
					//html += "<td>" + mfile.fileInfo + "</td>";
					//html += "<td align='center'><a href='javascript:void(0);return false;' onclick='delFile(\"" + bizType + "\",\""+ mfile.bizCode+ "\",\"" +  mfile.filePath + "\", this, \"" + viewDivIdOuter + "\", \"" + viewDivIdInner + "\")'>删除</a></td></tr>";
					$('#imgList').datagrid('appendRow', {
						originalName: mfile.originalName,
						fileInfo : mfile.fileInfo
						//op: opHtml
					});
					//html += "<tr height='30px;'><td>" + mfile.originalName + "</td>";
					//html += "<td>" + mfile.fileInfo + "</td>";
					//html += "<td align='center'><a href='javascript:void(0);return false;' onclick='delFile(\"" + bizType + "\",\""+ mfile.bizCode+ "\",\"" +  mfile.filePath + "\", this)'>删除</a></td></tr>";

					var fileID  = mfile.id;
					if( fileID == 0 || fileID < 1 ){
						imgPathArray[i] = root + "/uploadtmp/" + mfile.filePath;
					}else{
						imgPathArray[i] = root + "/upload/" + mfile.filePath;
					}
					imgDescArray[i] = mfile.fileInfo;
					i++;
				}else{
					videoArray[j] = mfile.filePath;
					j++;
				}
			}
			//html += "</table>";
			//$("#imgList").html(html);
			if( imgPathArray.length >= 0 ){
				reloadImageView( viewDivIdOuter, viewDivIdInner, imgPathArray, imgDescArray, 450, 500 );
			}
			//显示视频信息
			if( videoArray.length > 0 ){
				try{
					showVideoList( videoArray, divCode );
				}catch(e){}
			}else{
				var obj = $("#" + divCode);
				if( obj ){
					showVideoList( videoArray, divCode );
				}
			}
		}
    });
}

function showFileListView( bizType, bizCode, title, viewDivIdOuter, viewDivIdInner, divCode ){
  $.ajax({
    url: root + "/file/fileList?bizType="+bizType+"&bizCode="+bizCode,
    type: 'post',
    dataType: 'text',
    contentType : 'text/html',
    error: function (result){
          alert('获得文件列表失败');
    },
      async: true,
    success: function (result){
      var obj = JSON.parse(result);
      var html = '<table class="t1" width="100%" height="30px;" style="margin-top:10px;table-layout:fixed;border-collapse:collapse;">';
      html += '<tr height="30px;"><td align="center">'+ title +'</td><td align="center">文件说明</td></tr>';  //回显字符串

      //预览数组
      var imgPathArray = new Array();
      var imgDescArray = new Array();
      var i = 0;
      //视频信息
      var videoArray = new Array();
      var j = 0;
      for(var k in obj.data){
        var mfile = obj.data[k];
        if( mfile.fileType == "01" || mfile.fileType == "" ){
          html += "<tr height='30px;'><td>" + mfile.originalName + "</td>";
          html += "<td>" + mfile.fileInfo + "</td>";
          html += "</tr>";

          var fileID  = mfile.id;
          if( fileID == 0 || fileID < 1 ){
            imgPathArray[i] = root + "/uploadtmp/" + mfile.filePath;
          }else{
            imgPathArray[i] = root + "/upload/" + mfile.filePath;
          }
          imgDescArray[i] = mfile.fileInfo;
          i++;
        }else{
          videoArray[j] = mfile.filePath;
          j++;
        }
      }
      html += "</table>";
      $("#imgList").html(html);
      if( imgPathArray.length > 0 ){
        reloadImageView( viewDivIdOuter, viewDivIdInner, imgPathArray, imgDescArray, 450, 500 );
      }
      //显示视频信息
      if( videoArray.length > 0 ){
        try{
          showVideoList( videoArray, divCode );
        }catch(e){}
      }
    }
    });
}

//删除后调用的方法
function showImageView( bizType, bizCode, title, viewDivIdOuter, viewDivIdInner, divCode ){
	$.ajax({
		url: root + "/file/fileList?bizType="+bizType+"&bizCode="+bizCode,
		type: 'post',
		dataType: 'text',
		contentType : 'text/html',
		error: function (result){
	        alert('获得文件列表失败');
		},
	    async: true,
		success: function (result){
			var obj = JSON.parse(result);
			var html = '<table class="t1" width="100%" height="30px;" style="margin-top:10px;table-layout:fixed;border-collapse:collapse;">';
			html += '<tr height="30px;"><td align="center">'+ title +'</td><td align="center">文件说明</td><td align="center">操作</td></tr>';  //回显字符串

			//预览数组
			var imgPathArray = new Array();
			var imgDescArray = new Array();
			var i = 0;
			//视频信息
			var videoArray = new Array();
			var j = 0;
			for(var k in obj.data){
				var mfile = obj.data[k];
				if( mfile.fileType == "01" || mfile.fileType == "" ){
					//html += "<tr height='30px;'><td>" + mfile.originalName + "</td>";
					//html += "<td>" + mfile.fileInfo + "</td>";
					//html += "<td align='center'><a href='javascript:void(0);return false;' onclick='delFile(\"" + bizType + "\",\""+ mfile.bizCode+ "\",\"" +  mfile.filePath + "\", this)'>删除</a></td></tr>";
					var opHtml = "<a href='javascript:void(0);return false;' onclick='delUploadFile(\"" + bizType + "\",\""+ mfile.bizCode+ "\",\"" +  mfile.filePath + "\", this, \"" + viewDivIdOuter + "\", \"" + viewDivIdInner + "\")'>删除</a>";
					//html += "<tr height='30px;'><td>" + mfile.originalName + "</td>";
					//html += "<td>" + mfile.fileInfo + "</td>";
					//html += "<td align='center'><a href='javascript:void(0);return false;' onclick='delFile(\"" + bizType + "\",\""+ mfile.bizCode+ "\",\"" +  mfile.filePath + "\", this, \"" + viewDivIdOuter + "\", \"" + viewDivIdInner + "\")'>删除</a></td></tr>";
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
					videoArray[j] = mfile.filePath;
					j++;
				}
			}
			//html += "</table>";
			//$("#imgList").html(html);
			if( imgPathArray.length >= 0 ){
				reloadImageView( viewDivIdOuter, viewDivIdInner, imgPathArray, imgDescArray, 450, 500 );
			}
			//显示视频信息
			if( videoArray.length > 0 ){
				try{
					showVideoList( videoArray, divCode );
				}catch(e){}
			}else{
				var obj = $("#" + divCode);
				if( obj ){
					showVideoList( videoArray, divCode );
				}
			}
		}
    });
}

//bizCode如果没有就传空串
function delUploadFile(bizType, bizCode, filePath, obj, viewDivIdOuter, viewDivIdInner){
	//if(!confirm("您确定要删除吗？")) return false;
	//alert( obj.parentNode.parentNode.nodeName );
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
				//var _obj = obj.parentNode.parentNode.parentNode;
				//var tbody = _obj.parentNode;
				//tbody.removeChild( _obj );
				//var a = $('#imgList').datagrid('getSelected');
				//alert("a:" + a);
	            //var b = $('#imgList').datagrid('getRowIndex', a);
	            //alert( b );
	            //$('#imgList').datagrid('deleteRow', b);
	            //return;
				showFileList(bizType, bizCode, "", viewDivIdOuter, viewDivIdInner);
			} else {
				$.messager.alert('提示','删除失败。' + e.msg,'info');
			}
		});
	});
}