create table if not exists av(
	id bigint(20) NOT NULL AUTO_INCREMENT,
	title VARCHAR(128),
	author VARCHAR(64),
	PRIMARY KEY(id)
);

create table if not exists chapter(
	id bigint(20) NOT NULL AUTO_INCREMENT,
	title VARCHAR(255),
	av_id bigint(20) NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(av_id) REFERENCES av(id)
);

create table if not exists exercise(
	id bigint(20) NOT NULL AUTO_INCREMENT,
	chapter_id bigint(20) NOT NULL,
	exercise VARCHAR(32),
	answer INT,
	question VARCHAR(255),
	one VARCHAR(255),
	two VARCHAR(255),
	three VARCHAR(255),
	PRIMARY KEY(id),
	FOREIGN KEY(chapter_id) REFERENCES chapter(id)
);

INSERT INTO av (id,title,author) VALUES (1, 'Algorithmic Intuition', 'Evan Gertis');
INSERT INTO chapter (id, title, av_id) VALUES (1,'Graph Traversals',1);