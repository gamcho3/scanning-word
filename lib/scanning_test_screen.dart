import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class ScanningTextTest extends StatefulWidget {
  const ScanningTextTest({
    super.key,
  });

  @override
  State<ScanningTextTest> createState() => _ScanningTextTestState();
}

class _ScanningTextTestState extends State<ScanningTextTest> {
  @override
  Widget build(BuildContext context) {
    String resultText = 'here';
    final ImagePicker imagePicker = ImagePicker();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final XFile? image =
                      await imagePicker.pickImage(source: ImageSource.camera);
                  if (image != null) {
                    InputImage inputImage = InputImage.fromFilePath(image.path);
                    final textRecognizer =
                        TextRecognizer(script: TextRecognitionScript.korean);
                    final RecognizedText recognizedText =
                        await textRecognizer.processImage(inputImage);

                    String text = recognizedText.text;
                    setState(() {
                      resultText = text;
                    });
                  }
                },
                child: Text("choose image")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                " resultText",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
