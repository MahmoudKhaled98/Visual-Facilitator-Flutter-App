import 'dart:io';
import '../../domain/entities/text_entity.dart';

class TextModel extends TextEntity{

  const TextModel({String? text,File? imageFile}):super(text:text,imageFile: imageFile);
}