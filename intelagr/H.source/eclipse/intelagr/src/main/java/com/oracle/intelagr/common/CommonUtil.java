package com.oracle.intelagr.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.management.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oracle.intelagr.entity.Mfile;
import com.oracle.intelagr.entity.User;
import com.oracle.intelagr.service.IFileManagerService;

import sun.misc.BASE64Decoder;

/**
 * @处理器拦截       通用工具类
 * @Author    Gaohua
 * @Version   2015/08/16
 */
public class CommonUtil {
	private static final Logger log = LoggerFactory.getLogger(CommonUtil.class);
	
	/*取当前登陆用户，及当时时间 */ 
	public static BaseModel getBaseModel(HttpServletRequest request){
		User user = GetSession.getSessionEntity(request);
		BaseModel baseModel = new BaseModel();
		baseModel.setCreateDate(new Date());
		baseModel.setCreateUserId(user.getUserID());
		baseModel.setUpdateDate(new Date());
		baseModel.setUpdateUserId(user.getUserID());
		baseModel.setCreateUserName(user.getUserName());
		baseModel.setUpdateUserName(user.getUserName());
		return baseModel;
	}
	
	/*保存数据时保存相关图片
	 * fileManagerService 文件管理Service 
	 * bizType 业务类型
	 * 01：  购种凭证上传
	   02：  投入品凭证上传
	   03: 收粮凭证上传
	   04: 特殊土地备案凭证上传
	   05: 特殊土地变更凭证上传
	   06: 浸种催芽图片上传
	   07: 育秧环节图片上传
	   08: 插秧环节图片上传
	   09: 植保环节图片上传
	   10: 收割环节图片上传
	   11: 物流环节图片上传
	   12: 仓储环节图片上传
	   13: 加工环节图片上传
	   14: 地块举证材料上传
	   15: 购种举证材料上传
	   16: 超产举证材料上传
	   17: 土地图片上传
	   18: 企业投诉材料上传
	   19: 种子投诉材料上传
	   20: 土地备案变更申请材料上传
	 * bizCode 业务编码
	 * request
	 * 本方法只适用于图片上传，视频没有涉及到上传，直接保存即可
	 */
	public static int saveMfile(IFileManagerService fileManagerService, String bizType, String bizCode, HttpServletRequest request){
		int saveFileCount = 0;
		HttpSession session = request.getSession();
		Object obj = session.getAttribute(bizType+"fileList");
		if(obj == null) return 0;
		List<MfileModel> list = (List)obj;
		Iterator<MfileModel> iter = list.iterator();
		while(iter.hasNext()) {
			MfileModel mfileModel =  (MfileModel)iter.next();
			BaseModel baseModel = CommonUtil.getBaseModel(request);
			Mfile mfile = new Mfile();
			mfile.setBizType(bizType);
			mfile.setBizCode(bizCode);
			mfile.setExtField1("");
			mfile.setExtField2("");
			
			String fileType = mfileModel.getFileType();
			if(StringUtil.isNullOrEmpty(fileType)){
				fileType = "01";
			}
			
			mfile.setFileType(fileType); //01图片 02视频
			String lastFilePath = "";
			if(fileType.equals("01")){
				lastFilePath = bizType + bizCode + "_" + mfileModel.getFilePath();
			}else{
				lastFilePath = mfileModel.getFilePath();
			}
			mfile.setFilePath(lastFilePath);
			mfile.setOriginalName(mfileModel.getOriginalName());
			mfile.setFileInfo(mfileModel.getFileInfo());
			mfile.setCreateUserId(baseModel.getCreateUserId());
			mfile.setCreateDate(baseModel.getCreateDate());
			mfile.setUpdateUserId(baseModel.getUpdateUserId());
			mfile.setUpdateDate(baseModel.getUpdateDate());
			fileManagerService.save(mfile);
			
			if(fileType.equals("01")){
				//移动文件
				String srcPath = request.getSession().getServletContext().getRealPath("/uploadtmp/");
				srcPath += "\\" + mfileModel.getFilePath();
				
				String dstPath = request.getSession().getServletContext().getRealPath("/upload/");
				dstPath += "\\" + lastFilePath;
				
				File afile = new File(srcPath);
				
	            if (afile.renameTo(new File(dstPath))) saveFileCount++;
	            else log.error("save file error " + mfileModel.getFilePath()) ;
			}
		}
		session.setAttribute(bizType+"fileList", null);
		return saveFileCount;
	}
	
	private static Date getDate(String date) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
		return sdf.parse(date);
	}
	
	public static String getHqlForDate(String column, Object startDate, Object endDate){
		String wherePart = "";
		if( startDate != null && StringUtils.isNotEmpty( (String)startDate ) 
				&& endDate != null && StringUtils.isNotEmpty( (String)endDate ) 
				&& endDate.equals(startDate)){
			wherePart+=" AND "+column+" =?";
		}else{
			if( startDate != null && StringUtils.isNotEmpty( (String)startDate ) ){
				wherePart+=" AND "+column+">=?";
			}
			if( endDate != null && StringUtils.isNotEmpty( (String)endDate ) ){
				wherePart+=" AND "+column+" <=?";
			}
		}
		return wherePart;
	}
	
	
	
	public static String getUUID(){
		String uuid = UUID.randomUUID().toString();
		return uuid.replaceAll("-", "");

	}
	
	public static void removeTmpFileList(String bizType, HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute(bizType+"fileList");
	}
	
	/**
     * 功能：身份证的有效验证
     * 
     * @param IDStr
     *            身份证号
     * @return 有效：返回"" 无效：返回String信息
     * @throws ParseException
     */
    @SuppressWarnings("unchecked")
    public static String IDCardValidate(String IDStr) throws ParseException {
        String errorInfo = "";// 记录错误信息
        String[] ValCodeArr = { "1", "0", "x", "9", "8", "7", "6", "5", "4",
                "3", "2" };
        String[] Wi = { "7", "9", "10", "5", "8", "4", "2", "1", "6", "3", "7",
                "9", "10", "5", "8", "4", "2" };
        String Ai = "";
        // ================ 号码的长度 15位或18位 ================
        if (IDStr.length() != 15 && IDStr.length() != 18) {
            errorInfo = "身份证号码长度应该为15位或18位。";
            return errorInfo;
        }
        // =======================(end)========================

        // ================ 数字 除最后以为都为数字 ================
        if (IDStr.length() == 18) {
            Ai = IDStr.substring(0, 17);
        } else if (IDStr.length() == 15) {
            Ai = IDStr.substring(0, 6) + "19" + IDStr.substring(6, 15);
        }
        if (isNumeric(Ai) == false) {
            errorInfo = "身份证15位号码都应为数字 ; 18位号码除最后一位外，都应为数字。";
            return errorInfo;
        }
        // =======================(end)========================

        // ================ 出生年月是否有效 ================
        String strYear = Ai.substring(6, 10);// 年份
        String strMonth = Ai.substring(10, 12);// 月份
        String strDay = Ai.substring(12, 14);// 月份
        if (isDate(strYear + "-" + strMonth + "-" + strDay) == false) {
            errorInfo = "身份证生日无效。";
            return errorInfo;
        }
        GregorianCalendar gc = new GregorianCalendar();
        SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
        try {
            if ((gc.get(Calendar.YEAR) - Integer.parseInt(strYear)) > 150
                    || (gc.getTime().getTime() - s.parse(
                            strYear + "-" + strMonth + "-" + strDay).getTime()) < 0) {
                errorInfo = "身份证生日不在有效范围。";
                return errorInfo;
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        } catch (java.text.ParseException e) {
            e.printStackTrace();
        }
        if (Integer.parseInt(strMonth) > 12 || Integer.parseInt(strMonth) == 0) {
            errorInfo = "身份证月份无效";
            return errorInfo;
        }
        if (Integer.parseInt(strDay) > 31 || Integer.parseInt(strDay) == 0) {
            errorInfo = "身份证日期无效";
            return errorInfo;
        }
        // =====================(end)=====================

        
        // ==============================================

        // ================ 判断最后一位的值 ================
        int TotalmulAiWi = 0;
        for (int i = 0; i < 17; i++) {
            TotalmulAiWi = TotalmulAiWi
                    + Integer.parseInt(String.valueOf(Ai.charAt(i)))
                    * Integer.parseInt(Wi[i]);
        }
        int modValue = TotalmulAiWi % 11;
        String strVerifyCode = ValCodeArr[modValue];
        Ai = Ai + strVerifyCode;

        if (IDStr.length() == 18) {
            if (Ai.equals(IDStr) == false) {
                errorInfo = "身份证无效，不是合法的身份证号码";
                return errorInfo;
            }
        } else {
            return "";
        }
        // =====================(end)=====================
        return "";
    }
    /**
     * 功能：判断字符串是否为数字
     * 
     * @param str
     * @return
     */
    public static boolean isNumeric(String str) {
        Pattern pattern = Pattern.compile("[0-9]*");
        Matcher isNum = pattern.matcher(str);
        if (isNum.matches()) {
            return true;
        } else {
            return false;
        }
    }
    
    private static boolean isMatch(String regex, String orginal){  
        if (orginal == null || orginal.trim().equals("")) {  
            return false;  
        }  
        Pattern pattern = Pattern.compile(regex);  
        Matcher isNum = pattern.matcher(orginal);  
        return isNum.matches();  
    } 
    
    /**
     * 是否手机号
     * @param input
     * @return
     */
    public static boolean isPhoneNumber(String input){  
    	Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");  
    	Matcher m = p.matcher( input );  
    	  
    	return m.matches();  
    } 
    /** 
     * 电话号码验证 
     *  
     * @param  str 
     * @return 验证通过返回true 
     */  
    public static boolean isPhone(String str) {   
        Pattern p1 = null,p2 = null;  
        Matcher m = null;  
        boolean b = false;    
        p1 = Pattern.compile("^[0][1-9]{2,3}-[0-9]{5,10}$");  // 验证带区号的  
        p2 = Pattern.compile("^[1-9]{1}[0-9]{5,8}$");         // 验证没有区号的  
        if(str.length() >9)  
        {   m = p1.matcher(str);  
            b = m.matches();    
        }else{  
            m = p2.matcher(str);  
            b = m.matches();   
        }    
        return b;  
    }  
    
    public static boolean isPositiveInteger(String orginal) {  
        return isMatch("^\\+{0,1}[1-9]\\d*", orginal);  
    } 
    
    public static boolean isPositiveDecimal(String orginal){
    	return isMatch("^(([1-9]\\d{0,9})|0)(\\.\\d{1,2})?$", orginal);	
        //return isMatch("\\+{0,1}[0]\\.[1-9]*|\\+{0,1}[1-9]\\d*\\.\\d*", orginal);  
    }  
    
    public static void main(String[] rags){
    	System.out.println( isPhoneNumber("101340121") + "--" + isPhone("0121") );
    	//System.out.println(  isPositiveDecimal( "13.123" ) + "--"  + isPositiveInteger("12.4") );
    }
    
    /**
     * 功能：判断字符串是否为日期格式
     * 
     * @param str
     * @return
     */
    public static boolean isDate(String strDate) {
        Pattern pattern = Pattern
                .compile("^((\\d{2}(([02468][048])|([13579][26]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])))))|(\\d{2}(([02468][1235679])|([13579][01345789]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\\s(((0?[0-9])|([1-2][0-3]))\\:([0-5]?[0-9])((\\s)|(\\:([0-5]?[0-9])))))?$");
        Matcher m = pattern.matcher(strDate);
        if (m.matches()) {
            return true;
        } else {
            return false;
        }
    }
    
    /**
     * 验证是否承包方类型
     * @param cType
     * @return
     */
    public static boolean isContractorType(String cType){
    	if( "农户".equalsIgnoreCase( cType ) || "个人".equalsIgnoreCase( cType )
    			||  "单位".equalsIgnoreCase( cType )){
    		return true;
    	}
    	
    	return false;
    }
    
    /**
     * 验证是否承包方类型
     * @param idType
     * @return
     */
    public static boolean isIdType(String idType){
    	if( "身份证".equalsIgnoreCase( idType ) || "军官证".equalsIgnoreCase( idType )
    			||  "行政、企事业单位机构代码证或法人代码证".equalsIgnoreCase( idType ) || "户口簿".equals( idType ) 
    			|| "护照".equals( idType ) || "其他证件".equals( idType )){
    		return true;
    	}
    	
    	return false;
    }
    
    public static boolean isCardNo(String IDStr) throws ParseException {
		Pattern idNumPattern = Pattern.compile("(\\d{14}[0-9a-zA-Z])|(\\d{17}[0-9a-zA-Z])"); 
		Matcher idNumMatcher = idNumPattern.matcher(IDStr); 
		if(idNumMatcher.matches()){ 
			return true;
		} else {
			return false;
		}
    }
    
    //将base64字节流转图片
    public static boolean string2Image(String imgStr, String dstFilePath) {  
        if (imgStr == null)  
            return false;  
        try {  
            // Base64解码  
            byte[] byteAarr = new BASE64Decoder().decodeBuffer(imgStr);  
            for (int i = 0; i < byteAarr.length; ++i) {  
                if (byteAarr[i] < 0) {  
                    // 调整异常数据  
                	byteAarr[i] += 256; 
                }  
            }  
            //生成Jpeg图片  
            OutputStream outputStream = new FileOutputStream(dstFilePath);  
            outputStream.write(byteAarr);  
            outputStream.flush();  
            outputStream.close();  
            return true;  
        } catch (Exception e) {  
            return false;  
        }  
    }   
}
