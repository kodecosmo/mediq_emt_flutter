import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'patient_details_page.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200.0), // Adding top padding here
            child: Text(
              'Notifications',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          NotificationCard(),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Emergency alert',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {},
                ),
              ],
            ),
            Text(
              'Age - About 35',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            Text(
              'Male',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            Text(
              'Possible choke',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
               Navigator.of(context).pushNamed('/patientDetails');
              },
              child: Text(
                'Connect',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 16 , color: Colors.black54, fontWeight: FontWeight.bold),


                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
