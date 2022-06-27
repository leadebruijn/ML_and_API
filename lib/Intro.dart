import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_recognition/main.dart';

//
// class Intro extends StatelessWidget {
//   // const Intro({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Center(
//         child: Text('HOW IT WORKS'),
//       )),
//       // body: Column(children: [
//       //   Center(
//       //     child: Column(
//       //       children: <Widget>[
//       //         Image.asset('assets/vb.jpg'),
//       //         Text(
//       //           'A tablet is a wireless touch screen computer that is smaller than a notebook but larger than a smartphone.',
//       //           style: TextStyle(fontSize: 20.0),
//       //         )
//       //       ],
//       //     ),
//       //   ),
//       //   ElevatedButton(
//       //     onPressed: () {
//       //       Navigator.push(
//       //         context,
//       //         MaterialPageRoute(builder: (context) => MyHomePage()),
//       //       );
//       //     },
//       //     child: const Text('Start scanning!'),
//       //   ),
//       // ]),
//
//     );
//   }
// }
// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
// import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Color(0xFFBEEAF3),
          automaticallyImplyLeading: false,
          flexibleSpace: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              'HOW IT WORKS',
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                'Poppins',
                color: Colors.black,
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 8, 8),
                          child: ClipRRect(
                            // borderRadius: BorderRadius.circular(7),
                            child: Container(
                              width: 150,
                              height: 250,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                ),
                              ),
                              child: Image.asset(
                                'assets/vb.jpg',
                                // width: 150,
                                // height: 250,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
                          child: Text(
                            'This is an example of the front cover of a test',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
                        child: Text(
                          'When scanning the front cover, it is important to take the picture correctly as shown below.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child:
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: 2,
                                ),
                              children: [
                                TextSpan(
                                  text: 'The student number should be at the bottom of the picture as shown in ',
                                ),
                                TextSpan(
                                  text: 'green',
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    letterSpacing: 2,
                                    color: Colors.green,
                                  ),
                                ),
                                TextSpan(
                                  text: ' and no text  should appear after the student number as shown in ',
                                ),
                                TextSpan(
                                  text: 'red',
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    letterSpacing: 2,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ]
                            ),

                          ),
                        )
                      // Text(
                      //   'The student number should be at the bottom of the picture as shown in green and no text  should appear after the student number as shown in red',
                      //   textAlign: TextAlign.center,
                      //   style: GoogleFonts.getFont(
                      //     'Poppins',
                      //     fontWeight: FontWeight.w500,
                      //     fontSize: 10,
                      //     letterSpacing: 2,
                      //   ),
                      // ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: ClipRRect(
                            // borderRadius: BorderRadius.circular(7),
                            child: Container(
                              width: 150,
                              height: 170,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2, color: Colors.green,
                                ),
                              ),
                              child: Image.asset(
                                'assets/reg.jpg',
                                // width: 150,
                                // height: 250,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      // borderRadius: BorderRadius.circular(7),
                      child: Container(
                        width: 150,
                        height: 170,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2, color: Colors.deepOrange,
                          ),
                        ),
                        child: Image.asset(
                          'assets/verkeerd.jpg',
                          width: 150,
                          height: 250,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                // Row(
                //   mainAxisSize: MainAxisSize.max,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'The student number should be at the bottom of the picture as shown in green and no text  should appear after the student number as shown in red',
                //         textAlign: TextAlign.center,
                //         style: GoogleFonts.getFont(
                //           'Poppins',
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFD3F6CC),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                              );
                            },
                            child: const Text('Start Scanning',style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,letterSpacing: 2.5,)),
                          )
                          // FFButtonWidget(
                        // textAlign: TextAlign.center,
                        // style: GoogleFonts.getFont(
                        //   'Poppins',
                        //   fontWeight: FontWeight.w500,
                        // ),
                          //   text: 'Start Scanning!',
                          //   options: FFButtonOptions(
                          //     width: 130,
                          //     height: 40,
                          //     color: Color(0xFFD3F6CC),
                          //     textStyle: TextStyle(
                          //       color: Colors.black,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //     elevation: 4,
                          //     borderSide: BorderSide(
                          //       color: Colors.transparent,
                          //       width: 1,
                          //     ),
                          //     borderRadius: 12,
                          //   ),
                          // ),
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
