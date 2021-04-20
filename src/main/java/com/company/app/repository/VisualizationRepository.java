package com.company.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.company.app.model.Visualization;

@Repository
public interface VisualizationRepository extends JpaRepository<Visualization, Integer> {
	Visualization findById(int id);
	Visualization findByExerciseId(int exerciseId);
}
