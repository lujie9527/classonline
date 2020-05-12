package com.wljx.utils;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtils {

	/**
	 * 获取当前时间yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static String getCurrentTime() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentTime = sdf.format(new Date());
		return currentTime;
	}
	/**
	 * 获取当前时间yyyy-MM-dd
	 * @return
	 */
	public static String getCurrentTime2() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String currentTime = sdf.format(new Date());
		return currentTime;
	}
	
	//文件大小转换
	public static String getNetFileSizeDescription(long size) {
        StringBuffer bytes = new StringBuffer();
        DecimalFormat format = new DecimalFormat("###.0");
        if (size >= 1024 * 1024 * 1024) {
            double i = (size / (1024.0 * 1024.0 * 1024.0));
            bytes.append(format.format(i)).append("GB");
        }
        else if (size >= 1024 * 1024) {
            double i = (size / (1024.0 * 1024.0));
            bytes.append(format.format(i)).append("MB");
        }
        else if (size >= 1024) {
            double i = (size / (1024.0));
            bytes.append(format.format(i)).append("KB");
        }
        else if (size < 1024) {
            if (size <= 0) {
                bytes.append("0B");
            }
            else {
                bytes.append((int) size).append("B");
            }
        }
        return bytes.toString();
    }

	
}
