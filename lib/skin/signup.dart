import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isAgreed = false; // Track agreement checkbox state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        // Enable scrolling
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SCIN Logo
            SizedBox(
              height: 100,
              child: Image.asset('assets/logoscin.png'),
            ),
            const SizedBox(height: 20),
            Text(
              'Create Your Account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            const SizedBox(height: 20),
            // Email Field
            _buildTextField('Email', Icons.email_outlined),
            const SizedBox(height: 10),
            // Phone Number Field
            _buildTextField('Phone Number', Icons.phone_outlined),
            const SizedBox(height: 10),
            // Password Field
            _buildTextField('Password', Icons.lock_outline, isPassword: true),
            const SizedBox(height: 10),
            // Confirm Password Field
            _buildTextField('Confirm Password', Icons.lock_outline,
                isPassword: true),
            const SizedBox(height: 20),
            // Checkbox
            Row(
              children: [
                Checkbox(
                  value: _isAgreed,
                  onChanged: (value) {
                    setState(() {
                      _isAgreed = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text('I agree with and Accept '),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle privacy policy tap
                  },
                  child: Text(
                    'Privacy and Policy',
                    style: TextStyle(
                      color: Colors.blue[900],
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Sign Up Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isAgreed
                    ? () {
                        // Handle sign up action
                      }
                    : null, // Disable if not agreed
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isAgreed ? Colors.blue[900] : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Or Sign Up With'),
            const SizedBox(height: 20),
            // Social Media Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton(FontAwesomeIcons.google, Colors.red),
                const SizedBox(width: 20),
                _buildSocialButton(FontAwesomeIcons.facebook, Colors.blue),
                const SizedBox(width: 20),
                _buildSocialButton(FontAwesomeIcons.twitter, Colors.lightBlue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Reusable widget for text fields
  Widget _buildTextField(String hintText, IconData icon,
      {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[200],
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Reusable widget for social media buttons
  Widget _buildSocialButton(IconData icon, Color color) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.grey[200],
      child: Icon(icon, color: color),
    );
  }
}
