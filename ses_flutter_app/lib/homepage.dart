import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'register.dart';
import 'login.dart';
import 'dashboard.dart';
import 'program_card.dart';

class EngineeringSchoolHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.asset('lib/assets/uglogo.png', width: 75, height: 75),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'University Of Ghana, Legon. School of Engineering Sciences',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color.fromARGB(255, 37, 87, 112),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationForm(),
                          ),
                        );
                      },
                      child: Text('Apply now'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 43, 85, 165),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        );
                      },
                      child: Text('Dashboard'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 43, 85, 165),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginForm()),
                        );
                      },
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 43, 85, 165),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Vision',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[900],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'To become a leading school of engineering sciences in Africa, committed to excellence in education, research, and innovation.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey[900],
                      ),
                    ),
                    SizedBox(height: 20),
                    Image.asset('lib/assets/engSch.jpg'),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to the School of Engineering Sciences!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[900],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Transforming the world through innovation and excellence in engineering education.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey[900],
                      ),
                    ),
                    SizedBox(height: 20),
                    Image.asset('lib/assets/aircraft.jpg'),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Programs',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[900],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'We offer a wide range of engineering programs to meet your academic and professional goals. Join us to make a difference!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey[900],
                      ),
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: ProgramCard(
                            title: 'Computer Engineering',
                            image: 'lib/assets/computer.jpg',
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: ProgramCard(
                            title: 'Biomedical Engineering',
                            image: 'lib/assets/medical.jpg',
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: ProgramCard(
                            title: 'Food Process Engineering',
                            image: 'lib/assets/food.jpg',
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: ProgramCard(
                            title: 'Material Science Engineering',
                            image: 'lib/assets/mat.jpeg',
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: ProgramCard(
                            title: 'Agricultural Engineering',
                            image: 'lib/assets/agric.jpg',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Color.fromARGB(255, 37, 87, 112),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Have questions? Contact us for more information about our programs and admissions process.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Email: info@engineering.school',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: 'Phone: ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: ' +233 553-456-7890',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle phone number tap
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
