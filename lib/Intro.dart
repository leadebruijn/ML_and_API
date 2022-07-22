import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_recognition/main.dart';
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
      backgroundColor: Color(0xFFFAF3FF),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 4),
                      child: Container(
                        constraints: BoxConstraints(
                          maxHeight: double.infinity,
                        ),
                        width: MediaQuery.of(context).size.width,
                        // height: 200,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF6CD),
                          borderRadius: BorderRadius.circular(4),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 4),
                              child: Text(
                                'Below is an example of the front cover of a test:',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 4, 8, 8),
                              child: Container(
                                width: 150,
                                height: 200,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.black,
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: double.infinity,
                    ),
                    width: MediaQuery.of(context).size.width,
                    // height: 250,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF6CD),
                      borderRadius: BorderRadius.circular(4),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      letterSpacing: 1.5,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            'When scanning the handwritten student number of a paper, it is important to note that the student number must appear at the bottom of the page',
                                      ),
                                      TextSpan(
                                        text: ' (as shown in green)',
                                        style: GoogleFonts.getFont(
                                          'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Colors.green,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            ' and no text should appear below the student number',
                                      ),
                                      TextSpan(
                                        text: ' (as shown in red)',
                                        style: GoogleFonts.getFont(
                                          'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 150,
                                height: 200,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.green,
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/reg.jpg',
                                  // width: 150,
                                  // height: 250,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                width: 150,
                                height: 200,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.red,
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/verkeerd.jpg',
                                  // width: 150,
                                  // height: 250,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Generated code for this Container Widget...
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 8),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: double.infinity,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF6CD),
                      borderRadius: BorderRadius.circular(4),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 4),
                          child: Text(
                            'Once the digit recognition has started and the digit is correctly identified, click the check icon. If the recognised digit is incorrect, edit the text field and ensure the last 4 digits are correct before pressing the check button.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.check,
                          color: Color(0xFF38B635),
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 8),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: double.infinity,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF6CD),
                      borderRadius: BorderRadius.circular(4),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 4),
                          child: Text(
                            'Once the check button is pressed, the class number of the student number or possible student numbers will appear at the bottom of the screen.\n\nClick below to start scanning:',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
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
                              child: const Text('Start Scanning!', style: TextStyle(color: Colors.black, letterSpacing: 2.5)),
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // return Scaffold(
    //   // key: scaffoldKey,
    //   appBar: PreferredSize(
    //     preferredSize: Size.fromHeight(50),
    //     child: AppBar(
    //       backgroundColor: Color(0xFFBEEAF3),
    //       automaticallyImplyLeading: false,
    //       flexibleSpace: Align(
    //         alignment: AlignmentDirectional(0, 0),
    //         child: Text(
    //           'HOW IT WORKS',
    //           textAlign: TextAlign.center,
    //           style: GoogleFonts.getFont(
    //             'Poppins',
    //             color: Colors.black,
    //             fontWeight: FontWeight.w600,
    //             fontSize: 22,
    //             fontStyle: FontStyle.normal,
    //             letterSpacing: 3,
    //           ),
    //         ),
    //       ),
    //       actions: [],
    //       elevation: 2,
    //     ),
    //   ),
    //   backgroundColor: Color(0xFFFFF6CD),
    //   body: SafeArea(
    //     child: GestureDetector(
    //       onTap: () => FocusScope.of(context).unfocus(),
    //       child: SingleChildScrollView(
    //         child: Column(
    //           mainAxisSize: MainAxisSize.max,
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             Align(
    //               alignment: AlignmentDirectional(0, 0),
    //               child: Row(
    //                 mainAxisSize: MainAxisSize.max,
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 children: [
    //                   Align(
    //                     alignment: AlignmentDirectional(0, 0),
    //                     child: Padding(
    //                       padding: EdgeInsetsDirectional.fromSTEB(20, 20, 8, 8),
    //                       child: ClipRRect(
    //                         // borderRadius: BorderRadius.circular(7),
    //                         child: Container(
    //                           width: 150,
    //                           height: 250,
    //                           decoration: BoxDecoration(
    //                             border: Border.all(
    //                               width: 2,
    //                               color: Colors.black,
    //                             ),
    //                           ),
    //                           child: Image.asset(
    //                             'assets/vb.jpg',
    //                             // width: 150,
    //                             // height: 250,
    //                             fit: BoxFit.fill,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   Expanded(
    //                     child: Padding(
    //                       padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
    //                       child: Text(
    //                         'This is an example of the front cover of a test',
    //                         textAlign: TextAlign.center,
    //                         style: GoogleFonts.getFont(
    //                           'Poppins',
    //                           fontWeight: FontWeight.w500,
    //                           letterSpacing: 2,
    //                           fontSize: 12,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Row(
    //               mainAxisSize: MainAxisSize.max,
    //               children: [
    //                 Expanded(
    //                   child: Padding(
    //                     padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
    //                     child: Text(
    //                       'When scanning the front cover, it is important to take the picture correctly as shown below.',
    //                       textAlign: TextAlign.center,
    //                       style: GoogleFonts.getFont(
    //                         'Poppins',
    //                         fontWeight: FontWeight.w500,
    //                         letterSpacing: 2,
    //                         fontSize: 12,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             Row(
    //               mainAxisSize: MainAxisSize.max,
    //               children: [
    //                 Expanded(
    //                   child:
    //                     Padding(
    //                       padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
    //                       child: RichText(
    //                         textAlign: TextAlign.center,
    //                         text: TextSpan(
    //                             style: GoogleFonts.getFont(
    //                               'Poppins',
    //                               fontWeight: FontWeight.w500,
    //                               fontSize: 12,
    //                               letterSpacing: 2,
    //                               color: Colors.black,
    //                             ),
    //                           children: [
    //                             TextSpan(
    //                               text: 'The student number should be at the bottom of the picture as shown in ',
    //                             ),
    //                             TextSpan(
    //                               text: 'green',
    //                               style: GoogleFonts.getFont(
    //                                 'Poppins',
    //                                 fontWeight: FontWeight.w500,
    //                                 fontSize: 12,
    //                                 letterSpacing: 2,
    //                                 color: Colors.green,
    //                               ),
    //                             ),
    //                             TextSpan(
    //                               text: ' and no text  should appear after the student number as shown in ',
    //                             ),
    //                             TextSpan(
    //                               text: 'red',
    //                               style: GoogleFonts.getFont(
    //                                 'Poppins',
    //                                 fontWeight: FontWeight.w500,
    //                                 fontSize: 12,
    //                                 letterSpacing: 2,
    //                                 color: Colors.deepOrange,
    //                               ),
    //                             ),
    //                           ]
    //                         ),
    //
    //                       ),
    //                     )
    //                 ),
    //               ],
    //             ),
    //             Row(
    //               mainAxisSize: MainAxisSize.max,
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 Column(
    //                   mainAxisSize: MainAxisSize.max,
    //                   children: [
    //                     Padding(
    //                       padding: EdgeInsetsDirectional.fromSTEB(0, 8, 20, 8),
    //                       child: ClipRRect(
    //                         // borderRadius: BorderRadius.circular(7),
    //                         child: Container(
    //                           width: 150,
    //                           height: 170,
    //                           decoration: BoxDecoration(
    //                             border: Border.all(
    //                               width: 2, color: Colors.green,
    //                             ),
    //                           ),
    //                           child: Image.asset(
    //                             'assets/reg.jpg',
    //                             // width: 150,
    //                             // height: 250,
    //                             fit: BoxFit.fill,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 ClipRRect(
    //                   // borderRadius: BorderRadius.circular(7),
    //                   child: Container(
    //                     width: 150,
    //                     height: 170,
    //                     decoration: BoxDecoration(
    //                       border: Border.all(
    //                         width: 2, color: Colors.deepOrange,
    //                       ),
    //                     ),
    //                     child: Image.asset(
    //                       'assets/verkeerd.jpg',
    //                       width: 150,
    //                       height: 250,
    //                       fit: BoxFit.fill,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             Row(
    //               mainAxisSize: MainAxisSize.max,
    //               children: [
    //                 Expanded(
    //                   child: Padding(
    //                     padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
    //                     child: Text(
    //                       'Click below to start scanning!',
    //                       textAlign: TextAlign.center,
    //                       style: GoogleFonts.getFont(
    //                         'Poppins',
    //                         fontWeight: FontWeight.w500,
    //                         letterSpacing: 2,
    //                         fontSize: 12,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             Row(
    //               mainAxisSize: MainAxisSize.max,
    //               children: [
    //                 Expanded(
    //                   child: Padding(
    //                       padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
    //                       child: ElevatedButton(
    //                         style: ElevatedButton.styleFrom(
    //                           primary: Color(0xFFD3F6CC),
    //                         ),
    //                         onPressed: () {
    //                           Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) => MyHomePage()),
    //                           );
    //                         },
    //                         child: const Text('Start Scanning',style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,letterSpacing: 2.5,)),
    //                       )
    //                       ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
