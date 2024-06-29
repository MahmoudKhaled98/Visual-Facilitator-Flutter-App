import 'dart:io';
import '../../domain/entities/object_entity.dart';

class ObjectModel extends ObjectEntity{

  const ObjectModel({String? objectName,File? imageFile}):super(objectName:objectName,imageFile: imageFile);
}