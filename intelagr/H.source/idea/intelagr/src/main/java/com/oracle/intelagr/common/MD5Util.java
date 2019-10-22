package com.oracle.intelagr.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.security.MessageDigest;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

public class MD5Util {
	private static final Logger log = LoggerFactory.getLogger(MD5Util.class);
	
	/**
	 * MD5 加密算法
	 */
	public static String getMD5Code(String srcString) {
	MessageDigest messageDigest = null;
	try	{
		messageDigest = MessageDigest.getInstance("MD5");
		messageDigest.reset();
		messageDigest.update(srcString.getBytes("UTF-8"));
	} catch (NoSuchAlgorithmException e) {
		log.error("get md5 str error!");
	} catch (UnsupportedEncodingException e) {
		log.error("unsupported encoding exception!!!");
	}
	
	byte[] byteArray = messageDigest.digest();
	
	StringBuffer md5StrBuff = new StringBuffer();
	
	for (int i = 0; i < byteArray.length; i++) {
		if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)
			md5StrBuff.append("0").append(Integer.toHexString(0xFF & byteArray[i]));
				else
					md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));
			}
			return md5StrBuff.toString();
		}
	}
