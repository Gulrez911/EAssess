package com.assessment.data;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class UniqueUrl {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String testId;

	@DateTimeFormat(pattern = "dd-MM-yyyy")
	@Temporal(TemporalType.DATE)
	private Date urlDate;
	private String urlId;
	private String email;
	private String testName;

	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getUrlDate() {
		return urlDate;
	}

	public void setUrlDate(Date urlDate) {
		this.urlDate = urlDate;
	}

	public String getUrlId() {
		return urlId;
	}

	public void setUrlId(String urlId) {
		this.urlId = urlId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTestId() {
		return testId;
	}

	public void setTestId(String testId) {
		this.testId = testId;
	}

	@Override
	public String toString() {
		return "UniqueUrl [id=" + id + ", testId=" + testId + ", urlDate=" + urlDate + ", urlId=" + urlId + ", email="
				+ email + ", testName=" + testName + "]";
	}
}
