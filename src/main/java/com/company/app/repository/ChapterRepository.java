package com.company.app.repository;

/*
 * ChapterRepository.java
 * Author: Evan Gertis
 */

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.company.app.model.Chapter;

@Repository
public interface ChapterRepository extends JpaRepository<Chapter, Integer> {
	Chapter findById(int id);
	List<Chapter> findByAvId(int avId);
}
