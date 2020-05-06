package com.test.excel;


import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.jxls.reader.ReaderBuilder;
import org.jxls.reader.XLSReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.ResourceUtils;

import com.assessment.data.Course;
import com.assessment.data.CourseModule;
import com.assessment.data.LearningPath;
import com.assessment.repositories.CourseModuleRepository;
import com.assessment.repositories.CourseRepository;
import com.assessment.repositories.LearningPathRepository;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:appContext.xml" })
public class ImportCourseTest {

	@Autowired
	CourseModuleRepository courseModuleRepository;
	@Autowired
	CourseRepository courseRepository;
	@Autowired
	LearningPathRepository learningPathRepository;
	@Autowired
	ResourceLoader resourceLoader;

	@Test
	
	public void testQuery() throws Exception {
//	public static void main(String[] args) throws Exception {
		File file2 = ResourceUtils.getFile("C:/Users/gulfa/OneDrive/Desktop/LearningPath Folder/Cplusplus.xlsx");
		InputStream stream = new FileInputStream(file2.getPath());
		System.out.println("stream :	" + stream);
//		File file = new File("C:/Users/gulfa/OneDrive/Desktop/course.xml");
		File file = ResourceUtils.getFile("classpath:course.xml");
		System.out.println("file" + file.getAbsolutePath());
		List<CourseDto> courses = ImportCourseTest.parseExcelFileToBeans(stream, file);
		List<Course> list = new ArrayList<Course>();
		for (CourseDto course : courses) {
			System.out.println("List: " + course);
			Course cs = courseRepository.findByPrimaryKey(course.getCourseName(), "IH");
			Course cs2 = new Course();
			if (cs == null) {
				cs2.setCourseName(course.getCourseName());
				cs2.setImageUrl(course.getImageUrl());
				cs2.setCompanyId("IH");
				cs2.setCompanyName("IIHT");
				cs2.setDuration(course.getDuration());
				cs2.setTechnology(course.getTechnology());
				courseRepository.save(cs2);
				System.out.println("Id: " + cs2.getId());
			}
			CourseModule cm = new CourseModule();

			CourseModule cm2 = courseModuleRepository.findByPrimaryKey(course.getModuleName(),
					course.getCourseName(), "e-assess");
			if (cm2 == null) {
				cm.setCompanyId("IH");
				cm.setCompanyName("IIHT");
				cm.setModuleName(course.getModuleName());
				cm.setContentLink(course.getContentLink());
//				cm.setTestId(course.getTestId());
				if (cs2.getId() == null) {
					cs2.setId(cs.getId());
					cs2.setCourseName(cs.getCourseName());
				}
				System.out.println(">>>>>> "+course.getTestId());
				cm.setCourseId(cs2.getId());
				cm.setCourseName(cs2.getCourseName());
				courseModuleRepository.save(cm);
			}

			System.out.println("learning Path: " + course.getLearningPathName());
			System.out.println("Course: " + course.getImageUrl());
			System.out.println("ImageURL: " + course.getCourseName());
		}
		LearningPath lp = learningPathRepository.findByPrimaryKey(courses.get(0).getLearningPathName(), "IH");
		LearningPath lp2 = new LearningPath();
		if (lp == null) {
			lp2.setCompanyId("IH");
			lp2.setCompanyName("IIHT");
			lp2.setName(courses.get(0).getLearningPathName());
			lp2.setImageUrl(courses.get(0).getImageUrl());
			lp2.setTechnology(courses.get(0).getTechnology());
			Set<String> hSet = new HashSet<String>();
			for (CourseDto course : courses) {
				hSet.add(course.getCourseName());
			}
			for (String cs : hSet) {
				Course cs23 = courseRepository.findByPrimaryKey(cs, "IH");
				list.add(cs23);
			}
			lp2.setCourses(list);
			learningPathRepository.save(lp2);
			System.out.println("Id: " + lp2.getId());
		}
	}

	public static <T> List<T> parseExcelFileToBeans(final InputStream xlsFile, final File jxlsConfigFile)
			throws Exception {
		System.out.println("test");
		final XLSReader xlsReader = ReaderBuilder.buildFromXML(jxlsConfigFile);
		System.out.println("test 2");
		final List<T> result = new ArrayList<>();
		final Map<String, Object> beans = new HashMap<>();
		beans.put("result", result);
		try {
			xlsReader.read(xlsFile, beans);
		} catch (Exception r) {
			r.printStackTrace();
		}
		return result;
	}
}
