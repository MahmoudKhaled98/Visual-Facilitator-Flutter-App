import 'dart:ui';

import 'package:flutter_tts/flutter_tts.dart';

class SpeakText  {
  final  FlutterTts tts = FlutterTts();
  Future speak(String text) async{
    // Set language to Arabic explicitly
    await tts.setLanguage("ar-EG"); // Use "ar-EG" for Egyptian Arabic
    try {
      await tts.getEngines;
      await tts.speak(text);
      tts.setSpeechRate(0.7);
      await tts.awaitSpeakCompletion(true);
      tts.cancelHandler?.call();
    } catch (error) {
      print("Error speaking text: $error");
      // Display a user-friendly message or guide them to resolve the issue.
    }

  }

}