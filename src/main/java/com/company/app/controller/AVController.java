package com.company.app.controller;

/*
 * AVController.java
 * Author: Evan Gertis
 */

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.company.app.model.AV;
import com.company.app.model.Chapter;
import com.company.app.service.AVService;
import com.company.app.service.ChapterService;

@Controller
public class AVController {
    private static final Logger logger = LogManager.getLogger(AVController.class);
    private final AVService avService;
    private final ChapterService chapterService;

    @Autowired
    public AVController(AVService avService, ChapterService chapterService) {
        this.avService = avService;
        this.chapterService = chapterService;
    }
    
    @RequestMapping("/avs/")
    public ResponseEntity<List<AV>> getAVs(){
    	List<AV> avs = avService.findAll();
    	return new ResponseEntity<List<AV>>(avs, HttpStatus.OK);
    }
    
    @PostMapping("/avs/")
    public ResponseEntity<AV> createAV(@RequestBody AV av){
    	av = avService.save(av);
    	return new ResponseEntity<AV>(av, HttpStatus.CREATED);
    }
    

    @DeleteMapping("/avs/{id}")
    public HttpStatus deleteAVById(@PathVariable int id) {
    	avService.deleteById(id);
    	return HttpStatus.ACCEPTED;
    }
    
    @PutMapping("/avs/{id}")
    public ResponseEntity<AV> updateAVById(AV av, int id){
    	av = avService.updateAVById(av, id);
    	return new ResponseEntity<AV>(av, HttpStatus.ACCEPTED);
    }
    
    @RequestMapping("/avs/{id}")
    public ResponseEntity<AV> getAVById(@PathVariable int id){
    	AV av = avService.findById(id);
    	return new ResponseEntity<AV>(av, HttpStatus.OK);
    }
    
    @RequestMapping("/avs/chapters")
	public ResponseEntity<List<Chapter>> getChaptersById(@RequestParam int avId) {
		List<Chapter> chapter = chapterService.findAllById(avId);
		return new ResponseEntity<List<Chapter>>(chapter, HttpStatus.OK);
	}
    
    @RequestMapping("/avs/show/{id}")
    public String getAVViewById(Model model, @PathVariable int id) {
    	logger.info("Request to /avs/{}",id);
    	AV av = avService.findById(id);
    	model.addAttribute("av", av);
    	logger.info("Response {}", av);
    	return "av";
    }
}
