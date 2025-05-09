import 'package:flutter/material.dart';
/*import 'package:intl/intl.dart';*/

class ApplicationFormScreen extends StatefulWidget {
  const ApplicationFormScreen({Key? key}) : super(key: key);

  @override
  _ApplicationFormScreenState createState() => _ApplicationFormScreenState();
}

class _ApplicationFormScreenState extends State<ApplicationFormScreen> {
  bool isNewApplication = false;
  bool isRenewal = false;
  bool isAnnually = false;
  bool isSemi_Annually = false;
  bool isquarterly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application Form'),
        backgroundColor: const Color.fromARGB(255, 221, 223, 225),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("APPLICANT FORM", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("Basic Information"),

            // ✅ Checkbox for New Application
            Row(
              children: [
                Checkbox(
                  value: isNewApplication,
                  onChanged: (bool? value) {
                    setState(() {
                      isNewApplication = value ?? false;
                    });
                  },
                ),
                const Text('New Application'),
              ],
            ),
            Row(children: [
              Checkbox(
                value: isRenewal,
                onChanged: (bool? value) {
                  setState(() {
                    isRenewal = value ?? false;
                  });
                },
              ),
              const Text('Renewal'),
             ],
            ),

            const Text("MODE OF PAYMENT", style: TextStyle(fontWeight: FontWeight.bold)),

            Row(
              children: [
                Checkbox(
                  value: isAnnually, 
                  onChanged: (bool? value) {
                    setState(() {
                      isAnnually = value ?? false;
                    });
                  },
                ),
                const Text('Annually')
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isSemi_Annually,
                   onChanged: (bool? value) {
                    setState(() {
                      isSemi_Annually = value ?? false;

                    });
                   },
                 ),
                 const Text('Semi-Annually')
               ],
              ),
            Row(
              children: [
                Checkbox(
                  value: isquarterly, 
                  onChanged: (bool? value) {
                    setState(() {
                      isquarterly = value ?? false;
                    });
                  },
                  ),
                  const Text('Quarterly')
                ],
              ),
            

            TextField(decoration: InputDecoration(labelText: 'Full Name')),
            TextField(decoration: InputDecoration(labelText: 'Address')),
            TextField(decoration: InputDecoration(labelText: 'Contact Number')),

            const SizedBox(height: 16),
            const Text("Vehicle Information", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(decoration: InputDecoration(labelText: 'Plate Number')),
            TextField(decoration: InputDecoration(labelText: 'Make/Model')),
            TextField(decoration: InputDecoration(labelText: 'Year')),

            const SizedBox(height: 16),
            const Text("Application Details", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(decoration: InputDecoration(labelText: 'Type of Application')),
            TextField(decoration: InputDecoration(labelText: 'Route')),

            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // You can access isNewApplication here if needed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A2B47),
                ),
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*import 'package:flutter/material.dart';

class ApplicationFormScreen extends StatelessWidget {
  const ApplicationFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application Form for Business Permit'),
        backgroundColor: const Color.fromARGB(255, 221, 223, 225),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Applicant Form", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("BASIC INFORMATION"),
            Checkbox(value: "New", onChanged: onChanged),
            TextField(decoration: InputDecoration(labelText: 'Full Name')),
            TextField(decoration: InputDecoration(labelText: 'Address')),
            TextField(decoration: InputDecoration(labelText: 'Contact Number')),

            const SizedBox(height: 16),
            const Text("Vehicle Information", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(decoration: InputDecoration(labelText: 'Plate Number')),
            TextField(decoration: InputDecoration(labelText: 'Make/Model')),
            TextField(decoration: InputDecoration(labelText: 'Year')),

            const SizedBox(height: 16),
            const Text("Application Details", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(decoration: InputDecoration(labelText: 'Type of Application')),
            TextField(decoration: InputDecoration(labelText: 'Route')),

            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Submit logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A2B47),
                ),
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
