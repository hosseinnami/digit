// import 'package:flutter/material.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:image_picker/image_picker.dart';
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }
//-----------------پردازش تصاویر روی کارت ویزیت و خواندن متن روی آن
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   String _scannedText = '';
//   final ImagePicker _picker = ImagePicker();
//
//   Future<void> _scanText(XFile? imageFile) async {
//     if (imageFile == null) return;
//
//     final inputImage = InputImage.fromFilePath(imageFile.path);
//     final textDetector = GoogleMlKit.vision.textDetector();
//     final RecognisedText recognisedText = await textDetector.processImage(inputImage);
//     await textDetector.close();
//
//     setState(() {
//       _scannedText = recognisedText.text;
//     });
//   }
//
//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     await _scanText(pickedFile);
//   }
//
//   Future<void> _takePicture() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera);
//     await _scanText(pickedFile);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Business Card Scanner'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: Text('Pick Image from Gallery'),
//             ),
//             ElevatedButton(
//               onPressed: _takePicture,
//               child: Text('Take Picture with Camera'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               _scannedText,
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
