import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:palette_generator/palette_generator.dart';
import '../../../../../core/constants/colors_names.dart';
import '../../../../../core/util/image_provide_function.dart';
import '../../../../../core/util/text_to_speech_function.dart';
import '../../models/color_model.dart';

class RecognizeColorFromCamera{
  String? _colorName;
  File? imageFile;
  Color color=const Color(0xFF000000);
  final GetImage _getImage= GetImage();
  Future<ColorModel> recognizeColor() async{
    imageFile= await _getImage.takePhoto();
    final imageProvider = FileImage(imageFile!);
    final palette = await PaletteGenerator.fromImageProvider(
      imageProvider, size: const Size(100, 100),
      // Set the size of the region for palette generation
      region: Offset.zero & const Size(50, 50),
    );

    // Get the dominant color from the generated palette
    color = palette.dominantColor!.color;
    String classifyColor(Color color) {
      String closestColor = "Unknown";
      double minDistance = double.infinity;
      colorMap.forEach((name, value) {
        double distance = ((color.red - value.red).abs() +
            (color.green - value.green).abs() +
            (color.blue - value.blue).abs()).toDouble();
        if (distance < minDistance) {
          minDistance = distance;
          closestColor = name;
        }
      });
      return closestColor;
    }

    Color? myColor = color;
    String colorName = classifyColor(myColor);
    _colorName = colorName;
    print(myColor);
    SpeakText().speak(colorName);
    return ColorModel(colorName: _colorName, color: color, imageFile: imageFile);
  }
}