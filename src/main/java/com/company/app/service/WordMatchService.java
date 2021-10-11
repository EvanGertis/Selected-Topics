package com.company.app.service;

/*
 * VisualizationService.java
 * Author: Evan Gertis
 */

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.app.repository.WordMatchRepository;

@Service
public class WordMatchService {
	
	private WordMatchRepository wordMatchRepository;
	
	@Autowired
	WordMatchService(WordMatchRepository wordMatchRepository){
		this.wordMatchRepository = wordMatchRepository;
	}
}
