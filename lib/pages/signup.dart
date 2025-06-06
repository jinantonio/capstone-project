import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // full white background
      appBar: AppBar(
        title: const Text(
          "Sign Up",
          style: TextStyle(color: Colors.white), // make AppBar title white
        ),
        backgroundColor: const Color.fromARGB(255, 50, 76, 89), // Dark background to show white text
        iconTheme: const IconThemeData(color: Colors.white), // Make back arrow white
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Create an Account",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(decoration: const InputDecoration(labelText: 'First Name')),
            const SizedBox(height: 10),
            TextField(decoration: const InputDecoration(labelText: 'Last Name')),
            const SizedBox(height: 10),
            TextField(decoration: const InputDecoration(labelText: 'Middle Name')),
            const SizedBox(height: 10),
            TextField(decoration: const InputDecoration(labelText: 'Email Address')),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
            ),
            const SizedBox(height: 10),
            TextField(decoration: const InputDecoration(labelText: 'Mobile Number')),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                // Sign up logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 50, 76, 89),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                "Sign Up",
                style: TextStyle(color: Colors.white),
              ),
            ),

            // Cancel Button
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
