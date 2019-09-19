package com.zhoufudun.util;

public class ExtremeValue {
	public static double getExtremeValue(Double one,Double two,Double three,Double fouth) {
		double min1=0;
		min1=Math.min(one, two);
		double min2=0;
		min2=Math.min(three, fouth);
		double min=0;
		min=Math.min(min1, min2);
		
		double max1=0;
		max1=Math.max(one, two);
		double max2=0;
		max2=Math.max(three, fouth);
		double max=0;
		max=Math.max(max1, max2);		
		return max-min;
	}
}
