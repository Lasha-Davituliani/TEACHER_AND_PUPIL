CREATE DATABASE NETII;
GO

USE NETII;
GO

CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    gender NCHAR(1) NOT NULL,
    subject VARCHAR(50) NOT NULL
);

CREATE TABLE Pupil (
    pupil_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender NCHAR(1) NOT NULL,
    class VARCHAR(50) NOT NULL
);

CREATE TABLE TeacherPupil (
    teacher_id INT,
    pupil_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id),
    FOREIGN KEY (pupil_id) REFERENCES Pupil(pupil_id),
    PRIMARY KEY (teacher_id, pupil_id)
);



-- Insert sample teachers
INSERT INTO Teacher (first_name, last_name, gender, subject) VALUES
    ('John', 'Doe', 'M', 'Math'),
    ('Jane', 'Smith', 'F', 'Science'),
    ('Mike', 'Johnson', 'M', 'History');

-- Insert sample pupils
INSERT INTO Pupil (first_name, last_name, gender, class) VALUES
    ('George', 'Smith', 'M', 'Class A'),
    ('Emma', 'Johnson', 'F', 'Class B'),
    ('Ethan', 'Brown', 'M', 'Class A');

-- Establish relationships between teachers and pupils
INSERT INTO TeacherPupil (teacher_id, pupil_id) VALUES
    (1, 1), -- John Doe teaches George Smith
    (2, 1), -- Jane Smith teaches George Smith
    (3, 2); -- Mike Johnson teaches Emma Johnson




SELECT
    T.first_name AS teacher_first_name,
    T.last_name AS teacher_last_name,
    T.subject
FROM
    Teacher AS T
JOIN
    TeacherPupil AS TP ON T.teacher_id = TP.teacher_id
JOIN
    Pupil AS P ON TP.pupil_id = P.pupil_id
WHERE
    P.first_name = 'George';
