import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import './Dashboard.css';
import logoImage from '../assets/uglogo1.jpeg';
import studentImage from '../assets/dp.png';

const Dashboard = () => {
  const [studentName, setStudentName] = useState('');
  const [studentBio, setStudentBio] = useState('');
  const [studentDetails, setStudentDetails] = useState({});
  const [enrolledCourses, setEnrolledCourses] = useState([]);
  const [assignments, setAssignments] = useState([]);
  const [projects, setProjects] = useState([]);
  const [preResults, setPreResults] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    const fetchDashboardData = async () => {
      try {
        // Fetch student data using the school ID from local storage
        const schoolId = localStorage.getItem('schoolId');
        if (!schoolId) {
          throw new Error('School ID is missing');
        }

        const studentResponse = await fetch(`http://localhost:8673/api/students?schoolId=${schoolId}`);
        if (!studentResponse.ok) {
          throw new Error('Failed to fetch student details');
        }

        const studentData = await studentResponse.json();
        const student = studentData[0]; // Access the first element of the array

        setStudentName(student.name);
        setStudentBio(student.bio);
        setStudentDetails({
          email: student.email,
          dateOfBirth: student.dateOfBirth,
          department: student.department,
          level: student.level,
          semester: student.semester,
        });

        // Fetch department and level from the Registration table using the school ID
        const registrationResponse = await fetch(`http://localhost:8673/api/registrations?schoolId=${schoolId}`);
        if (!registrationResponse.ok) {
          throw new Error('Failed to fetch registration details');
        }

        const registrationData = await registrationResponse.json();

        // Access the first element of the registrationData array
        const registration = registrationData[0];

        // Get department and level from the registration object
        const { department, level } = registration;

        // Store in localStorage
        localStorage.setItem('department', department);
        localStorage.setItem('level', level);

        // Retrieve from localStorage
        const cachedDepartment = localStorage.getItem('department');
        const cachedLevel = localStorage.getItem('level');


        // Fetch enrolled courses data using the department and level
        const enrolledCoursesResponse = await fetch(`http://localhost:8673/api/enrolled-courses?department=${cachedDepartment}&level=${cachedLevel}`);
        if (!enrolledCoursesResponse.ok) {
          throw new Error('Failed to fetch enrolled courses');
        }

        const enrolledCoursesData = await enrolledCoursesResponse.json();
        setEnrolledCourses(enrolledCoursesData);

        // Fetch preResults data using the department, level, and semester
        const preResultsResponse = await fetch(`http://localhost:8673/api/previous-results?studentId=${schoolId}&level=${cachedLevel}&semester=${student.semester}`);
        if (!preResultsResponse.ok) {
          throw new Error('Failed to fetch previous results');
        }

        const preResultsData = await preResultsResponse.json();
        setPreResults(preResultsData);

        // Fetch assignments data using the department and level
        const assignmentsResponse = await fetch(`http://localhost:8673/api/assignments?department=${cachedDepartment}&level=${cachedLevel}`);
        if (!assignmentsResponse.ok) {
          throw new Error('Failed to fetch assignments');
        }

        const assignmentsData = await assignmentsResponse.json();
        setAssignments(assignmentsData);

        // Fetch projects data using the department and level
        const projectsResponse = await fetch(`http://localhost:8673/api/projects?department=${cachedDepartment}&level=${cachedLevel}`);
        if (!projectsResponse.ok) {
          throw new Error('Failed to fetch projects');
        }

        const projectsData = await projectsResponse.json();
        setProjects(projectsData);

        setLoading(false);
      } catch (error) {
        setError(error);
        setLoading(false);
      }
    };

    fetchDashboardData();
  }, []);





  const calculateGPA = () => {
    const gradePoints = {
      A: 4.0,
      B: 3.0,
      C: 2.0,
      D: 1.0,
      F: 0.0,
    };

    let totalCredits = 0;
    let totalGradePoints = 0;

    enrolledCourses.forEach(course => {
      const credit = Number(course.credit);
      const grade = course.grade;
      const gradePoint = gradePoints[grade];

      totalCredits += credit;
      totalGradePoints += credit * gradePoint;
    });

    const gpa = totalGradePoints / totalCredits;
    return gpa.toFixed(2);
  };

  const gpa = calculateGPA();

  return (
    <div className="dashboard-container">
      <div className="navigation-bar">
        <div className="top-bar">
          <div className="dropdown">
            <button className="dropbtn">Settings</button>
            <div className="dropdown-content">
              <Link to="/settings">Profile</Link>
              <Link to="/settings">Preferences</Link>
              <Link to="/login">Logout</Link>
            </div>
          </div>
        </div>
        <Link to="/">Home</Link>
        <a href="https://ienabler.ug.edu.gh/pls/prodi41/w99pkg.mi_login">Grades</a>
        <a href="https://sakai.ug.edu.gh/portal/xlogin">Assignments</a>
        <a href="https://sts.ug.edu.gh/services/">Course and Lecturer Evaluation</a>
      </div>

      {!loading && !error && (
        <div className="sidebar">
          <img src={studentImage} alt="Student" className="student-image" />
          <h2 className="student-name">{studentName}</h2>
          <p className="student-bio">{studentBio}</p>
          <table className="student-details">
            <tbody>
              <tr>
                <td>Email:</td>
                <td>{studentDetails.email}</td>
              </tr>
              <tr>
                <td>Date of Birth:</td>
                <td>{studentDetails.dateOfBirth}</td>
              </tr>
              <tr>
                <td>Department:</td>
                <td>{studentDetails.department}</td>
              </tr>
              <tr>
                <td>Level:</td>
                <td>{studentDetails.level}</td>
              </tr>
              <tr>
                <td>Semester:</td>
                <td>{studentDetails.semester}</td>
              </tr>
            </tbody>
          </table>
        </div>
      )}

      <div className="content">
        <div className="main-content">
          <div className="card">
            <img src={logoImage} alt="University Logo" className="university-logo" />
            <h1>Welcome, {studentName}</h1>
            <div className="grades">
              <h2>Enrolled Courses</h2>
              {enrolledCourses.map(course => (
                <div key={course.id}>{course.name}</div>
              ))}
            </div>
            <div className="grades">
  <h2>Previous Semester Results and GPA</h2>
  <table style={{ borderCollapse: 'collapse', width: '100%', borderRadius: '8px' }}>
    <thead>
      <tr style={{ backgroundColor: '#f2f2f2' }}>
        <th style={{ border: '1px solid black', padding: '8px' }}>Course</th>
        <th style={{ border: '1px solid black', padding: '8px' }}>Credit</th>
        <th style={{ border: '1px solid black', padding: '8px' }}>Grade</th>
      </tr>
    </thead>
    <tbody>
      {preResults.map(course => (
        <tr key={course.id} style={{ backgroundColor: 'white' }}>
          <td style={{ border: '1px solid black', padding: '8px' }}>{course.course}</td>
          <td style={{ border: '1px solid black', padding: '8px' }}>{course.credit}</td>
          <td style={{ border: '1px solid black', padding: '8px' }}>{course.grade}</td>
        </tr>
      ))}
    </tbody>
  </table>
  <p style={{ marginTop: '16px' }}>CGPA: {gpa}</p>
</div>

            <div className="assignments">
              <h2>Assignments</h2>
              {assignments.map(assignment => (
                <div key={assignment.id}>
                  <div>{assignment.title}</div>
                  <div>Due Date: {assignment.dueDate}</div>
                </div>
              ))}
            </div>

            <div className="projects">
              <h2>Projects</h2>
              {projects.map(project => (
                <div key={project.id}>{project.title}
                <div>Due Date: {project.deadline}</div>
                </div>
              ))}
            </div>
          </div>
          <footer className="footer">
            <p>&copy; 2023 University of Ghana, Sch Of Engineering. All rights reserved.</p>
          </footer>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
