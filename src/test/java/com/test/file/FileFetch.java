package com.test.file;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class FileFetch {

	public static void main(String[] args) throws IOException {
		File file = new File("assessment"+File.separator+"eclipseChe"+File.separator+"Java_Fullstack.json");
		String string = FileUtils.readFileToString(new File("assessment"+File.separator+"eclipseChe"+File.separator+"Java_Fullstack.json"));
		System.out.println("Read in: " + string);
	}
}
