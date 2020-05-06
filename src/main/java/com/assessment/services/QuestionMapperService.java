package com.assessment.services;

import java.util.List;

import com.assessment.data.Question;
import com.assessment.data.QuestionMapper;

public interface QuestionMapperService {

	public List<QuestionMapper> getQuestionsForSection(String testName, String sectionName, String companyId);

	public QuestionMapper findByQId(String testName, String sectionName, String companyId, Question question);

	public void save(QuestionMapper qmap);
}
