package kr.liferecord.monument.domain;

import java.sql.Date;

public class TestTableDto {

	private int idx;
	private String content;
	private Date createAt;
	private Date updateAt;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
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

	public Date getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}

	@Override
	public String toString() {
		return "TestTableDto [idx=" + idx + ", content=" + content + ", createAt=" + createAt + ", updateAt=" + updateAt
				+ "]";
	}

}
