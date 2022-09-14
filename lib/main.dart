import 'dart:convert';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_recognition/landing.dart';
import 'package:text_recognition/user.dart';
import 'package:http/http.dart' as http;
import 'Intro.dart';
import 'firstfourgroups.dart';
import 'user.dart';
import 'package:localregex/localregex.dart';
import 'package:camera/camera.dart';

//String regEx = "^[0-9]{8}$"; iets soos dit????
List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CameraController? controller;
  String imagePath = "";

  List<Firstfour> _firstfour = []; // database, user is 'n list

  TextEditingController mycontroller = TextEditingController(); // laat toe dat ek textfield beheer

  bool textScanning = false; //is image processing besig of nie, as besig = TRUE

  XFile? imageFile; // image van gallery of camera

  String scannedText = ""; // text wat terugkom van scanner af

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
              'SCAN TESTS',
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                'Poppins',
                color: Color(0xFF490808),
                fontWeight: FontWeight.w600,
                fontSize: 22,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          actions: [],
          elevation: 2,
        ),
      ),
      backgroundColor: Color(0xFFFFF6CD),
      body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 0),
                  child:
                  MaterialButton(
                    color: Color(0xFF490808),
                    shape: const CircleBorder(),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(3),
                      child: Text(
                        'i',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  )
      //             ElevatedButton(
      //               child: const Text(
      //                 'i',
      //                 style: TextStyle(fontSize: 20),
      //               ),
      //               onPressed: () {
      //                     Navigator.push(
      //                       context,
      //                       MaterialPageRoute(
      //                           builder: (context) => Intro()),
      //                     );
      //               },
      //               style: ElevatedButton.styleFrom(
      //
      //                   fixedSize: const Size(5, 5),
      //                   shape: const CircleBorder(),
      //
      //             ),
      // ),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Color(0xFF490808),
                  //   ),
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => Intro()),
                  //     );
                  //   },
                  //   child: const Text('HOW IT WORKS', style: TextStyle(color: Colors.white, letterSpacing: 2.5)),
                  // )
              ),
              SingleChildScrollView(
        child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (textScanning) const CircularProgressIndicator(), // scanning is besig = indicator
                    if (!textScanning && imageFile == null) // scanning nie besig = het ook nie image wat kan scan nie
                      Container(
                        // width: 300,
                        // height: 300,
                        // color: Colors.grey[200],
                        //   // decoration: BoxDecoration(
                        //   //     border: Border.all(color: Colors.black))
                        // // decoration: BoxDecoration(
                        // //   borderRadius: BorderRadius.circular(4),
                        // //   shape: BoxShape.rectangle,
                        // //   border: Border.all(
                        // //     color: Colors.black,
                        // //     width: 2,
                        // //   ),
                        // // ),
                        width: 250,
                        height: 350,
                        child: AspectRatio(
                          aspectRatio: controller!.value.aspectRatio,
                          child: CameraPreview(controller!),
                        ),

                      ),
                    if (imageFile != null) Image.file(File(imageFile!.path)), // daar is nou image, en wys nou image
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.only(top: 10),
                            // child: ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //     primary: Color(0xFFD3F6CC),
                            //     onPrimary: Colors.grey,
                            //     shadowColor: Colors.grey[400],
                            //     elevation: 10,
                            //     shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(8.0)),
                            //   ),
                            //   onPressed: () {
                            //     getImage(ImageSource.gallery);
                            //   },
                            //   child: Container(
                            //     margin: const EdgeInsets.symmetric(
                            //         vertical: 5, horizontal: 5),
                            //     child: Column(
                            //       mainAxisSize: MainAxisSize.min,
                            //       children: [
                            //         Icon(
                            //           Icons.image,
                            //           size: 20,
                            //         ),
                            //         // Text(
                            //         //   "Gallery",
                            //         //   style: TextStyle(
                            //         //       fontSize: 13, color: Colors.grey[600]),
                            //         // )
                            //       ],
                            //     ),
                            //   ),
                            // )
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.only(top: 10),
                            // child: ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //     primary: Color(0xFFD3F6CC),
                            //     onPrimary: Colors.grey,
                            //     shadowColor: Colors.grey[400],
                            //     elevation: 10,
                            //     shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(8.0)),
                            //   ),
                            //   onPressed: () {
                            //     getImage(ImageSource.camera);
                            //   },
                            //   child: Container(
                            //     margin: const EdgeInsets.symmetric(
                            //         vertical: 5, horizontal: 5),
                            //     child: Column(
                            //       mainAxisSize: MainAxisSize.min,
                            //       children: [
                            //         Icon(
                            //           Icons.camera_alt,
                            //           size: 20,
                            //         ),
                            //         // Text(
                            //         //   "Camera",
                            //         //   style: TextStyle(
                            //         //       fontSize: 13, color: Colors.grey[600]),
                            //         // )
                            //       ],
                            //     ),
                            //   ),
                            // )
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // IconButton(
                          //   onPressed :(){print('button clicked');},
                          //   icon: Icon(Icons.close),
                          //   color: Colors.red,
                          // ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              try {
                                final image = await controller!.takePicture();
                                setState(() {
                                  imagePath = image.path;
                                });
                                getRecognisedText(image);
                              } catch (e) {
                                print(e);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF490808), // Background color
                            ),
                            icon: Icon( // <-- Icon
                              Icons.camera_alt,
                              size: 24.0,
                              color: Color(0xFFFFFFFF),
                            ),
                            label: Text('CAPTURE', style: GoogleFonts.getFont(
    'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: Color(0xFFFFFFFF),
    ),), // <-- Text
                          ),

                          // IconButton(
                          //   // onPressed :(){_getData(mycontroller.text);}, //getdata function doen http request, connect na databases en doen... controller.text is wat in textfield staan
                          //   icon: Icon(Icons.check),
                          //   color: Colors.green,
                          //   onPressed: () async {
                          //     try {
                          //       final image = await controller!.takePicture();
                          //       setState(() {
                          //         imagePath = image.path;
                          //       });
                          //       getRecognisedText(image);
                          //     } catch (e) {
                          //       print(e);
                          //     }
                          //   },
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      child: TextField(
                        textAlign: TextAlign. center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Scanned Student Number',
                        ),
                        controller: mycontroller, //controller beheer die textfield
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(0xFF490808),
                        ),
                        // style: TextStyle(color: Color(0xFF490808), fontSize: 20, fontWeight: FontWeight.w500,letterSpacing: 1.5),
                      ),
                      ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // IconButton(
                          //   onPressed :(){print('button clicked');},
                          //   icon: Icon(Icons.close),
                          //   color: Colors.red,
                          // ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              try {
                                final image = await controller!.takePicture();
                                setState(() {
                                  imagePath = image.path;
                                });
                                getRecognisedText(image);
                              } catch (e) {
                                print(e);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF490808), // Background color
                            ),
                            icon: Icon( // <-- Icon
                              Icons.camera_alt,
                              size: 24.0,
                              color: Color(0xFFFFFFFF),
                            ),
                            label: Text('SEND', style: GoogleFonts.getFont(
                              'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xFFFFFFFF),
                            ),), // <-- Text
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Text(
                        'Output:',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xFF490808),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                         Text(_firstfour.isEmpty ? 'No User' : formatUsers(_firstfour),
                           style: GoogleFonts.getFont(
                             'Poppins',
                             fontWeight: FontWeight.w500,
                             fontSize: 12,
                             color: Color(0xFF490808),
                           ),
                           // style: GoogleFonts.getFont(
                           //   'Poppins',
                           //   fontWeight: FontWeight.w500,
                           //   letterSpacing: 1.5,
                           //   color: Color(0xFF490808),
                           // ),
                         )
                            //_users is 'n list soos ek define het. Check is users is empty is, (list met niks in nie) (bv as database nie oop is nie) as true, ... , as falsegaan deur list en kry EERSTE instance met ## numbber en gee name' het
                        ],
                      ),
                    ),
                  ],
                )),
      ),
            ],
          )),
    );
  }

  String formatUsers(List<Firstfour> firstfour) {
    String userString = '';
    firstfour.forEach((ff) {
      userString = userString + "${ff.studentnumber} - class ${ff.group}" + "\n";
    });
    return userString;
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getRecognisedText(pickedImage); //doen die function met die image
      }
    } catch (e) { //kan steeds aangaan as app error het
      textScanning = false;
      imageFile = null;
	  scannedText = "Error occured while scanning";
      setState(() {});
    }
  }

  void getRecognisedText(XFile image) async { // hier update ek scanned text, doen die function met die image (async function hardloop in agtergrond as dit gecall word)
    final inputImage = InputImage.fromFilePath(image.path); //inputImage is die image wat ek gestuur het
    final textDetector = GoogleMlKit.vision.textDetector(); //gebruik nou Google package, nou kan ek textdetection functions gebruik = instantiate textdetector object
    RecognisedText recognisedText = await textDetector.processImage(inputImage); //R=type van variable (die type word deur Google ML), r=naam van variable. Hy doen dit met inputImage
    await textDetector.close(); //hy moet geclose word, want ek is nou klaar (await: wag vir die om eers klaar te maak en vir response om terug te kom)
    scannedText = ""; //dit wat terugkom van scanner af
    String text = ""; //dis wat wys in inputfield
    // int blockindex = 0;
    // for (TextBlock block in recognisedText.blocks) { //Google ML define hierdie types
    //   print(block.text);
    //
    //   for (TextLine line in block.lines) {
    //     // scannedText = scannedText + line.text + "\n";
    //     text = text + line.text;// + "\n"; // sodat geen enters
    //   }
    //   blockindex++;
    // }

    text = text + recognisedText.blocks[recognisedText.blocks.length-1].text;
//roep hier al database
    scannedText = formatNumber(text); //format scanned text
    mycontroller.text = scannedText; //display scanned text in textfield //regex sal hier inkom probs??
    textScanning = false; // loading bar gaan weg
    setState(() {}); //update als, refresh
    print('call database');
    _getData(text);
  }
//hardcode....
  String formatNumber(String number){ //String1 = type  wat function return // Sring2 = dit wat function ontvang
    List<String> list= ['?','G', 'l', '|', 'I', 's','S', 'o','O','z','Z','i','b','q','a'];
    List<String> splitNumber = number.split(""); // split die nommer op // as mens n string split, verander dit in n string // "" hy moet als split, " " sal bv by elke spasie split //split the 'text'variable
    for(String item in list){
      for(String number in splitNumber){ // gaan deur gesplitde text 'list'
        if(splitNumber.indexOf(item) != -1){ //(daar is nie n posisie -1 nie) as die index nie -1 is nie, dan is een van die ?GL in die text
          int index = splitNumber.indexOf(item); //gee die index van die verkeerde ding (?GL)
          String val = splitNumber[index]; // kry die value wat dit is (is dit 'n ?/G/L)
          String replaceNum = handleNumberReplace(val); //handlenumberreplace function vervang verkeerde value met ...
          splitNumber[index] = replaceNum; //set waarde na regte value toe
        }
      }
    }
    return splitNumber.join("").replaceAll(" ", ""); //nou wil ek weer list in string verander (" " sou oral waar daar 'n spasie was gejooin het)//haal spasies uit
  }

  String handleNumberReplace(String num) {
    switch(num) {
      case '?':
        return '7';
        break;
      case 'l':
        return '1';
        break;
      case 'I':
        return '1';
        break;
      case 'z':
        return '2';
        break;
      case 'Z':
        return '2';
        break;
      case 'o':
        return '0';
        break;
      case 'O':
        return '0';
        break;
      case 's':
        return '5';
        break;
      case 'S':
        return '5';
        break;
      case 'b':
        return '6';
        break;
      case 'q':
        return '9';
        break;
      case 'a':
        return '9';
        break;
    }
    return ''; // maak seker daar word altyd n type string return, as dit nie hier is nie dan kry ek error
  }

  Future<void> _getData(String number) async {
    // String formattednumber = number.substring(number.length-4, number.length);
    // print(formattednumber);
    print(number);
    // var url = 'https://jsonplaceholder.typicode.com/posts';
    // var url = 'http://192.168.56.1/database.php?number='+formattednumber; //EMULATOR // +number = string interpolation, maak value van number deel van die string (concatenate) MOCK DATABASE
    // var url = 'http://192.168.1.10:80/database.php?number='+formattednumber; //MOBILE HUIS
    // var url = 'http://192.168.56.1:80/database.php?number='+formattednumber; //MOBILE FLAT MOCK DATABASE
    // var url = 'http://10.0.2.207:80/database.php?number='+formattednumber; //MOBILE
    // var url = 'http://192.168.1.10/database.php?number='+formattednumber;
    // var url = 'http://192.168.56.1/firstfourgroups.php?studentnumber='+formattednumber; //EMULATOR REAL DATABASE
    // var url = 'http://192.168.56.1/firstfourgroups.php?studentnumber='+number; //EMULATOR REAL DATABASE
    // var url = 'http://192.168.56.1/firstfourgroups.php?studentnumber='+number; //MOBILE REAL DATABASE
    // var url = 'http://10.0.2.59/firstfourgroups.php?studentnumber='+number;
    // var url = 'http://leadebruijn.infinityfreeapp.com/firstfourgroups_online.php?studentnumber='+number;
    // var url = 'http://leadebruijn.infinityfreeapp.com/firstfourgroups_online.php?studentnumber=25344293';
    var url = 'https://heruko-demo2022.herokuapp.com?studentnumber='+number;


    http.get(Uri.parse(url)).then((data) { //sit url in regte formaat
      print(data.body);
      return json.decode(data.body); //maak seker dis in json formaat
    }).then((data) {
      _firstfour.clear(); //clear list
      for (var json in data) { //gaan deur list, for loop hardloop nie as daar nie iets terugkom van die database af nie
        print(json); //vir testing
        if(!_firstfour.contains(json)){
          _firstfour.add(Firstfour.fromJson(json));
          setState(() {
          });
        }
      }
    })
        .catchError((e){ // user kan steeds aangaan al is daar error..
      print(e);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (cameras != null){
      controller = CameraController(cameras![0], ResolutionPreset.max);
    }

    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });

  }
}
