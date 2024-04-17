CREATE DATABASE IF NOT EXISTS CoopConnect;

USE CoopConnect;


CREATE TABLE IF NOT EXISTS User (
    User_ID INT PRIMARY KEY,
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

INSERT INTO User (User_ID, Username, User_Type, Password, Email) VALUES
(1, 'john_doe', 'Student', 'password123', 'john.doe@example.com'),
(2, 'jane_smith', 'Student', 'securepass456', 'jane.smith@example.com'),
(3, 'alice_johnson', 'Incomer', 'alicepass123', 'alice.johnson@example.com'),
(4, 'bob_williams', 'Incomer', 'bobpass456', 'bob.williams@example.com'),
(5, 'emily_brown', 'Alumni', 'emilypass123', 'emily.brown@example.com'),
(6, 'michael_johnson', 'Alumni', 'michaelpass456', 'michael.johnson@example.com'),
(7, 'emily_white', 'Professor', 'emilypass12345', 'emily.white@example.com'),
(8, 'michael_white', 'Advisor', 'michaelpass456', 'michael.white@example.com');

INSERT INTO Student (NUID, Name, Major, Grad_Date, Current_Role, Current_Company, User_ID) VALUES
(123456789, 'John Doe', 'Computer Science', '2024-05-15', null, null, 1),
(987654321, 'Jane Smith', 'Mechanical Engineering', '2023-12-20', null, null, 2);

INSERT INTO Incoming_Student (NUID, Name, Major, Grad_Date, User_ID) VALUES
(111111111, 'Alice Johnson', 'Electrical Engineering', '2025-05-15', 3),
(222222222, 'Bob Williams', 'Civil Engineering', '2025-05-20', 4);

INSERT INTO Alumni (Alumni_ID, Name, Major, Grad_Date, Current_Company, Current_Role, User_ID) VALUES
(100, 'Emily Brown', 'Chemical Engineering', '2020-05-15', 'Pharmaceuticals Inc.', 'Chemical Engineer', 5),
(101, 'Michael Johnson', 'Finance', '2018-12-20', 'Finance Corporation', 'Financial Analyst', 6);

INSERT INTO Faculty (Faculty_ID, Name, Department, User_ID) VALUES
(1001, 'Professor White', 'Computer Science', 7),
(1002, 'Advisor White', 'Electrical Engineering', 8);

INSERT INTO Company (Company_ID, Name, Location, Industry, Size, Reputation)
VALUES
    (10001, 'ABC Corp', 'New York', 'Software', 500, 'Highly rated by industry experts for innovative solutions'),
    (10002, 'XYZ Inc', 'San Francisco', 'Tech', 1000, 'Recipient of multiple awards for technological advancements'),
    (10003, 'Tech Solutions Ltd', 'London', 'IT Services', 300, 'Recognized for exceptional customer satisfaction and service quality');

INSERT INTO CoopCycle (CycleID, Year, PlacementRate, Type)
VALUES (100001, 2023, 0.85, 'Spring'),
       (100002, 2023, 0.75, 'Fall'),
       (100003, 2024, 0.90, 'Spring');

INSERT INTO CoopPosition (Position_ID, Title, Industry, Location, Role_Description, Company_Size, Work_Hours, Responsibilities, Company_ID, CycleID)
VALUES
    (1000001, 'Software Developer Intern', 'Software', 'New York', 'Assist in software development projects', 500, 40, 'Coding, testing, and documentation', 10001, 100001),
    (1000002, 'Marketing Intern', 'Tech', 'San Francisco', 'Assist in marketing campaigns and strategies', 1000, 35, 'Market research, social media management', 10002, 100002),
    (1000003, 'Data Analyst Intern', 'IT Services', 'London', 'Analyze data and generate insights', 300, 40, 'Data cleaning, statistical analysis', 10003, 100003);

INSERT INTO Review (Review_ID, Title, Date, Rating, Content, User_ID, Position_ID, SkillsUsed) VALUES
(10000001, 'Great Internship Experience', '2024-03-20', 5, 'I had an amazing experience working as a Software Developer Intern at ABC Corp. The team was supportive, and I learned a lot during my time there.', 1, 1000001, 'Java, Git, Agile Methodology'),
(10000002, 'Valuable Insights from Data Analysis Internship', '2023-11-10', 4, 'As a Data Analyst Intern at Tech Solutions Ltd, I gained valuable insights into data analysis techniques. The projects were challenging, and I developed my skills significantly.', 2, 1000003, 'SQL, Python, Data Visualization');

INSERT INTO CompensationPackage (CPID, Perks, Hourly, BonusTotal, HousingTotal, RelocationTotal, Position_ID) VALUES
(100000001, 'Health insurance, gym membership', 20.5, 1000.00, NULL, 2000.00, 1000001),
(100000002, 'Flexible work hours, company stock options', 18.75, 800.00, NULL, 1500.00, 1000002);

INSERT INTO Question (Question_ID, Title, Date, Status, Content, User_ID) VALUES
(200000001, 'Need advice on choosing a major', '2024-03-10', 'Open', 'I''m having trouble deciding on a major. Any advice or suggestions?', 1),
(200000002, 'Internship opportunities in finance', '2023-11-25', 'Open', 'What are some internship opportunities in finance for undergraduate students?', 2);

INSERT INTO Answer (Answer_ID, Content, Date, User_ID, Question_ID) VALUES
(300000001, 'Consider your interests, strengths, and career goals when choosing a major. Explore different fields through internships and speak with advisors for guidance.', '2024-03-12', 7, 200000001),
(300000002, 'Research internship opportunities in finance fields like investment banking, corporate finance, and asset management. Network and use career services to find suitable positions.', '2023-11-28', 8, 200000001);


