import React, { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import './LoginForm.css';

const LoginForm = () => {
  const [schoolId, setSchoolId] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
  
    // Perform form validation
    if (!schoolId || !password) {
      setError('Please enter your ID and password.');
      return;
    }
  
    try {
      // Send login request to the backend
      const response = await fetch('http://localhost:8673/api/users/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ schoolId, password }),
      });
  
      // Handle response based on status code
      if (response.ok) {
        // Login successful
        const authToken = await response.text(); // Read the response body as text
  
        // Save the authentication token to local storage or state management
        localStorage.setItem('token', authToken);
  
        // Store the schoolId in local storage
        localStorage.setItem('schoolId', schoolId);
  
        // Navigate to the dashboard or home page
        navigate('/dashboard');
      } else {
        // Login failed
        const errorData = await response.text(); // Read the response body as text
        setError(errorData);
      }
    } catch (error) {
      console.error('Error occurred during login:', error);
      setError('An unexpected error occurred. Please try again later.');
    }
  };
  

  return (
    <div className="log">
    <form onSubmit={handleSubmit}>
      <h2>Welcome to the School of Engineering</h2>
      <h2>Login</h2>
      {error && <p className="error-message">{error}</p>}
      <div className="iform-group">
        <label htmlFor="schoolId">ID</label>
        <input
          type="text"
          id="schoolId"
          placeholder="Enter your ID"
          value={schoolId}
          onChange={(e) => setSchoolId(e.target.value)}
          required
        />
      </div>
      <div className="iform-group">
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
      <button type="submit" className="btn btn-primary">Log In</button>
      <p className="register-link">Don't have an account? <Link to="/register">Register here</Link></p>
    </form>
  </div>
  );
};

export default LoginForm;
