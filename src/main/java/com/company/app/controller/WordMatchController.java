package com.company.app.controller;

//WordMatchController.java
//Author: Evan Gertis 10/11/2021

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.http.HttpStatus;

import com.company.app.service.WordMatchService;
import com.company.app.model.WordMatch;

@Controller
public class WordMatchController {
	private static final Logger logger =  LogManager.getLogger(WordMatchController.class);
	private final WordMatchService wordMatchService;
	
	@Autowired
	public WordMatchController(WordMatchService wordMatchService) {
		logger.info("visiting word match");
		this.wordMatchService = wordMatchService;
	}
	
	@PostMapping("/wordmatch")
	public ResponseEntity<?> saveWordMatch(@RequestBody WordMatch wordMatch) {
		wordMatchService.saveContent(wordMatch);
		return new ResponseEntity<HttpStatus>(HttpStatus.CREATED, HttpStatus.CREATED);
	}

	@RequestMapping("/wordmatch")
    public String getWordMatch(Model model) {
        return "word_match";
    }

	@RequestMapping("/wordmatch/{id}")
    public String getWordMatch(@PathVariable String id ,Model model) {
        return "word_match"+id;
    }

}