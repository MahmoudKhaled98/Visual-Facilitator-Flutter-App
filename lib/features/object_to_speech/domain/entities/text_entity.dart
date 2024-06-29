import 'dart:io';
import 'package:equatable/equatable.dart';

class TextEntity extends Equatable {
  final String? text;
  final File? imageFile;

  const TextEntity({this.text, this.imageFile});

  @override
  List<Object?> get props {
    return [text, imageFile];
  }
}