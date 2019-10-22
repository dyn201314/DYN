package com.oracle.intelagr.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;


public class CommonsMultipartResolverExt extends CommonsMultipartResolver {

	public MultipartParsingResult parseRequest(HttpServletRequest request)
			throws MultipartException {
		
		String encoding = "utf-8";
		FileUpload fileUpload = prepareFileUpload(encoding);
		final HttpSession session = request.getSession();
		UploadStatusModel status = new UploadStatusModel();
		
		fileUpload.setProgressListener(new ProgressListenerImpl(status, session));
		try {
			List<FileItem> fileItems = ((ServletFileUpload) fileUpload).parseRequest(request);
			return parseFileItems(fileItems, encoding);
		} catch (FileUploadBase.SizeLimitExceededException ex) {
			throw new MaxUploadSizeExceededException(fileUpload.getSizeMax(),ex);
		} catch (FileUploadException ex) {
			throw new MultipartException("Could not parse multipart servlet request", ex);
		}
	}
}