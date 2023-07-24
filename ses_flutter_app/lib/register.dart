import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart';

const String dummyAuthToken = 'YOUR_DUMMY_TOKEN_HERE';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? department;
  int? level;
  String? semester;
  String? gender;
  String? bio;
  DateTime? selectedDate;
  bool _isLoading = false;
  String _error = '';

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController schoolIdController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    schoolIdController.dispose();
    bioController.dispose();
    super.dispose();
  }

  Future<void> _handleRegistration() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _error = '';
      });

      final firstName = firstNameController.text;
      final lastName = lastNameController.text;
      final email = emailController.text;
      final department = this.department!;
      final level = this.level ?? 0;
      final password = passwordController.text;
      final address = addressController.text;
      final phone = phoneNumberController.text;
      final dob = selectedDate != null ? DateFormat('yyyy-MM-dd').format(selectedDate!) : '';
      final schoolId = schoolIdController.text;
      final selectedSemester = semester!;
      final selectedGender = gender!;
      final bio = bioController.text;

      if (bio.isEmpty) {
        setState(() {
          _error = 'Please enter your bio';
          _isLoading = false;
        });
        return;
      }

      // Check if schoolId is empty
      if (schoolId.isEmpty) {
        setState(() {
          _error = 'School ID not provided. Please try again later.';
          _isLoading = false;
        });
        return;
      }

      try {
        // In a real scenario, this is where you would send the registration data to the server
        // Since we are using dummy authentication, we will just simulate the registration process
        // by setting a dummy token and navigating to the dashboard.

        // Simulate server response delay for 2 seconds
        await Future.delayed(Duration(seconds: 2));

        // Save schoolId to local storage
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', dummyAuthToken);
        prefs.setString('schoolId', schoolId);

        // Navigate to the dashboard
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(),
            settings: RouteSettings(
              arguments: schoolId,
            ), // Pass schoolId as argument
          ),
        );
      } catch (error) {
        // Error occurred during registration, handle the exception
        setState(() {
          _error = 'An unexpected error occurred. Please try again later.';
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text('Register an SES account.'),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: firstNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'First name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: lastNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Last name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Add additional email validation logic if required
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: schoolIdController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your school ID';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'School ID',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Department',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    value: department,
                    onChanged: (newValue) {
                      setState(() {
                        department = newValue!;
                      });
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: '',
                        child: Text('Select your department'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Computer',
                        child: Text('Computer Engineering'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Agriculture',
                        child: Text('Agricultural Engineering'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Biomedical',
                        child: Text('Biomedical Engineering'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Food Process',
                        child: Text('Food Process Engineering'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Material Science',
                        child: Text('Material Science Engineering'),
                      ),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Department',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your department';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Level of Study',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DropdownButtonFormField<int>(
                    value: level,
                    onChanged: (newValue) {
                      setState(() {
                        level = newValue;
                      });
                    },
                    items: [
                      DropdownMenuItem<int>(
                        value: 0,
                        child: Text('Select your level of study'),
                      ),
                      DropdownMenuItem<int>(
                        value: 100,
                        child: Text('100'),
                      ),
                      DropdownMenuItem<int>(
                        value: 200,
                        child: Text('200'),
                      ),
                      DropdownMenuItem<int>(
                        value: 300,
                        child: Text('300'),
                      ),
                      DropdownMenuItem<int>(
                        value: 400,
                        child: Text('400'),
                      ),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Level of Study',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value == 0) {
                        return 'Please select your level of study';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Semester',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    value: semester,
                    onChanged: (newValue) {
                      setState(() {
                        semester = newValue!;
                      });
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: '',
                        child: Text('Select semester'),
                      ),
                      DropdownMenuItem<String>(
                        value: '1',
                        child: Text('Semester One'),
                      ),
                      DropdownMenuItem<String>(
                        value: '2',
                        child: Text('Semester Two'),
                      ),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Semester',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select the semester';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Gender',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    value: gender,
                    onChanged: (newValue) {
                      setState(() {
                        gender = newValue!;
                      });
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: '',
                        child: Text('Select your gender'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Male',
                        child: Text('Male'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Female',
                        child: Text('Female'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Other',
                        child: Text('Other'),
                      ),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your gender';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: bioController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your bio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Bio',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Date of Birth',
                        border: OutlineInputBorder(),
                      ),
                      child: Text(selectedDate != null
                          ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                          : 'Select date'),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: phoneNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      // Add additional phone number validation logic if required
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      // Add additional password validation logic if required
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _handleRegistration,
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 42, 28, 238),
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 24.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: _isLoading
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  SizedBox(height: 20.0),
                  if (_error.isNotEmpty)
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        _error,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
