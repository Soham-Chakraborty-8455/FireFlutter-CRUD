import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController namecontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  TextEditingController agecontroller=TextEditingController();

  String dropdownvalue = 'Enter Department';
  var items = [
    'Enter Department',
    'HR',
    'Finance',
    'Housekeeping',
    'Marketing',
  ];
  File? _image;
  Future<void> getFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imagetemporary = File(image.path);
    setState(() {
      this._image=imagetemporary;
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('SCREEEN 1', style: TextStyle(color: Colors.black, fontSize: 24.00)),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back),
              label: 'SCREEN 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward),
              label: 'SCREEN 2',
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40.00),
            //name
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.00),
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(30.00)
              ),
              child: TextField(
                controller: namecontroller,
                showCursor: true,
                decoration: const InputDecoration(
                  errorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(left:20.00),
                  labelText: 'Enter Name',
                  labelStyle: TextStyle(
                    color: Color(0xFF747677),
                  ),
                ),
              ),
            ),
            SizedBox(
              height:20.00,
            ),
            //phone
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.00),
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(30.00)
              ),
              child: TextField(
                controller: phonecontroller,
                showCursor: true,
                decoration: const InputDecoration(
                  errorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(left:20.00),
                  labelText: 'Enter Phone',
                  labelStyle: TextStyle(
                    color: Color(0xFF747677),
                  ),
                ),
              ),
            ),
            SizedBox(
              height:20.00,
            ),
            //age
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.00),
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(30.00)
              ),
              child: TextField(
                controller: agecontroller,
                showCursor: true,
                decoration: const InputDecoration(
                  errorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(left:20.00),
                  labelText: 'Enter Age',
                  labelStyle: TextStyle(
                    color: Color(0xFF747677),
                  ),
                ),
              ),
            ),
            SizedBox(
              height:20.00,
            ),
            //department
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.00),
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(30.00)
              ),
              child: DropdownButton(
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.00),
                      child: Text(items, style: TextStyle(color: Color(0xFF747677))),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
            SizedBox(
              height:20.00,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.00),
              child: ElevatedButton(
                  onPressed: getFromGallery,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Upload an Image'),
                  )
              ),
            ),
            _image!=null ? Image.file(_image!, height: 250, width: 250, fit: BoxFit.cover): Text("Upload an Image", textAlign: TextAlign.center),
            SizedBox(
              height:10.00,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.00),
              child: ElevatedButton(
                  onPressed: (){},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Save'),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

