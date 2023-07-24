import React from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import RegistrationForm from './Components/RegistrationForm';
import LoginForm from './Components/LoginForm';
import Dashboard from './Components/Dashboard';
import EngineeringSchoolHomepage from './Components/EngineeringSchoolHomepage';
import StudentInfoEntry from './Components/StudentInfoEntry';

const App = () => {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<EngineeringSchoolHomepage/>} />
        <Route path="/register" element={<RegistrationForm />} />
        <Route path="/infoentry" element={<StudentInfoEntry />} />
        <Route path="/login" element={<LoginForm />} />
        <Route path="/dashboard" element={<Dashboard />} />
      </Routes>
    </BrowserRouter>
  );
};

export default App;
