package com.company.app.repository;

/*
 * AVRepository.java
 * Author: Evan Gertis
 */

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.company.app.model.AV;

@Repository
public interface AVRepository extends JpaRepository<AV, Integer> {
	AV findById(int id);
	List<AV> findAll();
}
