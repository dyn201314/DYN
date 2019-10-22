<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
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
		<form id="addFrom" class="easyui-form" method="post" data-options="novalidate:true">
			<input name="id" value="" type="hidden">
			<fieldset class="fieldset_common_style">
				<table class="table_common_style">
					<tr>
		    			<td class="table_common_td_label_style">监测日期：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-datebox" name="monitorDate"  value="Sun May 21 00:00:00 CST 2017"
	            data-options="required:true,showSeconds:false" style="width:170px" editable="false">
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">监测点位：</td>
		    			<td class="table_common_td_txt_style">
		    				<select name="monitorPointCode" class="easyui-combobox" style="width:170px;" data-options="editable:false">

	<option value="150200G20101007A001" >桦树村01</option>

	<option value="150200G20101007A002" >桦树村02</option>

	<option value="150200G20101007A003" >万宝村01</option>

	<option value="150200G20101007A004" >万宝村02</option>

	<option value="150200G20101007A005" >杏花村01</option>

	<option value="150200G20101007A006" >杏花村02</option>

	<option value="150200G20101007A007" >农业中心01</option>

	<option value="150200G20101007A008" >杏花村03</option>

	<option value="150200G20101007A009" >杏花村04</option>

	<option value="150200G20101007A010" >桦树村03</option>

	<option value="150200G20101007A011" >西郊村01</option>

	<option value="150200G20101007A012" >远景村01</option>

	<option value="150200G20101007A013" >远景村02</option>

	<option value="150200G20101007A014" >远景村03</option>

	<option value="150200G20101007A015" >五常镇01</option>

	<option value="150200G20101007A016" >远景村04</option>

	<option value="150200G20101007A017" >新建村01</option>

	<option value="150200G20101007A018" >新建村02</option>

	<option value="150200G20101007A019" >新建村03</option>

	<option value="150200G20101007A020" >新建村04</option>

	<option value="150200G20101007A021" >莲花村01</option>

	<option value="150200G20101007A022" >远景村05</option>

	<option value="150200G20101007A023" >莲花村02</option>

	<option value="150200G20101007A024" >莲花村03</option>

	<option value="150200G20101007A025" >莲花村04</option>

	<option value="150200G20101007A026" >莲花村05</option>

	<option value="150200G20101007A027" >杏花村05</option>

	<option value="150200G20101007A028" >杏花村06</option>

	<option value="150200G20101007A029" >远景村06</option>

	<option value="150200G20101007A030" >远景村07</option>

	<option value="150200G20101007A031" >西郊村02</option>

	<option value="150200G20101007A032" >西郊村03</option>

	<option value="150200G20101007A033" >西郊村04</option>

	<option value="150200G20101007A034" >西郊村05</option>

	<option value="150200G20101007A035" >杏花村07</option>

	<option value="150200G20101007A036" >杏花村08</option>

	<option value="150200G20101007A037" >金山村01</option>

	<option value="150200G20101007A038" >金山村02</option>

	<option value="150200G20101007A039" >桦树村04</option>

	<option value="150200G20101007A040" >桦树村05</option>

	<option value="150200G20101007A041" >桦树村06</option>

	<option value="150200G20101007A042" >桦树村07</option>

	<option value="150200G20101007A043" >金山村03</option>

	<option value="150200G20101007A044" >金山村04</option>

	<option value="150200G20101007A045" >莲花村06</option>

	<option value="150200G20101007A046" >莲花村07</option>

	<option value="150200G20101007A047" >万宝山01</option>

	<option value="150200G20101007A048" >万宝山02</option>

	<option value="150200G20101007A049" >新建村05</option>

	<option value="150200G20101007A050" >新兴村01</option>

	<option value="150200G20101007A051" >新兴村02</option>

	<option value="150200G20101007A052" >杏花村09</option>

	<option value="150200G20101007A053" >杏花村 10</option>

	<option value="150200G20101007A054" >明华村01</option>

	<option value="150200G20101007A055" >明华村02</option>

	<option value="150200G20101007A056" >新光01</option>

	<option value="150200G20101007A057" >新光02</option>

	<option value="150200G20101007A058" >新光03</option>

	<option value="150200G20101007A059" >远景村08</option>

	<option value="150200G20101007A060" >新建村06</option>

	<option value="150200G20101007A061" >新建村07</option>

	<option value="150200G20101007A062" >远景村09</option>

	<option value="150200G20101007A063" >远景村10</option>

	<option value="150200G20101007A064" >新建村08</option>

	<option value="150200G20101007A065" >新建村09</option>

	<option value="150200G20101007A066" >镇西01</option>

	<option value="150200G20101007A067" >镇西02</option>

	<option value="150200G20101007A068" >桦树村08</option>

	<option value="150200G20101007A069" >镇西村03</option>

	<option value="150200G20101007A070" >镇西村04</option>

	<option value="150200G20101007A071" >远景村11</option>

	<option value="150200G20101007A072" >远景村12</option>

	<option value="150200G20101007A073" >莲花村08</option>

	<option value="150202G20101005B001" >九莲村01</option>

	<option value="150202G20101005B002" >九莲村02</option>

	<option value="150202G20101005B003" >九莲村03</option>

	<option value="150202G20101005B004" >团山子01</option>

	<option value="150202G20101005B005" >团山子02</option>

	<option value="150202G20101005B006" >团山子03</option>

	<option value="150202G20101005B007" >郎家村01</option>

	<option value="150202G20101005B008" >郎家村02</option>

	<option value="150202G20101005B009" >团山子04</option>

	<option value="150202G20101005B010" >九莲村04</option>

	<option value="150202G20101005B011" >团山子05</option>

	<option value="150202G20101005B012" >团山子06</option>

	<option value="150202G20101005B013" >团山子村07</option>

	<option value="150202G20101005B014" >兴盛乡村01</option>

	<option value="150202G20101005B015" >兴盛乡村02</option>

	<option value="150202G20101005B016" >兴盛乡村03</option>

	<option value="150202G20101005B017" >兴盛乡村04</option>

	<option value="150202G20101005B018" >九联村16</option>

	<option value="150202G20101005B019" >九联村17</option>

	<option value="150202G20101005B020" >兴盛乡村05</option>

	<option value="150202G20101005B021" >兴盛乡村06</option>

	<option value="150202G20101005B022" >辛家村04</option>

	<option value="150202G20101005B023" >辛家村05</option>

	<option value="150202G20101005B024" >辛家村06</option>

	<option value="150202G20101005B025" >辛家村07</option>

	<option value="150202G20101005B026" >辛家村08</option>

	<option value="150202G20101005B027" >辛家村09</option>

	<option value="150202G20101005B028" >辛家村10</option>

	<option value="150202G20101005B029" >辛家村11</option>

	<option value="150202G20101005B030" >辛家村12</option>

	<option value="150202G20101005B031" >郎家村03</option>

	<option value="150202G20101005B032" >郎家村04</option>

	<option value="150202G20101005B033" >九莲村05</option>

	<option value="150202G20101005B034" >九莲村06</option>

	<option value="150202G20101005B035" >郎家村05</option>

	<option value="150202G20101005B036" >郎家村06</option>

	<option value="150202G20101005B037" >五道岗村01</option>

	<option value="150202G20101005B038" >五道岗村02</option>

	<option value="150202G20101005B039" >郎家村07</option>

	<option value="150202G20101005B040" >郎家村08</option>

	<option value="150202G20101005B041" >九莲村07</option>

	<option value="150202G20101005B042" >九莲村08</option>

	<option value="150202G20101005B043" >九莲村09</option>

	<option value="150202G20101005B044" >九莲村10</option>

	<option value="150202G20101005B045" >九莲村11</option>

	<option value="150202G20101005B046" >九莲村12</option>

	<option value="150202G20101005B047" >九莲村13</option>

	<option value="150202G20101005B048" >九莲村14</option>

	<option value="150202G20101005B049" >九莲村15</option>

	<option value="150203G20101014C001" >中华01</option>

	<option value="150203G20101014C002" >长堡村01</option>

	<option value="150203G20101014C003" >常堡乡村01</option>

	<option value="150203G20101014C004" >常堡乡村02</option>

	<option value="150203G20101014C005" >周家岗村01</option>

	<option value="150203G20101014C006" >中华村02</option>

	<option value="150203G20101014C007" >二十家01</option>

	<option value="150203G20101014C008" >兴利村01</option>

	<option value="150203G20101014C009" >福兴村07</option>

	<option value="150203G20101014C010" >周家岗村02</option>

	<option value="150203G20101014C011" >三道岗村01</option>

	<option value="150203G20101014C012" >常堡乡村03</option>

	<option value="150203G20101014C013" >常堡乡村04</option>

	<option value="150203G20101014C014" >常堡乡村05</option>

	<option value="150203G20101014C015" >常堡乡村06</option>

	<option value="150203G20101014C016" >明星村01</option>

	<option value="150203G20101014C017" >明星村02</option>

	<option value="150203G20101014C018" >明星村03</option>

	<option value="150203G20101014C019" >明星村04</option>

	<option value="150203G20101014C020" >兴利村02</option>

	<option value="150203G20101014C021" >兴利村03</option>

	<option value="150203G20101014C022" >兴利村04</option>

	<option value="150203G20101014C023" >兴利村05</option>

	<option value="150203G20101014C024" >兴利村06</option>

	<option value="150203G20101014C025" >兴利村07</option>

	<option value="150203G20101014C026" >兴利村08</option>

	<option value="150203G20101014C027" >兴利村09</option>

	<option value="150203G20101014C028" >二十家02</option>

	<option value="150203G20101014C029" >二十家03</option>

	<option value="150203G20101014C030" >南岗村01</option>

	<option value="150203G20101014C031" >南岗村02</option>

	<option value="150203G20101014C032" >二十家04</option>

	<option value="150203G20101014C033" >二十家05</option>

	<option value="150203G20101014C034" >二十家06</option>

	<option value="150203G20101014C035" >二十家07</option>

	<option value="150203G20101014C036" >二十家08</option>

	<option value="150203G20101014C037" >福兴村08</option>

	<option value="150203G20101014C038" >辛家村01</option>

	<option value="150203G20101014C039" >辛家村02</option>

	<option value="150203G20101014C040" >辛家村03</option>

	<option value="150204G1013D001" >裕民01</option>

	<option value="150204G1013D002" >四河村01</option>

	<option value="150204G1013D003" >庆丰村01</option>

	<option value="150204G1013D004" >三河村01</option>

	<option value="150204G1013D005" >二河乡本村01</option>

	<option value="150204G1013D006" >三河村02</option>

	<option value="150204G1013D007" >裕民村03</option>

	<option value="150204G1013D008" >双河村01</option>

	<option value="150204G1013D009" >四河村02</option>

	<option value="150204G1013D010" >新庄村01</option>

	<option value="150204G1013D011" >三河村03</option>

	<option value="150204G1013D012" >裕民02</option>

	<option value="150204G1013D013" >新庄村02</option>

	<option value="150204G1013D014" >四河本屯01</option>

	<option value="150204G1013D015" >二河乡村01</option>

	<option value="150204G1013D016" >二河乡村02</option>

	<option value="150204G1013D017" >新庄村03</option>

	<option value="150204G1013D018" >新庄村04</option>

	<option value="150204G1013D019" >庆丰村02</option>

	<option value="150204G1013D020" >庆丰村03</option>

	<option value="150204G1013D021" >二河乡村03</option>

	<option value="150204G1013D022" >二河乡村04</option>

	<option value="150204G1013D023" >四河村03</option>

	<option value="150204G1013D024" >四河村04</option>

	<option value="150204G1013D025" >裕民村04</option>

	<option value="150204G1013D026" >裕民村05</option>

	<option value="150204G1013D027" >二河乡村05</option>

	<option value="150204G1013D028" >二河乡村06</option>

	<option value="150204G1013D029" >庆丰村04</option>

	<option value="150204G1013D030" >庆丰村05</option>

	<option value="150204G1013D031" >三河村04</option>

	<option value="150204G1013D032" >三河村05</option>

	<option value="150204G1013D033" >新庄村05</option>

	<option value="150204G1013D034" >新庄村06</option>

	<option value="150204G1013D035" >新庄村07</option>

	<option value="150204G1013D036" >新庄村08</option>

	<option value="150204G1013D037" >庆丰村06</option>

	<option value="150204G1013D038" >庆丰村07</option>

	<option value="150204G1013D039" >庆丰村08</option>

	<option value="150204G1013D040" >庆丰村09</option>

	<option value="150204G1013D041" >四河村05</option>

	<option value="150204G1013D042" >四河村06</option>

	<option value="150204G1013D043" >三河村06</option>

	<option value="150204G1013D044" >三河村07</option>

	<option value="150204G1013D045" >四河村07</option>

	<option value="150204G1013D046" >四河村08</option>

	<option value="150204G1013D047" >三河村08</option>

	<option value="150205G20101007E001" >兴水村01</option>

	<option value="150205G20101007E002" >西安村01</option>

	<option value="150205G20101007E003" >西安村02</option>

	<option value="150205G20101007E004" >东安村01</option>

	<option value="150205G20101007E005" >长征01</option>

	<option value="150205G20101007E006" >西安村03</option>

	<option value="150205G20101007E007" >五星村02</option>

	<option value="150205G20101007E008" >兴水村02</option>

	<option value="150205G20101007E009" >保家01</option>

	<option value="150205G20101007E010" >保家02</option>

	<option value="150205G20101007E011" >友好01</option>

	<option value="150205G20101007E012" >兴水村03</option>

	<option value="150205G20101007E013" >东安村02</option>

	<option value="150205G20101007E014" >长征02</option>

	<option value="150205G20101007E015" >西安村04</option>

	<option value="150205G20101007E016" >西安村05</option>

	<option value="150205G20101007E017" >兴水村04</option>

	<option value="150205G20101007E018" >兴水村05</option>

	<option value="150205G20101007E019" >友好村02</option>

	<option value="150205G20101007E020" >友好村03</option>

	<option value="150205G20101007E021" >西安村06</option>

	<option value="150205G20101007E022" >西安村07</option>

	<option value="150205G20101007E023" >兴水村06</option>

	<option value="150205G20101007E024" >兴水村07</option>

	<option value="150205G20101007E025" >兴水村08</option>

	<option value="150205G20101007E026" >兴水村09</option>

	<option value="150205G20101007E027" >兴水村10</option>

	<option value="150205G20101007E028" >保家03</option>

	<option value="150205G20101007E029" >保家04</option>

	<option value="150205G20101007E030" >卫国乡村01</option>

	<option value="150205G20101007E031" >卫国乡村02</option>

	<option value="150205G20101007E032" >长安村01</option>

	<option value="150205G20101007E033" >长安村02</option>

	<option value="150205G20101007E034" >西安村08</option>

	<option value="150205G20101007E035" >西安村09</option>

	<option value="150205G20101007E036" >友好村04</option>

	<option value="150205G20101007E037" >友好村05</option>

	<option value="150205G20101007E038" >西安村10</option>

	<option value="150205G20101007E039" >西安村11</option>

	<option value="150205G20101007E040" >友好村06</option>

	<option value="150205G20101007E041" >友好村07</option>

	<option value="150205G20101007E042" >友好村08</option>

	<option value="150205G20101007E043" >友好村09</option>

	<option value="150206G20101011F001" >监测点名称待确认</option>

	<option value="150206G20101011F002" >东兴旺村01</option>

	<option value="150206G20101011F003" >东兴旺村02</option>

	<option value="150206G20101011F004" >群星01</option>

	<option value="150206G20101011F005" >志强01</option>

	<option value="150206G20101011F006" >东兴旺村03</option>

	<option value="150206G20101011F007" >五星01</option>

	<option value="150206G20101011F008" >长富01</option>

	<option value="150206G20101011F009" >长富02</option>

	<option value="150206G20101011F010" >长富03</option>

	<option value="150206G20101011F011" >群星02</option>

	<option value="150206G20101011F012" >群星03</option>

	<option value="150206G20101011F013" >群星04</option>

	<option value="150206G20101011F014" >群星05</option>

	<option value="150206G20101011F015" >群星06</option>

	<option value="150206G20101011F016" >群星07</option>

	<option value="150206G20101011F017" >群星08</option>

	<option value="150206G20101011F018" >群星09</option>

	<option value="150206G20101011F019" >长富村04</option>

	<option value="150206G20101011F020" >长富村05</option>

	<option value="150206G20101011F021" >长富村06</option>

	<option value="150206G20101011F022" >长富村07</option>

	<option value="150206G20101011F023" >长富村08</option>

	<option value="150206G20101011F024" >长富村09</option>

	<option value="150206G20101011F025" >长富村10</option>

	<option value="150206G20101011F026" >长富村11</option>

	<option value="150206G20101011F027" >拥政村01</option>

	<option value="150206G20101011F028" >拥政村02</option>

	<option value="150206G20101011F029" >拥政村03</option>

	<option value="150206G20101011F030" >拥政村04</option>

	<option value="150206G20101011F031" >志强村02</option>

	<option value="150206G20101011F032" >志强村03</option>

	<option value="150206G20101011F033" >志强村04</option>

	<option value="150206G20101011F034" >群立村01</option>

	<option value="150206G20101011F035" >群立村02</option>

	<option value="150206G20101011F036" >拥正村01</option>

	<option value="150206G20101011F037" >拥正村02</option>

	<option value="150206G20101011F038" >东兴旺村04</option>

	<option value="150206G20101011F039" >东兴旺村05</option>

	<option value="150206G20101011F040" >拥正村03</option>

	<option value="150206G20101011F041" >拥正村04</option>

	<option value="150206G20101011F042" >东兴旺村06</option>

	<option value="150206G20101011F043" >东兴旺村07</option>

	<option value="150206G20101011F044" >东兴旺村08</option>

	<option value="150206G20101011F045" >东兴旺村09</option>

	<option value="150206G20101011F046" >东兴旺村10</option>

	<option value="150206G20101011F047" >东兴旺村11</option>

	<option value="150206G20101011F048" >长富村12</option>

	<option value="150206G20101011F049" >长富村13</option>

	<option value="150206G20101011F050" >长富村14</option>

	<option value="150207G20101013G001" >民意乡01</option>

	<option value="150207G20101013G002" >前进村01</option>

	<option value="150207G20101013G003" >民意乡02</option>

	<option value="150207G20101013G004" >褚家村01</option>

	<option value="150207G20101013G005" >褚家村02</option>

	<option value="150207G20101013G006" >褚家村03</option>

	<option value="150207G20101013G007" >前进村02</option>

	<option value="150207G20101013G008" >前进村03</option>

	<option value="150207G20101013G009" >九合村01</option>

	<option value="150207G20101013G010" >九合村02</option>

	<option value="150207G20101013G011" >明华村03</option>

	<option value="150207G20101013G012" >明华村04</option>

	<option value="150207G20101013G013" >永进村04</option>

	<option value="150207G20101013G014" >永进村05</option>

	<option value="150207G20101013G015" >中发村01</option>

	<option value="150207G20101013G016" >中发村02</option>

	<option value="150207G20101013G017" >草庙村01</option>

	<option value="150207G20101013G018" >草庙村02</option>

	<option value="150207G20101013G019" >草庙村03</option>

	<option value="150207G20101013G020" >草庙村04</option>

	<option value="150207G20101013G021" >草庙村05</option>

	<option value="150207G20101013G022" >草庙村06</option>

	<option value="150207G20101013G023" >草庙村07</option>

	<option value="150207G20101013G024" >草庙村08</option>

	<option value="150207G20101013G025" >草庙村09</option>

	<option value="150207G20101013G026" >草庙村10</option>

	<option value="150207G20101013G027" >草庙村11</option>

	<option value="150207G20101013G028" >草庙村12</option>

	<option value="150207G20101013G029" >草庙村13</option>

	<option value="150207G20101013G030" >草庙村14</option>

	<option value="150207G20101013G031" >草庙村15</option>

	<option value="150207G20101013G032" >前进村04</option>

	<option value="150207G20101013G033" >前进村05</option>

	<option value="150207G20101013G034" >前进村06</option>

	<option value="150207G20101013G035" >前进村07</option>

	<option value="150207G20101013G036" >明华村05</option>

	<option value="150207G20101013G037" >明华村06</option>

	<option value="150207G20101013G038" >中发村03</option>

	<option value="150207G20101013G039" >中发村04</option>

	<option value="150207G20101013G040" >中发村05</option>

	<option value="150207G20101013G041" >中发村06</option>

	<option value="150207G20101013G042" >草庙村16</option>

	<option value="150207G20101013G043" >永进村06</option>

	<option value="150207G20101013G044" >永进村07</option>

	<option value="150207G20101013G045" >永进村08</option>

	<option value="150207G20101013G046" >永进村09</option>

	<option value="150207G20101013G047" >永进村10</option>

	<option value="150207G20101013G048" >永进村11</option>

	<option value="150207G20101013G049" >永进村12</option>

	<option value="150207G20101013G050" >永进村13</option>

	<option value="150207G20101013G051" >永进村14</option>

	<option value="150207G20101013G052" >永进村15</option>

	<option value="150207G20101013G053" >永进村16</option>

	<option value="150207G20101013G054" >永进村17</option>

	<option value="150207G20101013G055" >黎明村01</option>

	<option value="150207G20101013G056" >黎明村02</option>

	<option value="150207G20101013G057" >黎明村03</option>

	<option value="150207G20101013G058" >黎明村04</option>

	<option value="150207G20101013G059" >草庙村17</option>

	<option value="150207G20101013G060" >草庙村18</option>

	<option value="150207G20101013G061" >中发村07</option>

	<option value="150207G20101013G062" >中发村08</option>

	<option value="150209G20101015H001" >胜源村01</option>

	<option value="150209G20101015H002" >光辉01</option>

	<option value="150209G20101015H003" >新华村01</option>

	<option value="150209G20101015H004" >新华村02</option>

	<option value="150209G20101015H005" >乐园村01</option>

	<option value="150209G20101015H006" >常堡村01</option>

	<option value="150209G20101015H007" >民利村01</option>

	<option value="150209G20101015H008" >北星村01</option>

	<option value="150209G20101015H009" >常堡村02</option>

	<option value="150209G20101015H010" >乐园村02</option>

	<option value="150209G20101015H011" >胜源村02</option>

	<option value="150209G20101015H012" >北星村02</option>

	<option value="150209G20101015H013" >新华村03</option>

	<option value="150209G20101015H014" >七寸河子01</option>

	<option value="150209G20101015H015" >辉煌01</option>

	<option value="150209G20101015H016" >辉煌02</option>

	<option value="150209G20101015H017" >新华村04</option>

	<option value="150209G20101015H018" >蓝彩桥01</option>

	<option value="150209G20101015H019" >常堡村03</option>

	<option value="150209G20101015H020" >胜源村03</option>

	<option value="150209G20101015H021" >辉煌03</option>

	<option value="150209G20101015H022" >民利村02</option>

	<option value="150209G20101015H023" >劳动村01</option>

	<option value="150209G20101015H024" >民利村03</option>

	<option value="150209G20101015H025" >劳动村02</option>

	<option value="150209G20101015H026" >常堡村04</option>

	<option value="150209G20101015H027" >兰彩桥01</option>

	<option value="150209G20101015H028" >民利村04</option>

	<option value="150209G20101015H029" >民利村05</option>

	<option value="150209G20101015H030" >东局村01</option>

	<option value="150209G20101015H031" >东局村02</option>

	<option value="150209G20101015H032" >石庙子01</option>

	<option value="150209G20101015H033" >石庙子02</option>

	<option value="150209G20101015H034" >乐园村03</option>

	<option value="150209G20101015H035" >乐园村04</option>

	<option value="150209G20101015H036" >乐园村05</option>

	<option value="150209G20101015H037" >乐园村06</option>

	<option value="150209G20101015H038" >光辉02</option>

	<option value="150209G20101015H039" >光辉03</option>

	<option value="150209G20101015H040" >乐园村07</option>

	<option value="150209G20101015H041" >乐园村08</option>

	<option value="150209G20101015H042" >乐园村09</option>

	<option value="150209G20101015H043" >乐园村10</option>

	<option value="150209G20101015H044" >乐园村11</option>

	<option value="150209G20101015H045" >监测点名称待确认</option>

	<option value="150209G20101015H046" >监测点名称待确认</option>

	<option value="150209G20101015H047" >民利村06</option>

	<option value="150209G20101015H048" >乐园村12</option>

	<option value="150209G20101015H049" >乐园村13</option>

	<option value="150209G20101015H050" >王家炉01</option>

	<option value="150209G20101015H051" >王家炉02</option>

	<option value="150209G20101015H052" >民利村07</option>

	<option value="150209G20101015H053" >常堡村05</option>

	<option value="150209G20101015H054" >常堡村06</option>

	<option value="150209G20101015H055" >七寸河子02</option>

	<option value="150209G20101015H056" >岗里村01</option>

	<option value="150209G20101015H057" >岗里村02</option>

	<option value="150209G20101015H058" >岗里村03</option>

	<option value="150209G20101015H059" >篮彩桥村01</option>

	<option value="150209G20101015H060" >蔡家街01</option>

	<option value="150209G20101015H061" >篮彩桥村02</option>

	<option value="150209G20101015H062" >蔡家街02</option>

	<option value="150209G20101015H063" >劳动村03</option>

	<option value="150209G20101015H064" >劳动村04</option>

	<option value="150209G20101015H065" >劳动村05</option>

	<option value="150209G20101015H066" >劳动村06</option>

	<option value="150209G20101015H067" >石庙子03</option>

	<option value="150209G20101015H068" >石庙子04</option>

	<option value="150209G20101015H069" >民主村03</option>

	<option value="150209G20101015H070" >民主村04</option>

	<option value="150209G20101015H071" >石庙子村05</option>

	<option value="150211G20101014I001" >胜进01</option>

	<option value="150211G20101014I002" >四里界01</option>

	<option value="150211G20101014I003" >八一村01</option>

	<option value="150211G20101014I004" >胜进村02</option>

	<option value="150211G20101014I005" >四里界02</option>

	<option value="150211G20101014I006" >双利01</option>

	<option value="150211G20101014I007" >陈香店01</option>

	<option value="150211G20101014I008" >监测点名称待确认</option>

	<option value="150211G20101014I009" >八一村02</option>

	<option value="150211G20101014I010" >陈香店02</option>

	<option value="150211G20101014I011" >八一村03</option>

	<option value="150211G20101014I012" >双利02</option>

	<option value="150211G20101014I013" >八一村04</option>

	<option value="150211G20101014I014" >四里界03</option>

	<option value="150211G20101014I015" >四里界04</option>

	<option value="150211G20101014I016" >双利村03</option>

	<option value="150211G20101014I017" >双利村04</option>

	<option value="150211G20101014I018" >双利村05</option>

	<option value="150211G20101014I019" >双利村06</option>

	<option value="150211G20101014I020" >双星村01</option>

	<option value="150211G20101014I021" >胜丰村01</option>

	<option value="150211G20101014I022" >胜丰村02</option>

	<option value="150211G20101014I023" >胜丰村03</option>

	<option value="150211G20101014I024" >胜丰村04</option>

	<option value="150211G20101014I025" >八一村05</option>

	<option value="150211G20101014I026" >八一村06</option>

	<option value="150211G20101014I027" >八一村07</option>

	<option value="150211G20101014I028" >双星村02</option>

	<option value="150211G20101014I029" >双星村03</option>

	<option value="150211G20101014I030" >双山村01</option>

	<option value="150211G20101014I031" >双山村02</option>

	<option value="150211G20101014I032" >双利村07</option>

	<option value="150211G20101014I033" >监测点名称待确认</option>

	<option value="150211G20101014I034" >监测点名称待确认</option>

	<option value="150211G20101014I035" >八一村08</option>

	<option value="150211G20101014I036" >八一村09</option>

	<option value="150211G20101014I037" >八一村10</option>

	<option value="150211G20101014I038" >八一村11</option>

	<option value="150211G20101014I039" >八一村12</option>

	<option value="150211G20101014I040" >八一村13</option>

	<option value="150211G20101014I041" >胜远村01</option>

	<option value="150211G20101014I042" >胜远村02</option>

	<option value="150211G20101014I043" >胜远村03</option>

	<option value="150211G20101014I044" >胜远村04</option>

	<option value="150211G20101014I045" >胜远村05</option>

	<option value="150211G20101014I046" >胜远村06</option>

	<option value="150211G20101014I047" >胜远村07</option>

	<option value="150211G20101014I048" >胜远村08</option>

	<option value="150211G20101014I049" >胜远村09</option>

	<option value="150211G20101014I050" >胜远村10</option>

	<option value="150211G20101014I051" >双兴村01</option>

	<option value="150211G20101014I052" >双兴村02</option>

	<option value="150211G20101014I053" >双兴村03</option>

	<option value="150211G20101014I054" >双兴村04</option>

	<option value="150211G20101014I055" >双兴村05</option>

	<option value="150211G20101014I056" >双兴村06</option>

	<option value="150211G20101014I057" >双兴村07</option>

	<option value="150211G20101014I058" >双兴村08</option>

	<option value="150211G20101014I059" >双兴村09</option>

	<option value="150211G20101014I060" >双兴村10</option>

	<option value="150227G20101009P001" >兰旗村01</option>

	<option value="150227G20101009P002" >兰旗村02</option>

	<option value="150227G20101009P003" >兰旗村03</option>

	<option value="150227G20101009P004" >背荫河镇村01</option>

	<option value="150227G20101009P005" >关家村01</option>

	<option value="150227G20101009P006" >关家村02</option>

	<option value="150227G20101009P007" >富有村01</option>

	<option value="150227G20101009P008" >富有村02</option>

	<option value="150227G20101009P009" >白旗村01</option>

	<option value="150227G20101009P010" >白旗村02</option>

	<option value="150227G20101009P011" >赵戏村01</option>

	<option value="150227G20101009P012" >赵戏村02</option>

	<option value="150227G20101009P013" >赵戏村03</option>

	<option value="150227G20101009P014" >赵戏村04</option>

	<option value="150227G20101009P015" >郑家村01</option>

	<option value="150227G20101009P016" >郑家村02</option>

	<option value="150227G20101009P017" >大合村01</option>

	<option value="150227G20101009P018" >大合村02</option>

	<option value="150227G20101009P019" >富有村03</option>

	<option value="150227G20101009P020" >富有村04</option>

	<option value="150227G20101009P021" >背荫河镇村02</option>

	<option value="150227G20101009P022" >背荫河镇村03</option>

	<option value="150227G20101009P023" >背荫河镇村04</option>

	<option value="150227G20101009P024" >背荫河镇村05</option>

	<option value="150227G20101009P025" >背荫河镇村06</option>

	<option value="150227G20101009P026" >背荫河镇村07</option>

	<option value="150227G20101009P027" >背荫河镇村08</option>

	<option value="150227G20101009P028" >背荫河镇村09</option>

	<option value="150227G20101009P029" >赵戏村05</option>

	<option value="150227G20101009P030" >赵戏村06</option>

	<option value="150227G20101009P031" >富有村05</option>

	<option value="150227G20101009P032" >富有村06</option>

	<option value="150227G20101009P033" >富有村07</option>

	<option value="150227G20101009P034" >富有村08</option>

	<option value="150227G20101009P035" >郑家村03</option>

	<option value="150227G20101009P036" >郑家村04</option>

	<option value="150227G20101009P037" >郑家村05</option>

	<option value="150227G20101009P038" >郑家村06</option>

	<option value="150227G20101009P039" >背荫河镇村10</option>

	<option value="150227G20101009P040" >背荫河镇村11</option>

	<option value="150227G20101009P041" >背荫河镇村12</option>

	<option value="150227G20101009P042" >背荫河镇村13</option>

	<option value="150227G20101009P043" >郑家村07</option>

	<option value="150227G20101009P044" >郑家村08</option>

	<option value="150227G20101009P045" >郑家村09</option>

	<option value="150227G20101009P046" >赵戏村07</option>

	<option value="150227G20101009P047" >赵戏村08</option>

	<option value="150227G20101009P048" >富有村09</option>

	<option value="150227G20101009P049" >富有村10</option>

	<option value="150227G20101009P050" >红旗村09</option>

	<option value="150227G20101009P051" >红旗村10</option>

	<option value="150227G20101009P052" >背荫河镇村14</option>

	<option value="150227G20101009P053" >背荫河镇村15</option>

	<option value="150228G20101006Q001" >监测点名称待确认</option>

	<option value="150228G20101006Q002" >营城子乡01</option>

	<option value="150228G20101006Q003" >南土01</option>

	<option value="150228G20101006Q004" >星光01</option>

	<option value="150228G20101006Q005" >星光02</option>

	<option value="150228G20101006Q006" >红旗村01</option>

	<option value="150228G20101006Q007" >靠河村01</option>

	<option value="150228G20101006Q008" >星光03</option>

	<option value="150228G20101006Q009" >红旗村02</option>

	<option value="150228G20101006Q010" >星光三号06</option>

	<option value="150228G20101006Q011" >星光四号07</option>

	<option value="150228G20101006Q012" >红旗村03</option>

	<option value="150228G20101006Q013" >红旗村04</option>

	<option value="150228G20101006Q014" >靠河村02</option>

	<option value="150228G20101006Q015" >星光04</option>

	<option value="150228G20101006Q016" >南土02</option>

	<option value="150228G20101006Q017" >靠河村03</option>

	<option value="150228G20101006Q018" >南土03</option>

	<option value="150228G20101006Q019" >靠河村04</option>

	<option value="150228G20101006Q020" >南土04</option>

	<option value="150228G20101006Q021" >南土05</option>

	<option value="150228G20101006Q022" >南土06</option>

	<option value="150228G20101006Q023" >营城子乡02</option>

	<option value="150228G20101006Q024" >星光05</option>

	<option value="150228G20101006Q025" >靠河村05</option>

	<option value="150228G20101006Q026" >营城子乡03</option>

	<option value="150228G20101006Q027" >红旗村05</option>

	<option value="150228G20101006Q028" >红旗村06</option>

	<option value="150228G20101006Q029" >蓝大桥村01</option>

	<option value="150228G20101006Q030" >蓝大桥村02</option>

	<option value="150228G20101006Q031" >计家村01</option>

	<option value="150228G20101006Q032" >计家村02</option>

	<option value="150228G20101006Q033" >计家村03</option>

	<option value="150228G20101006Q034" >计家村04</option>

	<option value="150228G20101006Q035" >古榆村01</option>

	<option value="150228G20101006Q036" >古榆村02</option>

	<option value="150228G20101006Q037" >靠河村06</option>

	<option value="150228G20101006Q038" >红旗村07</option>

	<option value="150228G20101006Q039" >红旗村08</option>

	<option value="150228G20101006Q040" >营城子村01</option>

	<option value="150229G20101012R001" >安家01</option>

	<option value="150229G20101012R002" >灯塔村01</option>

	<option value="150229G20101012R003" >东升村01</option>

	<option value="150229G20101012R004" >中心村01</option>

	<option value="150229G20101012R005" >双绕村01</option>

	<option value="150229G20101012R006" >黎树村05</option>

	<option value="150229G20101012R007" >中心村02</option>

	<option value="150229G20101012R008" >永进村01</option>

	<option value="150229G20101012R009" >永进村02</option>

	<option value="150229G20101012R010" >永进村03</option>

	<option value="150229G20101012R011" >黎树村06</option>

	<option value="150229G20101012R012" >民乐01</option>

	<option value="150229G20101012R013" >东升村02</option>

	<option value="150229G20101012R014" >富盛01</option>

	<option value="150229G20101012R015" >民乐02</option>

	<option value="150229G20101012R016" >民乐03</option>

	<option value="150229G20101012R017" >富盛02</option>

	<option value="150229G20101012R018" >富盛03</option>

	<option value="150229G20101012R019" >富盛04</option>

	<option value="150229G20101012R020" >铁西村01</option>

	<option value="150229G20101012R021" >铁西村02</option>

	<option value="150229G20101012R022" >双喜村01</option>

	<option value="150229G20101012R023" >兴业村01</option>

	<option value="150229G20101012R024" >兴业村02</option>

	<option value="150229G20101012R025" >蛤蟆塘村01</option>

	<option value="150229G20101012R026" >蛤蟆塘村02</option>

	<option value="150229G20101012R027" >民主村01</option>

	<option value="150229G20101012R028" >民主村02</option>

	<option value="150229G20101012R029" >河东村01</option>

	<option value="150229G20101012R030" >大荒村01</option>

	<option value="150229G20101012R031" >大荒村02</option>

	<option value="150229G20101012R032" >安家村01</option>

	<option value="150229G20101012R033" >安家村02</option>

	<option value="150229G20101012R034" >安家村03</option>

	<option value="150229G20101012R035" >铁西村03</option>

	<option value="150229G20101012R036" >铁西村04</option>

	<option value="150229G20101012R037" >铁西村05</option>

	<option value="150229G20101012R038" >房身岗01</option>

	<option value="150229G20101012R039" >房身岗02</option>

	<option value="150229G20101012R040" >房身岗03</option>

	<option value="150229G20101016S001" >监测点名称待确认</option>

	<option value="150229G20101016S002" >富胜村01</option>

	<option value="150229G20101016S003" >民乐乡村01</option>

	<option value="150229G20101016S004" >振兴村01</option>

	<option value="150229G20101016S005" >富胜村02</option>

	<option value="150229G20101016S006" >红光村01</option>

	<option value="150229G20101016S007" >富胜村03</option>

	<option value="150229G20101016S008" >民乐乡村02</option>

	<option value="150229G20101016S009" >民乐乡村03</option>

	<option value="150229G20101016S010" >双义村01</option>

	<option value="150229G20101016S011" >双义村02</option>

	<option value="150229G20101016S012" >双义村03</option>

	<option value="150229G20101016S013" >双义村04</option>

	<option value="150229G20101016S014" >新乐村01</option>

	<option value="150229G20101016S015" >新乐村02</option>

	<option value="150229G20101016S016" >振兴村02</option>

	<option value="150229G20101016S017" >振兴村03</option>

	<option value="150229G20101016S018" >远胜村01</option>

	<option value="150229G20101016S019" >远胜村02</option>

	<option value="150229G20101016S020" >红光村02</option>

	<option value="150229G20101016S021" >红光村03</option>

	<option value="150229G20101016S022" >红光村04</option>

	<option value="150229G20101016S023" >红光村05</option>

	<option value="150229G20101016S024" >红光村06</option>

	<option value="150229G20101016S025" >红光村07</option>

	<option value="150229G20101016S026" >双星村04</option>

	<option value="150229G20101016S027" >双星村05</option>

	<option value="150229G20101016S028" >陆家村01</option>

	<option value="150229G20101016S029" >陆家村02</option>

	<option value="150229G20101016S030" >民乐乡村04</option>

	<option value="150229G20101016S031" >民乐乡村05</option>

	<option value="150229G20101016S032" >陆家村03</option>

	<option value="150229G20101016S033" >陆家村04</option>

	<option value="150229G20101016S034" >民乐乡村06</option>

	<option value="150229G20101016S035" >民乐乡村07</option>

	<option value="150229G20101016S036" >富胜村04</option>

	<option value="150229G20101016S037" >红光村08</option>

	<option value="150229G20101016S038" >振兴村04</option>

	<option value="150229G20101016S039" >双义村05</option>

	<option value="150229G20101016S040" >双义村06</option>

	<option value="150229G20101016S041" >双义村07</option>

	<option value="150229G20101016S042" >双义村08</option>

	<option value="150229G20101016S043" >富胜村05</option>

	<option value="150229G20101016S044" >富胜村06</option>

	<option value="150229G20101016S045" >友谊村01</option>

	<option value="150229G20101016S046" >友谊村02</option>

	<option value="150229G20101016S047" >友谊村03</option>

	<option value="150229G20101016S048" >友谊村04</option>

	<option value="150229G20101016S049" >友谊村05</option>

	<option value="150231G20101010T001" >先锋村01</option>

	<option value="150231G20101010T002" >开发村01</option>

	<option value="150231G20101010T003" >七一村01</option>

	<option value="150231G20101010T004" >正兴村01</option>

	<option value="150231G20101010T005" >金星村01</option>

	<option value="150231G20101010T006" >幸福村01</option>

	<option value="150231G20101010T007" >永联村01</option>

	<option value="150231G20101010T008" >永联村02</option>

	<option value="150231G20101010T009" >正兴村02</option>

	<option value="150231G20101010T010" >长兴村01</option>

	<option value="150231G20101010T011" >半截河子村01</option>

	<option value="150231G20101010T012" >半截河子村02</option>

	<option value="150231G20101010T013" >先锋村02</option>

	<option value="150231G20101010T014" >长兴村刘瓦房屯05</option>

	<option value="150231G20101010T015" >永联村03</option>

	<option value="150231G20101010T016" >永联村04</option>

	<option value="150231G20101010T017" >金星村02</option>

	<option value="150231G20101010T018" >先锋村03</option>

	<option value="150231G20101010T019" >先锋村04</option>

	<option value="150231G20101010T020" >长兴村02</option>

	<option value="150231G20101010T021" >长兴村03</option>

	<option value="150231G20101010T022" >永联村05</option>

	<option value="150231G20101010T023" >杜家镇村01</option>

	<option value="150231G20101010T024" >杜家镇村02</option>

	<option value="150231G20101010T025" >杜家镇村03</option>

	<option value="150231G20101010T026" >监测点名称待确认</option>

	<option value="150231G20101010T027" >复兴村01</option>

	<option value="150231G20101010T028" >监测点名称待确认</option>

	<option value="150231G20101010T029" >杜家镇村04</option>

	<option value="150231G20101010T030" >先锋村05</option>

	<option value="150231G20101010T031" >先锋村06</option>

	<option value="150231G20101010T032" >幸福村02</option>

	<option value="150231G20101010T033" >幸福村03</option>

	<option value="150231G20101010T034" >七一村02</option>

	<option value="150231G20101010T035" >七一村03</option>

	<option value="150231G20101010T036" >金星村03</option>

	<option value="150231G20101010T037" >金星村04</option>

	<option value="150231G20101010T038" >开发村02</option>

	<option value="150231G20101010T039" >开发村03</option>

	<option value="150231G20101010T040" >曙光村01</option>

	<option value="150231G20101010T041" >曙光村02</option>

	<option value="150231G20101010T042" >半截河子村06</option>

	<option value="150231G20101010T043" >半截河子村03</option>

	<option value="150231G20101010T044" >长兴村04</option>

	<option value="150231G20101010T045" >杜家镇村05</option>

	<option value="150231G20101010T046" >杜家镇村06</option>

	<option value="150231G20101010T047" >半截河子村04</option>

	<option value="150231G20101010T048" >半截河子村05</option>

	<option value="150231G20101010T049" >长星01</option>

	<option value="150231G20101010T050" >长星02</option>

	<option value="150231G20101010T051" >长星03</option>

	<option value="150231G20101010T052" >正星01</option>

	<option value="150231G20101010T053" >正星02</option>

	<option value="150231G20101010T054" >正星03</option>

	<option value="150231G20101010T055" >正星04</option>

	<option value="150231G20101010T056" >正星05</option>

	<option value="150231G20101010T057" >杜家镇村07</option>

	<option value="150231G20101010T058" >七一村04</option>

	<option value="150231G20101010T059" >七一村05</option>

	<option value="150231G20101010T060" >七一村06</option>

	<option value="150231G20101010T061" >幸福村04</option>

	<option value="150231G20101010T062" >幸福村05</option>

	<option value="150231G20101010T063" >幸福村06</option>

	<option value="150231G20101010T064" >幸福村07</option>

	<option value="150232G20101008U001" >东光村01</option>

	<option value="150232G20101008U002" >沿河村01</option>

	<option value="150232G20101008U003" >沿河村02</option>

	<option value="150232G20101008U004" >东光村03</option>

	<option value="150232G20101008U005" >东光村02</option>

	<option value="150232G20101008U006" >太平山村01</option>

	<option value="150232G20101008U007" >太平山村02</option>

	<option value="150232G20101008U008" >太平山村03</option>

	<option value="150232G20101008U009" >太平山村04</option>

	<option value="150232G20101008U010" >太平山村05</option>

	<option value="150232G20101008U011" >山河镇村01</option>

	<option value="150232G20101008U012" >山河镇村02</option>

	<option value="150232G20101008U013" >平安村01</option>

	<option value="150232G20101008U014" >平安村02</option>

	<option value="150232G20101008U015" >平安村03</option>

	<option value="150232G20101008U016" >长胜村01</option>

	<option value="150232G20101008U017" >长胜村02</option>

	<option value="150232G20101008U018" >长胜村03</option>

	<option value="150232G20101008U019" >长胜村04</option>

	<option value="150232G20101008U020" >长胜村05</option>

	<option value="150232G20101008U021" >付船口村01</option>

	<option value="150232G20101008U022" >兴旺村01</option>

	<option value="150232G20101008U023" >兴旺村02</option>

	<option value="150232G20101008U024" >兴旺村03</option>

	<option value="150232G20101008U025" >永胜村06</option>

	<option value="150232G20101008U026" >太平山村06</option>

	<option value="150232G20101008U027" >太平山村07</option>

	<option value="150232G20101008U028" >福安村01</option>

	<option value="150232G20101008U029" >福安村02</option>

	<option value="150232G20101008U030" >万宝村03</option>

	<option value="150232G20101008U031" >万宝村04</option>

	<option value="150232G20101008U032" >双兴乡01</option>

	<option value="150232G20101008U033" >沿河村03</option>

	<option value="150232G20101008U034" >太平山村08</option>

	<option value="150232G20101008U035" >东光村04</option>

	<option value="150232G20101008U036" >福安村03</option>

	<option value="150232G20101008U037" >福安村04</option>

	<option value="150232G20101008U038" >太平山村09</option>

	<option value="150232G20101008U039" >太平山村10</option>

	<option value="150232G20101008U040" >福安村05</option>

	<option value="150232G20101008U041" >付船口村02</option>

	<option value="150232G20101008U042" >付船口村03</option>

	<option value="150232G20101008U043" >爱路01</option>

	<option value="150232G20101008U044" >爱路02</option>

	<option value="150232G20101008U045" >福安村06</option>

	<option value="150232G20101008U046" >山河镇村03</option>

	<option value="150232G20101008U047" >太平川村01</option>

	<option value="150232G20101008U048" >太平川村02</option>

	<option value="150232G20101008U049" >太平川村03</option>

	<option value="150232G20101008U050" >太平川村04</option>

	<option value="150232G20101008U051" >太平川村05</option>

	<option value="150232G20101008U052" >太平山村11</option>

	<option value="150232G20101008U053" >太平山村12</option>

	<option value="150232G20101008U054" >太平山村13</option>

	<option value="150232G20101008U055" >太平山村14</option>

	<option value="150232G20101008U056" >长胜村06</option>

	<option value="150232G20101008U057" >长胜村07</option>

	<option value="150232G20101008U058" >长胜村08</option>

	<option value="150232G20101008U059" >长胜村09</option>

	<option value="150232G20101008U060" >长胜村10</option>

</select>
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">有机质(g/Kg)：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-numberbox" type="text" name="omvalue" value="" data-options="min:0,max:999999999.99,precision:2,groupSeparator:','"  style="width:170px;"></input>
		    				<span class="span_common_mustinput_style">*</span>
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">碱解氮(mg/Kg)：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-numberbox" type="text" name="alkelinen" value=""  data-options="min:0,max:999999999.99,precision:2,groupSeparator:','" style="width:170px;"></input>
		    				<span class="span_common_mustinput_style">*</span>
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">有效磷(mg/Kg)：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-numberbox" type="text" name="olsenp" value="" data-options="min:0,max:999999999.99,precision:2,groupSeparator:','"  style="width:170px;"></input>
		    				<span class="span_common_mustinput_style">*</span>
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">速效钾(mg/Kg)：</td>
		    			<td class="table_common_td_txt_style"> 
		    				<input class="easyui-numberbox" type="text" name="olsenk" value="" data-options="min:0,max:999999999.99,precision:2,groupSeparator:','"  style="width:170px;"></input>
		    				<span class="span_common_mustinput_style">*</span>
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">PH值：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-numberbox" type="text" name="ph" value="" data-options="min:0,max:999999999.99,precision:2,groupSeparator:','"  style="width:170px;"></input>
		    				<span class="span_common_mustinput_style">*</span>
		    			</td>
	    			</tr>
	    			<tr height="30">
		    			<td colspan="2" align="center">
			    			<a href="#" class="easyui-linkbutton" onclick="formCheck()" data-options="iconCls:'icon-save'">保存</a>
			    			<a href="#" class="easyui-linkbutton" style="margin-left:15px;" onclick="closeEdiDialog()" data-options="iconCls:'icon-cancel'">取消</a>
		    			</td>
	    			</tr>
				</table>
			</fieldset>
		</form>
	</div>
<script type="text/javascript">
function formCheck(){
	if(!check()) return ;
	var a = $('#addFrom').toObject();
	Public.ajaxPost('save', JSON.stringify(a), function(e) {
		if (200 == e.status) {
			$.messager.alert('提示','保存成功。','info');
			closeEdiDialog();
			$('#inputForm').submit();
		} else {
			$.messager.alert('错误','保存失败','error');
		}
	});
}

function closeEdiDialog(){
	$('#addDialog').dialog('close');
}
function check(){
	if($("input[name='omvalue']").val()==""){
		$.messager.alert('警告','请填写有机质！','warning');
		return false;
	}else if (!isNumber($("input[name='omvalue']").val())){
		$.messager.alert('警告','有机质请输入数字！','warning');
		return false;
	}
	if($("input[name='alkelinen']").val()==""){
		$.messager.alert('警告','请填写碱解氮！','warning');
		return false;
	}else if (!isNumber($("input[name='omvalue']").val())){
		$.messager.alert('警告','碱解氮请输入数字！','warning');
		return false;
	}
	if($("input[name='olsenp']").val()==""){
		$.messager.alert('警告','请填写有效磷！','warning');
		return false;
	}else if (!isNumber($("input[name='omvalue']").val())){
		$.messager.alert('警告','效磷请输入数字！','warning');
		return false;
	}
	if($("input[name='olsenk']").val()==""){
		$.messager.alert('警告','请填写速效钾！','warning');
		return false;
	}else if (!isNumber($("input[name='omvalue']").val())){
		$.messager.alert('警告','速效钾请输入数字！','warning');
		return false;
	}
	if($("input[name='ph']").val()==""){
		$.messager.alert('警告','请填写PH值！','warning');
		return false;
	}else if (!isNumber($("input[name='omvalue']").val())){
		$.messager.alert('警告','PH值请输入数字！','warning');
		return false;
	}
	return true;
}

</script>
</body>
</html>