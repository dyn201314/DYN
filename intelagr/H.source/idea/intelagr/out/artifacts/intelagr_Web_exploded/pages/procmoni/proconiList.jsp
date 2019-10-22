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
	<div region="center" border="false" style="padding:5px;">	
		<fieldset class="fieldset_common_style">
			<form id="inputForm" name="inputForm" method="get" action="${pageContext.request.contextPath}/procMoni/list">
			<table class="table_common_style">
				<tr>
					<td class="table_common_td_label_style">年度：</td>
					<td class="table_common_td_txt_style">
						

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

					</td>
					<td class="table_common_td_label_style">企业名称：</td>
					<td class="table_common_td_txt_style">
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

						
					</td>
					<td align="right" valign="bottom">
                       	<a href="#" class="easyui-linkbutton" onclick="return form_check();">
                       		<span class="l-btn-left"><span class="l-btn-text icon-search l-btn-icon-left">查询
                       		</span>
                       		</span>
                       	</a>
             		</td>
				</tr>
			</table>	
			</form>
		</fieldset>
		<div class="processMonitor">
			<ul class="menuct">
				<li class="on"><a href="javascript:void(0)">浸种催芽</a></li>
				<li><a href="javascript:void(0)">育秧环节</a></li>
				<li><a href="javascript:void(0)">插秧环节</a></li>
				<li><a href="javascript:void(0)">植保环节</a></li>
				<li><a href="javascript:void(0)">收割环节</a></li>
				<li><a href="javascript:void(0)">物流环节</a></li>
				<li><a href="javascript:void(0)">仓储环节</a></li>
				<li><a href="javascript:void(0)">加工环节</a></li>
			</ul>
			<div class="processMonitorC">
				<div class="processMonitorSon" id="monitor_01" style="display:block;">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<th><span><i>过程图片</i></span></th>
							<th><span><i>过程视频</i></span></th>
						</tr>
						<tr>
							<td class="imgC" align="center">
							<div class="imgList" id="imglist01">
								<ul>
									
								</ul>
								<a href="javascript:void(0)" class="imglist_arrow imglist_l"></a>
								<a href="javascript:void(0)" class="imglist_arrow imglist_r"></a>
							</div>
							</td>
							<td>
								<div class="video" id="video01">
									<a href="javascript:void(0)" class="video_arrow video_l"></a>
									<a href="javascript:void(0)" class="video_arrow video_r"></a>
									<ul>
										
									</ul>
								</div>
							</td>
						</tr>
						<tr>
							<td align="center" id="imgbtn01">
								<!-- <a href="javascript:void(0)" class="btn btn1"></a> -->
								<!-- <a href="javascript:void(0)" class="btn btn2"></a> -->
								<a href="javascript:void(0)" class="btn btn3"></a>
								<!-- <a href="javascript:void(0)" class="btn btn4"></a> -->
								<a href="javascript:void(0)" class="btn btn5" target="_blank"></a>
							</td>
						</tr>
						<tr valign="top">
							<td class="description" rel="pic">
								
							</td>
							<td class="description" rel="video">
								
							</td>
						</tr>
					</table>
				</div>
				<div class="processMonitorSon" id="monitor_02">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<th><span><i>过程图片</i></span></th>
							<th><span><i>过程视频</i></span></th>
						</tr>
						<tr>
							<td class="imgC" align="center">
							<div class="imgList" id="imglist02">
								<ul>
									
								</ul>
								<a href="javascript:void(0)" class="imglist_arrow imglist_l"></a>
								<a href="javascript:void(0)" class="imglist_arrow imglist_r"></a>
							</div>
							</td>
							<td>
								<div class="video" id="video02">
									<ul>
										
									</ul>
									<a href="javascript:void(0)" class="video_arrow video_l"></a>
									<a href="javascript:void(0)" class="video_arrow video_r"></a>
								</div>
							</td>
						</tr>
						<tr>
							<td align="center" id="imgbtn02">
								<!-- <a href="javascript:void(0)" class="btn btn1"></a> -->
								<!-- <a href="javascript:void(0)" class="btn btn2"></a> -->
								<a href="javascript:void(0)" class="btn btn3"></a>
								<!-- <a href="javascript:void(0)" class="btn btn4"></a> -->
								<a href="javascript:void(0)" class="btn btn5" target="_blank"></a>
							</td>
						</tr>
						<tr valign="top">
							<td class="description" rel="pic">
								
							</td>
							<td class="description" rel="video">
								
							</td>
						</tr>
					</table>
				</div>
				<div class="processMonitorSon" id="monitor_03">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<th><span><i>过程图片</i></span></th>
							<th><span><i>过程视频</i></span></th>
						</tr>
						<tr>
							<td class="imgC" align="center">
							<div class="imgList" id="imglist03">
								<ul>
									
								</ul>
								<a href="javascript:void(0)" class="imglist_arrow imglist_l"></a>
								<a href="javascript:void(0)" class="imglist_arrow imglist_r"></a>
							</div>
							</td>
							<td>
								<div class="video" id="video03">
									<ul>
										
									</ul>
									<a href="javascript:void(0)" class="video_arrow video_l"></a>
									<a href="javascript:void(0)" class="video_arrow video_r"></a>
								</div>
							</td>
						</tr>
						<tr>
							<td align="center" id="imgbtn03">
								<!-- <a href="javascript:void(0)" class="btn btn1"></a> -->
								<!-- <a href="javascript:void(0)" class="btn btn2"></a> -->
								<a href="javascript:void(0)" class="btn btn3"></a>
								<!-- <a href="javascript:void(0)" class="btn btn4"></a> -->
								<a href="javascript:void(0)" class="btn btn5" target="_blank"></a>
							</td>
						</tr>
						<tr valign="top">
							<td class="description" rel="pic">
								
							</td>
							<td class="description" rel="video">
								
							</td>
						</tr>
					</table>
				</div>
				<div class="processMonitorSon" id="monitor_04">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<th><span><i>过程图片</i></span></th>
							<th><span><i>过程视频</i></span></th>
						</tr>
						<tr>
							<td class="imgC" align="center">
							<div class="imgList" id="imglist04">
								<ul>
									
								</ul>
								<a href="javascript:void(0)" class="imglist_arrow imglist_l"></a>
								<a href="javascript:void(0)" class="imglist_arrow imglist_r"></a>
							</div>
							</td>
							<td>
								<div class="video" id="video04">
									<ul>
										
									</ul>
									<a href="javascript:void(0)" class="video_arrow video_l"></a>
									<a href="javascript:void(0)" class="video_arrow video_r"></a>
								</div>
							</td>
						</tr>
						<tr>
							<td align="center" id="imgbtn04">
								<!-- <a href="javascript:void(0)" class="btn btn1"></a> -->
								<!-- <a href="javascript:void(0)" class="btn btn2"></a> -->
								<a href="javascript:void(0)" class="btn btn3"></a>
								<!-- <a href="javascript:void(0)" class="btn btn4"></a> -->
								<a href="javascript:void(0)" class="btn btn5" target="_blank"></a>
							</td>
						</tr>
						<tr valign="top">
							<td class="description" rel="pic">
								
							</td>
							<td class="description" rel="video">
								
							</td>
						</tr>
					</table>
				</div>
				<div class="processMonitorSon" id="monitor_05">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<th><span><i>过程图片</i></span></th>
							<th><span><i>过程视频</i></span></th>
						</tr>
						<tr>
							<td class="imgC" align="center">
							<div class="imgList" id="imglist05">
								<ul>
									
								</ul>
								<a href="javascript:void(0)" class="imglist_arrow imglist_l"></a>
								<a href="javascript:void(0)" class="imglist_arrow imglist_r"></a>
							</div>
							</td>
							<td>
								<div class="video" id="video05">
									<ul>
										
									</ul>
									<a href="javascript:void(0)" class="video_arrow video_l"></a>
									<a href="javascript:void(0)" class="video_arrow video_r"></a>
								</div>
							</td>
						</tr>
						<tr>
							<td align="center" id="imgbtn05">
								<!-- <a href="javascript:void(0)" class="btn btn1"></a> -->
								<!-- <a href="javascript:void(0)" class="btn btn2"></a> -->
								<a href="javascript:void(0)" class="btn btn3"></a>
								<!-- <a href="javascript:void(0)" class="btn btn4"></a> -->
								<a href="javascript:void(0)" class="btn btn5" target="_blank"></a>
							</td>
						</tr>
						<tr valign="top">
							<td class="description" rel="pic">
								
							</td>
							<td class="description" rel="video">
								
							</td>
						</tr>
					</table>
				</div>
				<div class="processMonitorSon" id="monitor_06">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<th><span><i>过程图片</i></span></th>
							<th><span><i>过程视频</i></span></th>
						</tr>
						<tr>
							<td class="imgC" align="center">
							<div class="imgList" id="imglist06">
								<ul>
									
								</ul>
								<a href="javascript:void(0)" class="imglist_arrow imglist_l"></a>
								<a href="javascript:void(0)" class="imglist_arrow imglist_r"></a>
							</div>
							</td>
							<td>
								<div class="video" id="video06">
									<ul>
										
									</ul>
									<a href="javascript:void(0)" class="video_arrow video_l"></a>
									<a href="javascript:void(0)" class="video_arrow video_r"></a>
								</div>
							</td>
						</tr>
						<tr>
							<td align="center" id="imgbtn06">
								<!-- <a href="javascript:void(0)" class="btn btn1"></a> -->
								<!-- <a href="javascript:void(0)" class="btn btn2"></a> -->
								<a href="javascript:void(0)" class="btn btn3"></a>
								<!-- <a href="javascript:void(0)" class="btn btn4"></a> -->
								<a href="javascript:void(0)" class="btn btn5" target="_blank"></a>
							</td>
						</tr>
						<tr valign="top">
							<td class="description" rel="pic">
								
							</td>
							<td class="description" rel="video">
								
							</td>
						</tr>
					</table>
				</div>
				<div class="processMonitorSon" id="monitor_07">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<th><span><i>过程图片</i></span></th>
							<th><span><i>过程视频</i></span></th>
						</tr>
						<tr>
							<td class="imgC" align="center">
							<div class="imgList" id="imglist07">
								<ul>
									
								</ul>
								<a href="javascript:void(0)" class="imglist_arrow imglist_l"></a>
								<a href="javascript:void(0)" class="imglist_arrow imglist_r"></a>
							</div>
							</td>
							<td>
								<div class="video" id="video07">
									<ul>
										
									</ul>
									<a href="javascript:void(0)" class="video_arrow video_l"></a>
									<a href="javascript:void(0)" class="video_arrow video_r"></a>
								</div>
							</td>
						</tr>
						<tr>
							<td align="center" id="imgbtn07">
								<!-- <a href="javascript:void(0)" class="btn btn1"></a> -->
								<!-- <a href="javascript:void(0)" class="btn btn2"></a> -->
								<a href="javascript:void(0)" class="btn btn3"></a>
								<!-- <a href="javascript:void(0)" class="btn btn4"></a> -->
								<a href="javascript:void(0)" class="btn btn5" target="_blank"></a>
							</td>
						</tr>
						<tr valign="top">
							<td class="description" rel="pic">
								
							</td>
							<td class="description" rel="video">
								
							</td>
						</tr>
					</table>
				</div>
				<div class="processMonitorSon" id="monitor_08">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<th><span><i>过程图片</i></span></th>
							<th><span><i>过程视频</i></span></th>
						</tr>
						<tr>
							<td class="imgC" align="center">
							<div class="imgList" id="imglist08">
								<ul>
									
								</ul>
								<a href="javascript:void(0)" class="imglist_arrow imglist_l"></a>
								<a href="javascript:void(0)" class="imglist_arrow imglist_r"></a>
							</div>
							</td>
							<td>
								<div class="video" id="video08">
									<ul>
										
									</ul>
									<a href="javascript:void(0)" class="video_arrow video_l"></a>
									<a href="javascript:void(0)" class="video_arrow video_r"></a>
								</div>
							</td>
						</tr>
						<tr>
							<td align="center" id="imgbtn08">
								<!-- <a href="javascript:void(0)" class="btn btn1"></a> -->
								<!-- <a href="javascript:void(0)" class="btn btn2"></a> -->
								<a href="javascript:void(0)" class="btn btn3"></a>
								<!-- <a href="javascript:void(0)" class="btn btn4"></a> -->
								<a href="javascript:void(0)" class="btn btn5" target="_blank"></a>
							</td>
						</tr>
						<tr valign="top">
							<td class="description" rel="pic">
								
							</td>
							<td class="description" rel="video">
								
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div id="addDialog"></div>
	<div class="imgDetailBG"></div>
	<div class="imgDetail">
		<img src="" />
		<div class="imgDetailBtn">
			<a href="javascript:void(0)" class="btn btn1"></a>
			<a href="javascript:void(0)" class="btn btn2"></a>
			<!-- <a href="javascript:void(0)" class="btn btn3"></a> -->
			<a href="javascript:void(0)" class="btn btn4"></a>
			<!-- <a href="javascript:void(0)" class="btn btn5"></a> -->
		</div>
	</div>
<script type="text/javascript">
	$(document).ready(function(){
		var year = $("#year").combobox('getValue');
		var companyCode  = $("#companyCode").combobox('getValue');
	});

	function initInfo( ){
		var year = $("#year").combobox('getValue');
		var companyCode  = $("#companyCode").combobox('getValue');
		if( year != "" && companyCode != "" ){
			document.location.href = "${pageContext.request.contextPath}/procMoni/list?year=" + year + "&companyCode=" + companyCode;
		}
	}

	function form_check(){
		$('#inputForm').submit();
	}

	function tabc(){
		var li = $(".processMonitor .menuct li");
		var son = $(".processMonitorSon");

		li.click(function(){
			var index = $(this).index();
			li.removeClass("on");
			$(this).addClass("on");
			son.hide();
			son.eq(index).show();
		})
	}
	tabc();

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
				leftbtn.hide();
				rightbtn.hide();
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
			leftbtn.click(function(){
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
			rightbtn.click(function(){
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
			imgDesc.hide();
			imgDesc.eq(i).css("display","block");
		}

		var init = function(){
			if(imgCount == 0){
				checkNULL();
			}else{
				elementSize();
				initleftbtn();
				initrightbtn();
				initImgDetailBtn();
				initImgListBtn();
				initYuan();
				initDesc();
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
				leftbtn.hide();
				rightbtn.hide();
			}
		}

		var elementSize = function(){
			videolistul.width(videolistliWidth * videoCount);
		}

		var initleftbtn = function(){
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
	
	function form_check(){
		if( $('#companyCode').combobox('getValue') == "" ){
			$.messager.alert('警告','请选择企业。','warning');
			return false;
		}
		showLoading();
		$('#inputForm').submit();
	}
	imgList("#imglist01", "#imgbtn01");
	videoList("#video01");
	imgList("#imglist02", "#imgbtn02");
	videoList("#video02");
	imgList("#imglist03", "#imgbtn03");
	videoList("#video03");
	imgList("#imglist04", "#imgbtn04");
	videoList("#video04");
	imgList("#imglist05", "#imgbtn05");
	videoList("#video05");
	imgList("#imglist06", "#imgbtn06");
	videoList("#video06");
	imgList("#imglist07", "#imgbtn07");
	videoList("#video07");
	imgList("#imglist08", "#imgbtn08");
	videoList("#video08");
</script>
</body>
</html>