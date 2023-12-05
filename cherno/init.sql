CREATE TABLE statistics (
    statistic_id SERIAL PRIMARY KEY,
    games INTEGER,
    kick_gate INTEGER,
    came_out INTEGER,
    returned INTEGER,
    assist INTEGER,
    earned_penalty INTEGER,
    player_id INTEGER NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

CREATE TABLE team (
  team_id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  logo_big TEXT,
  logo_medium TEXT,
  logo_small TEXT,
  stadium_id INTEGER NULL,
  managers_id TEXT NULL,
  main_players_id TEXT NULL,
  second_players_id TEXT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  deleted_at TIMESTAMP NULL
);

CREATE TABLE player (
    player_id SERIAL PRIMARY KEY,
    firstname VARCHAR(100),
    lastname VARCHAR(100),
    patronymic VARCHAR(100) NULL,
    date_of_birth TIMESTAMP,
    pic_url TEXT,
    number INTEGER,
    career TEXT,
    weight FLOAT,
    height FLOAT,
    country VARCHAR(255),
    role VARCHAR(255),
    team_id INTEGER,
    gallery TEXT NULL,
    show BOOLEAN,
    statistic_id INTEGER NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

CREATE TABLE manager(
    manager_id SERIAL PRIMARY KEY,
    firstname varchar(100),
    lastname varchar(100),
    patronymic varchar(100) NULL,
    pic_url TEXT,
    date_of_birth TIMESTAMP,
    biography TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

CREATE TABLE stadium(
    stadium_id SERIAL PRIMARY KEY,
    name varchar (255),
    shortname varchar (125),
    address varchar (255),
    city varchar (255),
    pic_url TEXT,
    photo_id INTEGER,
    teams_id TEXT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

CREATE TABLE news(
    news_id SERIAL PRIMARY KEY,
    title TEXT,
    subtitle TEXT NULL,
    content TEXT,
    pic_url TEXT,
    vid_url TEXT,
    photos TEXT,
    videos TEXT,
    valid_news BOOLEAN,
    slider_active BOOLEAN,
    news_block_active BOOLEAN,
    player_id INTEGER NULL,
    manager_id INTEGER NULL,
    match_id INTEGER NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE match (
    match_id SERIAL PRIMARY KEY,
    team1_id INTEGER,
    team2_id INTEGER,
    start_time TIMESTAMP,
    stadium_id INTEGER NULL,
    referee_id INTEGER NULL,
    status TEXT,
    guess BOOLEAN,
    ligue_id INTEGER NULL,
    season_id INTEGER NULL,
    score varchar(5),
    create_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE referee(
    referee_id SERIAL PRIMARY KEY,
    firstname varchar(150),
    lastname varchar(150),
    patronymic varchar(150) NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE season(
    season_id SERIAL PRIMARY KEY,
    name varchar (255),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE ligue(
    ligue_id SERIAL PRIMARY KEY,
    name varchar (255),
    ligue_statistics_id TEXT,
    logo TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE ligue_statistic(
    ligues_statistic_id SERIAL PRIMARY KEY,
    team_id INTEGER,
    ligue_id INTEGER,
    games INTEGER,
    wins INTEGER,
    draws INTEGER,
    losses INTEGER,
    scored_goals INTEGER,
    goals_against INTEGER,
    points INTEGER,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE photo (
    photo_id SERIAL PRIMARY KEY,
    name TEXT,
    url TEXT,
    show_in_block_photos BOOLEAN,
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);

CREATE TABLE video (
   video_id SERIAL PRIMARY KEY,
   name TEXT,
   url TEXT,
   show_in_block_videos BOOLEAN,
   created_at TIMESTAMP,
   updated_at TIMESTAMP,
   deleted_at TIMESTAMP
);

CREATE TABLE sponsor(
    sponsor_id SERIAL PRIMARY KEY,
    name varchar(255),
    logo TEXT,
    description TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);
CREATE TABLE block_partner(
    title_id SERIAL PRIMARY KEY,
    title TEXT,
    description TEXT,
    show BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);
CREATE TABLE block_sponsor(
    title_id SERIAL PRIMARY KEY,
    title TEXT,
    description TEXT,
    show BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

ALTER TABLE player
ADD CONSTRAINT fk_player_team
FOREIGN KEY (team_id)
REFERENCES team(team_id);

ALTER TABLE player
ADD CONSTRAINT fk_player_statistics
FOREIGN KEY (statistic_id)
REFERENCES statistics(statistic_id);

ALTER TABLE team
ADD CONSTRAINT fk_team_stadium
FOREIGN KEY (stadium_id)
REFERENCES stadium(stadium_id);

ALTER TABLE news
ADD CONSTRAINT fk_news_match
FOREIGN KEY (match_id)
REFERENCES match(match_id);

ALTER TABLE news
ADD CONSTRAINT fk_news_player
FOREIGN KEY (player_id)
REFERENCES player(player_id);

ALTER TABLE news
ADD CONSTRAINT fk_news_manager
FOREIGN KEY (manager_id)
REFERENCES manager(manager_id);

ALTER TABLE match
ADD CONSTRAINT fk_match_referee
FOREIGN KEY (referee_id)
REFERENCES referee(referee_id);

ALTER TABLE match
ADD CONSTRAINT fk_match_stadium
FOREIGN KEY (stadium_id)
REFERENCES stadium(stadium_id);

ALTER TABLE match
ADD CONSTRAINT fk_match_ligue
FOREIGN KEY (ligue_id)
REFERENCES ligue(ligue_id);

ALTER TABLE match
ADD CONSTRAINT fk_match_season
FOREIGN KEY (season_id)
REFERENCES season(season_id);

INSERT INTO sponsor (name, logo, description, created_at, updated_at, deleted_at) VALUES
    ('Sponsor1', 'logo1.png', 'Description for Sponsor1', NOW(), NOW(), NULL),
    ('Sponsor2', 'logo2.png', 'Description for Sponsor2', NOW(), NOW(), NULL),
    ('Sponsor3', 'logo3.png', 'Description for Sponsor3', NOW(), NOW(), NULL),
    ('Sponsor4', 'logo4.png', 'Description for Sponsor4', NOW(), NOW(), NULL),
    ('Sponsor5', 'logo5.png', 'Description for Sponsor5', NOW(), NOW(), NULL),
    ('Sponsor6', 'logo6.png', 'Description for Sponsor6', NOW(), NOW(), NULL),
    ('Sponsor7', 'logo7.png', 'Description for Sponsor7', NOW(), NOW(), NULL),
    ('Sponsor8', 'logo8.png', 'Description for Sponsor8', NOW(), NOW(), NULL),
    ('Sponsor9', 'logo9.png', 'Description for Sponsor9', NOW(), NOW(), NULL),
    ('Sponsor10', 'logo10.png', 'Description for Sponsor10', NOW(), NOW(), NULL);

INSERT INTO block_partner (title, description, show, created_at, updated_at, deleted_at) VALUES
    ('Partner1', 'Description for Partner1', false, NOW(), NOW(), NULL),
    ('Partner2', 'Description for Partner2', false, NOW(), NOW(), NULL),
    ('Partner3', 'Description for Partner3', false, NOW(), NOW(), NULL),
    ('Partner4', 'Description for Partner4', false, NOW(), NOW(), NULL),
    ('Partner5', 'Description for Partner5', true, NOW(), NOW(), NULL),
    ('Partner6', 'Description for Partner6', true, NOW(), NOW(), NULL),
    ('Partner7', 'Description for Partner7', true, NOW(), NOW(), NULL),
    ('Partner8', 'Description for Partner8', true, NOW(), NOW(), NULL),
    ('Partner9', 'Description for Partner9', true, NOW(), NOW(), NULL),
    ('Partner10', 'Description for Partner10', true,  NOW(), NOW(), NULL);

INSERT INTO block_sponsor (title, description, show, created_at, updated_at, deleted_at) VALUES
    ('BlockSponsor1', 'Description for BlockSponsor1', false, NOW(), NOW(), NULL),
    ('BlockSponsor2', 'Description for BlockSponsor2', false, NOW(), NOW(), NULL),
    ('BlockSponsor3', 'Description for BlockSponsor3', false, NOW(), NOW(), NULL),
    ('BlockSponsor4', 'Description for BlockSponsor4', false, NOW(), NOW(), NULL),
    ('BlockSponsor5', 'Description for BlockSponsor5', false, NOW(), NOW(), NULL),
    ('BlockSponsor6', 'Description for BlockSponsor6', true, NOW(), NOW(), NULL),
    ('BlockSponsor7', 'Description for BlockSponsor7', true, NOW(), NOW(), NULL),
    ('BlockSponsor8', 'Description for BlockSponsor8', true, NOW(), NOW(), NULL),
    ('BlockSponsor9', 'Description for BlockSponsor9', true, NOW(), NOW(), NULL),
    ('BlockSponsor10', 'Description for BlockSponsor10', true, NOW(), NOW(), NULL);

INSERT INTO photo (name, url, show_in_block_photos, created_at, updated_at, deleted_at) VALUES
    ('Photo 1', 'http://example.com/photo1.jpg', true, NOW(), NOW(), NULL),
    ('Photo 2', 'http://example.com/photo2.jpg', false, NOW(), NOW(), NULL),
    ('Photo 3', 'http://example.com/photo3.jpg', true, NOW(), NOW(), NULL),
    ('Photo 4', 'http://example.com/photo4.jpg', false, NOW(), NOW(), NULL),
    ('Photo 5', 'http://example.com/photo5.jpg', true, NOW(), NOW(), NULL),
    ('Photo 6', 'http://example.com/photo6.jpg', false, NOW(), NOW(), NULL),
    ('Photo 7', 'http://example.com/photo7.jpg', true, NOW(), NOW(), NULL),
    ('Photo 8', 'http://example.com/photo8.jpg', false, NOW(), NOW(), NULL),
    ('Photo 9', 'http://example.com/photo9.jpg', true, NOW(), NOW(), NULL),
    ('Photo 10', 'http://example.com/photo10.jpg', true, NOW(), NOW(), NULL);

INSERT INTO video (name, url, show_in_block_videos, created_at, updated_at, deleted_at) VALUES
    ('Video 1', 'http://example.com/video1.mp4', true, NOW(), NOW(), NULL),
    ('Video 2', 'http://example.com/video2.mp4', true, NOW(), NOW(), NULL),
    ('Video 3', 'http://example.com/video3.mp4', false, NOW(), NOW(), NULL),
    ('Video 4', 'http://example.com/video4.mp4', true, NOW(), NOW(), NULL),
    ('Video 5', 'http://example.com/video5.mp4', true, NOW(), NOW(), NULL),
    ('Video 6', 'http://example.com/video6.mp4', false, NOW(), NOW(), NULL),
    ('Video 7', 'http://example.com/video7.mp4', true, NOW(), NOW(), NULL),
    ('Video 8', 'http://example.com/video8.mp4', false, NOW(), NOW(), NULL),
    ('Video 9', 'http://example.com/video9.mp4', false, NOW(), NOW(), NULL),
    ('Video 10', 'http://example.com/video10.mp4', false, NOW(), NOW(), NULL);

INSERT INTO ligue (name, ligue_statistics_id, logo, created_at, updated_at) VALUES
    ('Лига 1', '12', 'logo1.png', NOW(), NOW()),
    ('Лига 2', '', 'logo1.png', NOW(), NOW()),
    ('Лига 3', '', 'logo1.png', NOW(), NOW()),
    ('Лига 4', '', 'logo1.png', NOW(), NOW()),
    ('Лига 5', '', 'logo1.png', NOW(), NOW()),
    ('Лига 6', '', 'logo1.png', NOW(), NOW()),
    ('Лига 7', '', 'logo1.png', NOW(), NOW()),
    ('Лига 8', '', 'logo1.png', NOW(), NOW()),
    ('Лига 9', '', 'logo1.png', NOW(), NOW()),
    ('Лига 10', '', 'logo1.png', NOW(), NOW());

INSERT INTO ligue_statistic (team_id, ligue_id, games, wins, draws, losses, scored_goals, goals_against, points, created_at, updated_at) VALUES
    (1, 1, 20, 15, 3, 2, 40, 15, 48, NOW(), NOW()),
    (2, 2, 20, 12, 5, 3, 35, 20, 41, NOW(), NOW()),
    (3, 3, 20, 14, 2, 4, 38, 18, 44, NOW(), NOW()),
    (4, 4, 20, 10, 6, 4, 30, 25, 36, NOW(), NOW()),
    (5, 5, 20, 11, 4, 5, 32, 22, 37, NOW(), NOW()),
    (6, 6, 20, 13, 3, 4, 36, 17, 42, NOW(), NOW()),
    (7, 7, 20, 9, 7, 4, 28, 21, 34, NOW(), NOW()),
    (8, 8, 20, 8, 6, 6, 25, 25, 30, NOW(), NOW()),
    (9, 9, 20, 10, 4, 6, 31, 27, 34, NOW(), NOW()),
    (10, 10, 20, 12, 2, 6, 33, 20, 38, NOW(), NOW());

INSERT INTO season (name, start_date, end_date, created_at, updated_at) VALUES
    ('Сезон 1', '2023-01-01', '2023-06-30', NOW(), NOW()),
    ('Сезон 2', '2023-07-01', '2023-12-31', NOW(), NOW()),
    ('Сезон 3', '2024-01-01', '2024-06-30', NOW(), NOW()),
    ('Сезон 4', '2024-07-01', '2024-12-31', NOW(), NOW()),
    ('Сезон 5', '2025-01-01', '2025-06-30', NOW(), NOW()),
    ('Сезон 6', '2025-07-01', '2025-12-31', NOW(), NOW()),
    ('Сезон 7', '2026-01-01', '2026-06-30', NOW(), NOW()),
    ('Сезон 8', '2026-07-01', '2026-12-31', NOW(), NOW()),
    ('Сезон 9', '2027-01-01', '2027-06-30', NOW(), NOW()),
    ('Сезон 10', '2027-07-01', '2027-12-31', NOW(), NOW());

INSERT INTO referee (firstname, lastname, patronymic, created_at, updated_at) VALUES
    ('Иван', 'Иванов', 'Иванович', NOW(), NOW()),
    ('Петр', 'Петров', 'Петрович', NOW(), NOW()),
    ('Анна', 'Сидорова', 'Ивановна', NOW(), NOW()),
    ('Александр', 'Козлов', 'Сергеевич', NOW(), NOW()),
    ('Мария', 'Николаева', 'Александровна', NOW(), NOW()),
    ('Дмитрий', 'Смирнов', 'Дмитриевич', NOW(), NOW()),
    ('Екатерина', 'Иванова', 'Петровна', NOW(), NOW()),
    ('Андрей', 'Андреев', 'Андреевич', NOW(), NOW()),
    ('Ольга', 'Ольгова', 'Ольговна', NOW(), NOW()),
    ('Сергей', 'Сергеев', 'Сергеевич', NOW(), NOW());

INSERT INTO news (title, subtitle, content, pic_url, vid_url, photos, videos, valid_news, slider_active, news_block_active, created_at, updated_at) VALUES
    ('Новость 1', NULL, 'Описание новости 1', 'url_картинки_1', 'url_видео_1', '', '', true, true, true, NOW(), NOW()),
    ('Новость 2', NULL, 'Описание новости 2', 'url_картинки_2', 'url_видео_2', '', '', true, true, true, NOW(), NOW()),
    ('Новость 3', 'Подзаголовок новости 3', 'Описание новости 3', 'url_картинки_3', 'url_видео_3', 'url_фото_3, url_фото_4', '', true, true, false, NOW(), NOW()),
    ('Новость 4', NULL, 'Описание новости 4', 'url_картинки_4', 'url_видео_4', '', '', true, false, true, NOW(), NOW()),
    ('Новость 5', NULL, 'Описание новости 5', 'url_картинки_5', 'url_видео_5', '', '', true, true, false, NOW(), NOW()),
    ('Новость 6', 'Подзаголовок новости 6', 'Описание новости 6', 'url_картинки_6', '', 'url_фото_6, url_фото_7', '', true, true, true, NOW(), NOW()),
    ('Новость 7', NULL, 'Описание новости 7', 'url_картинки_7', '', '', 'url_видео_7', true, true, true, NOW(), NOW()),
    ('Новость 8', NULL, 'Описание новости 8', 'url_картинки_8', 'url_видео_8', '', '', true, false, false, NOW(), NOW()),
    ('Новость 9', 'Подзаголовок новости 9', 'Описание новости 9', 'url_картинки_9', 'url_видео_9', 'url_фото_8, url_фото_9', '', true, true, true, NOW(), NOW()),
    ('Новость 10', NULL, 'Описание новости 10', 'url_картинки_10', '', 'url_фото_10', 'url_видео_10', true, true, false, NOW(), NOW());

INSERT INTO manager (firstname, lastname, patronymic, pic_url, date_of_birth, biography, created_at, updated_at, deleted_at) VALUES
     ('John', 'Doe', 'Sr.', 'pic1.jpg', '1990-01-01', 'Experienced manager in the field.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
     ('Jane', 'Smith', 'Jr.', 'pic2.jpg', '1985-05-15', 'Skilled leader with a passion for success.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
     ('Bob', 'Johnson', '', 'pic3.jpg', '1978-11-30', 'Team-oriented manager with proven results.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
     ('Alice', 'Williams', 'III', 'pic4.jpg', '1995-03-20', 'Innovative thinker with strategic vision.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
     ('Charlie', 'Brown', '', 'pic5.jpg', '1982-09-10', 'Motivational leader driving team performance.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
     ('Eva', 'Davis', 'Sr.', 'pic6.jpg', '1988-07-25', 'Passionate about organizational development.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
     ('Michael', 'Anderson', 'Jr.', 'pic7.jpg', '1992-04-12', 'Proactive manager with strong communication skills.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
     ('Sophia', 'Miller', '', 'pic8.jpg', '1975-12-05', 'Results-driven professional with extensive experience.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
     ('Ryan', 'Garcia', 'III', 'pic9.jpg', '1980-06-18', 'Strategic planner focused on achieving goals.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
     ('Emma', 'Turner', '', 'pic10.jpg', '1998-02-28', 'Adaptable leader fostering a positive work environment.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

INSERT INTO stadium (name, shortname, address, city, pic_url, photo_id, teams_id, created_at, updated_at, deleted_at) VALUES
    ('Stadium1', 'St1', 'Address1', 'City1', 'pic1.jpg', 1, '1,2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Stadium2', 'St2', 'Address2', 'City2', 'pic2.jpg', 2, '1,2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Stadium3', 'St3', 'Address3', 'City3', 'pic3.jpg', 3, '1,2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Stadium4', 'St4', 'Address4', 'City4', 'pic4.jpg', 4, '7,8', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Stadium5', 'St5', 'Address5', 'City5', 'pic5.jpg', 5, '3,4', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Stadium6', 'St6', 'Address6', 'City6', 'pic6.jpg', 6, '5,6', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Stadium7', 'St7', 'Address7', 'City7', 'pic7.jpg', 7, '5,6', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Stadium8', 'St8', 'Address8', 'City8', 'pic8.jpg', 8, '1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Stadium9', 'St9', 'Address9', 'City9', 'pic9.jpg', 9, '2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Stadium10', 'St10', 'Address10', 'City10', 'pic10.jpg', 10, '8,9', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

INSERT INTO team (name, logo_big, logo_medium, logo_small, stadium_id, managers_id, main_players_id, second_players_id, created_at, updated_at) VALUES
    ('Team A', 'https://example.com/logo_big_teamA.jpg', 'https://example.com/logo_medium_teamA.jpg', 'https://example.com/logo_small_teamA.jpg', 1, '1,2', '3,4', '5,6', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team B', 'https://example.com/logo_big_teamB.jpg', 'https://example.com/logo_medium_teamB.jpg', 'https://example.com/logo_small_teamB.jpg', 2, '7,8', '9,10', '11,12', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team C', 'https://example.com/logo_big_teamC.jpg', 'https://example.com/logo_medium_teamC.jpg', 'https://example.com/logo_small_teamC.jpg', 3, '13,14', '15,16', '17,18', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team D', 'https://example.com/logo_big_teamD.jpg', 'https://example.com/logo_medium_teamD.jpg', 'https://example.com/logo_small_teamD.jpg', 4, '19,20', '21,22', '23,24', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team E', 'https://example.com/logo_big_teamE.jpg', 'https://example.com/logo_medium_teamE.jpg', 'https://example.com/logo_small_teamE.jpg', 5, '25,26', '27,28', '29,30', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team F', 'https://example.com/logo_big_teamF.jpg', 'https://example.com/logo_medium_teamF.jpg', 'https://example.com/logo_small_teamF.jpg', 6, '31,32', '33,34', '35,36', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team G', 'https://example.com/logo_big_teamG.jpg', 'https://example.com/logo_medium_teamG.jpg', 'https://example.com/logo_small_teamG.jpg', 7, '37,38', '39,40', '41,42', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team H', 'https://example.com/logo_big_teamH.jpg', 'https://example.com/logo_medium_teamH.jpg', 'https://example.com/logo_small_teamH.jpg', 8, '43,44', '45,46', '47,48', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team I', 'https://example.com/logo_big_teamI.jpg', 'https://example.com/logo_medium_teamI.jpg', 'https://example.com/logo_small_teamI.jpg', 9, '49,50', '51,52', '53,54', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team J', 'https://example.com/logo_big_teamJ.jpg', 'https://example.com/logo_medium_teamJ.jpg', 'https://example.com/logo_small_teamJ.jpg', 10, '55,56', '57,58', '59,60', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO player (firstname, lastname, date_of_birth, pic_url, number, weight, height, country, role, team_id, show, created_at, updated_at) VALUES
    ('John', 'Doe', '1995-05-15 00:00:00', 'https://example.com/johndoe.jpg', 7, 78.5, 185.0, 1, 'Forward', 1, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Alice', 'Smith', '1990-02-20 00:00:00', 'https://example.com/alicesmith.jpg', 14, 65.0, 170.0, 2, 'Midfielder', 2, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Bob', 'Johnson', '1988-11-10 00:00:00', 'https://example.com/bobjohnson.jpg', 22, 80.0, 190.0, 3, 'Goalkeeper', 3, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Emma', 'Williams', '1992-08-03 00:00:00', 'https://example.com/emmawilliams.jpg', 9, 68.5, 175.0, 4, 'Midfielder', 4, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Michael', 'Brown', '1994-04-25 00:00:00', 'https://example.com/michaelbrown.jpg', 5, 75.0, 180.0, 5, 'Defender', 5, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Sophia', 'Davis', '1998-09-08 00:00:00', 'https://example.com/sophiadavis.jpg', 17, 72.0, 178.0, 6, 'Forward', 6, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('David', 'Taylor', '1996-06-18 00:00:00', 'https://example.com/davidtaylor.jpg', 12, 77.0, 183.0, 7, 'Midfielder', 7, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Olivia', 'Moore', '1993-12-30 00:00:00', 'https://example.com/oliviamoore.jpg', 20, 71.5, 177.0, 8, 'Defender', 8, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Daniel', 'Wilson', '1997-03-14 00:00:00', 'https://example.com/danielwilson.jpg', 8, 74.0, 182.0, 9, 'Goalkeeper', 9, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Ava', 'Anderson', '1991-07-22 00:00:00', 'https://example.com/avaanderson.jpg', 15, 66.5, 172.0, 10, 'Forward', 10, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO statistics (games, kick_gate, came_out, returned, assist, earned_penalty, player_id, created_at, updated_at) VALUES
    (0, 0, 0, 0, 0, 0, null, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (20, 10, 5, 2, 8, 3, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (18, 8, 3, 1, 5, 2, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (22, 12, 4, 0, 10, 4, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (25, 15, 7, 3, 12, 5, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (19, 9, 6, 2, 7, 3, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (21, 11, 5, 1, 9, 4, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (24, 14, 6, 3, 11, 6, 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (17, 7, 4, 1, 4, 2, 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (23, 13, 5, 2, 10, 5, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (20, 10, 6, 2, 8, 3, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO match (team1_id, team2_id, start_time, stadium_id, referee_id, status, guess, ligue_id, season_id, score, create_at, updated_at) VALUES
     (1, 2, '2023-01-15 18:00:00', 1, 1, 'Scheduled', true, 1, 1, '0-0', NOW(), NOW()),
     (3, 4, '2023-01-16 15:30:00', 2, 2, 'In Progress', false, 2, 1, '1-1', NOW(), NOW()),
     (5, 6, '2023-01-17 20:45:00', 3, 3, 'Completed', true, 3, 1, '2-1', NOW(), NOW()),
     (7, 8, '2023-01-18 16:00:00', 4, 4, 'Completed', false, 4, 1, '3-0', NOW(), NOW()),
     (9, 10, '2023-01-19 19:30:00', 5, 5, 'Scheduled', true, 5, 1, '0-0', NOW(), NOW()),
     (1, 3, '2023-01-20 14:00:00', 6, 6, 'In Progress', false, 6, 1, '1-2', NOW(), NOW()),
     (2, 4, '2023-01-21 17:15:00', 7, 7, 'Completed', true, 7, 1, '2-2', NOW(), NOW()),
     (5, 7, '2023-01-22 20:30:00', 8, 8, 'Scheduled', false, 8, 1, '0-0', NOW(), NOW()),
     (6, 8, '2023-01-23 16:45:00', 9, 9, 'In Progress', true, 9, 1, '1-0', NOW(), NOW()),
     (9, 10, '2023-01-24 19:00:00', 10, 10, 'Completed', false, 10, 1, '3-1', NOW(), NOW());

CREATE OR REPLACE FUNCTION update_player_statistic_id()
RETURNS TRIGGER AS $$
BEGIN
UPDATE player
SET statistic_id = NEW.statistic_id
WHERE player_id = NEW.player_id;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_player_statistic_id_trigger
AFTER INSERT ON statistics
FOR EACH ROW
EXECUTE FUNCTION update_player_statistic_id();

CREATE OR REPLACE FUNCTION update_ligue_statistic_id()
    RETURNS TRIGGER AS $$
BEGIN
    UPDATE ligue
    SET ligue_statistics_id =
            CASE
                WHEN ligue.ligue_statistics_id <> '' THEN CONCAT(ligue.ligue_statistics_id, ',', NEW.ligues_tatistic_id::TEXT)
                ELSE NEW.ligues_tatistic_id::TEXT
                END
    WHERE ligue_id = NEW.ligue_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_ligue_statistic_id_trigger
    AFTER INSERT ON ligue_statistic
    FOR EACH ROW
EXECUTE FUNCTION update_ligue_statistic_id();