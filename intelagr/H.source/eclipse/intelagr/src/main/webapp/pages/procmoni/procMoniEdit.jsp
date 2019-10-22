<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
<title>过程监控资料管理-五常优质水稻溯源监管平台</title>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/upload_proc.js"></script>
</head>
<body class="easyui-layout">
	<div region="center" border="false" style="padding:5px;">
		<form id="addFrom" class="easyui-form" method="post" data-options="novalidate:true">
		<input name="id" type="hidden" id="id" value=""/>
		<input name="bizCode" type="hidden" id="bizCode" value=""/>
		<fieldset class="fieldset_common_style">
			<table>
				<tr>
					<td align="left">
						<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="return save();">保存</a>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset class="fieldset_common_style">
			<table class="table_common_style">
				<tr>
					<td align="right">年度：</td>
					<td>
						

		<select id="year" name="year" class="easyui-combobox" style="width:170px;height:25px" data-options="editable:true">

			<option value="2015">2015年</option>

			<option value="2014">2014年</option>

		</select>

		 <script type="text/javascript">

			 $(document).ready(function(){ 

				 $('#year').combobox({ 

					 onChange:function(newValue,oldValue){

						 initInfo();

					 } 

				 });


			 });

		</script>

						<span class="span_common_mustinput_style">*</span>
					</td>
					<td align="right">企业名称：</td>
					<td>
						<!-- 实现不要默认选中 -->
						
						
						
							

		<select id="companyCode" name="companyCode" class="easyui-combobox" style="width:170px;height:25px" data-options="editable:true">
<option value="" selected>-=请选择=-</option>
			<option value="GS001">五常市长盛种业有限公司</option>

			<option value="GS002">五常市利元种业有限公司</option>

			<option value="GS003">五常市龙洋种子有限公司</option>

			<option value="GS004">黑龙江阳光种业有限公司</option>

			<option value="GS005">五常市神农天源种子有限公司</option>

			<option value="GS006">五常市葵花阳光农业科技服务有限公司</option>

			<option value="GS007">东方粮仓种业科技发展有限公司</option>

			<option value="GS008">五常沃科收种业有限责任公司</option>

			<option value="GS009">五常市宏运种业有限公司</option>

			<option value="GS010">五常市绿珠种业科技有限公司</option>

			<option value="GS011">黑龙江方圆农业有限责任公司</option>

			<option value="GS012">五常市丰源农业科技创新有限责任公司</option>

			<option value="GS013">哈尔滨盛世百年农业有限公司</option>

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

						
						<span class="span_common_mustinput_style">*</span>
					</td>
				</tr>
				<tr>
					<td align="right">过程分类：</td>
					<td>
						

		<select id="bizType" name="bizType" class="easyui-combobox" style="width:170px;height:25px" data-options="editable:true">
<option value="" selected>-=请选择=-</option>
			<option value="01">浸种催芽</option>

			<option value="02">育秧环节</option>

			<option value="03">插秧环节</option>

			<option value="04">植保环节</option>

			<option value="05">收割环节</option>

			<option value="06">物流环节</option>

			<option value="07">仓储环节</option>

			<option value="08">加工环节</option>

		</select>

		 <script type="text/javascript">

			 $(document).ready(function(){ 

				 $('#bizType').combobox({ 

					 onChange:function(newValue,oldValue){

						 initInfo();

					 } 

				 });


			 });

		</script>

						<span class="span_common_mustinput_style">*</span>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset class="fieldset_common_style">
			<legend>过程图片上传</legend>
			<table class="table_common_style"> 
				<tr>
					<td>
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:procImgUpload();">
							<span class="l-btn-left"><span class="l-btn-text icon-docupload l-btn-icon-left">上传过程图片</span>
						</a>
					</td>
					<td align="center" width="50%">过程图片预览：</td>
				</tr>
			<tr>
				<td>
					<table id="imgList" height="250" class="easyui-datagrid" striped="true" singleSelect="true">
						<thead>
							<tr>
								<th field="originalName" width="50%" align="center">过程图片</td>
								<th field="fileInfo" width="30%" align="center">过程图片描述</td>
								<th field="op" width="20%" align="center">操作</td>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</td>
				<td valign="top" align="center">
					<table class="table_common_style">
						<tr>
							<td class="imgC" align="center">
							<div class="imgList" id="imglist01">
								<ul id="imgUl">
								</ul>
								<a href="javascript:void(0)" class="imglist_arrow imglist_l"></a>
								<a href="javascript:void(0)" class="imglist_arrow imglist_r"></a>
							</div>
							</td>
						</tr>
						<tr>
							<td align="center" id="imgbtn01">
								<a href="javascript:void(0)" class="btn btn3"></a>
								<a href="javascript:void(0)" class="btn btn5" target="_blank"></a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</fieldset>
		<fieldset class="fieldset_common_style">
			<legend>过程视频上传</legend>
			<table class="table_common_style"> 
				<tr>
					<td class="table_common_td_label_style">
						过程视频URL：
					</td>
					<td class="table_common_td_txt_style">
						<input type="text" class="easyui-textbox" id="vUrl" name="vUrl" style="width:200px;">
						<span class="span_common_mustinput_style">*</span>
					</td>
					<td align="center" width="50%">过程视频预览：</td>
				</tr>
				<tr>
					<td class="table_common_td_label_style">	
						过程视频描述：
					</td>
					<td class="table_common_td_txt_style">
						<input type="text" class="easyui-textbox" id="desc" name="desc" style="width:200px;">
						<span class="span_common_mustinput_style">*</span>
					</td>
					<td rowspan="3" height="230px" align="center">
						<div class="video" id="video01">
							<a href="javascript:void(0)" class="video_arrow video_l"></a>
							<a href="javascript:void(0)" class="video_arrow video_r"></a>
							<ul id="videoUl">
							</ul>
						</div>
					</td>
				</tr>
				<tr>
					<td align="right" colspan="2">
						<a href="#" class="easyui-linkbutton" onclick="return add();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-add l-btn-icon-left">添加</span>
							</span>
						</a>
					</td>
				</tr>
				<tr>
					<td colspan="2" valign="top">
						<table height="200" id="videoList" class="easyui-datagrid" striped="true" singleSelect="true">
							<thead>
								<tr>
									<th field="videoURL" width="50%" align="center">过程视频URL</td>
									<th field="urlDesc" width="30%" align="center">过程视频描述</td>
									<th field="op" width="20%" align="center">操作</td>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
		</fieldset>
		</form>
	</div>
	<div id="addDialog"></div>
	<div id="uploadDialog"></div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#bizType").combobox({
			onChange: function (n,o) {
				initInfo();
			}
		});
		initInfo();
	});

	function save(){
		if( checkForm() ){
			var a = $('#addFrom').toObject();
			delete a["videoUrl"];  
			var jObj = [];
			//var videoUrl = $("input[name='videoUrl']");
			var rows = $("#videoList").datagrid("getRows");
			for( var i = 0; i < rows.length; i++ ){
				var d = {};
				d.filePath = rows[i].videoURL;
				d.fileInfo = rows[i].urlDesc;
				
				jObj.push( d );
			}
			//return;
			a.list = jObj;
			showLoading();
			Public.ajaxPost('save', JSON.stringify(a), function(e) {
				if (200 == e.status) {
					$.messager.alert('提示','保存成功。','info');
					hideLoading();
					$("#id").val(e.data.procMoniModel.id );
					$("#bizCode").val( e.data.procMoniModel.bizCode );
				} else {
					hideLoading();
					$.messager.alert('错误','操作失败！' + e.msg,'error');
				}
			});
		}
	}
	function initInfo( ){
		var year = $("#year").combobox('getValue');
		var bizType = $("#bizType").combobox('getValue');
		var companyCode  = $("#companyCode").combobox('getValue');
		if( year != "" && bizType != "" && companyCode != "" ){
			Public.ajaxGet('getInfo?year=' + year + "&bizType=" + bizType + "&companyCode=" + companyCode, {}, function(e) {
				if (200 == e.status) {
					initValue( e.data );
				} else
					$.messager.alert('错误','操作失败！' + e.msg,'error');
			});
		}
	}
	function initValue(data){
		var id = data.procMoni.id;
		var bizCode = data.procMoni.bizCode;
		var bizType = data.procMoni.bizType;
		if( id != null && id != "" && id != "null" && bizCode != "" ){
			$("#id").val( id );
			$("#bizCode").val( bizCode );
			showFileList(bizType, bizCode, '过程图片', 'imgPriviewOuter', 'imgPriviewInner' );
		}else{
			$("#id").val( "" );
			$("#bizCode").val( "" );
			clearDatasTable();//清除文件列表信息
			$('#videoList').datagrid('loadData', { total: 0, rows: [] });  //清除视频列表
		}
	}

	function clearDatasTable(){
		$('#imgList').datagrid('loadData', { total: 0, rows: [] });
	}
	
	function procImgUpload(){
		if( checkForm() ){
			if( $('#bizType').combobox('getValue') != "" ){
				var bizType = $('#bizType').combobox('getValue');
				bizType = getImgBizType(bizType);
				showUploadDialog(bizType, $('#bizCode').val(), '过程图片','imgPriviewOuter','imgPriviewInner', '');
			}else{
				$.messager.alert('警告','请选择过程分类。','warning');
				return false;
			}
		}
	}
	
	function checkForm(){
		if( $('#bizType').combobox('getValue') == "" ){
			$.messager.alert('警告','请选择过程分类。','warning');
			return false;
		}
		if( $('#year').combobox('getValue') == "" ){
			$.messager.alert('警告','请选择年度。','warning');
			return false;
		}
		if( $('#companyCode').combobox('getValue') == "" ){
			$.messager.alert('警告','请选择企业。','warning');
			return false;
		}
		
		return true;
	}
	
	//添加视频地址
	function add(){
		var vUrl = $("#vUrl").val();
		var desc = $("#desc").val();
		if( vUrl == "" ){
			$.messager.alert('警告','过程视频URL不能为空。','warning');
			return;
		}
		if( vUrl.length > 100 ){
			$.messager.alert('警告','过程视频URL长度不能超过100。','warning');
			return;
		}
		if( desc.length > 100 ){
			$.messager.alert('警告','过程描述长度不能超过100。','warning');
			return;
		}
		var index = vUrl.lastIndexOf(".");
		if(index == -1){
			$.messager.alert('警告','只支持SWF格式的视频地址。','warning');
			return false;
		}
		var extName = vUrl.substring(index+1, index + 4).toUpperCase();
		var extName1 = vUrl.substring(index+1, index + 5).toUpperCase();
		if(extName != 'SWF' && extName != 'SWF?'){
			$.messager.alert('警告','只支持SWF格式的视频地址。','warning');
			return false;
		}
		var bizCode = $('#bizCode').val();
		var bizType = $("#bizType").combobox('getValue');
		bizType = getImgBizType(bizType);
		Public.ajaxGet(root + '/file/addVideo?t=' + (new Date).getTime(), {bizType:bizType,bizCode:bizCode,filePath:vUrl,fileInfo:desc},
			function(e) {
			if (200 == e.status) {
				//重新更新本地列表
				$.messager.alert('提示','添加成功。','info');
				var bizCode = $('#bizCode').val();
				showFileList(bizType, bizCode);
			} else {
				$.messager.alert('提示','删除失败。' + e.msg,'info');
			}
		});
			
		$("#vUrl").textbox('setValue','');
		$("#desc").textbox('setValue','');
	}
	
	function getImgBizType(bizType){
		if( bizType == "01" )  bizType = "06";
		else if( bizType == "02" )  bizType = "07";
		else if( bizType == "03" )  bizType = "08";
		else if( bizType == "04" )  bizType = "09";
		else if( bizType == "05" )  bizType = "10";
		else if( bizType == "06" )  bizType = "11";
		else if( bizType == "07" )  bizType = "12";
		else if( bizType == "08" )  bizType = "13";
		return bizType;
	}
	
	//删除行
	/*function delVideo( index ){
		alert(index);
		$('#videoList').datagrid('deleteRow', index);
		$('#videoList').datagrid('reload');//删除后重新加载下
	}
	
	function rowformater( value,row,index ){
		var opHtml = "<a href='javascript:void(0);return false;' onclick='delVideo(\"" + index + "\")'>删除</a>";
		return opHtml;
	}*/
	
	function imgList(imglistid, imgbtnid){
		var imglist = $(imglistid);
		var imgbtn = $(imgbtnid);
		var imglistraw = imglist.find("li");
		var imgCount = imglistraw.length;
		var imglistul = imglist.find("ul");
		var imglistliWidth = imglist.find("li").eq(0).width();
		var i = 0;
		var leftbtn = imglist.find(".imglist_l");
		var rightbtn = imglist.find(".imglist_r");
		var imgDetailBG = $(".imgDetailBG");
		var imgDetail = $(".imgDetail");
		var w = $(window).width();
		var h = $(window).height();
		var imgDetailBtn = $(".imgDetailBtn");
		var leftrotate = imgDetailBtn.find('.btn1');
		var rightrotate = imgDetailBtn.find('.btn2');
		var zoomIn = imgDetailBtn.find(".btn4");
		var ri = 0;
		var zoomOut = imgbtn.find(".btn3");
		var yuan = imgbtn.find(".btn5");
		var imgSrc;
		var imgDesc = imglist.parents("table").find(".description[rel='pic']").find("span");

		var checkNULL = function(){
			if(imgCount == 0){
				imglistul.html("<img src='/suyuan/images/nothing.png' width='100%' height='100%'/>");
				// leftbtn.hide();
				// rightbtn.hide();
			}
		}

		var elementSize = function(){
			imglistul.width(imglistliWidth * imgCount);
			imgDetailBG.width(w).height(h);
			imgDetail.width(w * 0.8).height(0.8 * h).css({
				"left": 0.1 * w,
				"top": 0.1 * h
			});
			imgDetail.find("img").height(0.8 * h - 100);
		}

		var initleftbtn = function(){
			leftbtn.unbind("click");
			leftbtn.bind("click",function(){
				if(i == 0){
					i = imgCount -1;
				}else{
					i--;
				}
				initYuan();
				imglistul.animate({
					left: - imglistliWidth * i
				}, 300);
				initDesc();
			})
		}

		var initrightbtn = function(){
			rightbtn.unbind("click");
			rightbtn.bind("click", function(){
				if(i == imgCount - 1){
					i = 0;
				}else{
					i++;
				}
				initYuan();
				imglistul.animate({
					left: - imglistliWidth * i
				}, 300);
				initDesc();
			})
		}

		var initImgDetailBtn = function(){
			leftrotate.click(function(){
				ri--;
				imgDetail.find("img").css("transform","rotate(" + 90 * ri + "deg)");
				imgDetail.find("img").css("-ms-transform","rotate(" + 90 * ri + "deg)");
				imgDetail.find("img").css("-moz-transform","rotate(" + 90 * ri + "deg)");
			})
			rightrotate.click(function(){
				ri++;
				imgDetail.find("img").css("transform","rotate(" + 90 * ri + "deg)");
				imgDetail.find("img").css("-ms-transform","rotate(" + 90 * ri + "deg)");
				imgDetail.find("img").css("-moz-transform","rotate(" + 90 * ri + "deg)");
			})
			zoomIn.click(function(){
				imgDetail.hide();
				imgDetailBG.slideUp();
			})
		}

		var initImgListBtn = function(){
			zoomOut.click(function(){
				imgDetailBG.slideDown(300, function(){
					imgDetail.find("img").attr("src", imgSrc);
					imgDetail.show();
					ri = 0;
				});
			})
		}

		var initYuan = function(){
			imgSrc = imglistraw.eq(i).find("img").attr("src");
			yuan.attr("href", imgSrc);
		}

		var initDesc = function(){
			// imgDesc.hide();
			// imgDesc.eq(i).css("display","block");
		}

		var init = function(){
			if(imgCount == 0){
				checkNULL();
			}else{
				elementSize();
				initleftbtn();
				initrightbtn();
				// initImgDetailBtn();
				// initImgListBtn();
				// initYuan();
				// initDesc();
			}
		}
		init();
	}
	
	function videoList(videoId){

		var videolist = $(videoId);
		var videolistraw = videolist.find("li");
		var videoCount = videolistraw.length;
		var videolistul = videolist.find("ul");
		var videolistliWidth = videolist.find("li").eq(0).width();
		var i = 0;
		var leftbtn = videolist.find(".video_l");
		var rightbtn = videolist.find(".video_r");
		var w = $(window).width();
		var h = $(window).height();
		var videoDesc = videolist.parents("table").find(".description[rel='video']").find("span");

		var checkNULL = function(){
			if(videoCount == 0){
				videolistul.html("<img src='/suyuan/images/nothing1.png' width='100%' height='100%'/>");
				// leftbtn.hide();
				// rightbtn.hide();
			}
		}

		var elementSize = function(){
			videolistul.width(videolistliWidth * videoCount);
		}

		var initleftbtn = function(){
			leftbtn.unbind("click");
			leftbtn.click(function(){
				if(i == 0){
					i = videoCount - 1;
				}else{
					i--;
				}
				videolistul.animate({
					left: - videolistliWidth * i
				}, 300);
				initDesc();
			})
		}

		var initrightbtn = function(){
			rightbtn.unbind("click");
			rightbtn.click(function(){
				if(i == videoCount - 1){
					i = 0;
				}else{
					i++;
				}
				videolistul.animate({
					left: - videolistliWidth * i
				}, 300);
				initDesc();
			})
		}

		var initDesc = function(){
			videoDesc.hide();
			videoDesc.eq(i).css("display","block");
		}

		var init = function(){
			if(videoCount == 0){
				checkNULL();
			}else{
				elementSize();
				initleftbtn();
				initrightbtn();
				initDesc();
			}
		}
		init();
	}
	
	imgList("#imglist01", "#imgbtn01");
	videoList("#video01");
	
</script>
</body>
</html>