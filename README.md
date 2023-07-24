**School of Engineering Sciences (SES) Web and Mobile Application**

## Project Overview

The School of Engineering Sciences (SES) at the University of Ghana aims to enhance the student experience and streamline administrative processes by incorporating technology. To achieve this goal, SES requires a comprehensive database-driven web and mobile application. The application will provide students with a user-friendly platform for managing academic information, accessing administrative features, and valuable resources. The development stack includes React for the web-based front-end, Flutter for the mobile front-end, Spring Boot for the back-end/web service, and PostgreSQL for the database.

## Requirements

### Functional Requirements

1. Student Registration Page:
   - Allow new students to sign up with their personal information (name, email, password).
   - Store student information in the database for authentication.

2. Log-in Page:
   - Provide a secure log-in page for students to enter their email and password.
   - Implement password encryption and validation checks.

3. Dashboard:
   - Create a central hub for students to access their profile, registered courses, and academic results.
   - Ensure the dashboard is dynamic, user-friendly, and navigable.

4. Student Information Entry Page:
   - Enable students to enter and update personal information, such as contact details, academic history, and interests.
   - Implement user-friendly input validation and instructions.

### Non-functional Requirements

1. Security:
   - Ensure the application is secure and protects student data from unauthorized access.

2. Performance:
   - Optimize the application for responsiveness and fast load times.

3. Scalability:
   - Design the application to handle a large number of users and data without performance issues.

4. Usability:
   - Create a user-friendly interface for students, faculty, and administrative staff.

5. Reliability:
   - Ensure the application is available and reliable without frequent downtime.

6. Compatibility:
   - Make the application compatible with different browsers and operating systems.

## Getting Started

To run the application locally on your machine, follow these steps:

### Prerequisites

- Node.js and npm: Install Node.js and npm to run the web-based front-end (React).
- Flutter SDK: Install Flutter to run the mobile front-end (Flutter).
- Java Development Kit (JDK): Install JDK to run the back-end (Spring Boot).
- PostgreSQL: Install PostgreSQL as the database management system.

### Installation

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/your_username/ses-web-mobile-app.git
   cd ses-web-mobile-app
   ```

2. Front-end (React):
   ```bash
   cd web-frontend
   npm install   # Install dependencies
   npm run dev     # Run the web-based front-end on http://localhost:3000
   ```

3. Mobile Front-end (Flutter):
   ```bash
   cd mobile-frontend
   flutter pub get   # Get the required packages
   flutter run       # Run the mobile front-end on an emulator or connected device
   ```

4. Back-end (Spring Boot):
   - Set up the PostgreSQL database with the necessary tables.
   - Execute the `database_triggers.sql` file in the query tool of PostgreSQL after the tables are created in the database.
   - Configure the database connection in the `application.properties` file in the `back-end` directory.
   - Build and run the Spring Boot application:
     ```bash
     cd back-end
     ./mvnw spring-boot:run
     ```

## Testing

Testing is an integral part of the development process to ensure the application meets the requirements and is free of bugs. Different types of testing, including unit testing, integration testing, and system testing, are conducted throughout the development process.

## Contributing

Contributions to the project are welcome. If you find a bug or have an improvement suggestion, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

## Acknowledgments

We acknowledge the support and feedback from the School of Engineering Sciences (SES) at the University of Ghana for making this project possible.

## Contact

For any inquiries or questions, please contact [SES Support](mailto:agudeydaniel@gmail.com).
