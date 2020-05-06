package com.assessment.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.assessment.data.Question;
import com.assessment.data.QuestionMapper;
import com.assessment.repositories.QuestionMapperRepository;
import com.assessment.services.QuestionMapperService;

@Service
@Transactional
public class QuestionMapperServiceImpl implements QuestionMapperService {

	@Autowired
	QuestionMapperRepository questionMapperRepo;

	@Override
	public List<QuestionMapper> getQuestionsForSection(String testName, String sectionName, String companyId) {
		return questionMapperRepo.getQuestionsForSection(testName, sectionName, companyId);
	}

	@Override
	public QuestionMapper findByQId(String testName, String sectionName, String companyId, Question question) {
		// TODO Auto-generated method stub
		return questionMapperRepo.findByQId(testName, sectionName, companyId, question);
	}


	@Override
	public void save(QuestionMapper qmap) {
		// TODO Auto-generated method stub
		
	}

}
