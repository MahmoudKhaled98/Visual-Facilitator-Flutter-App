import 'dart:io';
import 'package:eye_helper/features/object_to_speech/data/models/text_model.dart';
import '../../../../../core/util/image_provide_function.dart';
import '../../../../../core/util/text_to_speech_function.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';

class RecognizeTextFromCamera{
  File? imageFile;
  String recognizedText="";
  final GetImage _getImage= GetImage();

  Future<TextModel>  recognizeText() async{
    imageFile= await _getImage.takePhoto();
     recognizedText = await FlutterTesseractOcr.extractText(imageFile!.path,language: 'ara+eng',args: {
       "psm": "4",
       "preserve_interword_spaces": "1",
     });
    SpeakText().speak(recognizedText);
    return TextModel(text: recognizedText,imageFile: imageFile);
  }
}
