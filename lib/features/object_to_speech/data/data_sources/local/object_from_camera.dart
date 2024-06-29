import 'dart:async';
import 'dart:io';
import 'package:tflite_v2/tflite_v2.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/image_provide_function.dart';
import '../../../../../core/util/text_to_speech_function.dart';
import '../../models/object_model.dart';

class ObjectFromCamera {
  Map? _recognitions;
  String? _objectName;
  File? imageFile;
  Color color = const Color(0xFF000000);
  final GetImage _getImage= GetImage();
  Future<ObjectModel> detectObject(String model, String labels) async {
    imageFile = await _getImage.takePhoto();
    await Tflite.loadModel(
      model: model,
      labels: labels,
    );
    var recognitions = await Tflite.runModelOnImage(
      path: imageFile!.path,
      numResults: 6,
      threshold: 0.06,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    _recognitions = recognitions?.first;
    if (_recognitions!.containsKey('label')) {
      _objectName = _recognitions?['label'];
      SpeakText().speak(_objectName!);

    } else {
      _objectName = 'Null';
     await  SpeakText().speak("يرجى إعادة المحاولة");
    }

    Tflite.close();

    return ObjectModel(objectName: _objectName, imageFile: imageFile);
  }
}
