package com.zhoufudun.entity;

public class Idcard {
	/**
	 * id
	 */
	private Integer id;
	/**
	 * 证件号码
	 */
	private Integer num;

	/**
	 * 无参
	 * 
	 */
	public Idcard() {
	}

	/**
	 * 全参
	 * 
	 * @param id
	 *            id
	 * @param num
	 *            证件号码
	 */
	public Idcard(Integer id, Integer num) {
		super();
		this.id = id;
		this.num = num;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}
}
