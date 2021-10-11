package com.company.app.controller;

//ChapterController.java
//Author: Evan Gertis 04/20/2021

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

import com.company.app.service.WordMatchService;
import com.company.app.model.WordMatch;

@Controller
public class WordMatchController {
	private static final Logger logger = LogManager.getLogger(WordMatchController.class);
	private final WordMatchService WordMatchService;
	
	@Autowired
	public WordMatchController(WordMatchService WordMatchService) {
		this.WordMatchService = WordMatchService;
	}
	
	@PostMapping("/wordmatch")
	public void saveWordMatch(@RequestBody WordMatch wordMatch) {
		// chapter = WordMatchService.save(chapter);
		logger.debug("calling word match");
	}

	@RequestMapping("/wordmatch")
    public String getWordMatch(Model model) {
        // logger.info("Request to /chapter/{}",id);
        // Chapter chapter = chapterService.findById(id);
        // model.addAttribute("word_match", chapter);
        // logger.info("Response {}",chapter);
        return "word_match";
    }

}