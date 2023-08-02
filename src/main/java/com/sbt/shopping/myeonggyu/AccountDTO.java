package com.sbt.shopping.myeonggyu;

public class AccountDTO {
	private String a_id;
	private String a_email;
	private String a_name; 
	private String a_nickname;
	private String a_password; 
	
	public AccountDTO() {
		// TODO Auto-generated constructor stub
	}

	public AccountDTO(String a_id, String a_email, String a_name, String a_nickname, String a_password) {
		super();
		this.a_id = a_id;
		this.a_email = a_email;
		this.a_name = a_name;
		this.a_nickname = a_nickname;
		this.a_password = a_password;
	}

	protected String getA_id() {
		return a_id;
	}

	protected void setA_id(String a_id) {
		this.a_id = a_id;
	}

	protected String getA_email() {
		return a_email;
	}

	protected void setA_email(String a_email) {
		this.a_email = a_email;
	}

	protected String getA_name() {
		return a_name;
	}

	protected void setA_name(String a_name) {
		this.a_name = a_name;
	}

	protected String getA_nickname() {
		return a_nickname;
	}

	protected void setA_nickname(String a_nickname) {
		this.a_nickname = a_nickname;
	}

	protected String getA_password() {
		return a_password;
	}

	protected void setA_password(String a_password) {
		this.a_password = a_password;
	}
	
	
	
	
}
