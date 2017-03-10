package cn.kitrst.blog.domain;

import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

public class Article {

	private String uuid;
	
	private String title;
	
	private String cont;
	
	private Date date;
	
	private List<Tag> tags = new LinkedList<Tag>();
	
	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCont() {
		return cont;
	}

	public void setCont(String cont) {
		this.cont = cont;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}
	
	
}
