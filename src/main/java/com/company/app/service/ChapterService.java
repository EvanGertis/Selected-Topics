package com.company.app.service;

/*
 * ChapterService.java
 * Author: Evan Gertis
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.app.model.Chapter;
import com.company.app.repository.ChapterRepository;

@Service
public class ChapterService {
	
	ChapterRepository chapterRepository;
	
	@Autowired
	ChapterService(ChapterRepository chapterRepository){
		this.chapterRepository = chapterRepository;
	}
	
	public Chapter findById(int id) {
		return chapterRepository.findById(id);
	}
	
	public void deleteById(int id) {
		chapterRepository.deleteById(id);
	}
	
	public Chapter save(Chapter chapter) {
		return chapterRepository.save(chapter);
	}
	
	public List<Chapter> findAllById(int avId){
		return chapterRepository.findByAvId(avId);
	}
	
	public Chapter updateChapterById(Chapter chapter, int id) {
		Chapter chapterToUpdate = chapterRepository.findById(id);
		chapterToUpdate.setAvId(chapter.getAvId());
		chapterToUpdate.setId(chapter.getId());
		chapterToUpdate.setTitle(chapter.getTitle());
		chapterToUpdate = chapterRepository.save(chapterToUpdate);
		return chapterToUpdate;
	}

}
