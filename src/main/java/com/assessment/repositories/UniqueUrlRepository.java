package com.assessment.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.assessment.data.UniqueUrl;

@Repository
public interface UniqueUrlRepository extends JpaRepository<UniqueUrl, Integer> {

	@Query("SELECT u FROM UniqueUrl u WHERE u.testId=:testId and u.urlId=:urlid")
	UniqueUrl findurl(@Param("testId") String testId, @Param("urlid") String urlid);
}
