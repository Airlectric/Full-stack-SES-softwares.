import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool showCourses = true;
  bool showGrades = true;
  bool showAssignments = true;
  bool showProjects = true;

  String studentImage = 'lib/assets/dp.png';
  String studentName = '';
  String studentBio = '';

  Map<String, String> studentDetails = {
    'email': '',
    'dateOfBirth': '',
    'department': '',
    'level': '',
    'semester': '',
  };

  List<Map<String, dynamic>> enrolledCourses = [];
  List<Map<String, dynamic>> preResults = [];
  List<Map<String, dynamic>> assignments = [];
  List<Map<String, dynamic>> projects = [];

  @override
  void initState() {
    super.initState();
    fetchDashboardData();
  }

  Future<String> getSchoolIdFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final schoolId = prefs.getString('schoolId') ?? '';
    return schoolId;
  }

  Future<void> setDepartmentAndLevelInLocalStorage(
      String department, String level) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('department', department);
    prefs.setString('level', level);
  }

  Future<String> getCachedDepartment() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedDepartment = prefs.getString('department') ?? '';
    return cachedDepartment;
  }

  Future<String> getCachedLevel() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedLevel = prefs.getString('level') ?? '';
    return cachedLevel;
  }

  Future<void> fetchDashboardData() async {
    try {
      final schoolId = await getSchoolIdFromLocalStorage();
      if (schoolId.isEmpty) {
        throw Exception('School ID is missing');
      }

      final studentResponse = await http.get(
          Uri.parse('http://localhost:8673/api/students?schoolId=$schoolId'));
      if (studentResponse.statusCode != 200) {
        throw Exception('Failed to fetch student details');
      }

      final studentData = json.decode(studentResponse.body);
      final student = studentData[0];

      setState(() {
        studentName = student['name'];
        studentBio = student['bio'];
        studentDetails['email'] = student['email'];
        studentDetails['dateOfBirth'] = student['dateOfBirth'];
        studentDetails['department'] = student['department'];
        studentDetails['level'] = student['level'];
        studentDetails['semester'] = student['semester'];
      });

      final registrationResponse = await http.get(Uri.parse(
          'http://localhost:8673/api/registrations?schoolId=$schoolId'));
      if (registrationResponse.statusCode != 200) {
        throw Exception('Failed to fetch registration details');
      }

      final registrationData = json.decode(registrationResponse.body);
      final registration = registrationData[0];

      final department = registration['department'];
      final level = registration['level'];

      await setDepartmentAndLevelInLocalStorage(department, level);

      final cachedDepartment = await getCachedDepartment();
      final cachedLevel = await getCachedLevel();

      final enrolledCoursesResponse = await http.get(Uri.parse(
          'http://localhost:8673/api/enrolled-courses?department=$cachedDepartment&level=$cachedLevel'));
      if (enrolledCoursesResponse.statusCode != 200) {
        throw Exception('Failed to fetch enrolled courses');
      }

      final enrolledCoursesData = json.decode(enrolledCoursesResponse.body);
      setState(() {
        enrolledCourses = List<Map<String, dynamic>>.from(enrolledCoursesData);
      });

      final preResultsResponse = await http.get(Uri.parse(
          'http://localhost:8673/api/previous-results?studentId=$schoolId&level=$cachedLevel&semester=${studentDetails['semester']}'));
      if (preResultsResponse.statusCode != 200) {
        throw Exception('Failed to fetch previous results');
      }

      final preResultsData = json.decode(preResultsResponse.body);
      setState(() {
        preResults = List<Map<String, dynamic>>.from(preResultsData);
      });

      final assignmentsResponse = await http.get(Uri.parse(
          'http://localhost:8673/api/assignments?department=$cachedDepartment&level=$cachedLevel'));
      if (assignmentsResponse.statusCode != 200) {
        throw Exception('Failed to fetch assignments');
      }

      final assignmentsData = json.decode(assignmentsResponse.body);
      setState(() {
        assignments = List<Map<String, dynamic>>.from(assignmentsData);
      });

      final projectsResponse = await http.get(Uri.parse(
          'http://localhost:8673/api/projects?department=$cachedDepartment&level=$cachedLevel'));
      if (projectsResponse.statusCode != 200) {
        throw Exception('Failed to fetch projects');
      }

      final projectsData = json.decode(projectsResponse.body);
      setState(() {
        projects = List<Map<String, dynamic>>.from(projectsData);
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(
                'lib/assets/new_ses.png',
                height: 50.0,
              ),
            ),
            Text('Dashboard'),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFFE8EDF5),
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            _buildProfileSection(),
            SizedBox(height: 20.0),
            _buildNavigationSection(),
            SizedBox(height: 20.0),
            if (showCourses) _buildCoursesSection(),
            if (showGrades) _buildGradesSection(),
            if (showAssignments) _buildAssignmentsSection(),
            if (showProjects) _buildProjectsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(studentImage),
            ),
            SizedBox(height: 10.0),
            Text(
              studentName,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              'Student',
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationSection() {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Navigation',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            _buildNavigationItem(
              icon: Icons.book,
              title: 'Courses',
              value: showCourses,
              onChanged: (value) {
                setState(() {
                  showCourses = value;
                });
              },
            ),
            _buildNavigationItem(
              icon: Icons.grade,
              title: 'Grades',
              value: showGrades,
              onChanged: (value) {
                setState(() {
                  showGrades = value;
                });
              },
            ),
            _buildNavigationItem(
              icon: Icons.assignment,
              title: 'Assignments',
              value: showAssignments,
              onChanged: (value) {
                setState(() {
                  showAssignments = value;
                });
              },
            ),
            _buildNavigationItem(
              icon: Icons.work,
              title: 'Projects',
              value: showProjects,
              onChanged: (value) {
                setState(() {
                  showProjects = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationItem({
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30.0,
          color: Colors.grey[600],
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildCoursesSection() {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enrolled Courses',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            for (final course in enrolledCourses)
              ListTile(
                title: Text(course['name']),
                subtitle: Text('Credit: ${course['credit']}'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradesSection() {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Previous Semester Results',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            for (final result in preResults)
              ListTile(
                title: Text(result['course']),
                subtitle: Text(
                    'Credit: ${result['credit']} Grade: ${result['grade']}'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssignmentsSection() {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Assignments',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            for (final assignment in assignments)
              ListTile(
                title: Text(assignment['title']),
                subtitle: Text('Due Date: ${assignment['dueDate']}'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectsSection() {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Projects',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            for (final project in projects)
              ListTile(
                title: Text(project['title']),
                subtitle: Text('Due Date: ${project['dueDate']}'),
              ),
          ],
        ),
      ),
    );
  }
}
