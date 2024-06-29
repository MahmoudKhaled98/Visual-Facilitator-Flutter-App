import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:eye_helper/features/object_to_speech/domain/entities/address_entity.dart';
import 'package:eye_helper/features/object_to_speech/domain/entities/text_entity.dart';
import 'package:eye_helper/features/object_to_speech/domain/use_cases/recognize_text_usecase.dart';
import '../../../../core/util/text_to_speech_function.dart';
import '../../domain/entities/color_entity.dart';
import '../../domain/entities/object_entity.dart';
import '../../domain/use_cases/get_address_usecase.dart';
import '../../domain/use_cases/get_object_from_camera_usecase.dart';
import '../../domain/use_cases/recognize_color_usecase.dart';
import 'object_to_speech_event.dart';
import 'object_to_speech_state.dart';
import '../../../../../core/constants/models_and_labels.dart';

class ObjectToSpeechBloc
    extends Bloc<ObjectToSpeechEvent, ObjectToSpeechState> {
  final GetObjFromCamUseCase _getObjFromCamUseCase;
  final RecognizeColorFromCamUseCase _recognizeColorFromCamUseCase;
  final GetAddressUseCase _getAddressUseCase;
  final RecognizeTextFromCamUseCase _recognizeTextFromCamUseCase;

  ObjectToSpeechBloc(
      this._getObjFromCamUseCase,
      this._recognizeColorFromCamUseCase,
      this._getAddressUseCase,
      this._recognizeTextFromCamUseCase
      )
      : super(ObjectToSpeechStateInitial()) {
    on<DetectMoneyObject>((event, emit) async {
      try {
        emit(ObjectToSpeechStateLoading());
        final ObjectEntity objectEntity = await _getObjFromCamUseCase.call(model:moneyModel , labels:moneyLabels);
        emit(ObjectToSpeechStateObjectDetected(
            objectName: objectEntity.objectName,
            imageFile: objectEntity.imageFile));
      } catch (error) {
        emit(ObjectToSpeechStateError(message: error.toString()));
      }
    });
    on<DetectVehicleObject>((event, emit) async {
      try {
        emit(ObjectToSpeechStateLoading());
        final ObjectEntity objectEntity = await _getObjFromCamUseCase.call(model:vehicleModel , labels:vehicleLabels);
        emit(ObjectToSpeechStateObjectDetected(
            objectName: objectEntity.objectName,
            imageFile: objectEntity.imageFile));
      } catch (error) {
        emit(ObjectToSpeechStateError(message: error.toString()));
      }
    });
    on<DetectVegetablesObject>((event, emit) async {
      try {
        emit(ObjectToSpeechStateLoading());
        final ObjectEntity objectEntity = await _getObjFromCamUseCase.call(model:vegetablesModel , labels:vegetablesLabels);
        emit(ObjectToSpeechStateObjectDetected(
            objectName: objectEntity.objectName,
            imageFile: objectEntity.imageFile));
      } catch (error) {
        emit(ObjectToSpeechStateError(message: error.toString()));
      }
    });
    on<DetectFruitsObject>((event, emit) async {
      try {
        emit(ObjectToSpeechStateLoading());
        final ObjectEntity objectEntity = await _getObjFromCamUseCase.call(model:fruitsModel , labels:fruitsLabels);
        emit(ObjectToSpeechStateObjectDetected(
            objectName: objectEntity.objectName,
            imageFile: objectEntity.imageFile));
      } catch (error) {
        emit(ObjectToSpeechStateError(message: error.toString()));
      }
    });
    on<DetectKitchenObject>((event, emit) async {
      try {
        emit(ObjectToSpeechStateLoading());
        final ObjectEntity objectEntity = await _getObjFromCamUseCase.call(model:kitchenModel , labels:kitchenLabels);
        emit(ObjectToSpeechStateObjectDetected(
            objectName: objectEntity.objectName,
            imageFile: objectEntity.imageFile));
      } catch (error) {
        emit(ObjectToSpeechStateError(message: error.toString()));
      }
    });
    on<ClassifyColor>((event, emit) async {
      try {
        emit(ObjectToSpeechStateLoading());
        final ColorEntity colorEntity =
            await _recognizeColorFromCamUseCase.call();
        emit(ObjectToSpeechStateColorClassified(
            colorName: colorEntity.colorName,
            imageFile: colorEntity.imageFile));
      } catch (error) {
        emit(ObjectToSpeechStateError(message: error.toString()));
      }
    });
    on<AddressToSpeech>((event, emit) async {
      try {
        emit(ObjectToSpeechStateLoading());
        final AddressEntity addressEntity = await _getAddressUseCase.call();
        emit(ObjectToSpeechStateAddressClassified(
            address: addressEntity.address));
      } catch (error) {
        emit(ObjectToSpeechStateError(message: error.toString()));
      }
    });
    on<TextToSpeech>((event, emit) async {
      try {
        emit(ObjectToSpeechStateLoading());
        final TextEntity textEntity = await _recognizeTextFromCamUseCase.call();
        emit(ObjectToSpeechStateTextSpeech(
            text: textEntity.text, imageFile: textEntity.imageFile));
      } catch (error) {
        emit(ObjectToSpeechStateError(message: error.toString()));
      }
    });

    Future<void> deleteFile(String filePath) async {
      File? file = File(filePath);
      await file.delete();
    }

    on<ObjectDetectionDone>((event, emit) {
      deleteFile(event.filePath);
      SpeakText().tts.stop();
      emit(ObjectToSpeechStateInitial());
    });
    on<AddressToSpeechDone>((event, emit) {
      SpeakText().tts.stop();
      emit(ObjectToSpeechStateInitial());
    });
  }
}
