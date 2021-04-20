package com.company.app.service;

/*
 * AVService.java
 * Author: Evan Gertis
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.app.model.AV;
import com.company.app.repository.AVRepository;

@Service
public class AVService {
	
	private AVRepository avRepository;
	
	@Autowired
	AVService(AVRepository avRepository){
		this.avRepository = avRepository;
	}
	
	public AV save(AV av) {
		return avRepository.save(av);
	}
	
	public AV findById(int id) {
		return avRepository.findById(id);
	}
	
	public void deleteById(int id) {
		avRepository.deleteById(id);
	}
	
	public List<AV> findAll(){
		return avRepository.findAll();
	}
	
	public AV updateAVById(AV av, int id) {
		AV avToUpdate = avRepository.findById(id);
		avToUpdate.setAuthor(av.getAuthor());
		avToUpdate.setTitle(av.getAuthor());
		avToUpdate = avRepository.save(av);
		return avToUpdate;
	}
	

}
