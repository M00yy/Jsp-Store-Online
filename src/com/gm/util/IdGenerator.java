package com.gm.util;

import java.math.BigInteger;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

//ID生成器
public class IdGenerator {
	//生成唯一的id
	public static String genPK(){
		return new BigInteger(165, new Random()).toString(36).toUpperCase();
	}
	//生成订单号
	public synchronized static String genOrdersNum(){
		Date now = new Date();
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		String date = df.format(now);
		return date+now.getTime();
	}
}
