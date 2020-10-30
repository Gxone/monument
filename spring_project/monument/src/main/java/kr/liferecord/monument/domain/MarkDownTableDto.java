package kr.liferecord.monument.domain;

import java.util.Date;

//import java.sql.Date;

public class MarkDownTableDto {
	int idx;
	private String title;
	private String content;
	private Date createAt;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	public Date getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	@Override
	public String toString() {
		return "MarkDownTableDto [idx=" + idx + ", title=" + title + ", content=" + content + ", createAt=" + createAt
				+ "]";
	}

	

}
