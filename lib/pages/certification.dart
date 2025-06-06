import 'package:flutter/material.dart';

void main() => runApp(BugueyMayorsPermitApp());

class BugueyMayorsPermitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MayorsPermitPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MayorsPermitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo at the top
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('images/buguey(logo).png'), // Update with your asset path
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Republic of the Philippines\nProvince of Cagayan\nMUNICIPALITY OF BUGUEY',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'OFFICE OF THE MAYOR',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              "MAYOR'S PERMIT",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 16),
            // Permit details
            Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.13,
                  child: Image.asset(
                    'images/buguey(logo).png', 
                    width: 320,
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  Text('Business Trade Name: __________________'),
                  SizedBox(height: 8),
                  Text('Kind of Business: __________________'),
                  SizedBox(height: 8),
                  Text('Owner/Proprietorship: __________________'),
                  SizedBox(height: 8),
                  Text('location of Business: __________________'),
                  SizedBox(height: 8),
                 ]
                ),
              ],
            ),
            SizedBox(height: 18),
            
            Text(
              'PERMIT IS HEREBY GRANTED to the above-mentioned person to engage in the above-stated business after payment of the required License/Permit Fees and compliance with the ordinances, rules and regulations governing the business trade.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
            // Date and Place (SPLIT INTO TWO LINES)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('GIVEN this ', style: TextStyle(fontSize: 14)),
                    Container(
                      width: 40,
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.5, color: Colors.black),
                        ),
                      ),
                    ),
                    Text(' day of ', style: TextStyle(fontSize: 14)),
                    Container(
                      width: 80,
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.5, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  'at Buguey,',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  ' Cagayan, Philippines.',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 16),
            
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage('assets/buguey_building.jpg'), 
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
      
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 24),
                  Text(
                    'LICERIO MILLARE ANTIPORDA III',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    'Municipal Mayor',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('O.R. Number:', style: TextStyle(fontSize: 13)),
                Container(width: 80, height: 18, color: const Color.fromARGB(255, 255, 255, 255)),
                Text('No: 4754', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Date of Issue:', style: TextStyle(fontSize: 13)),
                SizedBox(width: 8),
                Container(width: 80, height: 18, color: const Color.fromARGB(255, 255, 255, 255)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Amount Paid:', style: TextStyle(fontSize: 13)),
                SizedBox(width: 8),
                Container(width: 80, height: 18, color: const Color.fromARGB(255, 255, 255, 255)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Date of Expiry:', style: TextStyle(fontSize: 13)),
                SizedBox(width: 8),
                Container(width: 80, height: 18, color: const Color.fromARGB(255, 255, 255, 255)),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Note: This must bear the Original Signature of the Mayor',
              style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class PermitField extends StatelessWidget {
  final String label;
  const PermitField({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 20,
              color: Colors.grey[200],
            ),
          ),
        ],
      ),
    );
  }
}
