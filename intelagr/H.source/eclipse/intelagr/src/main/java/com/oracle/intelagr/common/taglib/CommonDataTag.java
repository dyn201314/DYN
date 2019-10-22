package com.oracle.intelagr.common.taglib;

import java.io.IOException;
import java.io.Writer;
import java.util.List;

import javax.servlet.jsp.JspException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.oracle.intelagr.entity.CommonData;
import com.oracle.intelagr.entity.Company;
import com.oracle.intelagr.entity.SeedVariety;
import com.oracle.intelagr.entity.YearCode;
import com.oracle.intelagr.service.ICompanyService;
import com.oracle.intelagr.service.ISeedVarietyService;
import com.oracle.intelagr.service.IYearCodeService;
import com.oracle.intelagr.service.impl.CommonDataService;

public class CommonDataTag extends RequestContextAwareTag {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8580701533942022532L;
	private static final Logger log = LoggerFactory.getLogger(CommonDataTag.class);
	
	private String id;
	private String name;
	private String entityName;
	private String codeKey;
	private String readOnly;
	private String value;
	private String cssClass;
	private String width;
	private String height;
	private String canEdit;
	private String hasPleaseSelectOption;
	private String onChange;

	@Override
	public int doStartTagInternal() throws JspException, IOException {
		Writer out = pageContext.getOut();
		StringBuffer buffer = new StringBuffer("\n");
		String companyName = "";
		
		if (id == null || "".equals(id.trim())) {
			id = "";
		}
		if (entityName == null || "".equals(entityName.trim())) {
			entityName = "CommonData";
		}
		if (readOnly == null || "".equals(readOnly.trim())) {
			readOnly = "false";
		}
		if (hasPleaseSelectOption == null || "".equals(hasPleaseSelectOption.trim())) {
			hasPleaseSelectOption = "false";
		}
		if (canEdit == null || "".equals(canEdit.trim())) {
			canEdit = "true";
		}
		if (cssClass == null || "".equals(cssClass.trim())) {
			cssClass = "easyui-combobox";
		}
		if (width == null || "".equals(width.trim())) {
			width = "200";
		}
		if (height == null || "".equals(height.trim())) {
			height = "25";
		}
		if (onChange == null || "".equals(onChange.trim())) {
			onChange = "return false;";
		}
		
		buffer.append("\n\t\t<select id=\""+id+"\" name=\"" + name + "\" class=\"" + cssClass + "\" style=\"width:" + width
				+ "px;height:" + height + "px\" data-options=\"editable:" + canEdit + "\">\n");
		
		if("true".equalsIgnoreCase(hasPleaseSelectOption))
			buffer.append("<option value=\"\" selected>-=请选择=-</option>");

		if ("commondata".equalsIgnoreCase(entityName)) {
			if (codeKey == null || "".equals(codeKey.trim())) {
				try {
					throw new RuntimeException("当自定义select标签的entityName取值为CommonData时,codeKey属性不允许为空!具体取值规则参见CommonData表中CodeKey字段");
				} catch (RuntimeException e) {
					e.printStackTrace();
					log.debug(e.getMessage());
					codeKey = " ";
				}
			}
			
			CommonDataService commonDataService = (CommonDataService) this.getRequestContext().getWebApplicationContext().getBean("commonDataService");
			
			if("true".equalsIgnoreCase(readOnly)){
				if (value == null || "".equals(value.trim())) {
					value = " ";
				}
				CommonData commonData = commonDataService.getCommonData(codeKey, value);
				buffer.append("\n\t\t\t<option value=\"" + commonData.getCodeCode() + "\">" + handlerStr(commonData.getCodeValue()) + "</option>\n");
			}else{
				List<CommonData> commonDatas = commonDataService.getCommonDataListByCodeKey(codeKey);
	
				for (CommonData commonData : commonDatas) {
					if(value!=null && !"".equals(value) && value.equals(commonData.getCodeCode())){
						buffer.append("\n\t\t\t<option value=\"" + commonData.getCodeCode() + "\" selected>" + handlerStr(commonData.getCodeValue()) + "</option>\n");
					}else{
						buffer.append("\n\t\t\t<option value=\"" + commonData.getCodeCode() + "\">" + handlerStr(commonData.getCodeValue()) + "</option>\n");
					}
				}
			}

		} else if ("company".equalsIgnoreCase(entityName)) {
			ICompanyService companyService = (ICompanyService) this.getRequestContext().getWebApplicationContext().getBean("companyService");
			if("true".equalsIgnoreCase(readOnly)){
				if (value == null || "".equals(value.trim())) {
					value = " ";
				}
				Company company = companyService.getCompany(value);
				companyName = handlerStr(company.getCompanyName());
				buffer.append("\n\t\t\t<option value=\"" + company.getCompanyCode() + "\">" + companyName + "</option>\n");
			}else{
				List<Company> companys = companyService.getCompanyListByCompanyType(codeKey);
				for (Company company : companys) {
					if(value!=null && !"".equals(value) && value.equals(company.getCompanyCode())){
						companyName = company.getCompanyName();
						buffer.append("\n\t\t\t<option value=\"" + company.getCompanyCode() + "\" selected>" + companyName + "</option>\n");
					}else{
						buffer.append("\n\t\t\t<option value=\"" + company.getCompanyCode() + "\">" + handlerStr(company.getCompanyName()) + "</option>\n");
					}
				}
			}
		}else if("yearcode".equalsIgnoreCase(entityName)){
			IYearCodeService yearCodeService = (IYearCodeService) this.getRequestContext().getWebApplicationContext().getBean("yearCodeService");
			if("true".equalsIgnoreCase(readOnly)){
				if (value == null || "".equals(value.trim())) {
					value = " ";
				}
				YearCode yearEntity = yearCodeService.getYearCode(value);
				buffer.append("\n\t\t\t<option value=\"" + yearEntity.getYearCode() + "\">" + handlerStr(yearEntity.getYearName()) + "年</option>\n");
			}else{
				List<YearCode> yearCodes = yearCodeService.getYearCodeList();
				for (YearCode yearEntity : yearCodes) {
					if(value!=null && !"".equals(value) && value.equals(yearEntity.getYearCode())){
						buffer.append("\n\t\t\t<option value=\"" + yearEntity.getYearCode() + "\" selected>" + handlerStr(yearEntity.getYearName()) + "年</option>\n");
					}else{
						buffer.append("\n\t\t\t<option value=\"" + yearEntity.getYearCode() + "\">" + handlerStr(yearEntity.getYearName()) + "年</option>\n");
					}
				}
			}
		}else if("seedvariety".equalsIgnoreCase(entityName)){
			ISeedVarietyService seedVarietyService = (ISeedVarietyService) this.getRequestContext().getWebApplicationContext().getBean("seedVarietyService");
			if("true".equalsIgnoreCase(readOnly)){
				if (value == null || "".equals(value.trim())) {
					value = " ";
				}
				SeedVariety seed = seedVarietyService.getSeedVariety(value);
				buffer.append("\n\t\t\t<option value=\"" + seed.getSeedCode() + "\">" + handlerStr(seed.getSeedName()) + "</option>\n");
			}else{
				List<SeedVariety> seedVarietys = seedVarietyService.getSeedVarietyList();
				for (SeedVariety seed : seedVarietys) {
					if(value!=null && !"".equals(value) && value.equals(seed.getSeedCode())){
						buffer.append("\n\t\t\t<option value=\"" + seed.getSeedCode() + "\" selected>" + handlerStr(seed.getSeedName()) + "</option>\n");
					}else{
						buffer.append("\n\t\t\t<option value=\"" + seed.getSeedCode() + "\">" + handlerStr(seed.getSeedName()) + "</option>\n");
					}
				}
			}
		}

		buffer.append("\n\t\t</select>\n");
		
		if ("company".equalsIgnoreCase(entityName)) {
			buffer.append("\n\t\t <input type=\"hidden\" id=\""+id+"_companyName\" name=\"companyName\" value=\""+companyName+"\">\n");
			buffer.append("\n\t\t <script type=\"text/javascript\">\n");
			buffer.append("\n\t\t\t $(document).ready(function(){ \n");
			buffer.append("\n\t\t\t\t $('#"+id+"_companyName').val($('#"+id+" option:selected').text());\n");
			buffer.append("\n\t\t\t\t $('#"+id+"').combobox({ \n");
			buffer.append("\n\t\t\t\t\t onChange:function(newValue,oldValue){\n");
			buffer.append("\n\t\t\t\t\t\t var ops = document.getElementById('"+id+"').options;\n");
			buffer.append("\n\t\t\t\t\t\t for(var i=0;i<ops.length;i++){ \n");
			buffer.append("\n\t\t\t\t\t\t\t if(ops[i].value == newValue){ \n");
			buffer.append("\n\t\t\t\t\t\t\t\t $('#"+id+"_companyName').val(ops[i].text); \n");
			buffer.append("\n\t\t\t\t\t\t\t\t break; \n");
			buffer.append("\n\t\t\t\t\t\t\t } \n");
			buffer.append("\n\t\t\t\t\t\t } \n");
			buffer.append("\n\t\t\t\t\t\t "+(onChange.endsWith(";")?onChange:onChange+";")+"; \n");
			buffer.append("\n\t\t\t\t\t } \n");
			buffer.append("\n\t\t\t\t });\n\n");
			
			if("true".equalsIgnoreCase(hasPleaseSelectOption) && "true".equalsIgnoreCase(canEdit)){
				//绑定请选择onfocus事件 added by gaohua
				buffer.append("\n\t\t\t\t $('#"+id+"').combobox('textbox').bind('focus',function(){");
				buffer.append("\n\t\t\t\t\t var value = $('#"+id+"').combobox('getValue');");
				buffer.append("\n\t\t\t\t\t var opts = $('#"+id+"').combobox('getData');");
				
				buffer.append("\n\t\t\t\t\t\t if(value != ''){");
				buffer.append("\n\t\t\t\t\t\t\t var findFlag = false;");
				buffer.append("\n\t\t\t\t\t\t\t for(var i=0; i<opts.length; i++){");
				buffer.append("\n\t\t\t\t\t\t\t\t if(opts[i].value == value){");
				buffer.append("\n\t\t\t\t\t\t\t\t\t findFlag = true;");
				buffer.append("\n\t\t\t\t\t\t\t\t\t break;");
				buffer.append("\n\t\t\t\t\t\t\t\t }");
				buffer.append("\n\t\t\t\t\t\t\t }");
				buffer.append("\n\t\t\t\t\t\t\t if(!findFlag){");
				buffer.append("\n\t\t\t\t\t\t\t\t value = '';");
				buffer.append("\n\t\t\t\t\t\t\t\t $('#"+id+"').combobox('setValue', '');");
				buffer.append("\n\t\t\t\t\t\t\t }");
				buffer.append("\n\t\t\t\t\t\t }");
				
				buffer.append("\n\t\t\t\t\t if(value == ''){");
				buffer.append("\n\t\t\t\t\t\t $('#"+id+"').combobox('setText','');");
				buffer.append("\n\t\t\t\t\t }");
				buffer.append("\n\t\t\t\t }); ");
				
				//绑定请选择blur事件 added by gaohua
				buffer.append("\n\t\t\t\t $('#"+id+"').combobox('textbox').bind('blur',function(){  ");
				buffer.append("\n\t\t\t\t\t var value = $('#"+id+"').combobox('getValue');");
				buffer.append("\n\t\t\t\t\t if(value == ''){");
				buffer.append("\n\t\t\t\t\t\t $('#"+id+"').combobox('setText','-=请选择=-');");
				buffer.append("\n\t\t\t\t\t }");
				buffer.append("\n\t\t\t\t });");
			}
			
			buffer.append("\n\t\t\t });\n");
			buffer.append("\n\t\t</script>\n");
		}else{
			buffer.append("\n\t\t <script type=\"text/javascript\">\n");
			buffer.append("\n\t\t\t $(document).ready(function(){ \n");
			buffer.append("\n\t\t\t\t $('#"+id+"').combobox({ \n");
			buffer.append("\n\t\t\t\t\t onChange:function(newValue,oldValue){\n");
			buffer.append("\n\t\t\t\t\t\t " + (onChange.endsWith(";")?onChange:onChange+";") + "\n");
			buffer.append("\n\t\t\t\t\t } \n");
			buffer.append("\n\t\t\t\t });\n\n");
			buffer.append("\n\t\t\t });\n");
			buffer.append("\n\t\t</script>\n");
		}
		out.write(buffer.toString());
		return EVAL_PAGE;
	}

	
	private String handlerStr(String bizName){
		return (bizName==null || "".equals(bizName)?"":bizName);
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEntityName() {
		return entityName;
	}

	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}

	public String getCodeKey() {
		return codeKey;
	}

	public void setCodeKey(String codeKey) {
		this.codeKey = codeKey;
	}

	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
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

	public String getCanEdit() {
		return canEdit;
	}

	public void setCanEdit(String canEdit) {
		this.canEdit = canEdit;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	public String getReadOnly() {
		return readOnly;
	}
	
	public void setReadOnly(String readOnly) {
		this.readOnly = readOnly;
	}

	public String getHasPleaseSelectOption() {
		return hasPleaseSelectOption;
	}


	public void setHasPleaseSelectOption(String hasPleaseSelectOption) {
		this.hasPleaseSelectOption = hasPleaseSelectOption;
	}


	public String getOnChange() {
		return onChange;
	}

	public void setOnChange(String onChange) {
		this.onChange = onChange;
	}

}
