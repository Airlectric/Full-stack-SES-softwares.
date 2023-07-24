import React from 'react';
import './EngineeringSchoolHomepage.css';
import logoImage from '../assets/uglogo1.jpeg';
import Aircraft from '../assets/aircraft.jpg';
import schLogo from '../assets/engSch.jpg';
import facebookLogo from '../assets/facebook-logo.png';
import twitterLogo from '../assets/twitter-logo.png';
import instagramLogo from '../assets/instagram-logo.png';


const EngineeringSchoolHomepage = () => {
  return (
    <div className="engineering-school-homepage">
      <div className="topbar">
        <img src={logoImage} alt="UG Logo" className="logo" />
        <h1 className="head1">University Of Ghana, Legon. School of Engineering Sciences</h1>
        <div className="search-bar">
          {/* Search bar component */}
          <input type="text" placeholder="Search" />
          <button>Search</button>
        </div>
        <button className="cta-button"><a href='/register'>Apply now</a></button>
        <button className="cta-button"><a href='/login'>Login</a></button>
      </div>

      <section className="hero-section">
        <div className="hero-content">
          <h2>Welcome to the School of Engineering Sciences!</h2>
          <p>Transforming the world through innovation and excellence in engineering education.</p>
        </div>
        <div className="hero-media">
        <img src={Aircraft} alt="aircraft" />
        </div>
      </section>

      {/* About section */}
      <section className="about-section">
        <h2>About the School of Engineering Sciences</h2>
        <div className="about-content">
          <div className="infographic" >
            <img src={schLogo}  alt="Infographic"/>
          </div>
          <div className="about-text">
            <p>
              The School of Engineering Sciences at the University of Ghana is a leading institution in engineering education. We offer a wide range of undergraduate and graduate programs, equipped with state-of-the-art facilities and taught by world-renowned faculty members.
            </p>
            <p>
              Our curriculum emphasizes practical learning, research opportunities, and a collaborative atmosphere. Our students have the chance to engage in cutting-edge research, participate in industry internships, and join student organizations that foster personal and professional growth.
            </p>
          </div>
        </div>
      </section>

      {/* Academics section */}
      <section className="academics-section">
      <h2>Academic Programs</h2>
<div class="program-list">
  <div class="program-card">
    <h3>Bachelor of Science in Computer Engineering</h3>
    <p>Our Computer Engineering program equips students with the knowledge and skills to design and develop computer hardware and software systems. Graduates excel in the fast-paced field of technology.</p>
  </div>
  <div class="program-card">
    <h3>Bachelor of Science in Food Process Engineering</h3>
    <p>Our Food Process Engineering program focuses on the production, preservation, and packaging of food products. Graduates play a vital role in ensuring food safety and innovation in the food industry.</p>
  </div>
  <div class="program-card">
    <h3>Bachelor of Science in Material Science Engineering</h3>
    <p>Our Material Science Engineering program explores the properties and behavior of various materials. Graduates contribute to advancements in materials research and development for diverse applications.</p>
  </div>
  <div class="program-card">
    <h3>Bachelor of Science in Agricultural Engineering</h3>
    <p>Our Agricultural Engineering program integrates engineering principles with agricultural sciences to improve agricultural practices and machinery. Graduates drive innovation in sustainable agriculture.</p>
  </div>
  <div class="program-card">
    <h3>Bachelor of Science in Biomedical Engineering</h3>
    <p>Our Biomedical Engineering program combines engineering principles with medical and biological sciences to develop innovative healthcare technologies. Graduates contribute to advancements in healthcare and medical device industries.</p>
  </div>
</div>

      </section>

   
      <section className="student-life-section">
        <h2>Student Life at the School of Engineering Sciences</h2>
        <div className="student-life-content">
          <div className="testimonial">
            <p>"The School of Engineering Sciences has provided me with exceptional opportunities to grow both academically and personally. The supportive faculty, state-of-the-art labs, and vibrant student community have enriched my learning experience."<br /><span>- Benjamin Sasu, Computer Engineering Student</span></p>
          </div>
          <div className="student-organizations">
            <h3>Student Organizations</h3>
            <ul>
              <li>Engineering Society</li>
              <li>Women in Engineering</li>
              <li>Robotics Club</li>
              <li>Machine learning</li>
              
            </ul>
          </div>
        </div>
      </section>

      {/* Contact section */}
      <section className="contact-section">
        <h2>Contact Us</h2>
        <div className="contact-info">
          <p>
            If you have any questions or would like to learn more about our programs, feel free to reach out to us. Our team is here to assist you.
          </p>
          <p>Email: info@engineering.ug.edu.gh</p>
          <p>Phone: +233 545 4343 22</p>
        </div>
      </section>

      {/* Footer */}
      <footer className="footer">
        <div className="social-media">
          <a href="https://www.facebook.com"><img src={facebookLogo} alt="Facebook" /></a>
          <a href="https://www.twitter.com"><img src={twitterLogo} alt="Twitter" /></a>
          <a href="https://www.instagram.com"><img src={instagramLogo} alt="Instagram" /></a>
        </div>

        <div className="footer-sections">
          <div className="contact-form">
            {/* Contact form component */}
            <h3>Contact Us</h3>
            <form>
              <input type="text" placeholder="Name" />
              <input type="email" placeholder="Email" />
              <textarea placeholder="Message"></textarea>
              <button>Send Message</button>
            </form>
          </div>
          <div className="latest-blog-posts">
            <h3>Latest Blog Posts</h3>
            <ul>
              <li>Post 1</li>
              <li>Post 2</li>
              <li>Post 3</li>
            </ul>
          </div>
          <div className="support-school">
            <h3>Support Our School</h3>
            <p>Your generous donations help us provide scholarships, enhance facilities, and support research initiatives. Together, we can make a difference.</p>
            <button className='butt'>Donate Now</button>
          </div>
        </div>
        <p>&copy; 2023 University of Ghana, Sch Of Engineering. All rights reserved.</p>
      </footer>
    </div>
  );
};

export default EngineeringSchoolHomepage;
