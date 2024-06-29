import 'dart:io';
import 'dart:ui';
import 'package:equatable/equatable.dart';

class ColorEntity extends Equatable {
  final String? colorName;
  final Color? color;
  final File? imageFile;

  const ColorEntity({this.colorName, this.color,this.imageFile});

  @override
  List<Object?> get props {
    return [colorName, color, imageFile];
  }
}