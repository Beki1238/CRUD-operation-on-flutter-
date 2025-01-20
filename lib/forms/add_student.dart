import 'package:flutter/material.dart';
import 'package:student_info/Screens/button_style.dart';

import 'package:student_info/database/database_helper.dart';
import 'package:student_info/database/student_model.dart';

void showAddStudentForm(BuildContext context) {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? _selectedDepartment;
  String _resultText = '';

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text('Add New Student'),
            content: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: 'Select Department'),
                      items: [
                        DropdownMenuItem(value: 'Computer Science', child: Text('Computer Science')),
                        DropdownMenuItem(value: 'Information Technology', child: Text('Information Technology')),
                        DropdownMenuItem(value: 'Software Engineering', child: Text('Software Engineering')),
                      ],
                      onChanged: (value) {
                        _selectedDepartment = value;
                      },
                      validator: (value) => value == null ? 'Please select a department' : null,
                    ),
                    TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(labelText: 'First Name'),
                      validator: (value) => value!.isEmpty ? 'Please enter first name' : null,
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(labelText: 'Last Name'),
                      validator: (value) => value!.isEmpty ? 'Please enter last name' : null,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => value!.isEmpty ? 'Please enter email' : null,
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(labelText: 'Phone'),
                      keyboardType: TextInputType.phone,
                      validator: (value) => value!.isEmpty ? 'Please enter phone number' : null,
                    ),
                    SizedBox(height: 20),
                    Text(
                      _resultText,
                      style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: customButtonStyle(),
              ),
              TextButton(
                child: Text('Clear'),
                onPressed: () {
                  _firstNameController.clear();
                  _lastNameController.clear();
                  _emailController.clear();
                  _phoneController.clear();
                  setState(() {
                    _resultText = '';
                  });
                },
                style: customButtonStyle(),
              ),
              TextButton(
                child: Text('Add'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Student student = Student(
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                      department: _selectedDepartment!,
                    );
                    try {
                      await DatabaseHelper.instance.insertStudent(student.toMap());
                      setState(() {
                        _resultText = 'Student added successfully!';
                      });
                    } catch (e) {
                      setState(() {
                        _resultText = 'Failed to add student.';
                      });
                    }
                  }
                },
                style: customButtonStyle(),
              ),
            ],
          );
        },
      );
    },
  );
}