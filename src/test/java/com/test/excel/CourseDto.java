package com.test.excel;

public class CourseDto {

	private String learningPathName;
	private String learningPathImageUrl;
	private String technology;
	private String courseName;
	private Integer duration;
	private String imageUrl;
	private String subTechnology;
	private String moduleName;
	private String contentLink;
	private Long testId;
	private String tesName;

	public Long getTestId() {
		return testId;
	}

	public void setTestId(Long testId) {
		this.testId = testId;
	}

	public String getTesName() {
		return tesName;
	}

	public void setTesName(String tesName) {
		this.tesName = tesName;
	}

	public String getLearningPathName() {
		return learningPathName;
	}

	public void setLearningPathName(String learningPathName) {
		this.learningPathName = learningPathName;
	}

	public String getLearningPathImageUrl() {
		return learningPathImageUrl;
	}

	public void setLearningPathImageUrl(String learningPathImageUrl) {
		this.learningPathImageUrl = learningPathImageUrl;
	}

	public String getTechnology() {
		return technology;
	}

	public void setTechnology(String technology) {
		this.technology = technology;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getSubTechnology() {
		return subTechnology;
	}

	public void setSubTechnology(String subTechnology) {
		this.subTechnology = subTechnology;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getContentLink() {
		return contentLink;
	}

	public void setContentLink(String contentLink) {
		this.contentLink = contentLink;
	}

	@Override
	public String toString() {
		return "CourseDto [learningPathName=" + learningPathName + ", learningPathImageUrl="
				+ learningPathImageUrl + ", technology=" + technology + ", courseName=" + courseName
				+ ", duration=" + duration + ", imageUrl=" + imageUrl + ", subTechnology="
				+ subTechnology + ", moduleName=" + moduleName + ", contentLink=" + contentLink
				+ ", testId=" + testId + ", tesName=" + tesName + "]";
	}

}
