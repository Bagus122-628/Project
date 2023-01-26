package org.spring.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tb_thread")
public class Threads {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	@JoinColumn(name = "publisher_id")
	private User publisher;

	private String thread_title;

	private String thread_content;

	private String thread_description;

	private Date publish_date;
	private int like_count;

	public Threads() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long thread_id) {
		this.id = thread_id;
	}

	public User getPublisher() {
		return publisher;
	}

	public void setPublisher(User publisher) {
		this.publisher = publisher;
	}

	public String getTitle() {
		return thread_title;
	}

	public void setTitle(String threadTitle) {
		this.thread_title = threadTitle;
	}

	public String getContent() {
		return thread_content;
	}

	public void setContent(String threadContent) {
		this.thread_content = threadContent;
	}

	public String getDescription() {
		return thread_description;
	}

	public void setDescription(String threadDescription) {
		this.thread_description = threadDescription;
	}

	public Date getPublishDate() {
		return publish_date;
	}

	public void setPublishDate(Date publishDate) {
		this.publish_date = publishDate;
	}

	public int getLikeCount() {
		return like_count;
	}

	public void setLikeCount(int likeCount) {
		this.like_count = likeCount;
	}

	@Override
	public String toString() {
		return "Thread [thread_id=" + id + ", publisher=" + publisher + ", threadTitle=" + thread_title
				+ ", threadContent=" + thread_content + ", threadDescription=" + thread_description + ", publishDate="
				+ publish_date + ", likeCount=" + like_count + "]";
	}

}
