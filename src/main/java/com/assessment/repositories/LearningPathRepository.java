package com.assessment.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.assessment.data.LearningPath;

public interface LearningPathRepository extends JpaRepository<LearningPath,Long>{
	
	@Query("SELECT c FROM LearningPath c WHERE c.name=:name and c.companyId=:companyId")
	LearningPath findByPrimaryKey(@Param("name") String name, @Param("companyId") String companyId);

	
	@Query("SELECT c FROM LearningPath c WHERE c.searchLabel LIKE %:searchLabel% and c.companyId=:companyId")
	List<LearningPath> searchLearningPaths(@Param("searchLabel") String searchLabel, @Param("companyId") String companyId);
	
	@Query("SELECT c FROM LearningPath c where c.companyId=:companyId order by c.noOfEnrollments DESC")
	List<LearningPath> getPopularLearningPaths(@Param("companyId") String companyId);
	
	List<LearningPath> findByCompanyId(String cid);
	@Query(value = "select name from LearningPath where id=(select LearningPath_id from LearningPath_Course where courses_id=(select id from Course where courseName=:name))", nativeQuery = true)
	String findLearningPathNameBycourseName(@Param("name") String name);
}
