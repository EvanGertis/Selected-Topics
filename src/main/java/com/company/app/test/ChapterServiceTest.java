package com.company.app.test;

import org.junit.jupiter.api.BeforeEach;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.company.app.repository.ChapterRepository;
import com.company.app.service.ChapterService;

public class ChapterServiceTest {
	@Mock
	ChapterRepository chapterRepository;
	
	@InjectMocks
	ChapterService chapterService;
	
	@BeforeEach
    public void init() {
        MockitoAnnotations.initMocks(this);
    }

}
