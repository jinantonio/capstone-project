import 'package:flutter/material.dart';
import 'application_form.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2B47),
        automaticallyImplyLeading: false,
        title: Image.asset(
          'images/PermitGo(LOGO).png',
          height: 90,
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
        centerTitle: false,
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          children: [
            // Dashboard Header
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 24.0),
              child: Column(
                children: [
                  const Text(
                    'Dashboard',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3.0,
                    width: 120.0,
                    color: Colors.blue,
                    margin: const EdgeInsets.only(top: 4.0),
                  ),
                ],
              ),
            ),

            // Menu Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  // First row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: _buildMenuItem(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.green,
                            size: 32.0,
                          ),
                          label: 'New Application',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ApplicationFormScreen()),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: _buildMenuItem(
                          icon: const Icon(
                            Icons.refresh,
                            color: Colors.green,
                            size: 28.0,
                          ),
                          label: 'Renew',
                          onTap: () {}, // Add functionality here
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),

                  // Second row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: _buildMenuItem(
                          icon: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 32.0,
                                width: 24.0,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              const Positioned(
                                bottom: -2,
                                right: -2,
                                child: CircleAvatar(
                                  radius: 6.0,
                                  backgroundColor: Colors.black,
                                ),
                              )
                            ],
                          ),
                          label: 'Certification',
                          onTap: () {}, // Add functionality here
                        ),
                      ),
                      Expanded(
                        child: _buildMenuItem(
                          icon: Container(
                            width: 32.0,
                            height: 32.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'RETIRE',
                                style: TextStyle(
                                  fontSize: 6.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          label: 'Retirement',
                          onTap: () {}, // Add functionality here
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),

                  // Third row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: _buildMenuItem(
                          icon: const Icon(
                            Icons.notifications_outlined,
                            size: 28.0,
                          ),
                          label: 'Notification',
                          onTap: () {}, // Add functionality here
                        ),
                      ),
                      Expanded(
                        child: _buildMenuItem(
                          icon: const Icon(
                            Icons.settings,
                            size: 28.0,
                          ),
                          label: 'Settings',
                          onTap: () {}, // Add functionality here
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Divider
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: Container(
                height: 1,
                color: Colors.grey[300],
              ),
            ),

            // Application Status
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const Text(
                    'Application Status',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 40.0,
        color: const Color(0xFF1A2B47),
      ),
    );
  }

  /// ✅ Updated to accept onTap
  Widget _buildMenuItem({
    required Widget icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 48,
            width: 48,
            child: Center(child: icon),
          ),
          const SizedBox(height: 6.0),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
