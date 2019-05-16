package com.ming.hospital.pojo;

public class Login {
	private String loginname;
	private String password;
	private String identifyingcode;

	public Login() {
		super();
	}

	public Login(String loginname, String password, String identifyingcode) {
		super();
		this.loginname = loginname;
		this.password = password;
		this.identifyingcode = identifyingcode;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIdentifyingcode() {
		return identifyingcode;
	}

	public void setIdentifyingcode(String identifyingcode) {
		this.identifyingcode = identifyingcode;
	}

	@Override
	public String toString() {
		return "Login [loginname=" + loginname + ", password=" + password + ", identifyingcode=" + identifyingcode
				+ "]";
	}

}
