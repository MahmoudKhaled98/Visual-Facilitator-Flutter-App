import 'dart:io';

import 'package:equatable/equatable.dart';

// States are defined here
abstract class ObjectToSpeechState extends Equatable {
  const ObjectToSpeechState();

  @override
  List<Object?> get props => [];
}

class ObjectToSpeechStateInitial extends ObjectToSpeechState {}

class ObjectToSpeechStateLoading extends ObjectToSpeechState {}


class ObjectToSpeechStateObjectDetected extends ObjectToSpeechState {
  final String? objectName;
  final File? imageFile;

  const ObjectToSpeechStateObjectDetected({required this.objectName,required this.imageFile});
}
class ObjectToSpeechStateColorClassified extends ObjectToSpeechState {
  final String? colorName;
  final File? imageFile;

  const ObjectToSpeechStateColorClassified({required this.colorName,required this.imageFile});
}
class ObjectToSpeechStateAddressClassified extends ObjectToSpeechState {
  final String? address;

  const ObjectToSpeechStateAddressClassified({required this.address});
}
class ObjectToSpeechStateTextSpeech extends ObjectToSpeechState {
  final String? text;
  final File? imageFile;
  const ObjectToSpeechStateTextSpeech({required this.text, required this.imageFile});
}




class ObjectToSpeechStateError extends ObjectToSpeechState {
  final String message;

  const ObjectToSpeechStateError({required this.message});
}


