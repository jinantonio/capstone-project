import 'package:flutter/material.dart';

class UploadDocumentPage extends StatelessWidget {
  final String documentName;

  const UploadDocumentPage({super.key, required this.documentName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload $documentName'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.camera_alt, size: 80, color: Colors.grey),
              const SizedBox(height: 20),
              const Text(
                'Use camera to upload your document',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.camera_alt),
                label: const Text("Open Camera"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey[900]),
                onPressed: () {
                  // Simulated success
                  Navigator.pop(context, true);
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text("Cancel", style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
