-- ============================================================
--  HR Employee Directory System
--  Database  : Employee_Directory_system
--  Author    : Suhail Anwar
--  Date      : 2026
--  Tool      : MySQL 8.0.46
-- ============================================================

CREATE DATABASE Employee_Directory_system;
USE Employee_Directory_system;

-- ============================================================
-- TABLE 1: Departments
-- ============================================================

CREATE TABLE Departments (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50)  NOT NULL,
    location  VARCHAR(100)
);

INSERT INTO Departments VALUES
(1, 'Engineering', 'Islamabad'),
(2, 'Sales',       'Karachi'),
(3, 'HR',          'Lahore'),
(4, 'Marketing',   'Peshawar'),
(5, 'Finance',     'Gilgit');

-- ============================================================
-- TABLE 2: Employees  (self-referencing FK on Manager_id)
-- ============================================================

CREATE TABLE Employees (
    emp_id INT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(255) DEFAULT NULL,
    email VARCHAR(255) DEFAULT NULL,
    phone VARCHAR(20)  DEFAULT NULL,
    hire_date DATE DEFAULT NULL,
    Salary INT DEFAULT NULL,
    dept_id INT DEFAULT NULL,
    Manager_id INT DEFAULT NULL,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id),
    FOREIGN KEY (Manager_id) REFERENCES Employees(emp_id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

INSERT INTO Employees (emp_id, emp_name, email, phone, hire_date, Salary, dept_id, manager_id) VALUES
  (100,'Hedy Sloan','hedysloan5414@gmail.com','03887019703','2025-03-01',107190,1,NULL),
  (101,'Carissa Hopkins','carissahopkins3559@gmail.org','03168613021','2022-05-07',100108,2,NULL),
  (102,'Shelley Bates','shelleybates@hotmail.org','03622693310','2025-06-01',46828,3,NULL),
  (103,'Chloe Christian','chloechristian@email.org','03774175272','2025-11-14',73937,4,NULL),
  (104,'Zeus Carson','zeuscarson5141@hotmail.org','03881328838','2024-02-28',115805,5,NULL),
  (105,'Brady Hogan','bradyhogan7107@hotmail.com','03257658668','2023-07-18',118695,1,100),
  (106,'Inga Vaughan','ingavaughan3344@email.com','03258992435','2022-10-08',93169,2,101),
  (107,'Caryn Crosby','caryncrosby@gmail.com','03874775606','2020-12-20',80043,3,102),
  (108,'Portia Ware','portiaware1730@email.org','03372155204','2021-03-05',89930,4,103),
  (109,'Wilma Jackson','wilmajackson@hotmail.com','03749395938','2025-06-01',121864,5,104),
  (110,'Kuame Contreras','kuamecontreras3567@hotmail.org','03231205260','2020-08-09',80123,1,100),
  (111,'Clio Reed','clioreed2685@email.com','03304921446','2025-03-29',128229,2,101),
  (112,'Amela Avery','amelaavery5581@gmail.com','03597530072','2021-08-09',67992,3,102),
  (113,'Tana Small','tanasmall2416@gmail.org','03374727553','2020-09-10',116898,4,103),
  (114,'Timothy Webb','timothywebb@hotmail.com','03162713569','2021-01-05',101855,5,104),
  (115,'Camille Burns','camilleburns7135@email.org','03331241886','2023-08-07',86679,1,100),
  (116,'Jackson Stewart','jacksonstewart@hotmail.com','03836403828','2022-01-05',76970,2,101),
  (117,'Kirsten Davenport','kirstendavenport4756@email.com','03483178201','2025-02-08',67369,3,102),
  (118,'McKenzie Roth','mckenzieroth@hotmail.org','03377092700','2023-05-26',53870,4,103),
  (119,'Forrest Herman','forrestherman@hotmail.org','03712643726','2026-04-27',121311,5,104),
  (120,'Mariko Roth','marikoroth1134@hotmail.org','03190670808','2026-01-07',147635,1,100),
  (121,'Alisa Patton','alisapatton8923@email.com','03522022268','2020-06-30',102969,2,101),
  (122,'Karen Valentine','karenvalentine14@hotmail.com','03300401234','2023-06-26',90547,3,102),
  (123,'Rajah Saunders','rajahsaunders@gmail.org','03107076154','2020-06-24',108642,4,103),
  (124,'Ella Shields','ellashields9894@hotmail.com','03568571853','2020-12-30',48405,5,104),
  (125,'Griffin Wagner','griffinwagner865@hotmail.com','03739244332','2022-11-11',101985,1,100),
  (126,'Nerea Hinton','nereahinton@gmail.org','03523305463','2026-02-05',47244,2,101),
  (127,'Jin Donovan','jindonovan@gmail.com','03285853990','2023-06-26',78855,3,102),
  (128,'Austin Watkins','austinwatkins@hotmail.org','03199819824','2020-10-25',54668,4,103),
  (129,'Kimberley Barnes','kimberleybarnes@hotmail.org','03741127175','2022-01-28',49424,5,104),
  (130,'Jonah Terrell','jonahterrell@gmail.com','03849459247','2021-08-17',144694,1,100),
  (131,'Ora Johns','orajohns2524@hotmail.org','03588672635','2025-02-13',149428,2,101),
  (132,'Chase Pate','chasepate6194@hotmail.org','03463843779','2025-02-11',108838,3,102),
  (133,'Cameron Conway','cameronconway@email.org','03878524544','2020-10-17',138047,4,103),
  (134,'Candice Lawson','candicelawson2456@hotmail.org','03635541154','2026-01-23',141931,5,104),
  (135,'Amity Brock','amitybrock@gmail.org','03143114771','2025-05-21',135952,1,100),
  (136,'Rhoda Nielsen','rhodanielsen@gmail.com','03732242621','2023-03-14',145413,2,101),
  (137,'Kenyon Griffith','kenyongriffith@email.org','03242183744','2022-10-15',68788,3,102),
  (138,'Len Rocha','lenrocha@hotmail.com','03576062234','2026-01-09',78524,4,103),
  (139,'Ryan Zamora','ryanzamora3982@gmail.com','03494278745','2025-12-27',41108,5,104),
  (140,'Tobias Maddox','tobiasmaddox@hotmail.org','03456556311','2023-09-05',135597,1,100),
  (141,'Logan Gill','logangill@hotmail.org','03450039442','2024-01-21',122119,2,101),
  (142,'Hashim Avery','hashimavery@gmail.com','03175254544','2024-09-01',109067,3,102),
  (143,'Elvis Hinton','elvishinton@email.org','03324817158','2020-12-15',105355,4,103),
  (144,'Aline Strickland','alinestrickland@hotmail.com','03848864184','2023-09-03',99958,5,104),
  (145,'Leilani Watson','leilaniwatson2596@hotmail.com','03485306823','2023-04-29',59380,1,100),
  (146,'Iris Buckley','irisbuckley@gmail.com','03221713247','2025-04-20',121480,2,101),
  (147,'Erasmus Miller','erasmusmiller@email.org','03472137908','2020-06-05',63982,3,102),
  (148,'Ross Duran','rossduran@gmail.com','03731582482','2020-08-13',74360,4,103),
  (149,'Kadeem Golden','kadeemgolden@email.com','03842030319','2025-11-07',121104,5,104),
  (150,'Judah Mayo','judahmayo@gmail.org','03258542433','2023-07-17',84688,1,100),
  (151,'Jolene Prince','joleneprince@gmail.com','03355178725','2026-01-07',70620,2,101),
  (152,'Zephr Cruz','zephrcruz@gmail.com','03342734642','2022-08-17',87122,3,102),
  (153,'Warren Murphy','warrenmurphy@email.org','03693672188','2026-01-23',113979,4,103),
  (154,'Lee Gonzalez','leegonzalez9507@gmail.com','03665613084','2020-06-17',71064,5,104),
  (155,'Kibo Briggs','kibobriggs2620@hotmail.com','03929993263','2024-07-26',125130,1,100),
  (156,'Aiko Rojas','aikorojas8601@hotmail.org','03896741025','2023-05-15',56813,2,101),
  (157,'Kim Byers','kimbyers@email.org','03151882887','2024-03-29',114730,3,102),
  (158,'India Sawyer','indiasawyer6135@email.com','03258574438','2023-03-13',58349,4,103),
  (159,'Dolan Baird','dolanbaird4733@hotmail.org','03776145316','2021-07-27',46659,5,104),
  (160,'Katell Wynn','katellwynn@gmail.org','03373533826','2022-06-18',49175,1,100),
  (161,'Anika Ayers','anikaayers9274@hotmail.com','03867962585','2026-05-22',120576,2,101),
  (162,'Althea Hughes','altheahughes@email.com','03998113317','2023-03-16',130815,3,102),
  (163,'Yvette Fry','yvettefry2948@hotmail.org','03577766984','2025-05-12',131663,4,103),
  (164,'September Mcfarland','septembermcfarland1154@hotmail.com','03684885211','2020-10-02',126447,5,104),
  (165,'Maryam Grant','maryamgrant@email.org','03538371388','2022-10-07',84278,1,100),
  (166,'Ulysses Barrera','ulyssesbarrera@gmail.com','03196579421','2021-11-04',78007,2,101),
  (167,'Nell Francis','nellfrancis@gmail.org','03248464942','2022-10-01',45884,3,102),
  (168,'Freya Merritt','freyamerritt@email.org','03382548814','2023-07-18',131532,4,103),
  (169,'Raja Forbes','rajaforbes@gmail.org','03415714667','2023-02-11',74319,5,104),
  (170,'Idola Rollins','idolarollins@email.com','03879645121','2022-12-07',45238,1,100),
  (171,'Oprah Williamson','oprahwilliamson6805@hotmail.com','03166261489','2026-04-30',45572,2,101),
  (172,'Gareth Simpson','garethsimpson9@gmail.org','03132472406','2025-04-23',91561,3,102),
  (173,'Shannon Kirk','shannonkirk@gmail.org','03640765746','2021-08-07',53635,4,103),
  (174,'Quamar Mcclure','quamarmcclure@gmail.com','03532153962','2025-07-31',79853,5,104),
  (175,'Pascale Wilkins','pascalewilkins@hotmail.com','03437747272','2024-05-07',58097,1,100),
  (176,'Joelle Burch','joelleburch@email.com','03783418266','2023-10-18',132869,2,101),
  (177,'Cruz Cooley','cruzcooley9240@gmail.org','03472461097','2022-10-26',45746,3,102),
  (178,'Imelda Owen','imeldaowen3172@email.com','03868502067','2025-05-12',75344,4,103),
  (179,'Marvin Noble','marvinnoble1897@email.org','03629944616','2023-10-26',56673,5,104),
  (180,'Leila Martinez','leilamartinez1168@email.org','03873851724','2022-06-30',56993,1,100),
  (181,'Hop Burnett','hopburnett@hotmail.com','03817586576','2021-12-16',113616,2,101),
  (182,'Holly Clayton','hollyclayton@email.org','03436893357','2026-02-15',76415,3,102),
  (183,'Alexa Thompson','alexathompson3277@email.com','03832678755','2026-05-26',137658,4,103),
  (184,'Keith Weiss','keithweiss5273@email.org','03846231313','2025-03-05',121500,5,104),
  (185,'Whoopi Burnett','whoopiburnett4192@gmail.com','03521518727','2021-07-05',89982,1,100),
  (186,'Barclay Ashley','barclayashley@gmail.com','03610075628','2021-11-23',131225,2,101),
  (187,'MacKensie Osborn','mackensieosborn5570@gmail.com','03529831554','2024-03-27',69641,3,102),
  (188,'Jordan Beasley','jordanbeasley5433@hotmail.com','03745826753','2026-01-11',145603,4,103),
  (189,'Hanae Hart','hanaehart@gmail.com','03493186736','2021-03-15',43205,5,104),
  (190,'Bevis Monroe','bevismonroe@hotmail.org','03168156860','2021-01-14',51705,1,100),
  (191,'Natalie Kane','nataliekane1026@gmail.org','03523030745','2022-08-28',139886,2,101),
  (192,'Adena Emerson','adenaemerson@gmail.com','03277383546','2021-05-25',92596,3,102),
  (193,'Florence Mccarthy','florencemccarthy@email.com','03013502211','2025-06-17',142225,4,103),
  (194,'Aaron Leach','aaronleach@email.org','03831425227','2021-02-18',85016,5,104),
  (195,'Allen Melton','allenmelton@hotmail.com','03953855277','2024-05-17',44253,1,100),
  (196,'Russell Vance','russellvance@hotmail.com','03199370588','2024-09-24',92577,2,101),
  (197,'Zeus Dorsey','zeusdorsey@hotmail.org','03270274140','2025-03-28',149105,3,102),
  (198,'Julian Carrillo','juliancarrillo1824@hotmail.org','03724205756','2022-09-29',135768,4,103),
  (199,'Jacqueline Bryan','jacquelinebryan@hotmail.org','03957573376','2025-01-10',71474,5,104),
  (200,'Reagan Beach','reaganbeach3737@email.org','03508632179','2023-09-30',130805,1,100),
  (201,'Hanna Rhodes','hannarhodes@gmail.org','03535753626','2022-08-01',49388,2,101),
  (202,'Connor Houston','connorhouston@hotmail.org','03636412643','2021-02-17',86192,3,102),
  (203,'Jenette Simon','jenettesimon6993@email.com','03585869147','2022-10-13',137844,4,103),
  (204,'Piper Reed','piperreed7106@hotmail.com','03338455650','2024-08-25',139748,5,104),
  (205,'Summer Kent','summerkent2065@email.com','03982449349','2020-07-04',147402,1,100),
  (206,'Wallace Ellis','wallaceellis5973@hotmail.com','03743821423','2024-05-19',130326,2,101),
  (207,'Simone Mcgee','simonemcgee3413@hotmail.com','03411961223','2022-05-27',88367,3,102),
  (208,'Lara Michael','laramichael@hotmail.com','03847928520','2020-06-11',82632,4,103),
  (209,'Dorothy Gill','dorothygill@hotmail.org','03133213283','2024-02-17',72333,5,104),
  (210,'Marshall Lucas','marshalllucas3659@email.org','03078585493','2021-08-14',75684,1,100),
  (211,'Kirsten Wilson','kirstenwilson@email.com','03288101002','2023-10-27',40396,2,101),
  (212,'Driscoll Russell','driscollrussell@gmail.com','03164687722','2020-12-24',149349,3,102),
  (213,'Joan Holland','joanholland@hotmail.org','03014862586','2021-12-15',115828,4,103),
  (214,'Raphael Francis','raphaelfrancis4959@hotmail.org','03347514805','2022-11-28',137307,5,104),
  (215,'Leonard Hill','leonardhill3110@hotmail.com','03368718957','2021-01-03',103695,1,100),
  (216,'Latifah Cherry','latifahcherry@email.com','03453963188','2021-04-07',107479,2,101),
  (217,'Tyrone Hudson','tyronehudson@hotmail.com','03486907445','2026-02-02',92352,3,102),
  (218,'Cedric Cooley','cedriccooley3887@gmail.com','03271626479','2021-07-29',99780,4,103),
  (219,'Zeus Bauer','zeusbauer@email.com','03843407618','2026-02-10',69153,5,104),
  (220,'Clare Porter','clareporter@hotmail.com','03764590449','2022-01-07',144486,1,100),
  (221,'Keaton Hall','keatonhall@email.org','03060234512','2024-06-04',89875,2,101),
  (222,'Caleb Kent','calebkent9617@gmail.com','03241347192','2025-05-05',71357,3,102),
  (223,'William Dodson','williamdodson7398@gmail.org','03723662674','2024-10-07',107983,4,103),
  (224,'Cally Nieves','callynieves1218@hotmail.org','03716786039','2022-07-04',110298,5,104),
  (225,'Nathan Chase','nathanchase2599@gmail.org','03494628681','2022-02-02',125339,1,100),
  (226,'Aimee Vance','aimeevance@hotmail.org','03756246464','2024-03-23',42380,2,101),
  (227,'Alden Hurley','aldenhurley@email.com','03251013935','2024-04-25',113903,3,102),
  (228,'Kristen Weiss','kristenweiss6489@hotmail.com','03972621781','2022-11-27',56316,4,103),
  (229,'Randall Simon','randallsimon@email.com','03756028251','2025-12-30',146551,5,104),
  (230,'Craig Hurley','craighurley1705@gmail.com','03722272076','2024-10-29',56076,1,100),
  (231,'Rooney Becker','rooneybecker5165@gmail.com','03618077536','2022-02-17',43899,2,101),
  (232,'Maisie Mcclure','maisiemcclure@hotmail.org','03729237107','2023-02-15',75571,3,102),
  (233,'Trevor Andrews','trevorandrews6172@hotmail.com','03531238856','2021-11-12',72399,4,103),
  (234,'Ivor Ballard','ivorballard@email.com','03349417740','2024-04-21',120371,5,104),
  (235,'Ariel Barton','arielbarton9464@email.org','03744517410','2026-01-30',85066,1,100),
  (236,'Xenos Ortiz','xenosortiz3084@gmail.org','03025976206','2023-09-04',85261,2,101),
  (237,'Kelly Grant','kellygrant@gmail.com','03863831105','2024-06-23',147548,3,102),
  (238,'Porter Finch','porterfinch@hotmail.org','03823486823','2024-03-13',52400,4,103),
  (239,'Moses Melton','mosesmelton351@hotmail.org','03838338144','2022-03-05',80602,5,104),
  (240,'Hedy Mckay','hedymckay@hotmail.com','03555418293','2023-11-03',76961,1,100),
  (241,'Desiree Jefferson','desireejefferson2044@email.com','03824257178','2021-06-20',78273,2,101),
  (242,'Stone Fuller','stonefuller5@email.org','03420354340','2024-11-19',99249,3,102),
  (243,'Whitney Shepard','whitneyshepard3622@hotmail.com','03136433251','2025-07-09',70905,4,103),
  (244,'Hasad Benjamin','hasadbenjamin@email.org','03367714672','2026-02-07',127276,5,104),
  (245,'Lee Decker','leedecker@gmail.com','03632566508','2024-05-28',99261,1,100),
  (246,'Xander Morin','xandermorin3206@email.com','03545145375','2024-08-20',84051,2,101),
  (247,'Jacqueline Lynn','jacquelinelynn@gmail.org','03584542508','2025-10-30',91555,3,102),
  (248,'Amos Brock','amosbrock1416@hotmail.org','03642121283','2023-01-24',52257,4,103),
  (249,'Rhoda Lara','rhodalara@email.org','03891618130','2024-03-11',148976,5,104),
  (250,'Ima Gill','imagill4924@gmail.org','03108406410','2020-06-30',142158,1,100),
  (251,'Julian Booker','julianbooker@gmail.org','03570319313','2021-05-02',56129,2,101),
  (252,'Carol French','carolfrench6884@email.org','03272877267','2020-10-10',75952,3,102),
  (253,'Grady Sharpe','gradysharpe7137@hotmail.org','03351187338','2023-02-08',52798,4,103),
  (254,'Reed Shaw','reedshaw3118@hotmail.com','03854845076','2022-11-19',62450,5,104),
  (255,'Kerry Hawkins','kerryhawkins4266@gmail.com','03302474463','2021-03-28',76799,1,100),
  (256,'Zephr Huber','zephrhuber@hotmail.org','03821435959','2025-06-02',138926,2,101),
  (257,'Isaiah Fisher','isaiahfisher@email.com','03655487452','2024-01-09',149706,3,102),
  (258,'Hop Lyons','hoplyons@email.com','03868826416','2020-08-25',104879,4,103),
  (259,'Xanthus Barrera','xanthusbarrera@gmail.org','03757782834','2025-01-23',105089,5,104),
  (260,'Fletcher Golden','fletchergolden@email.org','03721843159','2023-07-20',47348,1,100),
  (261,'Shoshana Mccormick','shoshanamccormick@hotmail.org','03858533934','2024-10-08',59374,2,101),
  (262,'Carly Owens','carlyowens@gmail.org','03675551653','2025-02-11',130831,3,102),
  (263,'Damon Marquez','damonmarquez4518@hotmail.com','03386618047','2025-02-12',130426,4,103),
  (264,'Michael Chandler','michaelchandler@hotmail.org','03549114874','2026-02-21',131372,5,104),
  (265,'Mollie Oliver','mollieoliver@gmail.org','03235263162','2020-08-31',57299,1,100),
  (266,'Mia Mitchell','miamitchell@gmail.org','03628977413','2025-08-29',63293,2,101),
  (267,'Briar Sexton','briarsexton7672@email.org','03027525174','2022-06-19',95814,3,102),
  (268,'Lana Lewis','lanalewis7868@hotmail.com','03729438643','2025-11-30',104901,4,103),
  (269,'Griffin Fischer','griffinfischer@email.com','03061824322','2022-07-23',143329,5,104),
  (270,'Mona Ortiz','monaortiz@gmail.org','03831634849','2022-10-14',42419,1,100),
  (271,'Yeo Soto','yeosoto7052@gmail.com','03919672818','2025-09-13',74600,2,101),
  (272,'Ezra Morton','ezramorton5209@gmail.com','03425662826','2024-04-21',73454,3,102),
  (273,'Cleo Whitaker','cleowhitaker2334@gmail.com','03700187786','2022-05-12',128817,4,103),
  (274,'Gray Lyons','graylyons@gmail.com','03814851313','2025-11-08',93060,5,104),
  (275,'Astra Koch','astrakoch@gmail.com','03398282756','2021-07-28',127007,1,100),
  (276,'Velma Griffith','velmagriffith@gmail.org','03515368157','2022-10-21',111761,2,101),
  (277,'Camilla Sweet','camillasweet984@gmail.org','03376917482','2023-05-06',42590,3,102),
  (278,'Rebekah Franks','rebekahfranks8381@hotmail.com','03344324002','2025-01-19',51999,4,103),
  (279,'Rylee Johns','ryleejohns2812@email.com','03734187472','2021-10-25',114739,5,104),
  (280,'Logan Cannon','logancannon1308@hotmail.org','03220633106','2021-08-06',111905,1,100),
  (281,'Quintessa Gilliam','quintessagilliam6337@email.org','03113328772','2024-11-17',49496,2,101),
  (282,'Caldwell Padilla','caldwellpadilla@email.com','03127423454','2020-10-03',75108,3,102),
  (283,'Heather Contreras','heathercontreras@email.com','03957557827','2023-07-14',99080,4,103),
  (284,'Charde Wilcox','chardewilcox1439@gmail.com','03640727128','2023-06-24',101632,5,104),
  (285,'Aurelia Montgomery','aureliamontgomery3974@gmail.org','03171564410','2026-05-20',75841,1,100),
  (286,'Camille Shields','camilleshields1618@gmail.com','03413110631','2026-01-16',103264,2,101),
  (287,'Portia Lowe','portialowe1278@email.org','03445445235','2023-07-22',137170,3,102),
  (288,'Keith Benton','keithbenton@gmail.com','03751657134','2024-05-11',106698,4,103),
  (289,'Carl Christian','carlchristian7242@hotmail.org','03167725129','2020-12-27',85575,5,104),
  (290,'Jermaine James','jermainejames4069@email.com','03155478254','2026-04-21',123065,1,100),
  (291,'Jillian Marks','jillianmarks2569@email.org','03251139159','2023-02-03',140130,2,101),
  (292,'Dorothy Kirk','dorothykirk@gmail.org','03338527164','2023-06-09',90309,3,102),
  (293,'Alec Fletcher','alecfletcher@gmail.org','03871137877','2025-01-04',122474,4,103),
  (294,'Thomas Conley','thomasconley@email.org','03928973257','2025-04-03',81863,5,104),
  (295,'Alec Fulton','alecfulton@gmail.org','03056020856','2022-08-17',57140,1,100),
  (296,'Arden Hartman','ardenhartman@hotmail.com','03020793843','2020-10-16',57546,2,101),
  (297,'Cassandra Dotson','cassandradotson8766@email.org','03365682953','2022-10-21',119917,3,102),
  (298,'Tamara Clarke','tamaraclarke@email.com','03125461519','2023-09-04',149285,4,103),
  (299,'Lane Bond','lanebond@email.org','03411481264','2025-01-18',42110,5,104);

-- ============================================================
-- TABLE 3: Projects
-- ============================================================

CREATE TABLE Projects (
    project_id   INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    budget       DECIMAL(12,2),
    dept_id      INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Projects VALUES
(701, 'Mobile App Development',    5000000,  1),
(702, 'Q4 Sales Campaign',         1500000,  2),
(703, 'Employee Wellness Program', 7500000,  3),
(704, 'Brand Refresh',            20000000,  4),
(705, 'Annual Audit',             10000000,  5);

-- ============================================================
-- TABLE 4: Employee_Projects  (junction table)
-- ============================================================

CREATE TABLE Employee_Projects (
    emp_id       INT,
    project_id   INT,
    hours_worked INT,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id)     REFERENCES Employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

INSERT INTO Employee_Projects (emp_id, project_id, hours_worked) VALUES
  (100,701,42),(101,702,33),(102,703,65),(103,704,42),(104,705,77),
  (105,701,48),(106,702,59),(107,703,75),(108,704,22),(109,705,55),
  (110,701,20),(111,702,39),(112,703,21),(113,704,72),(114,705,54),
  (115,701,38),(116,702,26),(117,703,71),(118,704,38),(119,705,44),
  (120,701,70),(121,702,30),(122,703,41),(123,704,62),(124,705,37),
  (125,701,66),(126,702,53),(127,703,64),(128,704,74),(129,705,61),
  (130,701,29),(131,702,49),(132,703,57),(133,704,51),(134,705,47),
  (135,701,46),(136,702,25),(137,703,21),(138,704,49),(139,705,46),
  (140,701,29),(141,702,72),(142,703,57),(143,704,26),(144,705,48),
  (145,701,56),(146,702,48),(147,703,45),(148,704,57),(149,705,56),
  (150,701,74),(151,702,60),(152,703,30),(153,704,63),(154,705,51),
  (155,701,51),(156,702,39),(157,703,66),(158,704,27),(159,705,54),
  (160,701,20),(161,702,71),(162,703,66),(163,704,50),(164,705,49),
  (165,701,28),(166,702,62),(167,703,76),(168,704,36),(169,705,29),
  (170,701,42),(171,702,54),(172,703,58),(173,704,31),(174,705,80),
  (175,701,51),(176,702,69),(177,703,33),(178,704,74),(179,705,56),
  (180,701,52),(181,702,42),(182,703,59),(183,704,60),(184,705,70),
  (185,701,29),(186,702,75),(187,703,32),(188,704,60),(189,705,38),
  (190,701,24),(191,702,47),(192,703,20),(193,704,64),(194,705,54),
  (195,701,73),(196,702,37),(197,703,53),(198,704,66),(199,705,51),
  (200,701,23),(201,702,48),(202,703,60),(203,704,67),(204,705,32),
  (205,701,66),(206,702,65),(207,703,76),(208,704,38),(209,705,80),
  (210,701,74),(211,702,55),(212,703,23),(213,704,40),(214,705,24),
  (215,701,56),(216,702,40),(217,703,43),(218,704,36),(219,705,29),
  (220,701,34),(221,702,25),(222,703,60),(223,704,48),(224,705,67),
  (225,701,72),(226,702,27),(227,703,66),(228,704,27),(229,705,62),
  (230,701,32),(231,702,71),(232,703,56),(233,704,66),(234,705,74),
  (235,701,49),(236,702,24),(237,703,26),(238,704,36),(239,705,60),
  (240,701,36),(241,702,29),(242,703,36),(243,704,34),(244,705,37),
  (245,701,77),(246,702,39),(247,703,79),(248,704,55),(249,705,57),
  (250,701,59),(251,702,62),(252,703,75),(253,704,41),(254,705,47),
  (255,701,41),(256,702,46),(257,703,45),(258,704,37),(259,705,49),
  (260,701,36),(261,702,22),(262,703,65),(263,704,23),(264,705,28),
  (265,701,33),(266,702,26),(267,703,25),(268,704,50),(269,705,40),
  (270,701,65),(271,702,73),(272,703,25),(273,704,47),(274,705,22),
  (275,701,71),(276,702,63),(277,703,46),(278,704,65),(279,705,72),
  (280,701,27),(281,702,50),(282,703,31),(283,704,55),(284,705,47),
  (285,701,33),(286,702,63),(287,703,69),(288,704,37),(289,705,52),
  (290,701,47),(291,702,65),(292,703,75),(293,704,26),(294,705,49),
  (295,701,59),(296,702,52),(297,703,53),(298,704,53),(299,705,46);

-- ============================================================
-- DATA VALIDATION  (CHECK constraints)
-- ============================================================

ALTER TABLE Employees       ADD CONSTRAINT chk_salary    CHECK (Salary >= 30000);
ALTER TABLE Employees       ADD CONSTRAINT chk_hire_date CHECK (hire_date >= '2020-01-01');
ALTER TABLE Employee_Projects ADD CONSTRAINT chk_hours   CHECK (hours_worked BETWEEN 1 AND 200);

-- ============================================================
-- DATA ANALYSIS QUERIES
-- ============================================================

-- (01) Total salary expense per department
SELECT
    d.dept_name,
    SUM(e.salary)  AS total_salary_per_dept,
    COUNT(e.emp_id) AS headcount
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_id
ORDER BY total_salary_per_dept DESC;

-- (02) Employee–manager hierarchy
SELECT
    e.emp_name AS employee,
    e.emp_id,
    e.salary,
    d.dept_name,
    m.emp_name AS reports_to
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN employees m  ON e.manager_id = m.emp_id
ORDER BY e.salary DESC;

-- (03) Total hours worked per project
SELECT
    p.project_id,
    p.project_name,
    SUM(ep.hours_worked) AS total_hours_per_project
FROM projects p
LEFT JOIN employee_projects ep ON p.project_id = ep.project_id
GROUP BY p.project_id
ORDER BY total_hours_per_project DESC;

-- (04) Project assignments per employee
SELECT
    e.emp_name,
    ep.emp_id,
    COUNT(ep.project_id) AS total_projects_assigned
FROM employees e
JOIN employee_projects ep ON e.emp_id = ep.emp_id
GROUP BY e.emp_id;

-- (05) Employees with under 50 hours logged
SELECT
    ep.emp_id,
    e.emp_name,
    SUM(ep.hours_worked) AS total_hours_worked
FROM employee_projects ep
JOIN employees e ON e.emp_id = ep.emp_id
GROUP BY ep.emp_id
HAVING SUM(ep.hours_worked) < 50
ORDER BY SUM(ep.hours_worked) DESC;

-- (06) Highest paid employee per department  (window function)
SELECT emp_name, dept_name, salary, ranking
FROM (
    SELECT
        e.emp_name,
        d.dept_name,
        e.salary,
        RANK() OVER (PARTITION BY e.dept_id ORDER BY e.salary DESC) AS ranking
    FROM employees e
    JOIN departments d ON e.dept_id = d.dept_id
) ranked
WHERE ranking = 1;

-- (07) Budget efficiency — cost per hour
SELECT
    p.project_name,
    SUM(ep.hours_worked)                                    AS total_hours_logged,
    p.budget,
    ROUND(p.budget / NULLIF(SUM(ep.hours_worked), 0), 2)   AS cost_per_hour
FROM Projects p
JOIN Employee_Projects ep ON p.project_id = ep.project_id
GROUP BY p.project_id;

-- ============================================================
-- INDEXES  (performance optimization)
-- ============================================================

CREATE INDEX idx_employees_dept_id          ON Employees(dept_id);
CREATE INDEX idx_employees_manager_id       ON Employees(Manager_id);
CREATE INDEX idx_projects_dept_id           ON Projects(dept_id);
CREATE INDEX idx_employee_projects_emp_id   ON Employee_Projects(emp_id);
CREATE INDEX idx_employee_projects_proj_id  ON Employee_Projects(project_id);
CREATE INDEX idx_departments_dept_name      ON Departments(dept_name);
CREATE INDEX idx_projects_project_name      ON Projects(project_name);
CREATE INDEX idx_employees_emp_name         ON Employees(emp_name);
CREATE INDEX idx_employees_email            ON Employees(email);

-- ============================================================
-- VIEWS
-- ============================================================

-- (01) Executive Dashboard
CREATE VIEW Executive_Dashboard AS
SELECT 'Total Employees' AS Metric, COUNT(*) AS Value FROM Employees
UNION ALL
SELECT 'Total Departments', COUNT(*) FROM Departments
UNION ALL
SELECT 'Active Projects', COUNT(*) FROM Projects
UNION ALL
SELECT 'Total Budget', CONCAT('$', FORMAT(SUM(budget), 0)) FROM Projects
UNION ALL
SELECT 'Avg Salary', CONCAT('$', FORMAT(AVG(Salary), 0)) FROM Employees
UNION ALL
SELECT 'Total Hours Logged', CONCAT(FORMAT(SUM(hours_worked), 0), ' hrs') FROM Employee_Projects;

SELECT * FROM Executive_Dashboard;

-- (02) Department Performance
CREATE VIEW Department_Performance AS
SELECT
    d.dept_name,
    COUNT(DISTINCT e.emp_id) AS employee_count,
    ROUND(AVG(e.salary), 0) AS avg_salary,
    COUNT(DISTINCT ep.emp_id) AS employees_on_projects,
    SUM(ep.hours_worked) AS total_project_hours,
    SUM(p.budget) AS total_budget
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
LEFT JOIN employee_projects ep ON e.emp_id = ep.emp_id
LEFT JOIN projects p ON d.dept_id = p.dept_id
GROUP BY d.dept_id;

SELECT * FROM Department_Performance;

-- (03) Employee Workload
CREATE VIEW Employee_Workload AS
SELECT
    e.emp_name,
    d.dept_name,
    COUNT(ep.project_id) AS project_count,
    SUM(ep.hours_worked) AS total_hours
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
LEFT JOIN employee_projects ep ON e.emp_id = ep.emp_id
GROUP BY e.emp_id;

SELECT * FROM Employee_Workload ORDER BY total_hours DESC;

-- ============================================================
-- STORED PROCEDURE
-- ============================================================

DELIMITER //
CREATE PROCEDURE GetDeptSummary(IN dept VARCHAR(50))
BEGIN
    SELECT
        d.dept_name,
        COUNT(e.emp_id) AS headcount,
        AVG(e.salary) AS avg_salary,
        SUM(e.salary) AS payroll
    FROM departments d
    JOIN employees e ON d.dept_id = e.dept_id
    WHERE d.dept_name = dept
    GROUP BY d.dept_id;
END //
DELIMITER ;

-- Tests
CALL GetDeptSummary('Engineering');
CALL GetDeptSummary('HR');
CALL GetDeptSummary('Sales');
CALL GetDeptSummary('Marketing');
CALL GetDeptSummary('Finance');

-- ============================================================
-- TABLE 5: Salary_Audit_Log
-- ============================================================

CREATE TABLE Salary_Audit_Log (
    audit_id    INT AUTO_INCREMENT PRIMARY KEY,
    emp_id      INT,
    emp_name    VARCHAR(255),
    old_salary  INT,
    new_salary  INT,
    changed_by  VARCHAR(100),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_sal_emp_id     (emp_id),
    INDEX idx_sal_change_date (change_date)
);

-- ============================================================
-- TRIGGERS
-- ============================================================

-- (01) Auto-log every salary change
DELIMITER $$
CREATE TRIGGER salary_change_audit
AFTER UPDATE ON Employees
FOR EACH ROW
BEGIN
    IF OLD.Salary != NEW.Salary THEN
        INSERT INTO Salary_Audit_Log (emp_id, emp_name, old_salary, new_salary, changed_by)
        VALUES (NEW.emp_id, NEW.emp_name, OLD.Salary, NEW.Salary, USER());
    END IF;
END$$
DELIMITER ;

-- Test
UPDATE Employees SET Salary = 180000 WHERE emp_id = 100;
SELECT * FROM Salary_Audit_Log;

-- (02) Block inserts below minimum salary
DELIMITER $$
CREATE TRIGGER validate_salary
BEFORE INSERT ON Employees
FOR EACH ROW
BEGIN
    IF NEW.Salary < 30000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary must be at least 30,000';
    END IF;
END$$
DELIMITER ;

-- Test (expected: throws error)
INSERT INTO Employees (emp_id, emp_name, email, phone, hire_date, Salary, dept_id, manager_id)
VALUES (999, 'Test User', 'test@email.com', '1234567890', '2024-01-01', 20000, 1, 100);

-- ============================================================
-- TABLE 6: Project_Documentation 
-- ============================================================

CREATE TABLE Project_Documentation (
    doc_id       INT AUTO_INCREMENT PRIMARY KEY,
    category     VARCHAR(50),
    item_name    VARCHAR(100),
    description  TEXT,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Project_Documentation (category, item_name, description) VALUES
('Database',   'Employee_Directory_system', 'Employee Directory System - Complete HR management database'),
('Table',      'Departments',               'Stores 5 departments with locations'),
('Table',      'Employees',                 'Stores 200 employees with manager hierarchy'),
('Table',      'Projects',                  'Stores 5 projects with budgets'),
('Table',      'Employee_Projects',         'Junction table linking employees to projects with hours'),
('Constraint', 'chk_salary',               'Ensures salary >= 30,000'),
('Constraint', 'chk_hire_date',            'Ensures hire date >= 2020-01-01'),
('Constraint', 'chk_hours',               'Ensures hours between 1-200'),
('View',       'Executive_Dashboard',      'Company-wide KPIs at a glance'),
('View',       'Department_Performance',   'Per-department statistics'),
('View',       'Employee_Workload',        'Individual employee hours summary'),
('Procedure',  'GetDeptSummary',           'Returns department headcount and payroll'),
('Trigger',    'salary_change_audit',      'Automatically logs all salary changes'),
('Index',      'idx_employees_dept_id',    'Optimizes department JOIN queries'),
('Index',      'idx_employees_email',      'Speeds up email searches');

SELECT * FROM Project_Documentation ORDER BY doc_id, item_name;

-- ============================================================
-- COMPLETION REPORT VIEW
-- ============================================================

CREATE VIEW Project_Completion_Report AS
SELECT '✅ Project Name' AS Metric, 'Employee Directory System' AS Value
UNION ALL SELECT '✅ Status', 'Completed'
UNION ALL SELECT '✅ Total Tables', CAST(COUNT(*) AS CHAR)
FROM information_schema.tables
WHERE table_schema = 'Employee_Directory_system' AND table_type = 'BASE TABLE'
UNION ALL SELECT '✅ Total Views', CAST(COUNT(*) AS CHAR)
FROM information_schema.views
WHERE table_schema = 'Employee_Directory_system'
UNION ALL SELECT '✅ Total Triggers',CAST(COUNT(*) AS CHAR)
FROM information_schema.triggers
WHERE trigger_schema = 'Employee_Directory_system'
UNION ALL SELECT '✅ Completion Date', CAST(NOW() AS CHAR);

SELECT * FROM Project_Completion_Report;
