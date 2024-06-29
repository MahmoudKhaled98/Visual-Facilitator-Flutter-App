import 'package:equatable/equatable.dart';

// Events are defined here
abstract class ObjectToSpeechEvent extends Equatable {
  const ObjectToSpeechEvent();

  @override
  List<Object?> get props => [];
}

class DetectMoneyObject extends ObjectToSpeechEvent {}
class DetectVehicleObject extends ObjectToSpeechEvent {}
class DetectVegetablesObject extends ObjectToSpeechEvent {}
class DetectFruitsObject extends ObjectToSpeechEvent {}
class DetectKitchenObject extends ObjectToSpeechEvent {}
class ClassifyColor extends ObjectToSpeechEvent {}
class AddressToSpeech extends ObjectToSpeechEvent {}
class TextToSpeech extends ObjectToSpeechEvent {}
class ObjectDetectionDone extends ObjectToSpeechEvent {
  final String filePath;

  const ObjectDetectionDone(this.filePath);
}
class AddressToSpeechDone extends ObjectToSpeechEvent {}

