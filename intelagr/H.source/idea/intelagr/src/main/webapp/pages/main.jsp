<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>五常优质水稻溯源监管平台</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/color.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/form2js.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/json2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
</head>
<body class="easyui-layout">  
    <div region="north" title="" split="false" class="mainTop">		
  		<a href="${pageContext.request.contextPath}/main" style="float:left;color:#000;font-size:30px;font-weight:bold;text-decoration:none;color:#666666;padding-left:10px;">五常优质水稻溯源监管平台</a>		
  		<div style="float:right;font-size:16px;padding-right:10px;">
  			hi,<c:out value="${user.userName}"></c:out> <a href="${pageContext.request.contextPath}/user/logout" target="_self" style="text-decoration:none;color:#449942">退出登陆</a>
  		</div>
    </div>
    <div region="west" split="true" title="管理后台" style="width:250px;"> 
    <ul id="menu_tree">
		<c:forEach items="${menuList}" var="m">
		<li class="menuTitleLi">
			<span class="menuTitle">${m.parent}</span>
			<ul>
				<c:forEach items="${m.child}" var="f">
				<li iconCls="icon-ok"><span><a onClick="addTab('${f.functionName}','${pageContext.request.contextPath}/${f.functionURL}')">${f.functionName}</a></span></li>
				</c:forEach>
			</ul>
		</li>
		</c:forEach>
	</ul>
    </div>
    <div id="region_center" region="center">
		<div id="center_tab" class="easyui-tabs" border="false" fit="true" style="">
		</div>
    </div>
	<div id="tree_click"></div>
	<div id="mm" class="easyui-menu" style="width:135px;">
		<div iconCls="icon-clear" id="mm_current" name="1">关闭当前</div>
		<div id="mm_all" name="2">关闭全部</div>
		<div id="mm_other" name="3">除此之外全部关闭</div>
		<div id="mm_left" name="4">关闭左侧全部</div>
		<div id="mm_right" name="5">关闭右侧全部</div>
	</div>
</body>
<script>

$(".menuTitleLi").eq(0).find("ul").show();
$(".menuTitleLi").eq(0).addClass("on");

$(".menuTitleLi").click(function(){
  if($(this).find("ul").css("display") != "block"){
    $(".menuTitleLi").removeClass("on");
    $(this).addClass("on");
    $(".menuTitleLi ul").slideUp();
    $(this).find("ul").slideDown();
  }
})

$(".menuTitleLi li a").click(function(){
  $(".menuTitleLi li").removeClass("bg");
  $(this).parents("li").addClass("bg");
})

$(document).ready(function(){
	$('#center_tab').tabs({
	    onContextMenu:function(e, title,index){
	        e.preventDefault();
	        if(index>=0){
	            $('#mm').menu('show', {
	                left: e.pageX,
	                top: e.pageY
	            }).data("tabTitle", title);
	        }
	    }
	});
	
	function closeTab(menu, type){
        var allTabs = $("#center_tab").tabs('tabs');
        var allTabtitle = [];
        $.each(allTabs,function(i,n){
            var opt=$(n).panel('options');
            if(opt.closable)
                allTabtitle.push(opt.title);
        });
        switch (type){
        	//关闭当前
            case "1" :
                var curTabTitle = $(menu).data("tabTitle");
                $("#center_tab").tabs("close", curTabTitle);
                return false;
            break;
            //关闭所有
            case "2" :
                for(var i=0; i<allTabtitle.length; i++){
                    $('#center_tab').tabs('close', allTabtitle[i]);
                }
            break;
            //关闭其它
            case "3" :
            	var curTabTitle = $(menu).data("tabTitle");
            	for(var i=0; i<allTabtitle.length; i++){
            		if(curTabTitle != allTabtitle[i]){
            			$('#center_tab').tabs('close', allTabtitle[i]);	
            		}
                }
            break;
            //关闭左侧全部
            case "4" :
           		var prevall = $('.tabs-selected').prevAll();
	           	 if(prevall.length==0){
	           		$.messager.alert('警告','左侧没有可关闭的标签页！','warning');
	           		return ;
	           	 }
	           	prevall.each(function(i,n){
	                var t=$('a:eq(0) span',$(n)).text();
	                $('#center_tab').tabs('close',t);
	            });
            break;
            case "5" :
            	var nextall = $('.tabs-selected').nextAll();
	           	if(nextall.length == 0){
	           		$.messager.alert('警告','右侧没有可关闭的标签页！','warning');
	           		return ;
	           	}
	           	nextall.each(function(i,n){
	                var t=$('a:eq(0) span',$(n)).text();
	                $('#center_tab').tabs('close',t);
	            });
            break;
        }
        
    }
	$("#mm").menu({
        onClick : function (item) {
            closeTab(this, item.name);
        }
    });
});

function addTab(title,url){	
	if($('#center_tab').tabs('exists',title) == true){ 
		$('#center_tab').tabs('select',title); 
		return updateTab();
	}
	$('#center_tab').tabs('add',{
		title:title,		
		content:'<iframe frameborder="0" scrolling="auto" style="width:100%;height:100%" src="'+url+'"></iframe>',
		closable:true,
		tools:[{
			iconCls:'icon-mini-refresh',
			handler:function(){	
				updateTab();
			}
		}]
	});
}

function updateTab(){
	var tab = $('#center_tab').tabs('getSelected');	
	$('#center_tab').tabs('update', {
		tab: tab,
		options:{
			//title:tab.panel('options').title
		}
	});		
}
</script>
</html>
