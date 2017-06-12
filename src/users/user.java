package users;

import java.util.Date;

import javax.persistence.*;


@Table(name="usertable")
@Entity
public class user {
	@Id
	private Integer id;
	@Column(name="password")
	private String password;
	@Column(name="username")
	private String username;
	@Column(name="name")
	private String name;
	@Column(name="gender")
	private String gender;
	@Column(name="dob")
	private Date dob;
	@Column(name="email")
	private String email;
	@Column(name="dp")
	private String dp;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDp() {
		return dp;
	}
	public void setDp(String dp) {
		this.dp = dp;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
}
