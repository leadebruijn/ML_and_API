import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_recognition/Intro.dart';
import 'package:google_fonts/google_fonts.dart';

class Landing extends StatelessWidget {
  // const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Color(0xFFEFBC39),
          automaticallyImplyLeading: false,
          flexibleSpace: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              'WELCOME',
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                'Poppins',
                color: Color(0xFF490808),
                fontWeight: FontWeight.w600,
                fontSize: 22,
                fontStyle: FontStyle.normal,
                letterSpacing: 3,
              ),
            ),
          ),
          actions: [],
          elevation: 2,
        ),
      ),
      backgroundColor: Color(0xFFFFF6CD),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'This application is for scanning handwritten student numbers and returning the class number of the student',
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                'Poppins',
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
                fontSize: 12,
                color: Color(0xFF490808),
              ),
            ),
          ),
          Center(
            child:
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF490808),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Intro()),
                );
              },
              child: const Text('HOW IT WORKS', style: TextStyle(color: Colors.white, letterSpacing: 2.5)),
            )
          ),
          Text(
            'by Lea de Bruijn',
            textAlign: TextAlign.center,
            style: GoogleFonts.getFont(
              'Poppins',
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
              fontSize: 8,
                color: Color(0xFF490808)
            ),
          ),
        ],
      ),
    );
  }
}
