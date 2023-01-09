import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const _App());
}

class _App extends StatefulWidget {
  const _App({super.key});

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  String resultText = 'here';

  @override
  Widget build(BuildContext context) {
    final ImagePicker imagePicker = ImagePicker();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    final XFile? image =
                        await imagePicker.pickImage(source: ImageSource.camera);
                    if (image != null) {
                      InputImage inputImage =
                          InputImage.fromFilePath(image.path);
                      final textRecognizer =
                          TextRecognizer(script: TextRecognitionScript.korean);
                      final RecognizedText recognizedText =
                          await textRecognizer.processImage(inputImage);

                      String text = recognizedText.text;
                      setState(() {
                        resultText = text;
                      });
                      // for (TextBlock block in recognizedText.blocks) {
                      //   // final Rect rect = block.
                      //   // final List<Offset> cornerPoints = block.cornerPoints;
                      //   final String text = block.text;
                      //   final List<String> languages =
                      //       block.recognizedLanguages;

                      //   for (TextLine line in block.lines) {
                      //     // Same getters as TextBlock
                      //     for (TextElement element in line.elements) {
                      //       // Same getters as TextBlock
                      //     }
                      //   }
                      // }
                    }
                  },
                  child: Text("choose image")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  resultText,
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
