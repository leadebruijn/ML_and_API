// // import '../flutter_flow/flutter_flow_theme.dart';
// // import '../flutter_flow/flutter_flow_util.dart';
// // import '../flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class HomePageWidget extends StatefulWidget {
//   const HomePageWidget({Key key}) : super(key: key);
//
//   @override
//   _HomePageWidgetState createState() => _HomePageWidgetState();
// }
//
// class _HomePageWidgetState extends State<HomePageWidget> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(40),
//         child: AppBar(
//           backgroundColor: Color(0xFFEFBC39),
//           automaticallyImplyLeading: true,
//           flexibleSpace: Align(
//             alignment: AlignmentDirectional(0, 0),
//             child: Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
//               child: Text(
//                 'HOW IT WORKS',
//                 style: GoogleFonts.getFont(
//                   'Poppins',
//                   color: Colors.white,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 22,
//                   fontStyle: FontStyle.normal,
//                   letterSpacing: 0.5,
//                 ),
//               ),
//             ),
//           ),
//           actions: [],
//           elevation: 2,
//         ),
//       ),
//       backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
//                       child: Text(
//                         'When hovering the camera above the front cover of the test, ensure that the hand written student number is the last text in the photo as shown below:',
//                         textAlign: TextAlign.justify,
//                         style: GoogleFonts.getFont(
//                           'Poppins',
//                           color: Color(0xFF490808),
//                           fontWeight: FontWeight.w600,
//                           fontSize: 10,
//                           fontStyle: FontStyle.normal,
//                           letterSpacing: 0.5,
//                         ),
//
//                         // FlutterFlowTheme.of(context).bodyText1.override(
//                         //   fontFamily: 'Poppins',
//                         //   color: Color(0xFF490808),
//                         //   fontSize: 10,
//                         // ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Image.network(
//                         'https://picsum.photos/seed/986/600',
//                         width: 100,
//                         height: 130,
//                         fit: BoxFit.cover,
//                       ),
//                       Text(
//                         'Incorrect',
//                         style: GoogleFonts.getFont(
//                           'Poppins',
//                           color: Color(0xFF490808),
//                           fontWeight: FontWeight.w600,
//                           fontSize: 10,
//                           fontStyle: FontStyle.normal,
//                           letterSpacing: 0.5,
//                         ),
//                         // FlutterFlowTheme.of(context).bodyText1.override(
//                         //   fontFamily: 'Poppins',
//                         //   color: Color(0xFF490808),
//                         //   fontSize: 10,
//                         // ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Image.network(
//                         'https://picsum.photos/seed/754/600',
//                         width: 100,
//                         height: 130,
//                         fit: BoxFit.cover,
//                       ),
//                       Text(
//                         'Correct',
//                         style:GoogleFonts.getFont(
//                           'Poppins',
//                           color: Color(0xFF490808),
//                           fontWeight: FontWeight.w600,
//                           fontSize: 10,
//                           fontStyle: FontStyle.normal,
//                           letterSpacing: 0.5,
//                         ),
//                         // FlutterFlowTheme.of(context).bodyText1.override(
//                         //   fontFamily: 'Poppins',
//                         //   color: Color(0xFF490808),
//                         //   fontSize: 10,
//                         // ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
//                       child: Text(
//                         'If the student number is in the correct position as indicated above, click the icon shown below:',
//                         textAlign: TextAlign.justify,
//                         style: GoogleFonts.getFont(
//                           'Poppins',
//                           color: Color(0xFF490808),
//                           fontWeight: FontWeight.w600,
//                           fontSize: 10,
//                           fontStyle: FontStyle.normal,
//                           letterSpacing: 0.5,
//                         ),
//                         // FlutterFlowTheme.of(context).bodyText1.override(
//                         //   fontFamily: 'Poppins',
//                         //   color: Color(0xFF490808),
//                         //   fontSize: 10,
//                         // ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Align(
//                 alignment: AlignmentDirectional(0, 0),
//                 child: Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       FFButtonWidget(
//                         onPressed: () {
//                           print('Button pressed ...');
//                         },
//                         text: 'CAPTURE',
//                         icon: Icon(
//                           Icons.photo_camera,
//                           size: 15,
//                         ),
//                         options: FFButtonOptions(
//                           width: 130,
//                           height: 40,
//                           color: Color(0xFF490808),
//                           textStyle:
//                           FlutterFlowTheme.of(context).subtitle2.override(
//                             fontFamily: 'Poppins',
//                             color: Colors.white,
//                           ),
//                           borderSide: BorderSide(
//                             color: Colors.transparent,
//                             width: 1,
//                           ),
//                           borderRadius: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
//                       child: Text(
//                         'Once the button has been clicked, the class number of the student will appear at the bottom of the screen. Ensure that the student number has been scanned correctly. If it is incorrect, adjust the position of the camera and press the capture button again untill the correct class number appears on the screen. If the application completely fails to detect the student number, manually type the student number in the provided textbox and click the icon shown below:',
//                         textAlign: TextAlign.justify,
//                         style: FlutterFlowTheme.of(context).bodyText1.override(
//                           fontFamily: 'Poppins',
//                           color: Color(0xFF490808),
//                           fontSize: 10,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     FFButtonWidget(
//                       onPressed: () {
//                         print('Button pressed ...');
//                       },
//                       text: 'SEND',
//                       icon: Icon(
//                         Icons.check,
//                         size: 15,
//                       ),
//                       options: FFButtonOptions(
//                         width: 130,
//                         height: 40,
//                         color: Color(0xFF490808),
//                         textStyle:
//                         FlutterFlowTheme.of(context).subtitle2.override(
//                           fontFamily: 'Poppins',
//                           color: Colors.white,
//                         ),
//                         borderSide: BorderSide(
//                           color: Colors.transparent,
//                           width: 1,
//                         ),
//                         borderRadius: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
//                       child: Text(
//                         'Use this application to quickly sort the tests into the correct class groups before making it available for collection by the students.',
//                         textAlign: TextAlign.justify,
//                         style: FlutterFlowTheme.of(context).bodyText1.override(
//                           fontFamily: 'Poppins',
//                           color: Color(0xFF490808),
//                           fontSize: 10,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
