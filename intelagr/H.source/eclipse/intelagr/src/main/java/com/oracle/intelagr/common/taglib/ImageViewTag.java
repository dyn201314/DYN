package com.oracle.intelagr.common.taglib;

import java.io.IOException;
import java.io.Writer;
import java.util.Map;
import java.util.Set;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 图片浏览通用组件,实现前台页面的图片浏览功能
 */
public class ImageViewTag extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -763835065728527480L;
	private static final Logger log = LoggerFactory.getLogger(ImageViewTag.class);

	private String outerDivId;
	private String innerDivId;
	private String imgInfoMaps;
	private String time;
	private String speed;
	private String autoScrooll;
	private String arrowControl;
	private String numberControl;
	private String width;
	private String height;

	@Override
	public int doStartTag() throws JspException {

		Writer out = this.pageContext.getOut();
		StringBuffer buffer = new StringBuffer("\n");

		
		if (outerDivId == null || "".equals(outerDivId.trim())) {
			outerDivId = "outerDiv";
		}
		if (innerDivId == null || "".equals(innerDivId.trim())) {
			innerDivId = "innerDiv";
		}
		if (imgInfoMaps == null || "".equals(imgInfoMaps.trim())) {
			imgInfoMaps = "NotExsits";
		}
		//if (time == null || "".equals(time.trim())) {
			time = "0";
		//}
		if (speed == null || "".equals(speed.trim())) {
			speed = "500";
		}
		//if (autoScrooll == null || "".equals(autoScrooll.trim())) {
		autoScrooll = "false";
		//}
		if (arrowControl == null || "".equals(arrowControl.trim())) {
			arrowControl = "true";
		}
		if (numberControl == null || "".equals(numberControl.trim())) {
			numberControl = "false";
		}
		if (width == null || "".equals(width.trim())) {
			width = "300";
		}
		if (height == null || "".equals(height.trim())) {
			height = "400";
		}

		buffer.append("\n<link rel=\"stylesheet\" type=\"text/css\" href=\"" + this.pageContext.getServletContext().getContextPath() + "/style/jquery.scrollpic.css\">\n");
		buffer.append("\n<link rel=\"stylesheet\" type=\"text/css\" href=\"" + this.pageContext.getServletContext().getContextPath() + "/style/jquery.fancybox.css\" media=\"screen\" />\n");
		buffer.append("\n<link rel=\"stylesheet\" type=\"text/css\" href=\"" + this.pageContext.getServletContext().getContextPath() + "/style/jquery.fancybox-buttons.css\" />\n");
		buffer.append("\n<script type=\"text/javascript\" src=\"" + this.pageContext.getServletContext().getContextPath() + "/js/jquery.ScrollPic.js\"></script>\n");
		buffer.append("\n<script type=\"text/javascript\" src=\"" + this.pageContext.getServletContext().getContextPath() + "/js/jquery.fancybox.js\"></script>	\n");
		buffer.append("\n<script type=\"text/javascript\" src=\"" + this.pageContext.getServletContext().getContextPath() + "/js/jquery.fancybox-buttons.js\"></script>\n");
//		buffer.append("\n<script type=\"text/javascript\" src=\"" + this.pageContext.getServletContext().getContextPath() + "/js/jquery.mousewheel-3.0.6.pack.js\"></script>\n");

		buffer.append("\n<script type=\"text/javascript\">\n");
		buffer.append("\n	$(function(){\n");
		buffer.append("\n	$('.yiz-slider-3').ScrollPic({\n");
		buffer.append("\n		Time: " + time + ",\n");
		buffer.append("\n		speed: " + speed + ",\n");
		buffer.append("\n		autoscrooll: " + autoScrooll + ",\n");
		buffer.append("\n		arrowcontrol: " + arrowControl + ",\n");
		buffer.append("\n		numbercontrol: " + numberControl + "\n");
		buffer.append("\n	});\n");
		buffer.append("\n})\n");
		buffer.append("\n$(document).ready(function() {\n");
		buffer.append("\n$('.fancybox-buttons').fancybox({\n");
		buffer.append("\n	openEffect  : 'none',\n");
		buffer.append("\n	closeEffect : 'none',\n");
		buffer.append("\n	prevEffect : 'none',\n");
		buffer.append("\n	nextEffect : 'none',\n");
		buffer.append("\n	closeBtn  : true,\n");
		buffer.append("\n	helpers : {\n");
		buffer.append("\n		title : {\n");
		buffer.append("\n			type : 'inside'\n");
		buffer.append("\n		},\n");
		buffer.append("\n		buttons	: {}\n");
		buffer.append("\n	},\n");
		buffer.append("\n	afterLoad : function() {\n");
		buffer.append("\n		this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');\n");
		buffer.append("\n	}\n");
		buffer.append("\n});\n");
		buffer.append("\n});\n");
		buffer.append("\n</script>\n");

		buffer.append("\n<style>\n");
		//buffer.append("\na:link,a:visited{color:#0fa7ff;text-decoration:none;outline:none;cursor: pointer;}\n");
		//buffer.append("\na:hover{color:#ff6407;text-decoration:underline;}\n");
		buffer.append(".t1 a:link, .t1 a:visited{}");
		buffer.append("t1 a:hover{}");
		buffer.append("\n</style>\n");

		buffer.append("\n<div id='"+outerDivId+"'><div class=\"yiz-slider-3 yiz-slider\" id=\""+innerDivId+"\" data-yiz-slider=\"3\" style=\"width:" + width + "px;height:" + height + "px\">\n");
		buffer.append("\n <ul>\n");

		Map<String, String> imgProperties = (Map<String, String>) (pageContext.findAttribute(imgInfoMaps));
		if (imgProperties != null && !imgProperties.isEmpty()) {
			Set<String> imgSrcs = imgProperties.keySet();
			for (String imgSrc : imgSrcs) {
				if (imgProperties.get(imgSrc) == null) {
					imgProperties.put(imgSrc, "");
				}
				buffer.append("\n<li><a class=\"fancybox-buttons\" data-fancybox-group=\"button\" href=\"" + imgSrc + "\" title=\"" + imgProperties.get(imgSrc) + "\"><img src=\"" + imgSrc + "\" alt=\"" + imgProperties.get(imgSrc) + "\" /></a></li>\n");
			}
		} else {
			buffer.append("\n<li><img src=\"" + pageContext.getServletContext().getContextPath() + "/images/nothing.png\" alt=\"There is nothing to View.\" /></li>\n");
		}
		buffer.append("\n</ul>\n");
		buffer.append("\n</div></div>\n");
		try {
			out.write(buffer.toString());
		} catch (IOException e) {
			e.printStackTrace();
			log.debug(e.getMessage());
		}
		return super.doStartTag();
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getSpeed() {
		return speed;
	}

	public void setSpeed(String speed) {
		this.speed = speed;
	}

	public String getAutoScrooll() {
		return autoScrooll;
	}

	public void setAutoScrooll(String autoScrooll) {
		this.autoScrooll = autoScrooll;
	}

	public String getArrowControl() {
		return arrowControl;
	}

	public void setArrowControl(String arrowControl) {
		this.arrowControl = arrowControl;
	}

	public String getNumberControl() {
		return numberControl;
	}

	public void setNumberControl(String numberControl) {
		this.numberControl = numberControl;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getImgInfoMaps() {
		return imgInfoMaps;
	}

	public void setImgInfoMaps(String imgInfoMaps) {
		this.imgInfoMaps = imgInfoMaps;
	}

	public String getOuterDivId() {
		return outerDivId;
	}

	public void setOuterDivId(String outerDivId) {
		this.outerDivId = outerDivId;
	}

	public String getInnerDivId() {
		return innerDivId;
	}

	public void setInnerDivId(String innerDivId) {
		this.innerDivId = innerDivId;
	}

}
