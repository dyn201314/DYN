package com.oracle.intelagr.common.taglib;

import java.io.Writer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.oracle.intelagr.entity.CommonData;
import com.oracle.intelagr.entity.Company;
import com.oracle.intelagr.entity.SeedVariety;
import com.oracle.intelagr.entity.YearCode;
import com.oracle.intelagr.service.ICommonDataService;
import com.oracle.intelagr.service.impl.CommonDataService;

public class ShowNameByCodeTag extends RequestContextAwareTag {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3484661201004988852L;
	private static final Logger log = LoggerFactory.getLogger(ShowNameByCodeTag.class);

	private String codeKey;
	private String entityName;
	private String value;

	@Override
	protected int doStartTagInternal() throws Exception {
		Writer out = pageContext.getOut();
		
		if (entityName == null || "".equals(entityName.trim())) {
			entityName = "commonData";
		}
		if (value == null || "".equals(value.trim())) {
			value = "NotExsist";
		}

		if ("commondata".equalsIgnoreCase(entityName)) {
			if (codeKey == null || "".equals(codeKey.trim())) {
				try {
					throw new RuntimeException("当entityName取值为CommonData时,codeKey属性不允许为空!具体取值规则参见CommonData表中CodeKey字段");
				} catch (RuntimeException e) {
					e.printStackTrace();
					log.debug(e.getMessage());
					codeKey = "NotExsist";
				}
			}
			ICommonDataService commonDataService = (ICommonDataService) this.getRequestContext()
					.getWebApplicationContext().getBean("commonDataService");
			CommonData commonData = commonDataService.getCommonData(codeKey, value);
			out.write("<span>" + (commonData.getCodeValue()==null || "".equals(commonData.getCodeValue())?"":commonData.getCodeValue()) + "</span>");
		}else if("yearcode".equalsIgnoreCase(entityName)){
			/*YearCodeService yearCodeService = (YearCodeService) this.getRequestContext().getWebApplicationContext().getBean("yearCodeService");
			YearCode yearEntity = yearCodeService.getYearCode(value);
			out.write("<span>" + (yearEntity.getYearName()==null || "".equals(yearEntity.getYearName())?"":yearEntity.getYearName()+"年") + "</span>");*/
		}else  if("seedvariety".equalsIgnoreCase(entityName)){
			/*SeedVarietyService seedVarietyService = (SeedVarietyService) this.getRequestContext().getWebApplicationContext().getBean("seedVarietyService");
			SeedVariety seedVariety = seedVarietyService.getSeedVariety(value);
			out.write("<span>" + (seedVariety.getSeedName()==null || "".equals(seedVariety.getSeedName())?"":seedVariety.getSeedName()) + "</span>");*/
		} else if ("company".equalsIgnoreCase(entityName)) {
			/*CompanyService companyService = (CompanyService) this.getRequestContext().getWebApplicationContext().getBean("companyService");
			Company company = companyService.getCompany(value);
			out.write("<span>" + (company.getCompanyName()==null || "".equals(company.getCompanyName())?"":company.getCompanyName()) + "</span>");*/
		} else if ("areadevision".equalsIgnoreCase(entityName)) {
			/*AreaDevisionService areaDevisionService = (AreaDevisionService) this.getRequestContext().getWebApplicationContext().getBean("areaDevisionService");
			if(codeKey.equalsIgnoreCase("country")){
				String strName = areaDevisionService.getCountryNameByCode(codeKey, value);
				out.write(strName==null || "".equals(strName.trim())?"":strName);
			}else{
				String strName = areaDevisionService.getAreaNameByCode(codeKey, value);
				out.write(strName==null || "".equals(strName.trim())?"":strName);
			}*/
		}
		return EVAL_PAGE;
	}

	public String getCodeKey() {
		return codeKey;
	}

	public void setCodeKey(String codeKey) {
		this.codeKey = codeKey;
	}

	public String getEntityName() {
		return entityName;
	}

	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
