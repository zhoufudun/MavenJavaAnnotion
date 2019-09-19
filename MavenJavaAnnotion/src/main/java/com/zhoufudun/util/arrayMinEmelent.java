package com.zhoufudun.util;
/*
 * ��ȡ������СԪ��
 */
public class arrayMinEmelent {
	public static Integer getMin(Integer[] array) {
		Integer min=array[0];
		for(int i=0;i<array.length;i++) {
			if(min>array[i]) {
				min=array[i];
			}
		}
		return min;
	}
	public static Integer getMinIndex(Integer[] array) {
		Integer min=array[0];
		Integer index=0;
		for(int i=0;i<array.length;i++) {
			if(min>array[i]) {
				min=array[i];
				index=i;
			}
		}
		return index;
	}
}
