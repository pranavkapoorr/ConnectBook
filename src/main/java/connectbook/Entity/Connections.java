package connectbook.Entity;

import java.io.Serializable;

import javax.persistence.*;
@Entity
@Table(name="connections")
public class Connections implements Serializable{
	@Id
	@Column(name="cid")
	private int id;
	@Column(name="reqfrom")
	private int reqFrom;
	@Column(name="reqto")
	private int reqTo;
	@Column(name="cstatus")
	private int reqStatus;
	@Column(name="time")
	private String time;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getReqFrom() {
		return reqFrom;
	}
	public void setReqFrom(int reqFrom) {
		this.reqFrom = reqFrom;
	}
	public int getReqTo() {
		return reqTo;
	}
	public void setReqTo(int reqTo) {
		this.reqTo = reqTo;
	}
	public int getReqStatus() {
		return reqStatus;
	}
	public void setReqStatus(int reqStatus) {
		this.reqStatus = reqStatus;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}

}
