import React, { useState } from 'react';
import axios from 'axios';
import './StudentEntry.css';
import logoImage from '../assets/uglogo1.jpeg';

const StudentInfoEntryPage = () => {
  const [name, setName] = useState('');
  const [dateOfBirth, setDateOfBirth] = useState('');
  const [gender, setGender] = useState('');
  const [address, setAddress] = useState('');
  const [phone, setPhone] = useState('');
  const [email, setEmail] = useState('');
  const [highSchool, setHighSchool] = useState('');
  const [grade, setGrade] = useState('');
  const [gpa, setGpa] = useState('');
  const [financialAidStatus, setFinancialAidStatus] = useState('');
  const [disability, setDisability] = useState('');
  const [scholarships, setScholarships] = useState('');
  const [extracurricularActivities, setExtracurricularActivities] = useState('');
  const [interests, setInterests] = useState('');
  const [goals, setGoals] = useState('');
  const [submitted, setSubmitted] = useState(false);

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const response = await axios.post('/api/studentInfo', {
        name,
        dateOfBirth,
        gender,
        address,
        phone,
        email,
        highSchool,
        grade,
        gpa,
        financialAidStatus,
        disability,
        scholarships,
        extracurricularActivities,
        interests,
        goals
      });
      if (response.status === 201) {
        setSubmitted(true);
      } else {
        alert("Student information submission failed. Please try again.");
      }
    } catch (error) {
      console.error("Student information submission error:", error);
      alert("An error occurred during student information submission. Please try again.");
    }
  };

  return (
    <div className="student-info-entry">
      <div className='itopbar'>
        <img src={logoImage} alt="UG Logo" className="logo" />
        <h2>Student Information Entry</h2>
      </div>
      <form onSubmit={handleSubmit}>
        {/* Personal Information */}
        <div className="form-section">
          <h3>Personal Information</h3>
          <div className="form-field">
            <label htmlFor="name">Name</label>
            <input
              type="text"
              id="name"
              className="input-field"
              value={name}
              onChange={(e) => setName(e.target.value)}
              required
            />
          </div>
          <div className="form-field">
            <label htmlFor="dateOfBirth">Date of Birth</label>
            <input
              type="date"
              id="dateOfBirth"
              className="input-field"
              value={dateOfBirth}
              onChange={(e) => setDateOfBirth(e.target.value)}
              required
            />
          </div>
          <div className="form-field">
            <label htmlFor="gender">Gender</label>
            <input
              type="text"
              id="gender"
              className="input-field"
              value={gender}
              onChange={(e) => setGender(e.target.value)}
              required
            />
          </div>
          <div className="form-field">
            <label htmlFor="address">Address</label>
            <input
              type="text"
              id="address"
              className="input-field"
              value={address}
              onChange={(e) => setAddress(e.target.value)}
              required
            />
          </div>
          <div className="form-field">
            <label htmlFor="phone">Phone Number</label>
            <input
              type="tel"
              id="phone"
              className="input-field"
              value={phone}
              onChange={(e) => setPhone(e.target.value)}
              required
            />
          </div>
          <div className="form-field">
            <label htmlFor="email">Email</label>
            <input
              type="email"
              id="email"
              className="input-field"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
          </div>
        </div>

        {/* Academic Information */}
        <div className="form-section">
          <h3>Academic Information</h3>
          <div className="form-field">
            <label htmlFor="highSchool">High School</label>
            <input
              type="text"
              id="highSchool"
              className="input-field"
              value={highSchool}
              onChange={(e) => setHighSchool(e.target.value)}
              required
            />
          </div>
          <div className="form-field">
            <label htmlFor="gpa">GPA</label>
            <input
              type="text"
              id="gpa"
              className="input-field"
              value={gpa}
              onChange={(e) => setGpa(e.target.value)}
              required
            />
          </div>
          <div className="form-field">
            <label htmlFor="satScores"> Grades </label>
            <input
              type="text"
              id="satScores"
              className="input-field"
              value={grade}
              onChange={(e) => setGrade(e.target.value)}
              required
            />
          </div>
        </div>

        {/* Financial Information */}
        <div className="form-section">
          <h3>Financial Information</h3>
          <div className="form-field">
            <label htmlFor="financialAidStatus">Financial Aid Status</label>
            <input
              type="text"
              id="financialAidStatus"
              className="input-field"
              value={financialAidStatus}
              onChange={(e) => setFinancialAidStatus(e.target.value)}
              required
            />
          </div>
          <div className="form-field">
            <label htmlFor="costOfAttendance">Disability Status</label>
            <input
              type="text"
              id="costOfAttendance"
              className="input-field"
              value={disability}
              onChange={(e) => setDisability(e.target.value)}
              required
            />
          </div>
          <div className="form-field">
            <label htmlFor="scholarships">Scholarships or Grants</label>
            <input
              type="text"
              id="scholarships"
              className="input-field"
              value={scholarships}
              onChange={(e) => setScholarships(e.target.value)}
              required
            />
          </div>
        </div>

        {/* Other Information */}
        <div className="form-section">
          <h3>Other Information</h3>
          <div className="form-field">
            <label htmlFor="extracurricularActivities">Extracurricular Activities</label>
            <textarea
              id="extracurricularActivities"
              className="textarea-field"
              value={extracurricularActivities}
              onChange={(e) => setExtracurricularActivities(e.target.value)}
              required
            />
          </div>
          <div className="form-field">
            <label htmlFor="interests">Interests</label>
            <textarea
              id="interests"
              className="textarea-field"
              value={interests}
              onChange={(e) => setInterests(e.target.value)}
              required
            />
          </div>
          <div className="form-field">
            <label htmlFor="goals">Goals</label>
            <textarea
              id="goals"
              className="textarea-field"
              value={goals}
              onChange={(e) => setGoals(e.target.value)}
              required
            />
          </div>
          <button type="submit" className="submit-button">Submit</button>
        </div>
      </form>
      {submitted && (
        <div className="success-message">
          <p>Student information submitted successfully!</p>
        </div>
      )}
    </div>
  );
};

export default StudentInfoEntryPage;
