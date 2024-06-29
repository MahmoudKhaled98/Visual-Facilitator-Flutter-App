import 'dart:io';
import 'package:equatable/equatable.dart';

class ObjectEntity extends Equatable {
  final String? objectName;
  final File? imageFile;

  const ObjectEntity({this.objectName, this.imageFile});

  @override
  List<Object?> get props {
    return [objectName, imageFile];
  }
}