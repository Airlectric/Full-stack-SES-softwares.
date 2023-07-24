import React, { useState } from 'react';
import './RegistrationForm.css';
import logoImage from '../assets/uglogo1.jpeg';

const RegistrationForm = () => {
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName] = useState('');
  const [schoolId, setSchoolId] = useState('');
  const [department, setDepartment] = useState('');
  const [level, setLevel] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [gender, setGender] = useState('');
  const [dob, setDob] = useState('');
  const [address, setAddress] = useState('');
  const [phone, setPhone] = useState('');
  const [bio, setBio] = useState('');
  const [semester, setSemester] = useState('');
  const [submitted, setSubmitted] = useState(false);

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (password !== confirmPassword) {
      alert("Passwords do not match");
      return;
    }

    try {
      const response = await fetch('http://localhost:8673/api/registrations', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        mode: 'cors',
        body: JSON.stringify({
          firstName,
          lastName,
          schoolId,
          department,
          level,
          email,
          password,
          gender,
          dob,
          address,
          phone,
          bio,
          semester,
        }),
      });
      if (response.ok) {
        setSubmitted(true);

        // Store the schoolId in local storage
        localStorage.setItem('schoolId', schoolId);

        // Redirect to the dashboard page
        window.location.href = '/dashboard';
      } else {
        alert("Registration failed. Please try again.");
      }
    } catch (error) {
      console.error("Registration error:", error);
      alert("An error occurred during registration. Please try again.");
    }
  };

  return (
    <div className="regist">
      <div className='rtopbar'>
        <img src={logoImage} alt="UG Logo" className="logo" />
        <h2>Register an SES account.</h2>
      </div>
      <form onSubmit={handleSubmit}>
        <div className="firDiv">
          <div className="rform-group">
            <label htmlFor="first_name">First name</label>
            <input
              type="text"
              id="first_name"
              placeholder="Enter your first name"
              value={firstName}
              onChange={(e) => setFirstName(e.target.value)}
              required
            />
          </div>

          <div className="rform-group">
            <label htmlFor="last_name">Last name</label>
            <input
              type="text"
              id="last_name"
              placeholder="Enter your last name"
              value={lastName}
              onChange={(e) => setLastName(e.target.value)}
              required
            />
          </div>

          <div className="rform-group">
            <label htmlFor="email">Email</label>
            <input
              type="email"
              id="email"
              placeholder="Enter your email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
          </div>

          <div className="rform-group">
            <label htmlFor="department">Department</label>
            <select id="department" value={department} onChange={(e) => setDepartment(e.target.value)} required>
              <option value="">Select your department</option>
              <option value="Computer">Computer Engineering</option>
              <option value="Agriculture">Agricultural Engineering</option>
              <option value="Biomedical">Biomedical Engineering</option>
              <option value="Food Process">Food Process Engineering</option>
              <option value="Material Science">Material Science Engineering</option>
            </select>
          </div>

          <div className="rform-group">
            <label htmlFor="level">Level of Study</label>
            <select id="level" value={level} onChange={(e) => setLevel(e.target.value)} required>
              <option value="">Select your level of Study</option>
              <option value="100">100</option>
              <option value="200">200</option>
              <option value="300">300</option>
              <option value="400">400</option>
            </select>
          </div>

          <div className="rform-group">
            <label htmlFor="gender">Gender</label>
            <select id="gender" value={gender} onChange={(e) => setGender(e.target.value)} required>
              <option value="">Select your gender</option>
              <option value="Male">Male</option>
              <option value="Female">Female</option>
              <option value="Other">Other</option>
            </select>
          </div>

          <div className="rform-group">
            <label htmlFor="dob">Date of Birth</label>
            <input
              type="date"
              id="dob"
              value={dob}
              onChange={(e) => setDob(e.target.value)}
              required
            />
          </div>

        </div>

        <div className='secDiv'>
        <div className="rform-group">
            <label htmlFor="bio">Bio</label>
            <textarea
              id="bio"
              placeholder="Tell us about yourself"
              value={bio}
              onChange={(e) => setBio(e.target.value)}
            />
          </div>

          <div className="rform-group">
            <label htmlFor="semester">Semester</label>
            <select id="semester" value={semester} onChange={(e) => setSemester(e.target.value)} required>
              <option value="">Select your semester</option>
              <option value="1">Semester One</option>
              <option value="2">Semester Two</option>
            </select>
          </div>
          <div className="rform-group">
            <label htmlFor="address">Address</label>
            <input
              type="text"
              id="address"
              placeholder="Enter your address"
              value={address}
              onChange={(e) => setAddress(e.target.value)}
              required
            />
          </div>


          <div className="rform-group">
            <label htmlFor="phone">Phone Number</label>
            <input
              type="tel"
              id="phone"
              placeholder="Enter your phone number"
              value={phone}
              onChange={(e) => setPhone(e.target.value)}
              required
            />
          </div>

          <div className="rform-group">
            <label htmlFor="schoolId">school ID</label>
            <input
              type="text"
              id="schoolId"
              placeholder="Enter your school ID"
              value={schoolId}
              onChange={(e) => setSchoolId(e.target.value)}
              required
            />
          </div>

          <div className="rform-group">
            <label htmlFor="password">Password</label>
            <input
              type="password"
              id="password"
              placeholder="Enter your password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </div>

          <div className="rform-group">
            <label htmlFor="confirmPassword">Confirm Password</label>
            <input
              type="password"
              id="confirmPassword"
              placeholder="Confirm your password"
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              required
            />
          </div>

          <button type="submit" className="btn btn-primary">Register</button>
        </div>
      </form>
      {submitted && (
        <div className="success-message">
          <p>Registration successful!</p>
        </div>
      )}
    </div>
  );
};

export default RegistrationForm;
