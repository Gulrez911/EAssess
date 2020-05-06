package com.assessment.web.controllers;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Base64;

import org.apache.commons.io.FileUtils;

import com.assessment.common.PropertyConfig;
import com.assessment.common.util.EmailGenericMessageThread;
import com.assessment.data.UserTestSession;
import com.assessment.services.UserTestSessionService;

public class EmailReminderController extends Thread {

	UserTestSessionService userTestSessionService;

	Long testId;

	String testName;

	String companyId;

	String baseUrl;

	String user;

	String htmlLocation;

	PropertyConfig propertyConfig;

	public EmailReminderController(UserTestSessionService userTestSessionService, Long testId, String testName,
			String companyId, String baseUrl, String user, String htmlLocation,
			PropertyConfig propertyConfig) {
		super();
		this.userTestSessionService = userTestSessionService;
		this.testId = testId;
		this.testName = testName;
		this.companyId = companyId;
		this.baseUrl = baseUrl;
		this.user = user;
		this.htmlLocation = htmlLocation;
		this.propertyConfig = propertyConfig;
	}

	@Override
	public void run() {

		System.out.println(getName() + " is running");
		try {
			System.out.println("............................");
			UserTestSession li = userTestSessionService.findUserTestSession(user, testName, companyId);
			System.out.println("List>>>>>>>>>>>> " + li);
			if (li == null) {
				String html = htmlLocation;
				String welcomeMailData = FileUtils.readFileToString(new File(html));
				welcomeMailData = welcomeMailData.replace("{TEST_NAME}", testName);
				String url = getUrlForUser(user);
				welcomeMailData = welcomeMailData.replace("{URL}", url);
				EmailGenericMessageThread client = new EmailGenericMessageThread(user,
						"Test Link - " + testName + " Sent by IIHT", welcomeMailData,
						propertyConfig);
				Thread th = new Thread(client);
				th.start();
				System.out.println("Mail sent");
			}
			Thread.sleep(5000);
		} catch (InterruptedException | IOException e) {
			e.printStackTrace();
		}
		System.out.println(getName() + " is running");
	}

	private String getUrlForUser(String email) {
		String userBytes = Base64.getEncoder().encodeToString(email.getBytes());

		String after = "userId=" + URLEncoder.encode(userBytes) + "&testId="
				+ URLEncoder.encode(testId.toString()) + "&companyId=" + URLEncoder.encode(companyId);
		String url = baseUrl + "startTestSession?" + after;
		return url;
	}
}