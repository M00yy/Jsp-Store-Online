package com.gm.util;

import java.math.BigInteger;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

//ID������
public class IdGenerator {
	//����Ψһ��id
	public static String genPK(){
		return new BigInteger(165, new Random()).toString(36).toUpperCase();
	}
	//���ɶ�����
	public synchronized static String genOrdersNum(){
		Date now = new Date();
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		String date = df.format(now);
		return date+now.getTime();
	}
}
