CREATE DATABASE IF NOT EXISTS CoopConnect;

USE CoopConnect;


CREATE TABLE IF NOT EXISTS User (
    User_ID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    User_Type VARCHAR(50),
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Student (
    NUID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Major VARCHAR(255),
    Grad_Date DATE,
    Current_Role VARCHAR(255),
    Current_Company VARCHAR(255),
    User_ID INT,
    CONSTRAINT fk_1
        FOREIGN KEY (User_ID)
            REFERENCES User (User_ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Incoming_Student (
    NUID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Major VARCHAR(255),
    Grad_Date DATE,
    User_ID INT,
    CONSTRAINT fk_2
        FOREIGN KEY (User_ID)
            REFERENCES User (User_ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Alumni (
    Alumni_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Major VARCHAR(255) NOT NULL,
    Grad_Date DATE,
    Current_Company VARCHAR(255),
    Current_Role VARCHAR(255),
    User_ID INT,
    CONSTRAINT fk_3
        FOREIGN KEY (User_ID)
            REFERENCES User (User_ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Faculty (
    Faculty_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Department VARCHAR(255),
    User_ID INT,
    CONSTRAINT fk_4
        FOREIGN KEY (User_ID)
            REFERENCES User (User_ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);




CREATE TABLE IF NOT EXISTS Company (
    Company_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Location VARCHAR(255),
    Industry VARCHAR(255),
    Size INT,
    Reputation VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS CoopCycle (
    CycleID INT AUTO_INCREMENT PRIMARY KEY,
    Year INT NOT NULL,
    PlacementRate FLOAT,
    Type VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS CoopPosition (
    Position_ID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Industry VARCHAR(255),
    Location VARCHAR(255),
    Role_Description TEXT,
    Company_Size INT,
    Work_Hours INT,
    Responsibilities TEXT,
    Company_ID INT,
    CycleID INT,
    CONSTRAINT fk_5
        FOREIGN KEY (Company_ID)
            REFERENCES Company (Company_ID)
            ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_6
        FOREIGN KEY (CycleID)
            REFERENCES CoopCycle (CycleID)
            ON UPDATE CASCADE ON DELETE CASCADE
);




CREATE TABLE IF NOT EXISTS Review (
    Review_ID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Date DATE NOT NULL,
    Rating INT,
    Content TEXT,
    User_ID INT,
    Position_ID INT,
    SkillsUsed VARCHAR(255),
    CONSTRAINT fk_7
        FOREIGN KEY (User_ID)
            REFERENCES User (User_ID)
            ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_8
        FOREIGN KEY (Position_ID)
            REFERENCES CoopPosition (Position_ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS CompensationPackage (
    CPID INT AUTO_INCREMENT PRIMARY KEY,
    Perks VARCHAR(255),
    Hourly FLOAT,
    BonusTotal FLOAT,
    HousingTotal FLOAT,
    RelocationTotal FLOAT,
    Position_ID INT,
    CONSTRAINT fk_9
        FOREIGN KEY (Position_ID)
            REFERENCES CoopPosition (Position_ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Question (
    Question_ID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Date DATE NOT NULL,
    Status VARCHAR(50),
    Content TEXT,
    User_ID INT,
    CONSTRAINT fk_10
        FOREIGN KEY (User_ID)
            REFERENCES User (User_ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Answer (
    Answer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Content TEXT NOT NULL,
    Date DATE NOT NULL,
    User_ID INT,
    Question_ID INT,
    CONSTRAINT fk_11
        FOREIGN KEY (User_ID)
            REFERENCES User (User_ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO User (Username, User_Type, Password, Email) VALUES
('jane_doe', 'Student', 'pass321', 'jane.doe@example.com'),
('sarah_connor', 'Student', 'terminator2', 'sarah.connor@example.com'),
('harry_potter', 'Student', 'quidditch', 'harry.potter@example.com'),
('hermione_granger', 'Student', 'leviosa', 'hermione.granger@example.com'),
('ron_weasley', 'Student', 'scabbers', 'ron.weasley@example.com'),
('lisa_simpson', 'Student', 'saxophone', 'lisa.simpson@example.com'),
('bart_simpson', 'Student', 'skateboard', 'bart.simpson@example.com'),
('maggie_simpson', 'Student', 'pacifier', 'maggie.simpson@example.com'),
('marge_simpson', 'Student', 'bluehair', 'marge.simpson@example.com'),
('homer_simpson', 'Student', 'doughnut', 'homer.simpson@example.com'),
('peter_griffin', 'Student', 'giggity', 'peter.griffin@example.com'),
('lois_griffin', 'Student', 'piano', 'lois.griffin@example.com'),
('stewie_griffin', 'Student', 'worlddomination', 'stewie.griffin@example.com'),
('brian_griffin', 'Student', 'martini', 'brian.griffin@example.com'),
('meg_griffin', 'Student', 'familyguy', 'meg.griffin@example.com'),
('chris_griffin', 'Student', 'drawing', 'chris.griffin@example.com'),
('tony_stark', 'Student', 'ironman', 'tony.stark@example.com'),
('bruce_wayne', 'Student', 'batman', 'bruce.wayne@example.com'),
('clark_kent', 'Student', 'superman', 'clark.kent@example.com'),
('diana_prince', 'Student', 'wonderwoman', 'diana.prince@example.com'),
('barry_allen', 'Student', 'theflash', 'barry.allen@example.com'),
('arthur_curry', 'Student', 'aquaman', 'arthur.curry@example.com'),
('victor_stone', 'Student', 'cyborg', 'victor.stone@example.com'),
('peter_parker', 'Student', 'spiderman', 'peter.parker@example.com'),
('logan_howl', 'Student', 'wolverine', 'logan.howl@example.com'),
('natasha_romanoff', 'Student', 'blackwidow', 'natasha.romanoff@example.com'),
('steve_rogers', 'Student', 'captainamerica', 'steve.rogers@example.com'),
('bruce_banner', 'Student', 'hulk', 'bruce.banner@example.com'),
('scott_summers', 'Student', 'cyclops', 'scott.summers@example.com'),
('jean_grey', 'Student', 'phoenix', 'jean.grey@example.com'),
('albus_dumbledore', 'Faculty', 'elderwand', 'albus.dumbledore@hogwarts.edu'),
('minerva_mcgonagall', 'Faculty', 'transfiguration', 'minerva.mcgonagall@hogwarts.edu'),
('severus_snape', 'Faculty', 'always', 'severus.snape@hogwarts.edu'),
('rubeus_hagrid', 'Faculty', 'buckbeak', 'rubeus.hagrid@hogwarts.edu'),
('gilderoy_lockhart', 'Faculty', 'memorycharm', 'gilderoy.lockhart@hogwarts.edu'),
('remus_lupin', 'Faculty', 'moony', 'remus.lupin@hogwarts.edu'),
('horace_slughorn', 'Faculty', 'potions', 'horace.slughorn@hogwarts.edu'),
('filius_flitwick', 'Faculty', 'charms', 'filius.flitwick@hogwarts.edu'),
('pomona_sprout', 'Faculty', 'herbology', 'pomona.sprout@hogwarts.edu'),
('sybill_trelawney', 'Faculty', 'prophecy', 'sybill.trelawney@hogwarts.edu'),
('quirinus_quirrell', 'Faculty', 'defence', 'quirinus.quirrell@hogwarts.edu'),
('rolanda_hooch', 'Faculty', 'flying', 'rolanda.hooch@hogwarts.edu'),
('dolores_umbridge', 'Faculty', 'detention', 'dolores.umbridge@hogwarts.edu'),
('cuthbert_binns', 'Faculty', 'history', 'cuthbert.binns@hogwarts.edu'),
('wilhelmina_grubbly_plank', 'Faculty', 'creatures', 'wilhelmina.grubbly@hogwarts.edu'),
('charity_burbage', 'Faculty', 'mugglestudies', 'charity.burbage@hogwarts.edu'),
('aurora_sinistra', 'Faculty', 'astronomy', 'aurora.sinistra@hogwarts.edu'),
('irma_pince', 'Faculty', 'librarian', 'irma.pince@hogwarts.edu'),
('septima_vector', 'Faculty', 'arithmancy', 'septima.vector@hogwarts.edu'),
('argus_filch', 'Faculty', 'caretaker', 'argus.filch@hogwarts.edu'),
('walter_white', 'Faculty', 'chemistry', 'walter.white@highschool.edu'),
('sheldon_cooper', 'Faculty', 'theoreticalphysics', 'sheldon.cooper@university.edu'),
('indiana_jones', 'Faculty', 'archaeology', 'indiana.jones@university.edu'),
('gilbert_grape', 'Faculty', 'drama', 'gilbert.grape@school.edu'),
('robin_scherbatsky', 'Faculty', 'journalism', 'robin.scherbatsky@college.edu'),
('gregory_house', 'Faculty', 'diagnostics', 'gregory.house@hospital.edu'),
('john_keating', 'Faculty', 'poetry', 'john.keating@academy.edu'),
('elizabeth_bennet', 'Faculty', 'literature', 'elizabeth.bennet@college.edu'),
('jean_luc_picard', 'Faculty', 'leadership', 'jeanluc.picard@starfleet.edu'),
('rosa_diaz', 'Faculty', 'lawenforcement', 'rosa.diaz@police.academy.edu'),
('lily_evans', 'Incoming_Student', 'magicpotion', 'lily.evans@newstudents.edu'),
('james_potter', 'Incoming_Student', 'quidditch99', 'james.potter@newstudents.edu'),
('cedric_diggory', 'Incoming_Student', 'triwizard', 'cedric.diggory@newstudents.edu'),
('cho_chang', 'Incoming_Student', 'ravenclaw', 'cho.chang@newstudents.edu'),
('padma_patil', 'Incoming_Student', 'twinmagic', 'padma.patil@newstudents.edu'),
('parvati_patil', 'Incoming_Student', 'divination', 'parvati.patil@newstudents.edu'),
('dean_thomas', 'Incoming_Student', 'gryffindor', 'dean.thomas@newstudents.edu'),
('seamus_finnigan', 'Incoming_Student', 'fireworks', 'seamus.finnigan@newstudents.edu'),
('oliver_wood', 'Incoming_Student', 'keeper', 'oliver.wood@newstudents.edu'),
('fleur_delacour', 'Incoming_Student', 'beauxbatons', 'fleur.delacour@newstudents.edu'),
('viktor_krum', 'Incoming_Student', 'durmstrang', 'viktor.krum@newstudents.edu'),
('neville_longbottom', 'Incoming_Student', 'herbology101', 'neville.longbottom@newstudents.edu'),
('luna_lovegood', 'Incoming_Student', 'nargles', 'luna.lovegood@newstudents.edu'),
('draco_malfoy', 'Incoming_Student', 'slytherin', 'draco.malfoy@newstudents.edu'),
('pansy_parkinson', 'Incoming_Student', 'pureblood', 'pansy.parkinson@newstudents.edu'),
('blaise_zabini', 'Incoming_Student', 'slytherintactics', 'blaise.zabini@newstudents.edu'),
('millicent_bulstrode', 'Incoming_Student', 'duel101', 'millicent.bulstrode@newstudents.edu'),
('ernie_macmillan', 'Incoming_Student', 'hufflepuff', 'ernie.macmillan@newstudents.edu'),
('hannah_abbott', 'Incoming_Student', 'puffpride', 'hannah.abbott@newstudents.edu'),
('justin_finchfletchley', 'Incoming_Student', 'muggleborn', 'justin.finch@newstudents.edu'),
('susan_bones', 'Incoming_Student', 'ameliasniece', 'susan.bones@newstudents.edu'),
('terry_boot', 'Incoming_Student', 'ravenclawlogic', 'terry.boot@newstudents.edu'),
('michael_corner', 'Incoming_Student', 'strategygames', 'michael.corner@newstudents.edu'),
('anthony_goldstein', 'Incoming_Student', 'ravenclawdebate', 'anthony.goldstein@newstudents.edu'),
('marietta_edgecombe', 'Incoming_Student', 'secretkeeper', 'marietta.edgecombe@newstudents.edu'),
('lee_jordan', 'Incoming_Student', 'quidditchcommentary', 'lee.jordan@newstudents.edu'),
('angelina_johnson', 'Incoming_Student', 'chaserpro', 'angelina.johnson@newstudents.edu'),
('katie_bell', 'Incoming_Student', 'flyhigh', 'katie.bell@newstudents.edu'),
('alicia_spinnet', 'Incoming_Student', 'quidditchfan', 'alicia.spinnet@newstudents.edu'),
('george_weasley', 'Incoming_Student', 'wizardwheezes', 'george.weasley@newstudents.edu'),
('tom_riddle', 'Alumni', 'darklord1943', 'tom.riddle@alumni.example.edu'),
('arthur_weasley', 'Alumni', 'muggleartifacts', 'arthur.weasley@alumni.example.edu'),
('molly_weasley', 'Alumni', 'familyfirst', 'molly.weasley@alumni.example.edu'),
('nymphadora_tonks', 'Alumni', 'metamorphmagus', 'nymphadora.tonks@alumni.example.edu'),
('andromeda_tonks', 'Alumni', 'trueblack', 'andromeda.tonks@alumni.example.edu'),
('ted_tonks', 'Alumni', 'muggleborn', 'ted.tonks@alumni.example.edu'),
('kingsley_shacklebolt', 'Alumni', 'aurorforce', 'kingsley.shacklebolt@alumni.example.edu'),
('xenophilius_lovegood', 'Alumni', 'crumplehorned', 'xenophilius.lovegood@alumni.example.edu'),
('bill_weasley', 'Alumni', 'gringottsbanker', 'bill.weasley@alumni.example.edu'),
('charlie_weasley', 'Alumni', 'dragonkeeper', 'charlie.weasley@alumni.example.edu'),
('percy_weasley', 'Alumni', 'ministryman', 'percy.weasley@alumni.example.edu'),
('fred_weasley', 'Alumni', 'prankster', 'fred.weasley@alumni.example.edu'),
('garrick_ollivander', 'Alumni', 'wandmaker', 'garrick.ollivander@alumni.example.edu'),
('filius_flitwick_alumni', 'Alumni', 'charmmaster', 'filius.flitwick@alumni.example.edu'),
('pomona_sprout_alumni', 'Alumni', 'greenfingers', 'pomona.sprout@alumni.example.edu'),
('sybill_trelawney_alumni', 'Alumni', 'seer', 'sybill.trelawney@alumni.example.edu'),
('lucius_malfoy', 'Alumni', 'purewizard', 'lucius.malfoy@alumni.example.edu'),
('bellatrix_lestrange', 'Alumni', 'darkfollower', 'bellatrix.lestrange@alumni.example.edu'),
('narcissa_malfoy', 'Alumni', 'malfoymanor', 'narcissa.malfoy@alumni.example.edu'),
('horace_slughorn_alumni', 'Alumni', 'slughornclub', 'horace.slughorn@alumni.example.edu'),
('regulus_black', 'Alumni', 'r.a.b', 'regulus.black@alumni.example.edu'),
('rita_skeeter', 'Alumni', 'quickquotes', 'rita.skeeter@alumni.example.edu'),
('bertha_jorkins', 'Alumni', 'forgotten', 'bertha.jorkins@alumni.example.edu'),
('elphias_doge', 'Alumni', 'oldguard', 'elphias.doge@alumni.example.edu'),
('gideon_prewett', 'Alumni', 'ordermember', 'gideon.prewett@alumni.example.edu'),
('fabian_prewett', 'Alumni', 'braveheart', 'fabian.prewett@alumni.example.edu'),
('barty_crouch_jr', 'Alumni', 'imperio', 'barty.crouch.jr@alumni.example.edu'),
('igor_karkaroff', 'Alumni', 'headmaster', 'igor.karkaroff@alumni.example.edu'),
('ludo_bagman', 'Alumni', 'wizengamot', 'ludo.bagman@alumni.example.edu'),
('amaranthus_sprout', 'Alumni', 'professorem', 'amaranthus.sprout@alumni.example.edu');


INSERT INTO Student (Name, Major, Grad_Date, Current_Role, Current_Company, User_ID) VALUES
('Jane Doe', 'Computer Science', '2025-05-15', NULL, NULL, 1),
('Sarah Connor', 'Mechanical Engineering', '2024-12-20', NULL, NULL, 2),
('Harry Potter', 'Magic and Wizardry', '2023-06-25', 'Junior Wizard', 'Ministry of Magic', 3),
('Hermione Granger', 'Magic and Wizardry', '2023-06-25', NULL, NULL, 4),
('Ron Weasley', 'Magic and Wizardry', '2023-06-25', NULL, NULL, 5),
('Lisa Simpson', 'Political Science', '2028-05-20', NULL, NULL, 6),
('Bart Simpson', 'Law', '2028-05-20', NULL, NULL, 7),
('Maggie Simpson', 'Early Childhood Education', '2040-05-15', NULL, NULL, 8),
('Marge Simpson', 'Culinary Arts', '2026-11-30', NULL, NULL, 9),
('Homer Simpson', 'Safety Engineering', '2024-04-15', NULL, NULL, 10),
('Peter Griffin', 'Music', '2023-12-17', NULL, NULL, 11),
('Lois Griffin', 'Education', '2023-08-21', 'Music Teacher', 'Quahog School', 12),
('Stewie Griffin', 'Genius Things', '2038-05-22', NULL, NULL, 13),
('Brian Griffin', 'Philosophy', '2025-10-31', NULL, NULL, 14),
('Meg Griffin', 'Journalism', '2024-05-20', NULL, NULL, 15),
('Chris Griffin', 'Art', '2026-09-10', NULL, NULL, 16),
('Tony Stark', 'Engineering', '2022-12-15', 'Consultant', 'Stark Industries', 17),
('Bruce Wayne', 'Business Management', '2023-01-25', NULL, NULL, 18),
('Clark Kent', 'Journalism', '2024-08-15', NULL, NULL, 19),
('Diana Prince', 'History', '2023-09-05', NULL, NULL, 20),
('Barry Allen', 'Forensic Science', '2025-07-20', NULL, NULL, 21),
('Arthur Curry', 'Marine Biology', '2024-11-17', NULL, NULL, 22),
('Victor Stone', 'Computer Science', '2023-12-12', NULL, NULL, 23),
('Peter Parker', 'Photography', '2025-05-15', 'Intern', 'Daily Bugle', 24),
('Logan Howl', 'Political Science', '2024-03-19', NULL, NULL, 25),
('Natasha Romanoff', 'International Relations', '2023-11-25', NULL, NULL, 26),
('Steve Rogers', 'Art', '2024-04-14', NULL, NULL, 27),
('Bruce Banner', 'Physics', '2023-10-18', NULL, NULL, 28),
('Scott Summers', 'Education', '2024-06-30', NULL, NULL, 29),
('Jean Grey', 'Psychology', '2023-07-14', NULL, NULL, 30);

INSERT INTO Faculty (Name, Department, User_ID) VALUES
('Albus Dumbledore', 'Philosophy', 31),
('Minerva McGonagall', 'Mathematics', 32),
('Severus Snape', 'Chemistry', 33),
('Rubeus Hagrid', 'Environmental Science', 34),
('Gilderoy Lockhart', 'Psychology', 35),
('Remus Lupin', 'History', 36),
('Horace Slughorn', 'Chemistry', 37),
('Filius Flitwick', 'Music', 38),
('Pomona Sprout', 'Botany', 39),
('Sybill Trelawney', 'Psychology', 40),
('Quirinus Quirrell', 'History', 41),
('Rolanda Hooch', 'Physical Education', 42),
('Dolores Umbridge', 'Law', 43),
('Cuthbert Binns', 'History', 44),
('Wilhelmina Grubbly-Plank', 'Zoology', 45),
('Charity Burbage', 'Cultural Studies', 46),
('Aurora Sinistra', 'Astronomy', 47),
('Irma Pince', 'Library Sciences', 48),
('Septima Vector', 'Mathematics', 49),
('Argus Filch', 'Facilities Management', 50),
('Walter White', 'Chemistry', 51),
('Sheldon Cooper', 'Physics', 52),
('Indiana Jones', 'Archaeology', 53),
('Gilbert Grape', 'Theater Arts', 54),
('Robin Scherbatsky', 'Journalism', 55),
('Gregory House', 'Medicine', 56),
('John Keating', 'English Literature', 57),
('Elizabeth Bennet', 'English Literature', 58),
('Jean Luc Picard', 'Leadership Studies', 59),
('Rosa Diaz', 'Criminal Justice', 60);



INSERT INTO Incoming_Student (Name, Major, Grad_Date, User_ID) VALUES
('Lily Evans', 'Biology', '2025-05-15', 61),
('James Potter', 'Mechanical Engineering', '2024-12-20', 62),
('Cedric Diggory', 'Sports Science', '2023-06-25', 63),
('Cho Chang', 'International Relations', '2023-06-25', 64),
('Padma Patil', 'Computer Science', '2023-06-25', 65),
('Parvati Patil', 'Fashion Design', '2028-05-20', 66),
('Dean Thomas', 'Fine Arts', '2028-05-20', 67),
('Seamus Finnigan', 'Chemical Engineering', '2040-05-15', 68),
('Oliver Wood', 'Physical Education', '2026-11-30', 69),
('Fleur Delacour', 'French Literature', '2024-04-15', 70),
('Viktor Krum', 'Physical Education', '2023-12-17', 71),
('Neville Longbottom', 'Botany', '2025-10-31', 72),
('Luna Lovegood', 'Environmental Science', '2024-05-20', 73),
('Draco Malfoy', 'Business Administration', '2026-09-10', 74),
('Pansy Parkinson', 'Psychology', '2022-12-15', 75),
('Blaise Zabini', 'Philosophy', '2023-01-25', 76),
('Millicent Bulstrode', 'Criminal Justice', '2024-08-15', 77),
('Ernie Macmillan', 'History', '2023-09-05', 78),
('Hannah Abbott', 'Nutrition Sciences', '2025-07-20', 79),
('Justin Finch-Fletchley', 'Law', '2024-11-17', 80),
('Susan Bones', 'Forensic Science', '2023-12-12', 81),
('Terry Boot', 'Physics', '2025-05-15', 82),
('Michael Corner', 'English Literature', '2024-03-19', 83),
('Anthony Goldstein', 'Political Science', '2023-11-25', 84),
('Marietta Edgecombe', 'Communications', '2024-04-14', 85),
('Lee Jordan', 'Media Studies', '2023-10-18', 86),
('Angelina Johnson', 'Sports Management', '2024-06-30', 87),
('Katie Bell', 'Kinesiology', '2023-07-14', 88),
('Alicia Spinnet', 'Public Health', '2024-07-15', 89),
('George Weasley', 'Entrepreneurship', '2023-12-15', 90);

INSERT INTO Alumni (Name, Major, Grad_Date, Current_Company, Current_Role, User_ID) VALUES
('Tom Riddle', 'Political Science', '2010-06-01', 'Goldman Sachs', 'Strategy Consultant', 91),
('Arthur Weasley', 'Electrical Engineering', '2008-05-15', 'Tesla', 'Electrical Engineer', 92),
('Molly Weasley', 'Family and Consumer Science', '2009-05-15', NULL, NULL, 93),
('Nymphadora Tonks', 'Criminal Justice', '2006-06-20', 'Metropolitan Police', 'Detective', 94),
('Andromeda Tonks', 'Law', '2007-05-10', 'Private Practice', 'Attorney', 95),
('Ted Tonks', 'Mechanical Engineering', '2008-04-22', 'Boeing', 'Mechanical Engineer', 96),
('Kingsley Shacklebolt', 'Political Science', '2011-08-15', 'United Nations', 'Policy Advisor', 97),
('Xenophilius Lovegood', 'Journalism', '2006-11-17', 'The New York Times', 'Independent Journalist', 98),
('Bill Weasley', 'Finance', '2012-05-30', 'JP Morgan Chase', 'Financial Analyst', 99),
('Charlie Weasley', 'Zoology', '2007-06-14', 'National Geographic', 'Field Researcher', 100),
('Percy Weasley', 'Political Science', '2010-07-22', 'The White House', 'Legislative Assistant', 101),
('Fred Weasley', 'Business', '2013-05-02', 'Google', 'Entrepreneur', 102),
('Garrick Ollivander', 'Material Science', '2009-06-18', '3M', 'Materials Engineer', 103),
('Filius Flitwick', 'Theater Arts', '2011-09-05', NULL, NULL, 104),
('Pomona Sprout', 'Botany', '2011-07-15', NULL, NULL, 105),
('Sybill Trelawney', 'Psychology', '2010-05-20', NULL, NULL, 106),
('Lucius Malfoy', 'Business Administration', '2006-12-18', 'Amazon', 'Operations Manager', 107),
('Bellatrix Lestrange', 'Criminal Justice', '2009-05-30', NULL, NULL, 108),
('Narcissa Malfoy', 'Social Work', '2008-06-12', 'UNICEF', 'Program Director', 109),
('Horace Slughorn', 'Chemistry', '2009-10-14', 'Pfizer', 'Research Scientist', 110),
('Regulus Black', 'History', '2006-05-15', 'Smithsonian Institution', 'Researcher', 111),
('Rita Skeeter', 'Journalism', '2008-04-22', 'CNN', 'Investigative Reporter', 112),
('Bertha Jorkins', 'International Relations', '2007-05-10', 'United Nations', 'Program Coordinator', 113),
('Elphias Doge', 'Law', '2008-06-01', 'ACLU', 'Senior Advisor', 114),
('Gideon Prewett', 'Political Science', '2006-07-15', NULL, NULL, 115),
('Fabian Prewett', 'Political Science', '2006-07-15', NULL, NULL, 116),
('Barty Crouch Jr', 'Law', '2007-06-25', NULL, NULL, 117),
('Igor Karkaroff', 'International Relations', '2006-08-20', 'European Union', 'Diplomat', 118),
('Ludo Bagman', 'Sports Management', '2009-12-15', 'Nike', 'Sports Marketing Director', 119),
('Amaranthus Sprout', 'Botany', '2007-09-10', 'Monsanto', 'Botanical Researcher', 120);


INSERT INTO Company (Name, Location, Industry, Size, Reputation) VALUES
('Google', 'Mountain View, CA', 'Technology', 118899, 'Excellent'),
('Apple Inc.', 'Cupertino, CA', 'Technology', 147000, 'Excellent'),
('Microsoft', 'Redmond, WA', 'Technology', 163000, 'Excellent'),
('Amazon', 'Seattle, WA', 'E-commerce', 1298000, 'Excellent'),
('Facebook', 'Menlo Park, CA', 'Social Media', 58604, 'Excellent'),
('Tesla', 'Palo Alto, CA', 'Automotive', 70757, 'Very Good'),
('Netflix', 'Los Gatos, CA', 'Entertainment', 9400, 'Very Good'),
('Nike', 'Beaverton, OR', 'Apparel', 76700, 'Very Good'),
('Pfizer', 'New York, NY', 'Pharmaceuticals', 78500, 'Very Good'),
('Coca-Cola', 'Atlanta, GA', 'Beverages', 80300, 'Excellent'),
('Visa', 'San Francisco, CA', 'Financial Services', 19500, 'Excellent'),
('Goldman Sachs', 'New York, NY', 'Financial Services', 38300, 'Excellent'),
('ExxonMobil', 'Irving, TX', 'Oil and Gas', 72000, 'Good'),
('Chevron', 'San Ramon, CA', 'Oil and Gas', 47736, 'Good'),
('Boeing', 'Chicago, IL', 'Aerospace', 142000, 'Good'),
('Ford Motor Company', 'Dearborn, MI', 'Automotive', 186000, 'Good'),
('General Motors', 'Detroit, MI', 'Automotive', 155000, 'Good'),
('JP Morgan Chase', 'New York, NY', 'Financial Services', 256981, 'Excellent'),
('Walmart', 'Bentonville, AR', 'Retail', 2300000, 'Good'),
('UnitedHealth Group', 'Minnetonka, MN', 'Healthcare', 325000, 'Very Good'),
('McKesson', 'Irving, TX', 'Healthcare', 42500, 'Good'),
('Verizon Communications', 'New York, NY', 'Telecommunications', 135000, 'Good'),
('AT&T', 'Dallas, TX', 'Telecommunications', 230760, 'Good'),
('Costco Wholesale', 'Issaquah, WA', 'Retail', 273000, 'Very Good'),
('CitiGroup', 'New York, NY', 'Financial Services', 210153, 'Good'),
('Intel', 'Santa Clara, CA', 'Semiconductors', 110600, 'Very Good'),
('Procter & Gamble', 'Cincinnati, OH', 'Consumer Goods', 99000, 'Excellent'),
('3M', 'Maplewood, MN', 'Manufacturing', 95000, 'Good'),
('The Home Depot', 'Atlanta, GA', 'Retail', 500000, 'Very Good'),
('UPS', 'Atlanta, GA', 'Logistics', 481000, 'Very Good');

INSERT INTO Company (Company_ID, Name, Location, Industry, Size, Reputation)
VALUES
    (10001, 'ABC Corp', 'New York', 'Software', 500, 'Highly rated by industry experts for innovative solutions'),
    (10002, 'XYZ Inc', 'San Francisco', 'Tech', 1000, 'Recipient of multiple awards for technological advancements'),
    (10003, 'Tech Solutions Ltd', 'London', 'IT Services', 300, 'Recognized for exceptional customer satisfaction and service quality'),
    (10004, 'Innovatech Solutions', 'Chicago', 'Software', 250, 'Known for cutting-edge software solutions'),
(10005, 'Data Analytics Co', 'Boston', 'Data Science', 800, 'Leaders in big data and analytics'),
(10006, 'GreenTech Innovations', 'Austin', 'Renewable Energy', 150, 'Pioneers in sustainable energy solutions'),
(10007, 'HealthPlus Tech', 'Seattle', 'Healthcare Technology', 450, 'Advancing healthcare through technology'),
(10008, 'CyberSecure', 'Atlanta', 'Cyber Security', 550, 'Top rated for cybersecurity defenses'),
(10009, 'AutoDrive Systems', 'Detroit', 'Automotive Tech', 750, 'Revolutionizing auto tech with autonomous systems'),
(10010, 'Quantum Computing Corp', 'San Jose', 'Quantum Computing', 200, 'Leading the charge in quantum technology'),
(10011, 'Smart Home Solutions', 'Denver', 'Consumer Electronics', 320, 'Smart home technologies for modern living'),
(10012, 'Blockchain Services Ltd', 'Toronto', 'Blockchain', 400, 'Innovative blockchain solutions provider'),
(10013, 'AI Dynamics', 'Vancouver', 'Artificial Intelligence', 600, 'Forefront of AI research and applications'),
(10014, 'EcoBuild Architects', 'Miami', 'Architecture', 220, 'Eco-friendly architectural designs and services'),
(10015, 'NeuroTech Industries', 'Philadelphia', 'Biotechnology', 350, 'Specialists in neurological technologies'),
(10016, 'Genomics Research Lab', 'San Diego', 'Genomics', 300, 'Advances in genetic research and diagnostics'),
(10017, 'OceanTech Marine', 'Houston', 'Marine Technology', 180, 'Innovations in marine exploration and safety'),
(10018, 'Future Robotics', 'Phoenix', 'Robotics', 500, 'Robotics solutions for industrial automation'),
(10019, 'SkyNet Drones', 'New Orleans', 'Aerospace', 400, 'Leading drone technology for commercial use'),
(10020, 'NextGen Materials', 'Portland', 'Materials Science', 450, 'Developing superior materials for construction'),
(10021, 'BioHeal Pharmaceuticals', 'Baltimore', 'Pharmaceuticals', 600, 'Breakthroughs in medicinal treatments'),
(10022, 'AgriTech Farming Co', 'St. Louis', 'Agriculture Tech', 350, 'Modernizing agriculture with technology'),
(10023, 'Clean Water Solutions', 'Tampa', 'Environmental Services', 250, 'Providing clean water solutions globally'),
(10024, 'InfoTech Systems', 'Cleveland', 'IT Services', 300, 'Reliable and efficient IT support services'),
(10025, 'Virtual Reality Ventures', 'Minneapolis', 'Virtual Reality', 150, 'Creating immersive virtual reality experiences'),
(10026, 'NanoTech Materials', 'Cincinnati', 'Nanotechnology', 200, 'Advances in nanotechnology applications'),
(10027, 'Green Energy Solar', 'Kansas City', 'Renewable Energy', 500, 'Sustainable energy solutions with solar power'),
(10028, 'MediaStream Technologies', 'Orlando', 'Media Technology', 450, 'Innovative streaming technologies for media'),
(10029, 'Urban Development Inc', 'Salt Lake City', 'Real Estate', 700, 'Leading urban development projects'),
(10030, 'Crypto Currency Hub', 'Las Vegas', 'Fintech', 350, 'Cryptocurrency solutions and services'),
(10031, 'Logistics Network Ltd', 'Raleigh', 'Logistics', 550, 'Enhanced logistics and supply chain management'),
(10032, 'Climate Control Systems', 'Nashville', 'Climate Technology', 400, 'Technologies for climate management and control'),
(10033, 'Heritage Art Institute', 'Milwaukee', 'Art & Design', 250, 'Promoting fine arts and design innovation'),
(10034, 'Protein Engineering Lab', 'Omaha', 'Biotechnology', 180, 'Protein engineering for medical applications'),
(10035, 'Smart Mobility Solutions', 'Sacramento', 'Transportation', 300, 'Solutions for smart and sustainable mobility'),
(10036, 'Quantum Research Institute', 'Wichita', 'Research & Development', 500, 'Quantum computing research and development'),
(10037, 'Global Health Initiatives', 'Newark', 'Global Health', 400, 'Improving global health through innovative projects');

INSERT INTO CoopCycle (Year, PlacementRate, Type) VALUES
(2018, 0.95, 'Summer'),
(2018, 0.90, 'Fall'),
(2018, 0.88, 'Spring'),
(2019, 0.93, 'Summer'),
(2019, 0.91, 'Fall'),
(2019, 0.89, 'Spring'),
(2020, 0.85, 'Summer'),
(2020, 0.87, 'Fall'),
(2020, 0.84, 'Spring'),
(2021, 0.92, 'Summer'),
(2021, 0.90, 'Fall'),
(2021, 0.91, 'Spring'),
(2022, 0.94, 'Summer'),
(2022, 0.95, 'Fall'),
(2022, 0.92, 'Spring'),
(2017, 0.89, 'Summer'),
(2017, 0.90, 'Fall'),
(2017, 0.88, 'Spring'),
(2016, 0.93, 'Summer'),
(2016, 0.91, 'Fall'),
(2016, 0.89, 'Spring'),
(2015, 0.95, 'Summer'),
(2015, 0.94, 'Fall'),
(2015, 0.93, 'Spring'),
(2014, 0.92, 'Summer'),
(2014, 0.91, 'Fall'),
(2014, 0.90, 'Spring'),
(2013, 0.89, 'Summer'),
(2013, 0.87, 'Fall'),
(2013, 0.85, 'Spring');


INSERT INTO CoopPosition (Title, Industry, Location, Role_Description, Company_Size, Work_Hours, Responsibilities, Company_ID, CycleID) VALUES
('Software Engineering Intern', 'Technology', 'San Francisco, CA', 'Participate in the development of new software products.', 10000, 40, 'Write code, conduct tests, and debug.', 1, 10),
('Marketing Intern', 'Marketing', 'New York, NY', 'Support the marketing team with campaign strategies.', 5000, 30, 'Assist in market research and prepare presentations.', 2, 15),
('Data Analyst Intern', 'Data Analysis', 'Chicago, IL', 'Analyze data sets to improve business decisions.', 1500, 40, 'Data collection, processing, and statistical analysis.', 3, 20),
('Graphic Design Intern', 'Design', 'Los Angeles, CA', 'Create visual content for digital and print media.', 200, 35, 'Design graphics and multimedia for brand projects.', 4, 25),
('Mechanical Engineering Intern', 'Engineering', 'Houston, TX', 'Assist in the design of mechanical components.', 9500, 40, 'CAD modeling and mechanical testing.', 5, 30),
('Environmental Research Intern', 'Environmental', 'Seattle, WA', 'Research on environmental impact of industrial activities.', 300, 40, 'Collect field data and assist with reports.', 6, 10),
('Finance Intern', 'Finance', 'Boston, MA', 'Support the finance team in daily operations.', 8000, 40, 'Help with budgeting and financial forecasting.', 7, 15),
('HR Intern', 'Human Resources', 'Atlanta, GA', 'Assist with the recruitment and employee engagement programs.', 2000, 30, 'Screen resumes and schedule interviews.', 8, 20),
('Journalism Intern', 'Media', 'Washington, DC', 'Write articles and conduct interviews for various sections.', 300, 35, 'Reporting, writing, and editing news stories.', 9, 25),
('Civil Engineering Intern', 'Construction', 'San Diego, CA', 'Assist in civil infrastructure projects.', 5000, 40, 'Site inspections and project documentation.', 10, 30),
('Pharmacy Intern', 'Healthcare', 'Phoenix, AZ', 'Assist pharmacists in managing medication distribution.', 150, 40, 'Prepare medications and provide customer service.', 11, 10),
('IT Support Intern', 'IT', 'Dallas, TX', 'Provide technical support and troubleshooting services.', 2000, 35, 'Support end-users with hardware and software issues.', 12, 15),
('Event Planning Intern', 'Event Management', 'Philadelphia, PA', 'Help organize corporate events and meetings.', 500, 30, 'Venue selection, coordination with vendors, event promotion.', 13, 20),
('Real Estate Intern', 'Real Estate', 'Miami, FL', 'Support real estate operations and client management.', 300, 40, 'Assist with property showings, documentation, and market analysis.', 14, 25),
('Electrical Engineering Intern', 'Engineering', 'Detroit, MI', 'Participate in the design of electrical systems.', 10000, 40, 'Develop electrical schematics, perform simulations.', 15, 30),
('Nutritionist Intern', 'Healthcare', 'San Jose, CA', 'Support dietary planning and consultations.', 200, 35, 'Create nutritional plans, educate clients.', 16, 10),
('Public Relations Intern', 'Public Relations', 'Minneapolis, MN', 'Assist with the creation of PR campaigns.', 1000, 30, 'Draft press releases, manage social media content.', 17, 15),
('Sales Intern', 'Sales', 'Denver, CO', 'Support the sales team in reaching its targets.', 500, 40, 'Generate leads, help with product presentations.', 18, 20),
('Legal Intern', 'Law', 'St. Louis, MO', 'Assist with case research and documentation.', 150, 35, 'Research legal cases, draft documents.', 19, 25),
('Supply Chain Intern', 'Logistics', 'Tampa, FL', 'Assist in the optimization of the supply chain process.', 8000, 40, 'Track shipments, analyze supply chain data.', 20, 30),
('Social Media Intern', 'Marketing', 'Portland, OR', 'Engage with online communities and manage social media profiles.', 250, 30, 'Content creation, campaign management, data analysis.', 21, 10),
('Bioengineering Intern', 'Biotechnology', 'Pittsburgh, PA', 'Participate in research and development of new bio-tech solutions.', 450, 40, 'Conduct experiments, document results, assist in prototype development.', 22, 15),
('Architectural Intern', 'Architecture', 'Cincinnati, OH', 'Assist in architectural design and model creation.', 1000, 35, 'Create digital models, assist with client presentations.', 23, 20),
('Software QA Intern', 'Technology', 'Salt Lake City, UT', 'Test software applications to find and document bugs.', 3000, 40, 'Execute test cases, report bugs, verify fixes.', 24, 25),
('Content Writing Intern', 'Media', 'Orlando, FL', 'Create content for websites, blogs, and marketing materials.', 200, 30, 'Write, edit, and proofread content to enhance readability.', 25, 30),
('Investment Banking Intern', 'Finance', 'Charlotte, NC', 'Assist with financial analysis and client presentations.', 5000, 40, 'Market research, financial modeling, presentation preparation.', 26, 10),
('Aerospace Engineering Intern', 'Aerospace', 'Baltimore, MD', 'Support the design and testing of aerospace components.', 15000, 40, 'Assist with simulations, report generation, test setups.', 27, 15),
('Web Development Intern', 'Technology', 'Indianapolis, IN', 'Develop and maintain web applications.', 750, 40, 'Code in HTML/CSS/JS, maintain website functionality.', 28, 20),
('Operations Management Intern', 'Manufacturing', 'Columbus, OH', 'Assist in the management of factory operations.', 2000, 40, 'Monitor production lines, assist with process improvements.', 29, 25),
('Clinical Research Intern', 'Healthcare', 'Fort Worth, TX', 'Participate in clinical trials and research studies.', 500, 35, 'Data collection, patient interaction, regulatory compliance.', 30, 30);

INSERT INTO Review (Title, Date, Rating, Content, User_ID, Position_ID, SkillsUsed) VALUES
('Great Learning Experience', '2023-04-15', 5, 'I had an excellent coop experience at this company. The team was supportive and I learned a lot about software development.', 1, 1, 'Programming, Debugging, Team Collaboration'),
('Challenging but Rewarding', '2023-01-10', 4, 'The job was challenging and pushed me to my limits. It was a rewarding experience that improved my analytical skills.', 2, 2, 'Data Analysis, Critical Thinking, Excel'),
('Supportive Work Environment', '2023-03-12', 5, 'Everyone was very welcoming and I received the guidance needed to thrive. Great place for an intern!', 3, 3, 'Customer Service, Problem Solving, Communication'),
('Poor Management', '2023-02-28', 2, 'The position was fine, but management was disorganized which made the work environment stressful.', 4, 4, 'Time Management, Adaptability'),
('Excellent Mentorship', '2023-04-20', 5, 'My mentor was knowledgeable and always available. I learned more than expected during my internship.', 5, 5, 'Technical Drawing, CAD Software'),
('Not as Advertised', '2023-05-01', 3, 'The job description did not accurately reflect the responsibilities, which were less engaging and more clerical.', 6, 6, 'Documentation, Filing, Organizational Skills'),
('Invaluable Industry Insight', '2023-03-15', 4, 'Working directly in the field gave me invaluable industry insight and a clear career path.', 7, 7, 'Market Research, Strategic Planning'),
('Lack of Structure', '2023-02-05', 2, 'The internship lacked structure and often had little to no work for me, which was disappointing.', 8, 8, 'Self-Motivation, Initiative'),
('Highly Rewarding Internship', '2023-01-25', 5, 'A highly rewarding internship with lots of hands-on experience. Definitely a boon for my CV.', 9, 9, 'Event Planning, Budget Management, Negotiation'),
('Average Experience', '2023-04-30', 3, 'The experience was average, not much mentoring but I did gain some independence.', 10, 10, 'Project Management, Independent Research'),
('Fantastic Team and Culture', '2023-05-20', 5, 'The team culture was fantastic, making it easy to learn and contribute significantly.', 11, 11, 'Teamwork, Creative Thinking'),
('Limited Growth Opportunities', '2023-03-05', 3, 'Work was interesting but there were limited opportunities for growth and learning.', 12, 12, 'Technical Support, IT Tools'),
('Diverse and Inclusive', '2023-05-15', 5, 'The company practices a truly inclusive and diverse culture which made the experience enriching.', 13, 13, 'Diversity Awareness, Communication'),
('Outdated Practices', '2023-03-20', 2, 'The company uses outdated practices and was resistant to adopting new technologies.', 14, 14, 'Legacy Systems, Patience'),
('Impactful Projects', '2023-05-05', 5, 'I worked on several impactful projects that allowed me to apply my classroom knowledge.', 15, 15, 'Project Design, Implementation'),
('Underwhelming Support', '2023-02-15', 2, 'Support from supervisors was underwhelming, often felt left out of the loop on major decisions.', 16, 16, 'Independence, Proactivity'),
('Dynamic and Fast Paced', '2023-04-01', 4, 'A dynamic and fast-paced environment that kept me engaged and constantly learning.', 17, 17, 'Adaptability, Fast Learning, Stress Management'),
('Excellent Entry-Level Experience', '2023-01-20', 4, 'For anyone looking to start their career, this internship provides excellent entry-level exposure.', 18, 18, 'Basic Legal Concepts, Research'),
('Too Much Workload', '2023-02-25', 2, 'The workload was too much for an intern, often had to work late with little acknowledgment.', 19, 19, 'Work Ethic, Endurance'),
('Inspirational Colleagues', '2023-04-10', 5, 'The colleagues were inspirational, and their dedication to quality and innovation was motivating.', 20, 20, 'Innovation, Quality Control'),
('Mismatched Role', '2023-03-01', 3, 'The role was not well matched to my skills, which led to a less productive internship.', 21, 21, 'Flexibility, Quick Learning'),
('Valuable Network Building', '2023-02-08', 4, 'The internship was an excellent opportunity for building a professional network in the industry.', 22, 22, 'Networking, Professional Etiquette'),
('Great for First-Timers', '2023-03-28', 4, 'If it’s your first internship, this is a great place. It provides a gentle introduction to the corporate world.', 23, 23, 'Corporate Etiquette, Basic Office Skills'),
('Lack of Proper Training', '2023-01-15', 2, 'There was a lack of proper training which made the learning curve steep and frustrating.', 24, 24, 'Self-Learning, Persistence'),
('Engaging and Fulfilling', '2023-02-18', 5, 'An engaging and fulfilling role that allowed me to take on real responsibilities.', 25, 25, 'Leadership, Responsibility Handling'),
('Need for Better Organization', '2023-04-25', 3, 'The company needs better organization, as there were frequent last-minute changes to tasks.', 26, 26, 'Organizational Skills, Flexibility'),
('Stimulating Environment', '2023-01-05', 5, 'The work environment was stimulating, with plenty of opportunities to challenge myself.', 27, 27, 'Problem Solving, Critical Analysis'),
('Insufficient Resources', '2023-03-10', 2, 'The company provided insufficient resources, which often hindered project completion.', 28, 28, 'Resource Management, Innovation'),
('Broad Exposure to Industry', '2023-04-02', 4, 'I received broad exposure to the industry, which was beneficial for my professional growth.', 29, 29, 'Industry Knowledge, Networking'),
('Unstructured Internship Program', '2023-01-30', 3, 'The internship program was unstructured, which sometimes led to confusion about project goals.', 30, 30, 'Adaptability, Initiative');

INSERT INTO CompensationPackage (Perks, Hourly, BonusTotal, HousingTotal, RelocationTotal, Position_ID) VALUES
('Health benefits, Gym membership', 25.00, 500, 2000, 1000, 1),
('Commuter benefits, Free lunches', 22.00, 0, 1500, 500, 2),
('Stock options, Flexible hours', 30.00, 1000, 0, 0, 3),
('401(k) matching, Health insurance', 28.00, 800, 2500, 1500, 4),
('Health insurance, Paid time off', 20.00, 0, 1000, 0, 5),
('Free snacks, Wellness programs', 18.00, 300, 0, 0, 6),
('Employee discounts, Product allowances', 15.00, 0, 1200, 300, 7),
('Flexible schedule, Remote work options', 19.50, 250, 0, 0, 8),
('Conference stipends, Professional training', 17.00, 0, 1000, 1000, 9),
('Paid holidays, Sick leave', 24.00, 700, 1800, 1200, 10),
('Company car, Travel compensation', 21.00, 400, 0, 2000, 11),
('Mobile phone, Subscription services', 16.00, 0, 800, 0, 12),
('Gym reimbursement, Social events', 23.50, 600, 0, 0, 13),
('Education allowance, Book credit', 20.00, 0, 1300, 500, 14),
('Stock options, Annual bonus', 29.00, 2000, 3000, 2500, 15),
('Free coffee, Parking benefits', 17.00, 0, 0, 0, 16),
('Healthcare, Vision benefits', 22.50, 500, 1500, 700, 17),
('Tuition reimbursement, Paid volunteer time', 26.00, 1000, 0, 0, 18),
('Travel perks, Free tickets', 24.50, 800, 2000, 1500, 19),
('Pet-friendly office, Adoption assistance', 19.00, 0, 1200, 0, 20),
('Free meals, On-site fitness center', 27.00, 1200, 2500, 2000, 21),
('Remote work support, Equipment allowance', 23.00, 0, 0, 0, 22),
('Profit sharing, Performance bonuses', 31.00, 1500, 3500, 3000, 23),
('Sabbatical leave, Cultural benefits', 16.50, 0, 1000, 0, 24),
('Paternity/Maternity leave, Childcare', 25.50, 900, 2000, 1000, 25),
('Annual retreats, Team bonding', 22.00, 0, 1500, 500, 26),
('Game room, Creative Fridays', 20.00, 0, 800, 0, 27),
('Sign-on bonus, Relocation support', 28.00, 2000, 3000, 2500, 28),
('End-of-year bonus, Early Friday release', 19.00, 500, 0, 0, 29),
('Health club membership, Public transit pass', 21.50, 0, 1100, 600, 30);


INSERT INTO Question (Title, Date, Status, Content, User_ID) VALUES
('Best Study Tips for Finals?', '2023-04-10', 'Open', 'Looking for effective study techniques for upcoming finals. Any advice?', 1),
('Internship Application Deadlines?', '2023-04-15', 'Open', 'When are the internship application deadlines for the fall 2023 cycle?', 2),
('Where to Find Scholarship Opportunities?', '2023-04-20', 'Answered', 'Can anyone recommend where to find scholarship opportunities for undergraduates?', 3),
('Effective Time Management Strategies?', '2023-03-30', 'Open', 'What are your best time management strategies during busy school terms?', 4),
('How to Prepare for Job Interviews?', '2023-04-05', 'Open', 'Any tips on how to effectively prepare for job interviews in the tech industry?', 5),
('Graduate School Application Tips?', '2023-04-25', 'Answered', 'What should I focus on in my graduate school applications to stand out?', 6),
('Recommended Student Organizations?', '2023-04-02', 'Open', 'What student organizations do you recommend joining for business majors?', 7),
('Tips for First-Year Adjustments?', '2023-04-18', 'Answered', 'How can first-year students adjust to college life more easily?', 8),
('Dealing with Exam Stress?', '2023-04-12', 'Open', 'Does anyone have advice on how to deal with stress during exam periods?', 9),
('Choosing a Major, Need Guidance', '2023-04-08', 'Answered', 'I''m undecided about my major. Can anyone share how they chose theirs?', 10),
('Best Local Part-Time Jobs?', '2023-04-14', 'Open', 'What are the best part-time jobs around campus for students?', 11),
('Finding Research Opportunities?', '2023-04-07', 'Answered', 'How do you find research opportunities in the biology department?', 12),
('Advice for Living Abroad?', '2023-04-17', 'Open', 'I''m considering a semester abroad. Any tips from students who have done it?', 13),
('Securing Letters of Recommendation?', '2023-04-21', 'Answered', 'What''s the best approach to ask professors for letters of recommendation?', 14),
('Balancing Work and Study Tips?', '2023-04-01', 'Open', 'How do you balance part-time work and full-time study effectively?', 15),
('Effective Group Study Sessions?', '2023-04-03', 'Answered', 'How can I make group study sessions more effective?', 16),
('Using Educational Technology?', '2023-04-19', 'Open', 'What educational technology tools have you found helpful during your studies?', 17),
('Best Coffee Spots on Campus?', '2023-04-13', 'Answered', 'Where are the best coffee spots on campus for studying?', 18),
('Navigating Financial Aid Options?', '2023-04-06', 'Open', 'Can anyone explain the different financial aid options available?', 19),
('Advice on Student Loans?', '2023-04-22', 'Open', 'Looking for advice on managing student loans. Any experiences to share?', 20),
('Studying Abroad in Europe?', '2023-04-16', 'Open', 'Has anyone studied abroad in Europe? What should I prepare for?', 21),
('Finding Mentors in Academia?', '2023-04-23', 'Answered', 'How do you go about finding a good mentor in academia?', 22),
('Effective Lecture Note-Taking?', '2023-04-11', 'Open', 'What are some effective methods for taking notes during lectures?', 23),
('Career Prospects in Data Science?', '2023-04-24', 'Answered', 'What are the career prospects for someone with a degree in data science?', 24),
('How to Get Involved in Campus Politics?', '2023-04-04', 'Open', 'I want to get involved in campus politics. Where do I start?', 25),
('Preparing for Professional Networking?', '2023-04-26', 'Open', 'How do I prepare for networking events to make the most of them?', 26),
('Recommendations for Summer Internships?', '2023-04-09', 'Open', 'Can anyone recommend companies that offer great summer internships for finance majors?', 27),
('How to Improve Public Speaking Skills?', '2023-04-27', 'Answered', 'What are some effective ways to improve public speaking skills?', 28),
('Finding Part-Time Jobs in IT?', '2023-04-29', 'Open', 'What are some good strategies to find part-time jobs in IT while studying?', 29),
('Advantages of Co-op Programs?', '2023-04-28', 'Answered', 'Can someone explain the advantages of participating in co-op programs?', 30);

INSERT INTO Answer (Content, Date, User_ID, Question_ID) VALUES
('For finals, try the Pomodoro technique. It involves studying in 25-minute intervals with 5-minute breaks. Helps maintain focus!', '2023-04-11', 2, 1),
('The deadlines for Fall internships usually close around mid-April. Check the career services portal for specific dates.', '2023-04-16', 3, 2),
('You can find scholarships through the financial aid office, departmental announcements, or external websites like Fastweb.', '2023-04-21', 4, 3),
('I prioritize tasks using a digital planner and set specific times for studying, rest, and social activities.', '2023-03-31', 5, 4),
('Practice common interview questions and know your resume well. Also, doing mock interviews with friends can be really helpful.', '2023-04-06', 6, 5),
('Focus on your statement of purpose and get strong letters of recommendation. Highlight unique experiences in your application.', '2023-04-26', 7, 6),
('For business majors, I recommend joining the Finance Club and the Entrepreneurship Society to build networks and learn.', '2023-04-03', 8, 7),
('Join clubs, attend social events, and try to establish a routine early. It really helps in adjusting to the new environment.', '2023-04-19', 9, 8),
('Exercise regularly and try meditation. Also, make sure to balance study with leisure to manage stress effectively.', '2023-04-13', 10, 9),
('I talked to seniors and alumni, attended career services workshops, and did some introspective thinking to decide on a major.', '2023-04-09', 11, 10),
('The library often offers part-time positions that are compatible with student schedules. Also check local cafes and bookstores.', '2023-04-15', 12, 11),
('Check with your department office or faculty advisors. They usually know about available research positions and projects.', '2023-04-08', 13, 12),
('Learn the local language basics and connect with other students who have studied abroad in that region for firsthand tips.', '2023-04-18', 14, 13),
('Start building relationships with your professors early. Participate in class and show your interest in the subject matter.', '2023-04-22', 15, 14),
('Setting strict schedules for work and study helps. Also, communicate your study needs with your employer if flexible.', '2023-04-02', 16, 15),
('Make an agenda before meetings, keep the group small, and assign tasks to ensure everyone contributes effectively.', '2023-04-04', 17, 16),
('I use tools like Evernote for note-taking and Khan Academy for supplementary learning, especially before exams.', '2023-04-20', 18, 17),
('The cafe in the new arts building has great ambiance for studying. Plus, their espresso is a must-try!', '2023-04-14', 19, 18),
('There are several aid options including loans, scholarships, and grants. It’s best to talk to a financial aid counselor.', '2023-04-07', 20, 19),
('Keep track of your borrowing and consider federal loans first as they have lower interest rates and flexible repayment terms.', '2023-04-23', 21, 20),
('I studied in Italy and it was amazing. Try to immerse yourself in the culture and travel as much as your budget allows.', '2023-04-17', 22, 21),
('Attend faculty lectures and speak to them during office hours. Showing genuine interest can help in finding a mentor.', '2023-04-24', 23, 22),
('For lectures, I prefer using a tablet to take handwritten notes which I later convert into typed summaries.', '2023-04-12', 24, 23),
('Data science has strong growth prospects. Focus on building your skills in machine learning and big data analytics.', '2023-04-25', 25, 24),
('Start by attending student government meetings as an observer. Speak to current members about how you can get involved.', '2023-04-05', 26, 25),
('Before networking events, research the attendees and prepare some talking points. Always follow up with new contacts.', '2023-04-27', 27, 26),
('Check with the career center; they have a list of summer internships. Also, many banks offer structured internship programs.', '2023-04-10', 28, 27),
('Join a local Toastmasters club to practice public speaking. It’s a great way to build confidence and improve.', '2023-04-28', 29, 28),
('Networking and LinkedIn can be quite effective. Also, check the campus career center for listings targeted at IT students.', '2023-04-30', 30, 29),
('Co-op programs provide real-world experience that enhances your resume and helps you build professional connections.', '2023-04-29', 1, 30);
