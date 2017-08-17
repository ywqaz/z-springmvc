package com.yw.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class User {

	private String username;
	private String password;
	private String nickname;
	private String email;
	
	public User(){
		
	}

	@NotEmpty(message="不能为空")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@NotEmpty(message="密码不能为空")
	@Size(min=2,max=8,message="密码长度在1-10之间")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Email(message="邮箱格式不正确")
	//@Pattern(regexp="(\\w+\\.*)\\w+@\\w+.[a-zA-Z](2,6)",message="邮箱格式不正确")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public User(String username, String password, String nickname, String email) {
		super();
		this.username = username;
		this.password = password;
		this.nickname = nickname;
		this.email = email;
	}
	
}
