package org.spring.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tb_message")
public class Message {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	@JoinColumn(name = "from_user_id")
	private User fromUser;

	@ManyToOne
	@JoinColumn(name = "to_user_id")
	private User toUser;
	
	private String message;
	private Date send_on;

	public Message() {

	}

	public Long getId() {
		return id;
	}

	public void setId(Long message_id) {
		this.id = message_id;
	}

	public User getFromUser() {
		return fromUser;
	}

	public void setFromUser(User fromUser) {
		this.fromUser = fromUser;
	}

	public User getToUser() {
		return toUser;
	}

	public void setToUser(User toUser) {
		this.toUser = toUser;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getSendOn() {
		return send_on;
	}

	public void setSendOn(Date sendOnDate) {
		this.send_on = sendOnDate;
	}

	@Override
	public String toString() {
		return "Message [to_user_id=" + toUser + ", from_user_id=" + fromUser + ", message=" + message + ", sendOnDate="
				+ send_on + "]";
	}

}
