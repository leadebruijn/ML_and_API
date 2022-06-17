import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_recognition/user.dart';
import 'package:http/http.dart' as http;
import 'user.dart';

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<User> _users = [];

  TextEditingController mycontroller = TextEditingController();

  bool textScanning = false;

  XFile? imageFile;

  String scannedText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Digit Recognition"),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (textScanning) const CircularProgressIndicator(),
                if (!textScanning && imageFile == null)
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.grey[300]!,
                  ),
                if (imageFile != null) Image.file(File(imageFile!.path)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.grey,
                            shadowColor: Colors.grey[400],
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.image,
                                  size: 20,
                                ),
                                // Text(
                                //   "Gallery",
                                //   style: TextStyle(
                                //       fontSize: 13, color: Colors.grey[600]),
                                // )
                              ],
                            ),
                          ),
                        )
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.grey,
                            shadowColor: Colors.grey[400],
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          onPressed: () {
                            getImage(ImageSource.camera);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 20,
                                ),
                                // Text(
                                //   "Camera",
                                //   style: TextStyle(
                                //       fontSize: 13, color: Colors.grey[600]),
                                // )
                              ],
                            ),
                          ),
                        )
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  child: TextField(
                    textAlign: TextAlign. center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Scanned Digits',
                    ),
                    controller: mycontroller,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 5, horizontal: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed :(){print('button clicked');},
                        icon: Icon(Icons.close),
                        color: Colors.red,
                      ),
                      IconButton(
                        onPressed :(){_getData(mycontroller.text);},
                        icon: Icon(Icons.check),
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 5, horizontal: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     Text(_users.isEmpty ? 'No User' : _users.first.name),
                    ],
                  ),
                ),
              ],
            )),
      )),
    );
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
	  scannedText = "Error occured while scanning";
      setState(() {});
    }
  }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textDetector();
    RecognisedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    String text = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        // scannedText = scannedText + line.text + "\n";
        text = text + line.text + "\n";
      }
    }
    scannedText = formatNumber(text);
    mycontroller.text = scannedText;
    textScanning = false;
    setState(() {});
  }

  String formatNumber(String number){
    List<String> list= ['?','G', 'l', '|', 'I', 's','S', 'o','O','z','Z','i','b','q'];
    List<String> splitNumber = number.split(""); // split die nommer op
    for(String item in list){
      for(String number in splitNumber){
        if(splitNumber.indexOf(item) != -1){
          int index = splitNumber.indexOf(item);
          String val = splitNumber[index];

          String replaceNum = handleNumberReplace(val);
          splitNumber[index] = replaceNum;
        }
      }
    }
    return splitNumber.join("");
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
    }
    return '';
  }

  Future<void> _getData(String number) async {
    // var url = 'https://jsonplaceholder.typicode.com/posts';
    var url = 'http://192.168.56.1/database.php?number='+number; //EMULATOR
    // var url = 'http://172.20.10.8:80/database.php'; //MOBILE
    // var url = 'http://10.0.2.207:80/database.php'; //MOBILE

    http.get(Uri.parse(url)).then((data) {
      return json.decode(data.body);
    }).then((data) {
      _users.clear();
      for (var json in data) {
        print(json);
        if(!_users.contains(json)){
          _users.add(User.fromJson(json));
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
  void initState() {
    super.initState();
  }
}
