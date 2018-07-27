package connectbook.Entity;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="messenger")
public class Message implements Serializable {
	@Id
	@Column(name="mid")
	private int id;
	@Column(name="time")
	private String msgTime;
	@Column(name="msgby")
	private int msgBy;
	@Column(name="msgto")
	private int msgTo;
	@Column(name="msg")
	private String msg;
	@Column(name="msgmedia")
	private String msgMedia;

	public String getMsgTime() {
		return msgTime;
	}

	public int getMsgBy() {
		return msgBy;
	}

	public int getMsgTo() {
		return msgTo;
	}

	public String getMsg() {
		return msg;
	}

	public String getMsgMedia() {
		return msgMedia;
	}

	public void setMsgTime(String msgTime) {
		this.msgTime = msgTime;
	}

	public void setMsgBy(int msgBy) {
		this.msgBy = msgBy;
	}

	public void setMsgTo(int msgTo) {
		this.msgTo = msgTo;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public void setMsgMedia(String msgMedia) {
		this.msgMedia = msgMedia;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}