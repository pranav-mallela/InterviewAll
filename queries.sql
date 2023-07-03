PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Admin
CREATE TABLE IF NOT EXISTS Admin (
    Name  TEXT PRIMARY KEY,
    Email TEXT
);

INSERT INTO Admin (
                      Name,
                      Email
                  )
                  VALUES (
                      'admin',
                      'admin@mathworks.com'
                  );

INSERT INTO Admin (
                      Name,
                      Email
                  )
                  VALUES (
                      'hritwik',
                      'hritwik@mathworks.com'
                  );

INSERT INTO Admin (
                      Name,
                      Email
                  )
                  VALUES (
                      'adsingh',
                      'adsingh@mathworks.com'
                  );

INSERT INTO Admin (
                      Name,
                      Email
                  )
                  VALUES (
                      'pmallela',
                      'pmallela@mathworks.com'
                  );


-- Table: Candidates
CREATE TABLE IF NOT EXISTS Candidates (
    ID          TEXT (20) PRIMARY KEY,
    Name        TEXT (30),
    Status      TEXT      DEFAULT Go
                          CHECK (Status == "No Go" OR 
                                 Status == "Go"),
    Round1      TEXT      DEFAULT [Not Completed],
    Round2      TEXT      DEFAULT [Not Completed],
    Round3      TEXT      DEFAULT [Not Completed],
    Domain      TEXT,
    CollegeName TEXT,
    Email       TEXT      UNIQUE,
    Department  TEXT
);

INSERT INTO Candidates (
                           ID,
                           Name,
                           Status,
                           Round1,
                           Round2,
                           Round3,
                           Domain,
                           CollegeName,
                           Email,
                           Department
                       )
                       VALUES (
                           '2020ucs0087',
                           'Garv',
                           'Go',
                           'Ongoing',
                           'Not Completed',
                           'Not Completed',
                           'CSE',
                           'IIT Jammu',
                           '2020ucs0087@iitjammu.ac.in',
                           'Bachelors'
                       );

INSERT INTO Candidates (
                           ID,
                           Name,
                           Status,
                           Round1,
                           Round2,
                           Round3,
                           Domain,
                           CollegeName,
                           Email,
                           Department
                       )
                       VALUES (
                           '2020ucs0090',
                           'Aditya',
                           'Go',
                           'Ongoing',
                           'Not Completed',
                           'Not Completed',
                           'EE',
                           'IIT Jammu',
                           '2020ucs0090@iitjammu.ac.in',
                           'Masters'
                       );

INSERT INTO Candidates (
                           ID,
                           Name,
                           Status,
                           Round1,
                           Round2,
                           Round3,
                           Domain,
                           CollegeName,
                           Email,
                           Department
                       )
                       VALUES (
                           '2020uee0047',
                           'Harshal',
                           'Go',
                           'Ongoing',
                           'Not Completed',
                           'Not Completed',
                           'CSE',
                           'IIT Dhanbad',
                           '2020uee0047@iitdhanbad.ac.in',
                           'Masters'
                       );

INSERT INTO Candidates (
                           ID,
                           Name,
                           Status,
                           Round1,
                           Round2,
                           Round3,
                           Domain,
                           CollegeName,
                           Email,
                           Department
                       )
                       VALUES (
                           '2020ucs0111',
                           'Shubh',
                           'Go',
                           'Ongoing',
                           'Not Completed',
                           'Not Completed',
                           'CSE',
                           'IIT Palakkad',
                           '2020ucs0111@iitpalakkad.ac.in',
                           'Bachelors'
                       );

INSERT INTO Candidates (
                           ID,
                           Name,
                           Status,
                           Round1,
                           Round2,
                           Round3,
                           Domain,
                           CollegeName,
                           Email,
                           Department
                       )
                       VALUES (
                           '2020ucs0078',
                           'Pranav',
                           'Go',
                           'Ongoing',
                           'Not Completed',
                           'Not Completed',
                           'CSE',
                           'IIT Madras',
                           '2020ucs0078@iitmadras.ac.in',
                           'Bachelors'
                       );


-- Table: Credentials
CREATE TABLE IF NOT EXISTS Credentials (
    Username TEXT PRIMARY KEY,
    Password TEXT
);

INSERT INTO Credentials (
                            Username,
                            Password
                        )
                        VALUES (
                            'Date',
                            '2023-07-11'
                        );

INSERT INTO Credentials (
                            Username,
                            Password
                        )
                        VALUES (
                            'yu',
                            '1065'
                        );

INSERT INTO Credentials (
                            Username,
                            Password
                        )
                        VALUES (
                            'admin',
                            '9751005109510551105'
                        );

INSERT INTO Credentials (
                            Username,
                            Password
                        )
                        VALUES (
                            'gagarwal',
                            '103597511451185'
                        );

INSERT INTO Credentials (
                            Username,
                            Password
                        )
                        VALUES (
                            'pmallela',
                            '9751005109510551105'
                        );


-- Table: Education
CREATE TABLE IF NOT EXISTS Education (
    ID     TEXT PRIMARY KEY,
    Degree TEXT
);

INSERT INTO Education (
                          ID,
                          Degree
                      )
                      VALUES (
                          '2020ucs0087',
                          'BTech'
                      );


-- Table: FreeInterviewerHR
CREATE TABLE IF NOT EXISTS FreeInterviewerHR (
    InterviewerName TEXT,
    StartingTime    INTEGER,
    EndingTime      INTEGER,
    Department      TEXT    CHECK (Department == "HR") 
                            DEFAULT HR,
    Active          TEXT    CHECK (Active == "Yes" OR 
                                   Active == "No") 
                            DEFAULT Yes,
    PRIMARY KEY (
        InterviewerName,
        StartingTime
    )
);


-- Table: FreeInterviewerMG
CREATE TABLE IF NOT EXISTS FreeInterviewerMG (
    InterviewerName TEXT,
    StartingTime    INTEGER,
    EndingTime      INTEGER,
    Department      TEXT    CHECK (Department == "MG") 
                            DEFAULT MG,
    Active          TEXT    CHECK (Active == "Yes" OR 
                                   Active == "No") 
                            DEFAULT Yes,
    PRIMARY KEY (
        InterviewerName,
        StartingTime
    )
);


-- Table: FreeInterviewerTECH
CREATE TABLE IF NOT EXISTS FreeInterviewerTECH (
    InterviewerName TEXT,
    StartingTime    INTEGER,
    EndingTime      INTEGER,
    Department      TEXT    CHECK (Department == "TECH") 
                            DEFAULT TECH,
    Active          TEXT    CHECK (Active == "Yes" OR 
                                   Active == "No") 
                            DEFAULT Yes,
    PRIMARY KEY (
        InterviewerName,
        StartingTime
    )
);


-- Table: InterviewerHR
CREATE TABLE IF NOT EXISTS InterviewerHR (
    Name       TEXT PRIMARY KEY,
    Status     TEXT CHECK (Status == "Idle" OR 
                           Status == "Unavailable" OR 
                           Status == "Interviewing"),
    Department      CHECK (Department == "HR"),
    Domain     TEXT,
    Email      TEXT
);

INSERT INTO InterviewerHR (
                              Name,
                              Status,
                              Department,
                              Domain,
                              Email
                          )
                          VALUES (
                              'hritwik',
                              'Interviewing',
                              'HR',
                              'EE',
                              'hritwik@mathworks.com'
                          );

INSERT INTO InterviewerHR (
                              Name,
                              Status,
                              Department,
                              Domain,
                              Email
                          )
                          VALUES (
                              'garv',
                              'Idle',
                              'HR',
                              'CSE',
                              'garv@mathworks.com'
                          );

INSERT INTO InterviewerHR (
                              Name,
                              Status,
                              Department,
                              Domain,
                              Email
                          )
                          VALUES (
                              'cat',
                              'Idle',
                              'HR',
                              'NA',
                              'cat@mat.com'
                          );

INSERT INTO InterviewerHR (
                              Name,
                              Status,
                              Department,
                              Domain,
                              Email
                          )
                          VALUES (
                              'yu',
                              'Idle',
                              'HR',
                              'NA',
                              'kj'
                          );

INSERT INTO InterviewerHR (
                              Name,
                              Status,
                              Department,
                              Domain,
                              Email
                          )
                          VALUES (
                              'gagarwal',
                              'Idle',
                              'HR',
                              'NA',
                              'gagarwal@mathworks.com'
                          );


-- Table: InterviewerMG
CREATE TABLE IF NOT EXISTS InterviewerMG (
    Name       TEXT PRIMARY KEY,
    Status     TEXT CHECK (Status == "Idle" OR 
                           Status == "Unavailable" OR 
                           Status == "Interviewing"),
    Department      CHECK (Department == "MG"),
    Domain     TEXT,
    Email      TEXT
);

INSERT INTO InterviewerMG (
                              Name,
                              Status,
                              Department,
                              Domain,
                              Email
                          )
                          VALUES (
                              'spareek',
                              'Unavailable',
                              'MG',
                              'CSE',
                              'spareek@mathworks.com'
                          );


-- Table: InterviewerTECH
CREATE TABLE IF NOT EXISTS InterviewerTECH (
    Name       TEXT PRIMARY KEY,
    Status     TEXT CHECK (Status == "Idle" OR 
                           Status == "Unavailable" OR 
                           Status == "Interviewing") 
                    DEFAULT Idle,
    Department      CHECK (Department == "TECH"),
    Domain     TEXT,
    Email      TEXT
);

INSERT INTO InterviewerTECH (
                                Name,
                                Status,
                                Department,
                                Domain,
                                Email
                            )
                            VALUES (
                                'adsingh',
                                'Idle',
                                'TECH',
                                'CSE',
                                'adsingh@mathworks.com'
                            );

INSERT INTO InterviewerTECH (
                                Name,
                                Status,
                                Department,
                                Domain,
                                Email
                            )
                            VALUES (
                                'pmallela',
                                'Idle',
                                'TECH',
                                'EE',
                                'pmallela@mathworks.com'
                            );


-- Table: Reviews
CREATE TABLE IF NOT EXISTS Reviews (
    InterviewerName TEXT,
    StudentID       TEXT,
    Review          TEXT,
    Status          TEXT CHECK (Status == "Go" OR 
                                Status == "No Go"),
    Round           TEXT,
    PRIMARY KEY (
        InterviewerName,
        StudentID
    )
);

INSERT INTO Reviews (
                        InterviewerName,
                        StudentID,
                        Review,
                        Status,
                        Round
                    )
                    VALUES (
                        'adsingh',
                        '2020ucs0087',
                        'Yes',
                        'Go',
                        'HR'
                    );

INSERT INTO Reviews (
                        InterviewerName,
                        StudentID,
                        Review,
                        Status,
                        Round
                    )
                    VALUES (
                        'spareek',
                        '2020ucs0091',
                        'ok',
                        'No Go',
                        'MG'
                    );

INSERT INTO Reviews (
                        InterviewerName,
                        StudentID,
                        Review,
                        Status,
                        Round
                    )
                    VALUES (
                        'spareek',
                        '2020ucs0077',
                        'no',
                        'No Go',
                        'MG'
                    );

INSERT INTO Reviews (
                        InterviewerName,
                        StudentID,
                        Review,
                        Status,
                        Round
                    )
                    VALUES (
                        'gagarwal',
                        '2020ucs0087',
                        'yes',
                        'No Go',
                        'HR'
                    );

INSERT INTO Reviews (
                        InterviewerName,
                        StudentID,
                        Review,
                        Status,
                        Round
                    )
                    VALUES (
                        'gagarwal',
                        '2020uee0047',
                        'yes',
                        'No Go',
                        'HR'
                    );


-- Table: ScheduledInterviews
CREATE TABLE IF NOT EXISTS ScheduledInterviews (
    InterviewerName TEXT,
    StudentID       TEXT,
    StartingTime    INTEGER,
    EndingTime      INTEGER,
    PRIMARY KEY (
        InterviewerName,
        StartingTime
    )
);

INSERT INTO ScheduledInterviews (
                                    InterviewerName,
                                    StudentID,
                                    StartingTime,
                                    EndingTime
                                )
                                VALUES (
                                    'adsingh',
                                    '2020ucs0087',
                                    900,
                                    1100
                                );

INSERT INTO ScheduledInterviews (
                                    InterviewerName,
                                    StudentID,
                                    StartingTime,
                                    EndingTime
                                )
                                VALUES (
                                    'pmallela',
                                    '2020ucs0090',
                                    1200,
                                    1300
                                );

INSERT INTO ScheduledInterviews (
                                    InterviewerName,
                                    StudentID,
                                    StartingTime,
                                    EndingTime
                                )
                                VALUES (
                                    'spareek',
                                    '2020ucs0111',
                                    1100,
                                    1200
                                );

INSERT INTO ScheduledInterviews (
                                    InterviewerName,
                                    StudentID,
                                    StartingTime,
                                    EndingTime
                                )
                                VALUES (
                                    'adsingh',
                                    '2020ucs0078',
                                    2200,
                                    2300
                                );


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
