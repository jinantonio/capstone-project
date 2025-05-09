import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text("Create an Account", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                TextField(decoration: const InputDecoration(labelText: 'First Name')),
                TextField(decoration: const InputDecoration(labelText: 'Last Name')),
                TextField(decoration: const InputDecoration(labelText: 'Middle Name')),
                TextField(decoration: const InputDecoration(labelText: 'Email Address')),
                TextField(obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
                TextField(obscureText: true, decoration: const InputDecoration(labelText: 'Confirm Password')),
                TextField(decoration: const InputDecoration(labelText: 'Mobile Number')),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text("Sign Up"),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
