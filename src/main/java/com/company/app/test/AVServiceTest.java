package com.company.app.test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentMatchers;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.company.app.model.AV;
import com.company.app.repository.AVRepository;
import com.company.app.service.AVService;

public class AVServiceTest {
	@Mock
	AVRepository avRepository;
	
	@InjectMocks
	AVService avService;
	
	@BeforeEach
    public void init() {
        MockitoAnnotations.initMocks(this);
    }
	
	@Test
	public void checkCreateAccount() {
		AV av = new AV();
		av.setId(1);
		av.setAuthor("John Doe");
		av.setTitle("How to program");
		when(avRepository.save(ArgumentMatchers.any())).thenReturn(av);
		AV createdAV = avService.save(av);
		assertEquals(createdAV,av);
	}
}
