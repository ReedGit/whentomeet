package com.giot.meeting.utils;

import java.io.UnsupportedEncodingException;

public class Iso8859_utf8 {
	public static String transfrom (String str){
		if(str!=null){
			try {
				str = new String(str.getBytes("iso8859-1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return str;
		}
		return null;
	}
}
