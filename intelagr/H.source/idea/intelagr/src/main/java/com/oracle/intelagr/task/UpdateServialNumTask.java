package com.oracle.intelagr.task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.oracle.intelagr.common.DateTimeUtil;
import com.oracle.intelagr.service.IServialNumService;

@Component
public class UpdateServialNumTask {
	private static final Logger log = LoggerFactory.getLogger(UpdateServialNumTask.class);
	
	@Autowired
	private IServialNumService servialNumService;
	
	@Scheduled(cron="0 0 0 * * ?")
	public void resetServialNum(){    
      log.info(DateTimeUtil.getCurrentDateTime() + " 开始重置流水号...");
      servialNumService.updateServialNum();
      log.info(DateTimeUtil.getCurrentDateTime() + " 重置流水号完毕！");
	}    
}
