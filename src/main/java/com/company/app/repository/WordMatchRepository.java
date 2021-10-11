package com.company.app.repository;

/*
 * VisualizationRepository.java
 * Author: Evan Gertis
 */

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.company.app.model.WordMatch;

@Repository
public interface WordMatchRepository extends JpaRepository<WordMatch, Integer> {
	WordMatch findById(int id);
}
