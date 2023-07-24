-- Inserting values into the projects table
INSERT INTO public.projects (id, deadline, department, level, title)
VALUES
    (1, '2023-07-31 23:59:59', 'Computer', '100', 'Project 1'),
	(2, '2023-07-31 23:59:59', 'Computer', '100', 'Project 2'),
    (3, '2023-08-15 23:59:59', 'Computer', '200', 'Project 1'),
	(4, '2023-08-15 23:59:59', 'Computer', '200', 'Project 2'),
	(5, '2023-08-15 23:59:59', 'Computer', '200', 'Project 3'),
    (6, '2023-08-31 23:59:59', 'Computer', '300', 'Project 1'),
    (7, '2023-09-15 23:59:59', 'Computer', '400', 'Project 1');


-- Inserting values into the enrolled_courses table
INSERT INTO public.enrolled_courses (id, credit, department, level, name, student_id)
VALUES
    -- Courses for level 100
    (1, 3, 'Computer', '100', 'Calculus I', NULL),
    (2, 4, 'Computer', '100', 'Engineering Design I', NULL),
    (3, 3, 'Computer', '100', 'Mechanics I', NULL),
    -- Courses for level 200
    (4, 4, 'Computer', '200', 'Calculus II', NULL),
    (5, 3, 'Computer', '200', 'Mechanics II', NULL),
    (6, 4, 'Computer', '200', 'Engineering Design II', NULL),
    -- Courses for level 300
    (7, 3, 'Computer', '300', 'Calculus III', NULL),
    (8, 4, 'Computer', '300', 'Mechanics III', NULL),
    (9, 3, 'Computer', '300', 'Engineering Design III', NULL),
    -- Courses for level 400
    (10, 4, 'Computer', '400', 'Course 1 for Level 400', NULL),
    (11, 3, 'Computer', '400', 'Course 2 for Level 400', NULL),
    (12, 4, 'Computer', '400', 'Course 3 for Level 400', NULL);








CREATE OR REPLACE FUNCTION copy_registration_to_student()
RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.level IS NOT NULL AND NEW.level != '' THEN
        INSERT INTO public.students (school_id, bio, date_of_birth, department, email, level, name, semester)
        VALUES (NEW.school_id, NEW.bio, NEW.dob, NEW.department, NEW.email, NEW.level, 
                CONCAT(NEW.first_name, ' ', NEW.last_name), NEW.semester);
    ELSE
        INSERT INTO public.students (school_id, bio, date_of_birth, department, email, name, semester)
        VALUES (NEW.school_id, NEW.bio, NEW.dob, NEW.department, NEW.email, 
                CONCAT(NEW.first_name, ' ', NEW.last_name), NEW.semester);
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER registration_to_student_trigger
AFTER INSERT ON registrations
FOR EACH ROW
EXECUTE PROCEDURE copy_registration_to_student();








-- Trigger Function
CREATE OR REPLACE FUNCTION insert_user_from_registration()
    RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO public.users (password, school_id)
    VALUES (NEW.password, NEW.school_id);
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER registration_trigger
    AFTER INSERT ON public.registrations
    FOR EACH ROW
    EXECUTE procedure  insert_user_from_registration();


