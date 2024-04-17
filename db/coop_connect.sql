
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
    NUID INT PRIMARY KEY,
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
    NUID INT PRIMARY KEY,
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
    Alumni_ID INT PRIMARY KEY,
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
    Faculty_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Department VARCHAR(255),
    User_ID INT,
    CONSTRAINT fk_4
        FOREIGN KEY (User_ID)
            REFERENCES User (User_ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);




CREATE TABLE IF NOT EXISTS Company (
    Company_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Location VARCHAR(255),
    Industry VARCHAR(255),
    Size INT,
    Reputation VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS CoopCycle (
    CycleID INT PRIMARY KEY,
    Year INT NOT NULL,
    PlacementRate FLOAT,
    Type VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS CoopPosition (
    Position_ID INT PRIMARY KEY,
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
    Review_ID INT PRIMARY KEY,
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
    CPID INT PRIMARY KEY,
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
    Question_ID INT PRIMARY KEY,
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
    Answer_ID INT PRIMARY KEY,
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
('john_doe', 'Student', 'password123', 'john.doe@example.com'),
('jane_smith', 'Student', 'securepass456', 'jane.smith@example.com'),
('alice_johnson', 'Incomer', 'alicepass123', 'alice.johnson@example.com'),
('bob_williams', 'Incomer', 'bobpass456', 'bob.williams@example.com'),
('emily_brown', 'Alumni', 'emilypass123', 'emily.brown@example.com'),
('michael_johnson', 'Alumni', 'michaelpass456', 'michael.johnson@example.com'),
('emily_white', 'Professor', 'emilypass12345', 'emily.white@example.com'),
('michael_white', 'Advisor', 'michaelpass456', 'michael.white@example.com'),
('charlie_miller', 'Student', 'mypassword789', 'charlie.miller@example.com'),
('sophia_lopez', 'Student', 'passcode246', 'sophia.lopez@example.com'),
('olivia_wang', 'Student', 'oliveTree123', 'olivia.wang@example.com'),
('noah_ramirez', 'Faculty', 'noahsArk456', 'noah.ramirez@example.com'),
('emma_lopez', 'Alumni', 'emmaL2024', 'emma.lopez@example.com'),
('liam_smith', 'Student', 'liamS123', 'liam.smith@example.com'),
('ava_taylor', 'Student', 'avaT321', 'ava.taylor@example.com'),
('william_jones', 'Incoming Student', 'willJ456', 'william.jones@example.com'),
('sophia_white', 'Student', 'sophieW789', 'sophia.white@example.com'),
('james_johnson', 'Faculty', 'jamesJ123', 'james.johnson@example.com'),
('charlotte_brown', 'Alumni', 'charlieB2024', 'charlotte.brown@example.com'),
('mason_davis', 'Student', 'masonD321', 'mason.davis@example.com'),
('isabella_martinez', 'Student', 'bellaM789', 'isabella.martinez@example.com'),
('lucas_garcia', 'Incoming Student', 'lucasG456', 'lucas.garcia@example.com'),
('mila_thompson', 'Student', 'milaT123', 'mila.thompson@example.com'),
('ethan_wilson', 'Faculty', 'ethanW321', 'ethan.wilson@example.com'),
('harper_anderson', 'Alumni', 'harperA789', 'harper.anderson@example.com'),
('logan_moore', 'Student', 'loganM456', 'logan.moore@example.com'),
('ella_jackson', 'Student', 'ellaJ123', 'ella.jackson@example.com'),
('aiden_clark', 'Incoming Student', 'aidenC321', 'aiden.clark@example.com'),
('lily_walker', 'Student', 'lilyW789', 'lily.walker@example.com'),
('jameson_hall', 'Faculty', 'jamesonH456', 'jameson.hall@example.com'),
('amelia_turner', 'Alumni', 'ameliaT123', 'amelia.turner@example.com'),
('oliver_carter', 'Student', 'oliverC321', 'oliver.carter@example.com'),
('mia_phillips', 'Student', 'miaP789', 'mia.phillips@example.com'),
('levi_mitchell', 'Incoming Student', 'leviM456', 'levi.mitchell@example.com'),
('zoe_perez', 'Student', 'zoeP123', 'zoe.perez@example.com'),
('benjamin_roberts', 'Faculty', 'benR321', 'benjamin.roberts@example.com'),
('evelyn_lee', 'Alumni', 'evelynL789', 'evelyn.lee@example.com'),
('sebastian_white', 'Student', 'sebastianW456', 'sebastian.white@example.com'),
('abigail_harris', 'Student', 'abbyH123', 'abigail.harris@example.com'),
('nathan_diaz', 'Incoming Student', 'nateD321', 'nathan.diaz@example.com');

INSERT INTO Student (NUID, Name, Major, Grad_Date, Current_Role, Current_Company, User_ID) VALUES
(123456789, 'John Doe', 'Computer Science', '2024-05-15', null, null, 1),
(987654321, 'Jane Smith', 'Mechanical Engineering', '2023-12-20', null, null, 2),
(123456790, 'Ella Rodriguez', 'Chemical Engineering', '2025-05-10', NULL, NULL, 11),
(123456791, 'Mason Lee', 'Environmental Science', '2023-12-15', NULL, NULL, 12),
(123456792, 'Isabella Thompson', 'Physics', '2026-11-21', NULL, NULL, 13),
(123456793, 'Liam Anderson', 'Mathematics', '2024-10-12', NULL, NULL, 14),
(123456794, 'Sophia Martinez', 'Biology', '2024-08-05', NULL, NULL, 15),
(123456795, 'Jacob Harris', 'Political Science', '2025-05-20', NULL, NULL, 16),
(123456796, 'Olivia Gonzalez', 'Computer Engineering', '2023-12-18', NULL, NULL, 17),
(123456797, 'Aiden Clark', 'Finance', '2024-07-15', NULL, NULL, 18),
(123456798, 'Charlotte Lee', 'Marketing', '2025-04-30', NULL, NULL, 19),
(123456799, 'Ethan Young', 'Economics', '2023-11-25', NULL, NULL, 20),
(123456800, 'Avery Lopez', 'Information Systems', '2026-12-10', NULL, NULL, 21),
(123456801, 'William Brown', 'Graphic Design', '2024-06-15', NULL, NULL, 22),
(123456802, 'Scarlett Garcia', 'Art History', '2025-05-18', NULL, NULL, 23),
(123456803, 'James Wilson', 'Journalism', '2024-12-22', NULL, NULL, 24),
(123456804, 'Amelia Robinson', 'Statistics', '2023-09-10', NULL, NULL, 25),
(123456805, 'Henry Martinez', 'Philosophy', '2024-08-11', NULL, NULL, 26),
(123456806, 'Gabriel Clark', 'Sociology', '2025-07-20', NULL, NULL, 27),
(123456807, 'Mia Rodriguez', 'Anthropology', '2026-05-22', NULL, NULL, 28),
(123456808, 'Lucas White', 'Civil Engineering', '2023-10-30', NULL, NULL, 29),
(123456809, 'Harper Lee', 'Architecture', '2024-05-25', NULL, NULL, 30),
(123456810, 'Jackson Brown', 'Astronomy', '2025-11-17', NULL, NULL, 31),
(123456811, 'Evelyn Lewis', 'Nursing', '2024-09-12', NULL, NULL, 32),
(123456812, 'Benjamin Walker', 'Public Health', '2023-12-19', NULL, NULL, 33),
(123456813, 'Zoey Hall', 'Actuarial Science', '2026-04-14', NULL, NULL, 34),
(123456814, 'Oliver Allen', 'Psychology', '2024-11-21', NULL, NULL, 35),
(123456815, 'Lucy Young', 'Biomedical Engineering', '2025-10-18', NULL, NULL, 36),
(123456816, 'Charlotte Harris', 'International Relations', '2023-08-30', NULL, NULL, 37),
(123456817, 'Jack Carter', 'Theatre', '2024-07-22', NULL, NULL, 38),
(123456818, 'Grace Johnson', 'English', '2025-09-25', NULL, NULL, 39),
(123456819, 'Wyatt Lopez', 'Mechanical Engineering', '2023-12-30', NULL, NULL, 40);

INSERT INTO Incoming_Student (NUID, Name, Major, Grad_Date, User_ID) VALUES
(111111111, 'Alice Johnson', 'Electrical Engineering', '2025-05-15', 3),
(222222222, 'Bob Williams', 'Civil Engineering', '2025-05-20', 4),
(111111112, 'Chloe King', 'Software Engineering', '2026-08-15', 41),
(222222223, 'Evan Lee', 'Mechanical Engineering', '2026-09-10', 42),
(111111113, 'Lily Wright', 'Chemical Engineering', '2026-10-05', 43),
(222222224, 'Maxwell Green', 'Environmental Science', '2026-01-20', 44),
(111111114, 'Nora Carter', 'Civil Engineering', '2026-04-15', 45),
(222222225, 'Finn Martinez', 'Electrical Engineering', '2026-03-25', 46),
(111111115, 'Ruby Anderson', 'Aerospace Engineering', '2026-07-20', 47),
(222222226, 'Olivia Hernandez', 'Computer Science', '2026-06-30', 48),
(111111116, 'Lucas Moore', 'Biomedical Engineering', '2026-12-15', 49),
(222222227, 'Mia Clark', 'Material Science', '2026-05-10', 50),
(111111117, 'Amelia Johnson', 'Mathematics', '2026-02-20', 51),
(222222228, 'Jacob Young', 'Physics', '2026-11-25', 52),
(111111118, 'Mason Hill', 'Biology', '2026-08-05', 53),
(222222229, 'Ella Lewis', 'Information Technology', '2026-09-15', 54),
(111111119, 'Aiden Scott', 'Sociology', '2026-07-10', 55),
(222222230, 'Luna Roberts', 'Psychology', '2026-10-20', 56),
(111111120, 'Logan White', 'Political Science', '2026-03-15', 57),
(222222231, 'Sophia Hall', 'History', '2026-04-25', 58),
(111111121, 'Isaac Turner', 'Philosophy', '2026-06-15', 59),
(222222232, 'Madison King', 'Economics', '2026-07-30', 60),
(111111122, 'Ethan Davis', 'Law', '2026-11-10', 61),
(222222233, 'Harper Allen', 'English Literature', '2026-01-15', 62),
(111111123, 'Grace Martin', 'Art and Design', '2026-02-10', 63),
(222222234, 'Jack Rivera', 'Architecture', '2026-05-25', 64),
(111111124, 'Liam Walker', 'Marketing', '2026-06-20', 65),
(222222235, 'Emma Lopez', 'Fashion Design', '2026-08-30', 66),
(111111125, 'Noah Edwards', 'Journalism', '2026-09-15', 67),
(222222236, 'Ava Gonzalez', 'Theatre Arts', '2026-10-10', 68),
(111111126, 'Charlotte Clark', 'Music', '2026-03-20', 69),
(222222237, 'Benjamin Ramirez', 'International Relations', '2026-04-18', 70),
(111111127, 'Zoe Mitchell', 'Anthropology', '2026-05-08', 71),
(222222238, 'Nathan Wright', 'Graphic Design', '2026-02-22', 72),
(111111128, 'Oliver Parker', 'Nutrition Sciences', '2026-04-05', 73),
(222222239, 'Miles Phillips', 'Entrepreneurship', '2026-03-15', 74),
(111111129, 'Julia Roberts', 'Environmental Studies', '2026-12-10', 75);

INSERT INTO Alumni (Alumni_ID, Name, Major, Grad_Date, Current_Company, Current_Role, User_ID) VALUES
(100, 'Emily Brown', 'Chemical Engineering', '2020-05-15', 'Pharmaceuticals Inc.', 'Chemical Engineer', 5),
(101, 'Michael Johnson', 'Finance', '2018-12-20', 'Finance Corporation', 'Financial Analyst', 6),
(102, 'Samantha Williams', 'Biomedical Engineering', '2019-06-15', 'BioTech Solutions', 'Research Scientist', 7),
(103, 'Daniel Smith', 'Computer Science', '2018-11-20', 'Innovative Tech', 'Software Developer', 8),
(104, 'Jessica Moore', 'Marketing', '2019-05-20', 'Advert Dynamics', 'Marketing Manager', 9),
(105, 'Christopher Taylor', 'Electrical Engineering', '2019-07-25', 'ElectroComp Inc.', 'Electrical Engineer', 10),
(106, 'Ashley Wilson', 'Business Administration', '2020-08-10', 'Enterprise Corp.', 'Operations Manager', 11),
(107, 'Joshua Thomas', 'Economics', '2018-09-15', 'Global Bank', 'Economist', 12),
(108, 'Amanda Lee', 'English Literature', '2019-04-18', 'Literature Co.', 'Editor', 13),
(109, 'Andrew Martin', 'Political Science', '2018-12-05', 'State Gov.', 'Policy Advisor', 14),
(110, 'Sarah Jackson', 'Civil Engineering', '2019-03-10', 'BuildWell Inc.', 'Civil Engineer', 15),
(111, 'James Lopez', 'Art History', '2019-11-20', 'City Museum', 'Curator', 16),
(112, 'Laura Hernandez', 'Sociology', '2019-05-15', 'Social Research Inc.', 'Sociologist', 17),
(113, 'Kevin Clark', 'Physics', '2020-09-05', 'National Research Lab', 'Physicist', 18),
(114, 'Anna Robinson', 'Chemistry', '2018-10-25', 'ChemWorks Ltd.', 'Chemist', 19),
(115, 'Ryan Garcia', 'Environmental Science', '2020-06-10', 'EnviroSolutions', 'Environmental Consultant', 20),
(116, 'Nicole Martinez', 'Architecture', '2020-07-20', 'Architects Inc.', 'Architect', 21),
(117, 'Brandon Miller', 'Mathematics', '2020-11-30', 'Tech Solutions', 'Data Analyst', 22),
(118, 'Erica Davis', 'Journalism', '2018-08-15', 'Daily News', 'Journalist', 23),
(119, 'Justin Anderson', 'Mechanical Engineering', '2020-02-20', 'AutoBuild Co.', 'Mechanical Engineer', 24),
(120, 'Katherine Scott', 'Philosophy', '2020-04-18', 'Thinkers United', 'Philosopher', 25),
(121, 'Tyler Thompson', 'Aerospace Engineering', '2019-07-10', 'AeroTech', 'Aerospace Engineer', 26),
(122, 'Chloe Walker', 'Psychology', '2020-12-15', 'Mind and Health Clinic', 'Clinical Psychologist', 27),
(123, 'Benjamin White', 'Information Technology', '2020-08-30', 'Digital Solutions', 'IT Specialist', 28),
(124, 'Natalie Harris', 'Nursing', '2019-06-05', 'General Hospital', 'Nurse', 29),
(125, 'Adam Young', 'Accounting', '2018-11-15', 'Accountants Inc.', 'Accountant', 30),
(126, 'Brittany Nelson', 'Music', '2019-12-10', 'Music Productions', 'Music Producer', 31),
(127, 'Dylan Carter', 'Fine Arts', '2019-05-20', 'Creative Arts Studio', 'Artist', 32),
(128, 'Megan Mitchell', 'Film Studies', '2019-08-15', 'FilmWorks Studio', 'Film Director', 33),
(129, 'Jason Gonzalez', 'Anthropology', '2020-01-20', 'Cultural Research Institute', 'Anthropologist', 34),
(130, 'Elizabeth Perez', 'History', '2020-03-15', 'Historical Society', 'Historian', 35),
(131, 'Ryan Brown', 'International Relations', '2020-09-25', 'Diplomatic Corps', 'Diplomat', 36),
(132, 'Lauren Lopez', 'Statistics', '2019-11-10', 'Market Analysis Corp.', 'Statistician', 37),
(133, 'Cameron Allen', 'Graphic Design', '2020-02-18', 'Design Studio', 'Graphic Designer', 38),
(134, 'Madison King', 'Public Health', '2020-05-30', 'Public Health Agency', 'Public Health Officer', 39),
(135, 'Jordan Sanchez', 'Veterinary Science', '2019-07-10', 'City Veterinary Clinic', 'Veterinarian', 40),
(136, 'Michelle Clark', 'Environmental Engineering', '2019-12-15', 'EcoEngineering Solutions', 'Environmental Engineer', 41);

INSERT INTO Faculty (Faculty_ID, Name, Department, User_ID) VALUES
(1001, 'Professor White', 'Computer Science', 7),
(1002, 'Advisor White', 'Electrical Engineering', 8),
(1003, 'Professor Green', 'Biology', 9),
(1004, 'Professor Thompson', 'Mechanical Engineering', 10),
(1005, 'Professor Black', 'Chemistry', 11),
(1006, 'Professor Grey', 'Physics', 12),
(1007, 'Professor Brown', 'Mathematics', 13),
(1008, 'Professor Blue', 'History', 14),
(1009, 'Professor Silver', 'Sociology', 15),
(1010, 'Professor Gold', 'Philosophy', 16),
(1011, 'Professor Pink', 'English Literature', 17),
(1012, 'Professor Orange', 'Political Science', 18),
(1013, 'Professor Purple', 'Psychology', 19),
(1014, 'Professor Lime', 'Environmental Science', 20),
(1015, 'Professor Olive', 'Art History', 21),
(1016, 'Professor Cyan', 'Economics', 22),
(1017, 'Professor Magenta', 'Law', 23),
(1018, 'Professor Crimson', 'Architecture', 24),
(1019, 'Professor Beige', 'Music', 25),
(1020, 'Professor Coral', 'Civil Engineering', 26),
(1021, 'Professor Khaki', 'Film Studies', 27),
(1022, 'Professor Navy', 'Anthropology', 28),
(1023, 'Professor Teal', 'International Relations', 29),
(1024, 'Professor Maroon', 'Public Health', 30),
(1025, 'Professor Turquoise', 'Nursing', 31),
(1026, 'Professor Tan', 'Accounting', 32),
(1027, 'Professor Amber', 'Business Management', 33),
(1028, 'Professor Emerald', 'Veterinary Science', 34),
(1029, 'Professor Plum', 'Information Technology', 35),
(1030, 'Professor Slate', 'Graphic Design', 36),
(1031, 'Professor Peach', 'Marketing', 37),
(1032, 'Professor Burgundy', 'Geography', 38),
(1033, 'Professor Quartz', 'Sports Science', 39),
(1034, 'Professor Indigo', 'Pharmacy', 40),
(1035, 'Professor Rose', 'Nutrition Sciences', 41),
(1036, 'Professor Charcoal', 'Dentistry', 42),
(1037, 'Professor Snow', 'Theatre Arts', 43);

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

INSERT INTO CoopCycle (CycleID, Year, PlacementRate, Type)
VALUES (100001, 2023, 0.85, 'Spring'),
       (100002, 2023, 0.75, 'Fall'),
       (100003, 2024, 0.90, 'Spring'),
       (100004, 2023, 0.88, 'Summer'),
       (100005, 2023, 0.65, 'Winter'),
       (100006, 2024, 0.72, 'Fall'),
       (100007, 2024, 0.78, 'Spring'),
       (100008, 2024, 0.95, 'Summer'),
       (100009, 2024, 0.60, 'Winter'),
       (100010, 2025, 0.83, 'Spring'),
       (100011, 2025, 0.70, 'Fall'),
       (100012, 2025, 0.90, 'Summer'),
       (100013, 2025, 0.55, 'Winter'),
       (100014, 2026, 0.80, 'Spring'),
       (100015, 2026, 0.76, 'Fall'),
       (100016, 2026, 0.89, 'Summer'),
       (100017, 2026, 0.67, 'Winter'),
       (100018, 2027, 0.92, 'Spring'),
       (100019, 2027, 0.74, 'Fall'),
       (100020, 2027, 0.85, 'Summer'),
       (100021, 2027, 0.59, 'Winter'),
       (100022, 2028, 0.81, 'Spring'),
       (100023, 2028, 0.77, 'Fall'),
       (100024, 2028, 0.88, 'Summer'),
       (100025, 2028, 0.63, 'Winter'),
       (100026, 2029, 0.84, 'Spring'),
       (100027, 2029, 0.79, 'Fall'),
       (100028, 2029, 0.91, 'Summer'),
       (100029, 2029, 0.66, 'Winter'),
       (100030, 2030, 0.87, 'Spring'),
       (100031, 2030, 0.82, 'Fall'),
       (100032, 2030, 0.94, 'Summer'),
       (100033, 2030, 0.68, 'Winter'),
       (100034, 2031, 0.90, 'Spring'),
       (100035, 2031, 0.75, 'Fall'),
       (100036, 2031, 0.93, 'Summer'),
       (100037, 2031, 0.64, 'Winter'),
       (100038, 2032, 0.89, 'Spring');

INSERT INTO CoopPosition (Position_ID, Title, Industry, Location, Role_Description, Company_Size, Work_Hours, Responsibilities, Company_ID, CycleID)
VALUES
    (1000001, 'Software Developer Intern', 'Software', 'New York', 'Assist in software development projects', 500, 40, 'Coding, testing, and documentation', 10001, 100001),
    (1000002, 'Marketing Intern', 'Tech', 'San Francisco', 'Assist in marketing campaigns and strategies', 1000, 35, 'Market research, social media management', 10002, 100002),
    (1000003, 'Data Analyst Intern', 'IT Services', 'London', 'Analyze data and generate insights', 300, 40, 'Data cleaning, statistical analysis', 10003, 100003),
    (1000004, 'Civil Engineering Intern', 'Construction', 'Houston', 'Assist in civil infrastructure projects', 600, 40, 'Site planning, surveying, and project management', 10004, 100004),
    (1000005, 'Graphic Design Intern', 'Media', 'Los Angeles', 'Develop graphic content for media', 250, 35, 'Graphic creation, layout design', 10005, 100005),
    (1000006, 'Human Resources Intern', 'Business', 'Chicago', 'Support HR tasks and employee relations', 550, 30, 'Recruitment, onboarding processes', 10006, 100006),
    (1000007, 'Finance Intern', 'Finance', 'Philadelphia', 'Support financial analysis and reporting', 400, 40, 'Financial modeling, audits', 10007, 100007),
    (1000008, 'Electrical Engineering Intern', 'Engineering', 'Seattle', 'Assist in electrical systems design', 300, 40, 'Circuit design, prototype testing', 10008, 100008),
    (1000009, 'Journalism Intern', 'Communications', 'Washington D.C.', 'Assist in news writing and reporting', 200, 35, 'Writing, editing, interviewing', 10009, 100009),
    (1000010, 'Pharmacy Intern', 'Healthcare', 'Miami', 'Assist in medication dispensing and consultations', 450, 40, 'Medication management, patient advice', 10010, 100010),
    (1000011, 'Environmental Science Intern', 'Environmental', 'San Diego', 'Conduct environmental research and fieldwork', 300, 40, 'Sample collection, data analysis', 10011, 100011),
    (1000012, 'Aerospace Engineering Intern', 'Aerospace', 'Orlando', 'Support aerospace design and simulations', 500, 40, 'Aerodynamics testing, model simulations', 10012, 100012),
    (1000013, 'Fashion Design Intern', 'Fashion', 'New York', 'Assist in fashion design and prototyping', 400, 35, 'Design concepts, material selection', 10013, 100013),
    (1000014, 'Event Planning Intern', 'Hospitality', 'Las Vegas', 'Support event organization and coordination', 350, 30, 'Vendor coordination, event setup', 10014, 100014),
    (1000015, 'Automotive Engineering Intern', 'Automotive', 'Detroit', 'Assist in automotive design and testing', 600, 40, 'Vehicle testing, design optimization', 10015, 100015),
    (1000016, 'Software QA Intern', 'Software', 'San Francisco', 'Conduct software testing and quality assurance', 450, 40, 'Bug tracking, test case development', 10016, 100016),
    (1000017, 'Biotechnology Research Intern', 'Biotech', 'Boston', 'Support biotechnology research projects', 300, 40, 'Laboratory experiments, data recording', 10017, 100017),
    (1000018, 'Public Relations Intern', 'Public Relations', 'Atlanta', 'Assist in PR campaigns and client management', 200, 35, 'Content creation, media outreach', 10018, 100018),
    (1000019, 'Sales Intern', 'Sales', 'Denver', 'Support sales team and client relationships', 500, 30, 'Client outreach, product presentations', 10019, 100019),
    (1000020, 'Web Developer Intern', 'IT', 'Seattle', 'Assist in website development and maintenance', 400, 40, 'Web design, backend development', 10020, 100020),
    (1000021, 'Nutrition Research Intern', 'Health & Wellness', 'Portland', 'Conduct nutrition research and community outreach', 300, 35, 'Research design, community workshops', 10021, 100021),
    (1000022, 'Real Estate Intern', 'Real Estate', 'Phoenix', 'Assist in property management and client tours', 500, 40, 'Property listings, client interaction', 10022, 100022),
    (1000023, 'Marketing Research Intern', 'Marketing', 'Houston', 'Conduct market research and analysis', 350, 40, 'Survey design, data analysis', 10023, 100023),
    (1000024, 'Industrial Design Intern', 'Manufacturing', 'Columbus', 'Assist in product design and user testing', 400, 35, 'Product sketches, user feedback collection', 10024, 100024),
    (1000025, 'Animation Intern', 'Entertainment', 'Los Angeles', 'Support animation projects and character design', 300, 40, 'Character rigging, animation sequences', 10025, 100025),
    (1000026, 'Telecommunications Intern', 'Telecom', 'Dallas', 'Assist in network management and testing', 550, 40, 'Network configuration, performance monitoring', 10026, 100026),
    (1000027, 'Cybersecurity Intern', 'Security', 'Baltimore', 'Support cybersecurity initiatives and threat analysis', 300, 35, 'Threat analysis, security protocols', 10027, 100027),
    (1000028, 'Digital Media Intern', 'Media', 'Atlanta', 'Assist in digital content creation and management', 500, 40, 'Content scheduling, social media management', 10028, 100028),
    (1000029, 'Logistics Intern', 'Logistics', 'Memphis', 'Support supply chain operations and logistics', 450, 35, 'Inventory management, distribution planning', 10029, 100029),
    (1000030, 'Veterinary Intern', 'Veterinary', 'San Antonio', 'Assist in animal care and surgical procedures', 300, 40, 'Animal handling, surgical assistance', 10030, 100030),
    (1000031, 'Museum Curator Intern', 'Cultural', 'Washington D.C.', 'Assist in exhibit setup and artifact management', 200, 35, 'Exhibit design, artifact cataloging', 10031, 100031),
    (1000032, 'Network Engineer Intern', 'Networking', 'Charlotte', 'Support network infrastructure projects', 450, 40, 'Network troubleshooting, hardware setup', 10032, 100032),
    (1000033, 'Construction Management Intern', 'Construction', 'Kansas City', 'Assist in construction planning and site management', 350, 40, 'Project tracking, site inspections', 10033, 100033),
    (1000034, 'Investment Banking Intern', 'Finance', 'New York', 'Support financial modeling and client advising', 550, 40, 'Financial analysis, client presentations', 10034, 100034),
    (1000035, 'Clinical Research Intern', 'Healthcare', 'Philadelphia', 'Assist in clinical trials and research documentation', 300, 35, 'Patient monitoring, data entry', 10035, 100035),
    (1000036, 'Sports Management Intern', 'Sports', 'Los Angeles', 'Support team management and operations', 500, 40, 'Event coordination, team logistics', 10036, 100036),
    (1000037, 'Supply Chain Intern', 'Manufacturing', 'Chicago', 'Assist in supply chain optimization and procurement', 450, 35, 'Procurement processes, supply chain analysis', 10037, 100037);

INSERT INTO Review (Review_ID, Title, Date, Rating, Content, User_ID, Position_ID, SkillsUsed) VALUES
(10000001, 'Great Internship Experience', '2024-03-20', 5, 'I had an amazing experience working as a Software Developer Intern at ABC Corp. The team was supportive, and I learned a lot during my time there.', 1, 1000001, 'Java, Git, Agile Methodology'),
(10000002, 'Valuable Insights from Data Analysis Internship', '2023-11-10', 4, 'As a Data Analyst Intern at Tech Solutions Ltd, I gained valuable insights into data analysis techniques. The projects were challenging, and I developed my skills significantly.', 2, 1000003, 'SQL, Python, Data Visualization'),
(10000003, 'Engaging Marketing Role', '2024-02-15', 4, 'The marketing team at XYZ Inc. was dynamic and innovative, making my internship a truly enriching experience.', 3, 1000002, 'Market Analysis, SEO, PPC'),
(10000004, 'Insightful Engineering Placement', '2023-12-22', 5, 'Working as a Civil Engineering Intern at GreenTech Innovations gave me valuable hands-on experience in sustainable design.', 4, 1000004, 'CAD, Project Management, Sustainability Practices'),
(10000005, 'Empowering Project Management Internship', '2024-01-18', 4, 'As a Project Management Intern at HealthPlus Tech, I was given significant responsibilities that enhanced my leadership skills.', 5, 1000007, 'Leadership, Scrum, Agile'),
(10000006, 'Eye-Opening Tech Support Internship', '2023-10-05', 3, 'My internship at CyberSecure involved challenging tasks that helped me grow my troubleshooting skills significantly.', 6, 1000006, 'Troubleshooting, Network Security, Customer Service'),
(10000007, 'Rewarding Financial Analyst Experience', '2024-04-10', 5, 'I thrived as a Financial Intern at Quantum Computing Corp, where I applied financial theories in real-world scenarios.', 7, 1000007, 'Financial Modeling, Excel, Analysis'),
(10000008, 'Productive Graphic Design Internship', '2023-11-30', 4, 'My creative skills were put to great use at Smart Home Solutions, where I designed multiple key project visuals.', 8, 1000005, 'Adobe Suite, Creativity, Time Management'),
(10000009, 'Invaluable Biotech Research Role', '2024-03-25', 5, 'Interning at Genomics Research Lab, I participated in cutting-edge genetic research that will shape my career.', 9, 1000017, 'PCR, Electrophoresis, Data Analysis'),
(10000010, 'Fulfilling Experience in Environmental Advocacy', '2023-09-15', 4, 'Working at EcoBuild Architects helped me understand the importance of sustainable building practices.', 10, 1000008, 'Sustainability, Architecture, AutoCAD'),
(10000011, 'Product Development Internship Insights', '2024-06-20', 3, 'At AI Dynamics, I learned how products are developed from conception to launch, gaining a lot of practical knowledge.', 11, 1000009, 'Product Management, AI, Prototyping'),
(10000012, 'Enlightening Software Development Internship', '2023-08-17', 5, 'I gained extensive coding experience at Innovatech Solutions that will benefit my future in software development.', 12, 1000004, 'C++, System Architecture, Debugging'),
(10000013, 'Hands-On Network Engineering Internship', '2024-07-19', 4, 'The hands-on experience I got at InfoTech Systems was invaluable, expanding my knowledge of network infrastructures.', 13, 1000032, 'Cisco Networking, Security, Python'),
(10000014, 'Challenging Yet Rewarding Sales Internship', '2023-11-22', 3, 'My time as a Sales Intern at MediaStream Technologies taught me about the challenging yet rewarding nature of sales.', 14, 1000019, 'Sales Techniques, CRM Software, Communication'),
(10000015, 'Diverse and Engaging Internship in Robotics', '2024-05-14', 4, 'At Future Robotics, I was engaged in diverse projects that helped me learn a lot about robotic systems.', 15, 1000018, 'Robotics, Automation, Circuit Design'),
(10000016, 'Great Experience in Public Relations', '2023-12-05', 5, 'My internship in Public Relations at Blockchain Services Ltd provided a deep insight into media coordination.', 16, 1000018, 'Public Speaking, Press Releases, Media Relations'),
(10000017, 'Exceptional Clinical Research Internship', '2024-02-22', 4, 'Working at BioHeal Pharmaceuticals, I was involved in crucial stages of clinical research that were highly educational.', 17, 1000035, 'Clinical Trials, Regulatory Compliance, Bioethics'),
(10000018, 'Comprehensive Digital Marketing Internship', '2023-10-11', 3, 'Digital Media Intern at Digital Solutions gave me a broad view of the digital marketing landscape.', 18, 1000028, 'SEO, Content Marketing, Analytics'),
(10000019, 'Transformative Experience in Data Analysis', '2024-06-30', 5, 'My internship at Data Analytics Co provided transformative experiences in handling large data sets.', 19, 1000005, 'Big Data, Machine Learning, Python'),
(10000020, 'Engaging Content Creation Internship', '2023-07-15', 4, 'At Virtual Reality Ventures, I created engaging content that was used in major VR campaigns.', 20, 1000025, 'VR Toolsets, Creative Writing, Graphic Design'),
(10000021, 'Impactful Healthcare Technology Internship', '2024-03-18', 4, 'Interning at HealthPlus Tech allowed me to contribute to meaningful healthcare technology solutions.', 21, 1000007, 'Health Informatics, Data Security, Patient Privacy'),
(10000022, 'Educational and Inspiring Engineering Internship', '2023-08-25', 5, 'My engineering internship at AutoDrive Systems was educational and has greatly inspired my future career path.', 22, 1000009, 'CAD, Mechanical Systems, Prototyping'),
(10000023, 'Foundation-Laying Software Engineering Internship', '2024-09-15', 4, 'My software engineering internship at Quantum Computing Corp laid the foundation for my software career.', 23, 1000010, 'Quantum Algorithms, Python, Simulation'),
(10000024, 'Insightful Cybersecurity Internship', '2023-10-10', 5, 'CyberSecure provided an insightful experience into the world of cybersecurity, enhancing my career prospects.', 24, 1000006, 'Network Security, Ethical Hacking, Malware Analysis'),
(10000025, 'Comprehensive Architectural Internship', '2024-04-11', 4, 'At EcoBuild Architects, I gained comprehensive insights into eco-friendly building designs.', 25, 1000014, 'Sustainable Design, 3D Modeling, Project Management'),
(10000026, 'Innovative Tech Internship', '2023-09-05', 5, 'My internship at XYZ Inc exposed me to innovative tech solutions that are shaping the industry.', 26, 1000002, 'Product Innovation, Tech Integration, Market Analysis'),
(10000027, 'Intensive Financial Analysis Internship', '2024-08-20', 4, 'My internship at Quantum Computing Corp provided intensive experience in financial analysis within a tech company.', 27, 1000007, 'Financial Forecasting, Budgeting, Excel'),
(10000028, 'Groundbreaking Research Internship in Genomics', '2023-11-25', 5, 'My experience at Genomics Research Lab involved groundbreaking research that has broadened my scientific perspective.', 28, 1000016, 'Genome Sequencing, Bioinformatics, Statistical Analysis'),
(10000029, 'Diverse Engineering Experience', '2024-01-20', 4, 'My engineering internship at Future Robotics offered a diverse experience across multiple projects.', 29, 1000018, 'System Integration, Automation, Electro-mechanics'),
(10000030, 'Exceptional Art and Design Internship', '2023-12-15', 5, 'Heritage Art Institute provided an exceptional experience in art and design, enhancing my creative skills.', 30, 1000033, 'Artistic Techniques, Design Theory, Critique Methods'),
(10000031, 'Inspirational Environmental Internship', '2024-07-10', 4, 'GreenTech Innovations offered an inspirational experience, emphasizing environmental impact in engineering.', 31, 1000006, 'Environmental Assessment, Green Tech, Sustainability'),
(10000032, 'Pharmaceutical Research Insight', '2023-10-23', 5, 'My internship at BioHeal Pharmaceuticals provided deep insights into the pharmaceutical research process.', 32, 1000021, 'Drug Development, Laboratory Skills, FDA Compliance');

INSERT INTO CompensationPackage (CPID, Perks, Hourly, BonusTotal, HousingTotal, RelocationTotal, Position_ID) VALUES
(100000001, 'Health insurance, gym membership', 20.5, 1000.00, NULL, 2000.00, 1000001),
(100000002, 'Flexible work hours, company stock options', 18.75, 800.00, NULL, 1500.00, 1000002),
(100000003, 'Free lunches, health insurance', 22.00, 1200.00, NULL, 1000.00, 1000003),
(100000004, 'Travel allowances, flexible hours', 19.50, 500.00, 500.00, 1200.00, 1000004),
(100000005, 'Stock options, 401k matching', 21.75, 1500.00, NULL, 2500.00, 1000005),
(100000006, 'Annual bonuses, health benefits', 18.00, 1000.00, NULL, NULL, 1000006),
(100000007, 'Gym membership, free snacks', 22.50, 950.00, 600.00, NULL, 1000007),
(100000008, 'Remote work options, wellness programs', 20.00, 700.00, NULL, 1800.00, 1000008),
(100000009, 'Transportation credits, paid leave', 19.00, 1100.00, NULL, 1300.00, 1000009),
(100000010, 'Company car, expense account', 23.50, 1400.00, NULL, 2000.00, 10000010),
(100000011, 'Childcare services, health insurance', 17.25, 850.00, NULL, 1500.00, 10000011),
(100000012, 'Conference sponsorship, professional development', 24.00, 1300.00, 700.00, NULL, 10000012),
(100000013, 'Housing stipend, relocation package', 25.00, 1600.00, 800.00, 2200.00, 10000013),
(100000014, 'Performance bonuses, free public transit', 21.00, 1200.00, NULL, 1100.00, 10000014),
(100000015, 'Stock options, annual travel stipend', 23.75, 1350.00, NULL, 2100.00, 10000015),
(100000016, 'Pet friendly office, parental leave', 18.25, 900.00, 500.00, 1600.00, 10000016),
(100000017, 'Employee discount, 401k plan', 20.50, 1100.00, 750.00, NULL, 10000017),
(100000018, 'Paid sabbatical, project bonuses', 22.25, 1250.00, NULL, 1800.00, 10000018),
(100000019, 'Free parking, company fitness center', 21.50, 1000.00, 550.00, NULL, 10000019),
(100000020, 'Professional training, performance bonuses', 19.75, 800.00, NULL, 2000.00, 10000020),
(100000021, 'Meal vouchers, high bonus potential', 17.00, 950.00, NULL, 1400.00, 10000021),
(100000022, 'Education reimbursement, health benefits', 22.75, 1300.00, NULL, 1700.00, 10000022),
(100000023, 'Annual bonus, comprehensive health plan', 20.25, 1450.00, 800.00, 1900.00, 10000023),
(100000024, 'Stock options, flexible spending accounts', 18.50, 1250.00, NULL, 1000.00, 10000024),
(100000025, 'Sign-on bonus, competitive hourly rate', 24.50, 1750.00, NULL, 2300.00, 10000025),
(100000026, 'Profit sharing, retirement benefits', 23.00, 1500.00, 650.00, 1200.00, 10000026),
(100000027, 'Health insurance, paid holidays', 19.25, 850.00, 500.00, NULL, 10000027),
(100000028, 'Free meals, wellness programs', 21.00, 1150.00, NULL, 1250.00, 10000028),
(100000029, 'Year-end bonus, paid time off', 22.50, 1050.00, NULL, 1500.00, 10000029),
(100000030, 'Remote work days, team retreats', 18.75, 900.00, 400.00, 1000.00, 10000030),
(100000031, 'Flexible hours, snack bar', 20.50, 1000.00, 300.00, NULL, 10000031),
(100000032, 'Tuition assistance, office perks', 21.25, 1100.00, 550.00, 1650.00, 10000032);

INSERT INTO Question (Question_ID, Title, Date, Status, Content, User_ID) VALUES
(200000001, 'Need advice on choosing a major', '2024-03-10', 'Open', 'I''m having trouble deciding on a major. Any advice or suggestions?', 1),
(200000002, 'Internship opportunities in finance', '2023-11-25', 'Open', 'What are some internship opportunities in finance for undergraduate students?', 2),
(200000003, 'Tips for successful job interviews', '2024-04-15', 'Open', 'Can anyone share effective strategies for acing job interviews?', 3),
(200000004, 'Recommendations for online coding courses', '2023-12-01', 'Open', 'Looking for suggestions on the best online coding courses for beginners.', 4),
(200000005, 'Grad school application advice', '2024-05-20', 'Open', 'What are key factors to consider when applying to graduate schools?', 5),
(200000006, 'Balancing work and study tips', '2023-10-15', 'Open', 'How do you effectively balance work and study?', 6),
(200000007, 'Exploring career options in biotech', '2024-06-10', 'Open', 'What career paths are available in the biotechnology field?', 7),
(200000008, 'Finding research opportunities', '2023-09-05', 'Open', 'How can I find research opportunities in environmental science?', 8),
(200000009, 'Managing stress during finals', '2024-01-12', 'Open', 'Does anyone have tips for managing stress during final exams?', 9),
(200000010, 'Resume building for internships', '2024-07-22', 'Open', 'What are the must-have elements in a resume for an internship?', 10),
(200000011, 'Improving leadership skills', '2023-11-30', 'Open', 'How can I improve my leadership skills as a student?', 11),
(200000012, 'Effective time management strategies', '2024-03-18', 'Open', 'What are some effective time management strategies for busy students?', 12),
(200000013, 'Networking tips for young professionals', '2024-02-14', 'Open', 'Can anyone offer networking tips for young professionals just starting their careers?', 13),
(200000014, 'Choosing the right externship', '2023-10-10', 'Open', 'What factors should I consider when choosing an externship?', 14),
(200000015, 'Learning a second language', '2024-08-05', 'Open', 'Is learning a second language beneficial for my career in international business?', 15),
(200000016, 'Finding part-time jobs on campus', '2023-09-20', 'Open', 'Where can I find part-time job opportunities on campus?', 16),
(200000017, 'Preparing for a career in data science', '2024-04-25', 'Open', 'What should I focus on to prepare for a career in data science?', 17),
(200000018, 'Developing public speaking skills', '2024-05-30', 'Open', 'How can I develop my public speaking skills effectively?', 18),
(200000019, 'Securing scholarships for undergraduates', '2023-08-15', 'Open', 'What are the best ways to secure scholarships as an undergraduate?', 19),
(200000020, 'Choosing a minor in engineering', '2024-07-10', 'Open', 'What are the benefits of choosing a minor in engineering?', 20),
(200000021, 'Advice for first-year law students', '2024-01-01', 'Open', 'Any advice for first-year law students?', 21),
(200000022, 'Dealing with academic burnout', '2024-02-22', 'Open', 'How do you deal with academic burnout?', 22),
(200000023, 'Engaging in student organizations', '2023-11-10', 'Open', 'How important is it to engage in student organizations?', 23),
(200000024, 'Preparing for medical school interviews', '2024-06-15', 'Open', 'How should I prepare for medical school interviews?', 24),
(200000025, 'Career options with a philosophy degree', '2024-03-05', 'Open', 'What are some career options with a philosophy degree?', 25),
(200000026, 'Mastering essential skills in marketing', '2023-12-25', 'Open', 'What are essential skills I should master in marketing?', 26),
(200000027, 'Utilizing campus resources effectively', '2024-07-20', 'Open', 'How can I utilize campus resources more effectively?', 27),
(200000028, 'Internship opportunities in renewable energy', '2024-01-30', 'Open', 'What are some internship opportunities in renewable energy?', 28),
(200000029, 'Choosing between job offers', '2024-08-10', 'Open', 'How do you choose between multiple job offers?', 29),
(200000030, 'Effective study techniques for STEM', '2023-11-05', 'Open', 'What are some effective study techniques for STEM subjects?', 30),
(200000031, 'Exploring careers in the arts', '2024-02-20', 'Open', 'Can anyone share insights on exploring careers in the arts?', 31),
(200000032, 'Recommendations for business analytics tools', '2024-03-25', 'Open', 'What business analytics tools would you recommend for a beginner?', 32);

INSERT INTO Answer (Answer_ID, Content, Date, User_ID, Question_ID) VALUES
(300000001, 'Consider your interests, strengths, and career goals when choosing a major. Explore different fields through internships and speak with advisors for guidance.', '2024-03-12', 7, 200000001),
(300000002, 'Research internship opportunities in finance fields like investment banking, corporate finance, and asset management. Network and use career services to find suitable positions.', '2023-11-28', 8, 200000001),
(300000003, 'Join professional organizations and attend networking events to build connections.', '2024-04-16', 9, 200000002),
(300000004, 'Review the curriculum of each major, consider job market trends, and talk to alumni.', '2024-03-13', 10, 200000001),
(300000005, 'Internships can provide hands-on experience. Consider applying to several to diversify your skills.', '2023-12-02', 11, 200000002),
(300000006, 'Use a planner and set specific goals each week to manage your time more effectively.', '2024-05-21', 12, 200000003),
(300000007, 'Work-study options can also be a good way to gain work experience while studying.', '2023-10-16', 13, 200000004),
(300000008, 'Consider online courses and certifications to enhance your knowledge and resume.', '2024-06-11', 14, 200000005),
(300000009, 'Stress management is crucial. Try meditation, regular breaks, and physical activities.', '2024-01-13', 15, 200000006),
(300000010, 'Focus on developing both hard and soft skills relevant to biotech through courses and projects.', '2024-07-23', 16, 200000007),
(300000011, 'Look for undergraduate research opportunities at your university to build experience.', '2023-11-01', 17, 200000008),
(300000012, 'Prepare by familiarizing yourself with common interview questions and by conducting mock interviews.', '2024-04-11', 18, 200000009),
(300000013, 'Focus on learning key business skills such as negotiation, project management, and data analysis.', '2024-03-19', 19, 200000010),
(300000014, 'Participating in group projects and internships can help build and demonstrate leadership skills.', '2023-11-23', 20, 200000011),
(300000015, 'Try to understand your professors expectations and attend office hours to clarify any doubts.', '2024-02-15', 21, 200000012),
(300000016, 'Look for externships that align with your career goals and provide practical experience.', '2023-10-11', 22, 200000013),
(300000017, 'If you are interested in global business, consider learning a second language to boost your profile.', '2024-08-06', 23, 200000014),
(300000018, 'There are often job boards on campus with postings for part-time positions; check them regularly.', '2023-09-21', 24, 200000015),
(300000019, 'Build strong statistical and programming skills, and get involved in data projects.', '2024-04-26', 25, 200000016),
(300000020, 'Join a public speaking club like Toastmasters to practice and receive feedback in a supportive environment.', '2024-05-31', 26, 200000017),
(300000021, 'There are numerous scholarship portals available; regularly check them and apply for relevant ones.', '2023-08-16', 27, 200000018),
(300000022, 'Consider electives that complement your major, adding value and expanding your skill set.', '2024-07-11', 28, 200000019),
(300000023, 'Engage with the faculty, attend guest lectures, and participate in moot court competitions.', '2024-01-02', 29, 200000020),
(300000024, 'Academic burnout can be managed by taking regular breaks, setting realistic goals, and maintaining a healthy lifestyle.', '2024-02-23', 30, 200000021),
(300000025, 'Student organizations are a great way to build networks, develop skills, and enhance your resume.', '2023-11-11', 31, 200000022),
(300000026, 'Preparing thoroughly for interviews and gaining practical experience through internships can be crucial.', '2024-06-16', 32, 200000023),
(300000027, 'There are various careers such as teaching, consulting, or writing that can follow from a philosophy degree.', '2024-03-06', 33, 200000024),
(300000028, 'Starting with basic tools like Google Analytics and advancing to more sophisticated software can be helpful.', '2023-12-26', 34, 200000025),
(300000029, 'Take advantage of all learning resources your campus offers, from libraries to tutoring centers.', '2024-07-21', 35, 200000026),
(300000030, 'Explore internships in clean tech, solar energy, or environmental consulting to gain practical experience.', '2024-01-31', 36, 200000027),
(300000031, 'Evaluate each offers benefits, company culture, and career advancement opportunities.', '2024-08-11', 37, 200000028),
(300000032, 'Active learning strategies, such as problem-solving sessions and group discussions, can be very effective for STEM subjects.', '2023-11-06', 38, 200000029);