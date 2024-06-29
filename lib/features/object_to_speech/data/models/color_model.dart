import 'dart:io';
import 'dart:ui';
import '../../domain/entities/color_entity.dart';

class ColorModel extends ColorEntity {
  const ColorModel({String? colorName, Color? color, File? imageFile})
      : super(colorName: colorName, color: color, imageFile: imageFile);
}
