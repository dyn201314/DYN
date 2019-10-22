var Public = Public || {};
var Business = Business || {};
Public.isIE6 = !window.XMLHttpRequest; // ie6

/* 获取URL参数值 */
Public.getRequest = Public.urlParam = function() {
	var param, url = location.search, theRequest = {};
	if (url.indexOf("?") != -1) {
		var str = url.substr(1);
		strs = str.split("&");
		for ( var i = 0, len = strs.length; i < len; i++) {
			param = strs[i].split("=");
			theRequest[param[0]] = decodeURIComponent(param[1]);
		}
	}
	return theRequest;
};

/*
 * 通用post请求，返回json url:请求地址， params：传递的参数{...}， callback：请求成功回调
 */
Public.ajaxPost = function(url, params, callback) {
	$.ajax({
		type : "POST",
		url : url,
		contentType : 'application/json; charset=utf-8',
		data : params,
		dataType : "json",
		async : false,
		success : function(data, status) {
			callback(data);
		},
		error : function(err) {
			/**
			parent.Public.tips({
				type : 1,
				content : '操作失败，请检查您的网络链接！'
			});
			**/
			$.messager.alert('错误',"操作失败，请检查您的网络链接！",'error');
		}
	});
};


Public.ajaxGet = function(url, params, callback) {
	$.ajax({
		type : "GET",
		url : url,
		data : params,
		dataType : "json",
		async : false,
		success : function(data, status) {
			callback(data);
		},
		error : function(err) {
			/**
			parent.Public.tips({
				type : 1,
				content : '操作失败，请检查您的网络链接！'
			});
			**/
			$.messager.alert('错误',"操作失败，请检查您的网络链接！",'error');
		}
	});
};


/* 操作提示 */
Public.tips = function(options) {
	return new Public.Tips(options);
}
Public.Tips = function(options) {
	var defaults = {
		renderTo : 'body',
		type : 0,
		autoClose : true,
		removeOthers : true,
		time : undefined,
		top : 10,
		onClose : null,
		onShow : null
	}
	this.options = $.extend({}, defaults, options);
	this._init();

	!Public.Tips._collection ? Public.Tips._collection = [ this ]
			: Public.Tips._collection.push(this);

}

Public.Tips.removeAll = function() {
	try {
		for ( var i = Public.Tips._collection.length - 1; i >= 0; i--) {
			Public.Tips._collection[i].remove();
		}
	} catch (e) {
	}
}

Public.Tips.prototype = {
	_init : function() {
		var self = this, opts = this.options, time;
		if (opts.removeOthers) {
			Public.Tips.removeAll();
		}

		this._create();

		this.closeBtn.bind('click', function() {
			self.remove();
		});

		if (opts.autoClose) {
			time = opts.time || opts.type == 1 ? 5000 : 3000;
			window.setTimeout(function() {
				self.remove();
			}, time);
		}

	},

	_create : function() {
		var opts = this.options;
		this.obj = $(
				'<div class="ui-tips"><i></i><span class="close"></span></div>')
				.append(opts.content);
		this.closeBtn = this.obj.find('.close');

		switch (opts.type) {
		case 0:
			this.obj.addClass('ui-tips-success');
			break;
		case 1:
			this.obj.addClass('ui-tips-error');
			break;
		case 2:
			this.obj.addClass('ui-tips-warning');
			break;
		default:
			this.obj.addClass('ui-tips-success');
			break;
		}

		this.obj.appendTo('body').hide();
		this._setPos();
		if (opts.onShow) {
			opts.onShow();
		}

	},

	_setPos : function() {
		var self = this, opts = this.options;
		if (opts.width) {
			this.obj.css('width', opts.width);
		}
		var h = this.obj.outerHeight(), winH = $(window).height(), scrollTop = $(
				window).scrollTop();
		// var top = parseInt(opts.top) ? (parseInt(opts.top) + scrollTop) :
		// (winH > h ? scrollTop+(winH - h)/2 : scrollTop);
		var top = parseInt(opts.top) + scrollTop;
		this.obj.css({
			position : Public.isIE6 ? 'absolute' : 'fixed',
			left : '50%',
			top : top,
			zIndex : '9999',
			marginLeft : -self.obj.outerWidth() / 2
		});

		window.setTimeout(function() {
			self.obj.show().css({
				marginLeft : -self.obj.outerWidth() / 2
			});
		}, 150);

		if (Public.isIE6) {
			$(window).bind('resize scroll', function() {
				var top = $(window).scrollTop() + parseInt(opts.top);
				self.obj.css('top', top);
			})
		}
	},

	remove : function() {
		var opts = this.options;
		this.obj.fadeOut(200, function() {
			$(this).remove();
			if (opts.onClose) {
				opts.onClose();
			}
		});
	}
};
// 数值显示格式转化
Public.numToCurrency = function(val, dec) {
	val = parseFloat(val);
	dec = dec || 2; // 小数位
	if (val === 0 || isNaN(val)) {
		return '';
	}
	val = val.toFixed(dec).split('.');
	var reg = /(\d{1,3})(?=(\d{3})+(?:$|\D))/g;
	return val[0].replace(reg, "$1,") + '.' + val[1];
};
// 数值显示
Public.currencyToNum = function(val) {
	var val = String(val);
	if ($.trim(val) == '') {
		return 0;
	}
	val = val.replace(/,/g, '');
	val = parseFloat(val);
	return isNaN(val) ? 0 : val;
};
// 只允许输入数字
Public.numerical = function(e) {
	var allowed = '0123456789.-', allowedReg;
	allowed = allowed.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, '\\$&');
	allowedReg = new RegExp('[' + allowed + ']');
	var charCode = typeof e.charCode != 'undefined' ? e.charCode : e.keyCode;
	var keyChar = String.fromCharCode(charCode);
	if (!e.ctrlKey && charCode != 0 && !allowedReg.test(keyChar)) {
		e.preventDefault();
	}
	;
};

// 限制只能输入允许的字符，不支持中文的控制
Public.limitInput = function(obj, allowedReg) {
	var ctrlKey = null;
	obj.css('ime-mode', 'disabled').on('keydown', function(e) {
		ctrlKey = e.ctrlKey;
	}).on(
			'keypress',
			function(e) {
				allowedReg = typeof allowedReg == 'string' ? new RegExp(
						allowedReg) : allowedReg;
				var charCode = typeof e.charCode != 'undefined' ? e.charCode
						: e.keyCode;
				var keyChar = $.trim(String.fromCharCode(charCode));
				if (!ctrlKey && charCode != 0 && charCode != 13
						&& !allowedReg.test(keyChar)) {
					e.preventDefault();
				}
			});
};
// 限制输入的字符长度
Public.limitLength = function(obj, count) {
	obj.on('keyup', function(e) {
		if (count < obj.val().length) {
			e.preventDefault();
			obj.val(obj.val().substr(0, count));
		}
	});
};
/* 批量绑定页签打开 */
Public.pageTab = function() {
	$(document)
			.on(
					'click',
					'[rel=pageTab]',
					function(e) {
						e.preventDefault();
						// var right = $(this).data('right');
						// if (right && !Business.verifyRight(right)) {
						// return false;
						// };
						var tabid = $(this).attr('tabid'), url = $(this).attr(
								'href'), showClose = $(this).attr('showClose'), text = $(
								this).attr('tabTxt')
								|| $(this).text(), parentOpen = $(this).attr(
								'parentOpen');
						if (parentOpen) {
							parent.tab.addTabItem({
								tabid : tabid,
								text : text,
								url : url,
								showClose : showClose
							});
						} else {
							tab.addTabItem({
								tabid : tabid,
								text : text,
								url : url,
								showClose : showClose
							});
						}
					});
};

$.fn.artTab = function(options) {
	var defaults = {};
	var opts = $.extend({}, defaults, options);
	var callback = opts.callback || function() {
	};
	this.each(function() {
		var $tab_a = $("dt>a", this);
		var $this = $(this);
		$tab_a.bind("click", function() {
			var target = $(this);
			target.siblings().removeClass("cur").end().addClass("cur");
			var index = $tab_a.index(this);
			var showContent = $("dd>div", $this).eq(index);
			showContent.siblings().hide().end().show();
			callback(target, showContent, opts);
		});
		if (opts.tab)
			$tab_a.eq(opts.tab).trigger("click");
		if (location.hash) {
			var tabs = location.hash.substr(1);
			$tab_a.eq(tabs).trigger("click");
		}
	});
};

$.fn.enterKey = function() {
	this.each(function() {
		$(this).keydown(function(e) {
			if (e.which == 13) {
				var ref = $(this).data("ref");
				if (ref) {
					$('#' + ref).select().focus().click();
				} else {
					eval($(this).data("enterKeyHandler"));
				}
			}
		});
	});
};

// input占位符
$.fn.placeholder = function() {
	this.each(function() {
		$(this).focus(function() {
			if ($.trim(this.value) == this.defaultValue) {
				this.value = '';
			}
			$(this).removeClass('ui-input-ph');
		}).blur(function() {
			var val = $.trim(this.value);
			if (val == '' || val == this.defaultValue) {
				$(this).addClass('ui-input-ph');
			}
			val == '' && $(this).val(this.defaultValue);
		});
	});
};

// 单选框插件
$.fn.cssRadio = function(opts) {
	var opts = $.extend({}, opts);
	var $_radio = $('label.radio', this), $_this = this;

	var radioclick = function(event) {
		$_radio.find("input").removeAttr("checked");
		$_radio.removeClass("checked");
		$(this).find("input").attr("checked", "checked");
		$(this).addClass("checked");

		typeof opts.callback == 'function' && opts.callback($(this));
	}

	$_radio.each(function() {
		var self = $(this);
		if (self.find("input")[0].checked) {
			self.addClass("checked");
		}
		;

	}).hover(function() {
		$(this).addClass("over");
	}, function() {
		$(this).removeClass("over");
	}).click(radioclick);

	return {
		getValue : function() {
			return $_radio.find("input[checked]").val();
		},
		setValue : function(index) {
			return $_radio.eq(index).click();
		},
		disable : function() {
			$_radio.each(function() {
				var self = $(this);
				if (self.find("input")[0].checked) {
					self.removeClass('checked').addClass("dis_check");
				}
				;
			}).unbind('click');
		},
		enable : function() {
			$_radio.each(function() {
				var self = $(this);
				if (self.find("input")[0].checked) {
					self.removeClass('dis_check').addClass("checked");
				}
				;
			}).bind('click', radioclick);
		}
	}
};
// 复选框插件
$.fn.cssCheckbox = function() {
	var $_chk = $(".chk", this);
	$_chk.each(function() {
		if ($(this).find("input")[0].checked) {
			$(this).addClass("checked");
		}
		;
		if ($(this).find("input")[0].disabled) {
			$(this).addClass("dis_check");
		}
		;
	}).hover(function() {
		$(this).addClass("over")
	}, function() {
		$(this).removeClass("over")
	}).click(function(event) {
		if ($(this).find("input")[0].disabled) {
			return;
		}
		;
		$(this).toggleClass("checked");
		$(this).find("input")[0].checked = !$(this).find("input")[0].checked;
		event.preventDefault();
	});

	return {
		chkAll : function() {
			$_chk.addClass("checked");
			$_chk.find("input").attr("checked", "checked");
		},
		chkNot : function() {
			$_chk.removeClass("checked");
			$_chk.find("input").removeAttr("checked");
		},
		chkVal : function() {
			var val = [];
			$_chk.find("input:checked").each(function() {
				val.push($(this).val());
			});
			return val;
		}
	}
};

Public.getDefaultPage = function() {
	var win = window.self;
	do {
		if (win.CONFIG) {
			return win;
		}
		win = win.parent;
	} while (true);
};

// 权限验证
Business.verifyRight = function(right) {
	var system = Public.getDefaultPage().SYSTEM;
	var isAdmin = system.isAdmin;
	var siExperied = system.siExpired;
	var rights = system.rights;
	if (isAdmin && !siExperied) {
		return true;
	}
	;

	if (siExperied) {
		if (rights[right]) {
			return true;
		} else {
			var html = [
					'<div class="ui-dialog-tips">',
					'<h4 class="tit">谢谢您使用本产品，您的当前服务已经到期，到期3个月后数据将被自动清除，如需继续使用请购买/续费！</h4>',
					'</div>' ].join('');
			$.dialog({
				width : 280,
				title : '系统提示',
				icon : 'alert.gif',
				fixed : true,
				lock : true,
				resize : false,
				ok : true,
				content : html
			});
			return false;
		}
	} else {
		if (rights[right]) {
			return true;
		} else {
			var html = [ '<div class="ui-dialog-tips">',
					'<h4 class="tit">您没有该功能的使用权限哦！</h4>',
					'<p>请联系管理员（' + system.realName + '）为您授权！</p>', '</div>' ]
					.join('');
			$.dialog({
				width : 240,
				title : '系统提示',
				icon : 'alert.gif',
				fixed : true,
				lock : true,
				resize : false,
				ok : true,
				content : html
			});
			return false;
		}
	}
	;
};

Business.customerCombo = function($_obj, opts, $_vobj, append) {
	if ($_obj.length == 0) {
		return;
	}
	;

	var opts = $.extend(true, {
		data : '/Customer/CustomerAutoData',
		ajaxOptions : {
			formatData : function(data) {
				return data.rows;
			}
		},
		width : 200,
		height : 300,
		formatText : function(row) {

			return row.Name;
		},
		text : 'Name',
		value : 'CustomerId',
		defaultSelected : 0,
		defaultFlag : false,
		cache : false,
		editable : true,
		loadOnce : false,
		callback : {
			onChange : function(data) {
				if (data) {
					$_vobj.val(data.CustomerId);
					//
					if (append)
						$.isFunction(append.onChange) && append.onChange(data);
				}
			}
		}
	}, opts);

	if (append && append.showAdd)
		opts.extraListHtml = '<a href="javascript:void(0);" id="quickAddCustomer" class="quick-add-link"><i class="ui-icon-add"></i>新增客户</a>';

	var customerCombo = $_obj.combo(opts).getCombo();
	// 新增客户
	$('#quickAddCustomer').on(
			'click',
			function(e) {
				e.preventDefault();

				$.dialog({
					title : '新增客户',
					content : 'url:/Customer/CustomerEdit',
					data : {
						oper : 'add',
						callback : function(data, oper, dialogWin) {

							customerCombo.loadData(
									'/Customer/CustomerAutoData', [
											'CustomerId', data.CustomerId ]);
							dialogWin && dialogWin.api.close();
						}
					},
					width : 640,
					height : 456,
					max : false,
					min : false,
					cache : false,
					lock : true
				});
			});
	return customerCombo;
};

Business.goodsCombo = function($_obj, opts) {
	if ($_obj.length == 0) {
		return;
	}
	;
	var opts = $
			.extend(
					true,
					{
						data : '/Manage/GoodsGridData',
						ajaxOptions : {
							formatData : function(data) {
								parent.SYSTEM.goodsInfo = data.rows; // 更新
								return data.rows;
							}
						},
						formatText : function(data) {
							if (!data.Spec) {
								return data.Name;
							} else {
								return data.Name + '_' + data.Spec;
							}
						},
						value : 'GoodsId',
						defaultSelected : -1,
						editable : true,
						extraListHtml : '<a href="javascript:void(0);" id="quickAddGoods" class="quick-add-link"><i class="ui-icon-add"></i>新增商品</a>',
						maxListWidth : 500,
						cache : false,
						forceSelection : true,
						maxFilter : 10,
						trigger : false,
						listHeight : 182,
						listWrapCls : 'ui-droplist-wrap',
						loadOnce : false,
						callback : {
							onChange : function(data) {
								if (data) {
									var parentTr = this.input.parents('tr');

									parentTr.data('goodsInfo', {
										GoodsId : data.GoodsId,
										Number : data.Number,
										Name : data.Name,
										Spec : data.Spec,
										Unit : data.Unit
									});
								}
							},
							onListClick : function() {

							}
						},
						queryDelay : 0,
						inputCls : 'edit_subject',
						wrapCls : 'edit_subject_wrap',
						focusCls : '',
						disabledCls : '',
						activeCls : ''
					}, opts);

	var goodsCombo = $_obj.combo(opts).getCombo();

	// 新增商品
	$('#quickAddGoods').on('click', function(e) {
		e.preventDefault();
		$.dialog({
			title : '新增商品',
			content : 'url:/Manage/GoodsEdit',
			data : {
				oper : 'add',
				callback : function(data, oper, dialogWin) {
					var goodsId = data.GoodsId;

					parent.SYSTEM.goodsInfo.push(data);

					dialogWin && dialogWin.api.close();

					goodsCombo.loadData(parent.SYSTEM.goodsInfo, '-1', false);

					setTimeout(function() {
						goodsCombo.selectByValue(goodsId, true);
						$_obj.focus();
					}, 10);
				}
			},
			width : 640,
			height : 530,
			max : false,
			min : false,
			cache : false,
			lock : true
		});
	});
	return goodsCombo;
};

Business.billsEvent = function(obj, type, flag) {
	var _self = obj;
	// 新增分录
	$('.grid-wrap').on(
			'click',
			'.ui-icon-plus',
			function(e) {
				var cellEdit = $("#grid").jqGrid("getGridParam")['cellEdit'];
				if (!cellEdit)
					return;

				var rowId = $(this).parent().data('id');
				var newId = $('#grid tbody tr').length;
				var datarow = {
					id : _self.newId
				};
				var su = $("#grid").jqGrid('addRowData', _self.newId, datarow,
						'after', rowId);// 'before'
				if (su) {
					$(this).parents('td').removeAttr('class');
					$(this).parents('tr').removeClass(
							'selected-row ui-state-hover');
					$("#grid").jqGrid('resetSelection');
					_self.newId++;
				}
			});
	// 删除分录
	$('.grid-wrap').on('click', '.ui-icon-trash', function(e) {
		var cellEdit = $("#grid").jqGrid("getGridParam")['cellEdit'];
		if (!cellEdit)
			return;

		if ($('#grid tbody tr').length === 2) {
			parent.Public.tips({
				type : 2,
				content : '至少保留一条分录！'
			});
			return false;
		}
		var rowId = $(this).parent().data('id');
		var su = $("#grid").jqGrid('delRowData', rowId);
		if (su) {
			_self.calTotal && _self.calTotal();
		}
		;
	});
	// 批量添加
	$('.grid-wrap').on('click', '.ui-icon-ellipsis', function(e) {

		$.dialog({
			width : 620,
			height : 500,
			title : '选择商品',
			content : 'url:/Manage/GoodsBatch',
			data : {
				curId : _self.curId,
				newId : _self.newId,
				callback : function(newId, curId, curRow) {
					if (curId === '') {
						$("#grid").jqGrid('addRowData', newId, {}, 'last');
						_self.newId = newId + 1;
					}
					;
					setTimeout(function() {
						$("#grid").jqGrid("editCell", curRow, 2, true)
					}, 10);
					_self.calTotal && _self.calTotal();
				}
			},
			lock : true,
			ok : function() {
				this.content.callback(type);
				// return false;
			},
			cancel : true
		});
	});
	// 取消分录编辑状态
	$(document).bind(
			'click.cancel',
			function(e) {
				if (!$(e.target).closest(".ui-jqgrid-bdiv").length > 0
						&& curRow !== null && curCol !== null) {
					$("#grid").jqGrid("saveCell", curRow, curCol);
					curRow = null;
					curCol = null;
				}
				;
			});

};


function reloadImageView() {
	var outerDivId = "outerDiv";
	var innerDivId = "innerDiv";
	var imgSrcPaths = null;
	var imgInfos = null;
	var width = 300;
	var height = 400;
	var autoScrooll = true;
	var time = 2000;
	var arrowControl = true;
	var speed = 500;
	var numberControl = false;

	var html = "";
	switch (arguments.length) {
	case 11:
		numberControl = arguments[10];
	case 10:
		speed = arguments[9];
	case 9:
		arrowControl = arguments[8];
	case 8:
		time = arguments[7];
	case 7:
		autoScrooll = arguments[6];
	case 6:
		height = arguments[5];
	case 5:
		width = arguments[4];
	case 4:
		imgInfos = arguments[3];
	case 3:
		imgSrcPaths = arguments[2];
	case 2:
		innerDivId = arguments[1];
	case 1:
		outerDivId = arguments[0];
		break;
	default:
		return;
	}
	
	html += "<div class='yiz-slider-3 yiz-slider' id='"+innerDivId+"' data-yiz-slider='3' style='width:" + width + "px;height:" + height + "px'><ul>";
	if (imgSrcPaths == null || imgSrcPaths == '' || imgSrcPaths.length == 0) {
		html += "<li><img src='../images/nothing.png' alt='There is nothing to View.' /></li>";
	} else {
		for ( var index in imgSrcPaths) {
			var imgInfo = 'This picture has no description.';
			if (imgInfos != null && imgInfos.length > 0) {
				try {
					imgInfo = imgInfos[index];
				} catch (e) {
					imgInfo = '';
				}
			}
			html += "<li><a class='fancybox-buttons' data-fancybox-group='button' href='" + imgSrcPaths[index] + "' title='" + imgInfo + "'><img src='" + imgSrcPaths[index] + "' alt='" + imgInfo + "' /></a></li>";
		}
	}
	html += "</ul></div>";
	
	$('#'+outerDivId).html(html);
	
	$('#'+innerDivId).ScrollPic({
		Time : time,
		speed : speed,
		autoscrooll : autoScrooll,
		arrowcontrol : arrowControl,
		numbercontrol : numberControl
	});
}

// $.fn.toObject jQuery wrapper for form2object()
(function($) {

	/**
	 * jQuery wrapper for form2object() Extracts data from child inputs into
	 * javascript object
	 */
	$.fn.toObject = function(options) {
		var result = [], settings = {
			mode : 'first', // what to convert: 'all' or 'first' matched node
			delimiter : ".",
			skipEmpty : true,
			nodeCallback : null,
			useIdIfEmptyName : false
		};

		if (options) {
			$.extend(settings, options);
		}

		switch (settings.mode) {
		case 'first':
			return form2js(this.get(0), settings.delimiter, settings.skipEmpty,
					settings.nodeCallback, settings.useIdIfEmptyName);
			break;
		case 'all':
			this.each(function() {
				result.push(form2js(this, settings.delimiter,
						settings.skipEmpty, settings.nodeCallback,
						settings.useIdIfEmptyName));
			});
			return result;
			break;
		case 'combine':
			return form2js(Array.prototype.slice.call(this),
					settings.delimiter, settings.skipEmpty,
					settings.nodeCallback, settings.useIdIfEmptyName);
			break;
		}
	}

})(jQuery);
//是否是数字
function isNumber(value){
	var re=/^\d+(\.\d+)?$/; 
	if (!re.test(value)) return false;
	return true; 
}
//判断是否是正数
function isInt(value)
{
	var re = /^[0-9]+[0-9]*]*$/;
	if (!re.test(value)) return false;
	return true;
}

//判断是否是浮点数
function isFloat(value)
{
	var re = /^[-0-9]+([.]\d{1,2})?$/;;
	if (!re.test(value)) return false;
        return true;
}

//邮箱判断
function isEmail(email) {
	var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (filter.test(email)) {
        return true;
    }
    return false;
}

//手机和电话
function isTel(tel){
	var isPhone = /^([0-9]{3,4}-)?[0-9]{7,8}$/;
	var isMob = /^((\+?86)|(\(\+86\)))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/;
	if(isMob.test(tel) || isPhone.test(tel)){
		return true;
	}
	else{
		return false;
	}
}
/**
 * 小数位数控制
 * @param num
 * @param digits
 * @returns
 */
function numberDecimalDigits(num,digits){
	return num.toFixed(digits);
}
/**
 * 日期比较控制
 * @param startDate
 * @param endDate
 * @returns
 */
function dateCompare(startDate, endDate) {
	if(startDate == '' || endDate == '') return true;
    var arrStart = startDate.split("-");
    var startTime = new Date(arrStart[0], arrStart[1], arrStart[2]);
    var startTimes = startTime.getTime();

    var arrEnd = endDate.split("-");
    var endTime = new Date(arrEnd[0], arrEnd[1], arrEnd[2]);
    var endTimes = endTime.getTime();

    if (startTimes > endTimes) {
        return false;
    }
    else
        return true;

}

//采用jquery easyui loading css效果   
function showLoading(){   
    $("<div class=\"datagrid-mask\"></div>").css({display:"block",width:"100%",height:$(window).height()}).appendTo("body");   
    $("<div class=\"datagrid-mask-msg\"></div>").html("正在处理，请稍候。。。").appendTo("body").css({display:"block",left:($(document.body).outerWidth(true) - 190) / 2,top:($(window).height() - 45) / 2});   
 }   
 function hideLoading(){   
     $(".datagrid-mask").remove();   
     $(".datagrid-mask-msg").remove();               
}

 /**
  * 判断身份证长度是否合法
  * @param card
  * @returns {Boolean}
  */
function isCardNo( card ){  
     //身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X  
     var reg = /(^\d{15}$)|(^\d{17}(\d|X)$)/;  
     if(reg.test(card) === false){  
         return false;  
     }  
   
     return true;  
 }

/**
 * 去掉字符串首尾空格
 * @param str
 * @returns
 */
function trim(str){
	return str.replace(/(^\s*)|(\s*$)/g,"");
}

 /**
  * WolfSoul
  * 身份证号是否合格的校验方法,强类型校验,慎用吧...
  * @param idNumber
  * @return
  */
 function checkIdNumber(idNumber){ 
	idNumber = trim(idNumber);
	var Errors=new Array("身份证格式错误！","身份证号码出生日期超出范围或含有非法字符!","身份证号码错误,所输入的身份证号不会对应任何人!","身份证号中所示的地区代码非法!"); 
 	
 	//校验长度，类型 
    if(isCardNo(idNumber) === false){  
        return Errors[0];  
    }else{
    	return "";
    }
 	/*   2015-09-09陈松林提出，身份证号弱校验
 	var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};  
 	var Y,JYM; 
 	var S,M; 
 	var idNumber_array = new Array(); 
 	idNumber_array = idNumber.split(""); 
 	if(area[parseInt(idNumber.substr(0,2))]==null) 
 		return Errors[3]; 

 	switch(idNumber.length){ 
 		case 15: 
 			if( (parseInt(idNumber.substr(6,2))+1900) % 4 == 0 || ((parseInt(idNumber.substr(6,2))+1900) % 100 == 0 && (parseInt(idNumber.substr(6,2))+1900) % 4 == 0 )){ 
 				ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//测试出生日期的合法性 
 			}else{ 
 				ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//测试出生日期的合法性 
 			} 
 			
 			if(ereg.test(idNumber)){
 				return "";
 			}else{
 				return Errors[1];
 			}
 			break; 
 			
 		case 18: 
 			if ( parseInt(idNumber.substr(6,4)) % 4 == 0 || (parseInt(idNumber.substr(6,4)) % 100 == 0 && parseInt(idNumber.substr(6,4))%4 == 0 )){ 
 				ereg=/^[1-9][0-9]{5}[1-9][0-9][0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//闰年出生日期的合法性正则表达式 
 			}else{ 
 				ereg=/^[1-9][0-9]{5}[1-9][0-9][0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//平年出生日期的合法性正则表达式 
 			} 
 			if(ereg.test(idNumber)){
 				S = (parseInt(idNumber_array[0]) 		 + parseInt(idNumber_array[10])) * 7 	
 						+ (parseInt(idNumber_array[1]) + parseInt(idNumber_array[11])) * 9 
 						+ (parseInt(idNumber_array[2]) + parseInt(idNumber_array[12])) * 10 	
 						+ (parseInt(idNumber_array[3]) + parseInt(idNumber_array[13])) * 5
 						+ (parseInt(idNumber_array[4]) + parseInt(idNumber_array[14])) * 8
 						+ (parseInt(idNumber_array[5]) + parseInt(idNumber_array[15])) * 4
 						+ (parseInt(idNumber_array[6]) + parseInt(idNumber_array[16])) * 2
 						+  parseInt(idNumber_array[7]) * 1
 						+  parseInt(idNumber_array[8]) * 6
 						+  parseInt(idNumber_array[9]) * 3 ; 
 				
 				Y = S % 11;
 				M = "F";
 				JYM = "10X98765432"; 
 				M = JYM.substr(Y,1);
 				if(M == idNumber_array[17]){
 					return "";
 				}else{
 					return Errors[2];
 				}
 			}else{
 				return Errors[1]; 
 			}
 			break; 
 			
 		default: 
 			return "";
 			break; 
 	}
 	*/
 }
  