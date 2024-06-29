import 'package:eye_helper/features/object_to_speech/data/data_sources/remote/get_address.dart';
import 'package:eye_helper/features/object_to_speech/data/repositories/get_address_repository_implementation.dart';
import 'package:eye_helper/features/object_to_speech/data/repositories/recognize_color_repository_implementation.dart';
import 'package:eye_helper/features/object_to_speech/data/repositories/recognize_text_repository_implementation.dart';
import 'package:eye_helper/features/object_to_speech/domain/use_cases/get_address_usecase.dart';
import 'package:eye_helper/features/object_to_speech/domain/use_cases/recognize_text_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/object_to_speech/data/data_sources/local/color_detection.dart';
import 'features/object_to_speech/data/data_sources/local/object_from_camera.dart';
import 'features/object_to_speech/data/data_sources/local/text_detection.dart';
import 'features/object_to_speech/data/repositories/get_object_repository_implementation.dart';
import 'features/object_to_speech/domain/use_cases/get_object_from_camera_usecase.dart';
import 'features/object_to_speech/domain/use_cases/recognize_color_usecase.dart';
import 'features/object_to_speech/presentation/pages/home_page.dart';
import 'features/object_to_speech/presentation/state_manager/object_to_speech_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

    runApp(MaterialApp(
      theme: ThemeData.light(),
      home: BlocProvider(
        create: (context) =>
            ObjectToSpeechBloc(
                GetObjFromCamUseCase(GetObjImpl(ObjectFromCamera())),
                RecognizeColorFromCamUseCase(
                    RecognizeColorImpl(RecognizeColorFromCamera())),
                GetAddressUseCase(GetAddressImpl(GetAddress())),
                RecognizeTextFromCamUseCase(
                    RecognizeTextImpl(RecognizeTextFromCamera()))

            ),
        child: const HomePage(),
      ),
    ));
  }

