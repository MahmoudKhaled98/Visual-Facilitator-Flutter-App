import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/recognize_text_usecase.dart';
import '../state_manager/object_to_speech_bloc.dart';
import '../state_manager/object_to_speech_event.dart';
import '../state_manager/object_to_speech_state.dart';
import '../widgets/custom_button.dart';
import '../widgets/detection_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF446879),
        appBar: AppBar(
          title: const Center(
              child: Text(
            'التعرف على الأشياء',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Kufi',
            ),
          )),
          backgroundColor: const Color(0xFFacc8d7),
        ),
        body: BlocBuilder<ObjectToSpeechBloc, ObjectToSpeechState>(
          builder: (context, state) {
            if (state is ObjectToSpeechStateInitial) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CustomButton(
                      onDoubleTap: () {context.read<ObjectToSpeechBloc>().add(TextToSpeech());},
                      buttonName: "قراءة النصوص",
                    ),
                    CustomButton(
                      onDoubleTap: () {context.read<ObjectToSpeechBloc>().add(AddressToSpeech());},
                      buttonName: "التعرف على العنوان",
                    ),
                    CustomButton(
                      onDoubleTap: () {
                        context.read<ObjectToSpeechBloc>().add(DetectMoneyObject());
                      },
                      buttonName: "التعرف على النقود",
                    ),
                    CustomButton(
                      onDoubleTap: () {
                        context.read<ObjectToSpeechBloc>().add(ClassifyColor());
                      },
                      buttonName: "التعرف على الألوان",
                    ),
                    CustomButton(
                      onDoubleTap: () { context.read<ObjectToSpeechBloc>().add(DetectKitchenObject());},
                      buttonName: "التعرف على أدوات المطبخ",
                    ),

                    CustomButton(
                      onDoubleTap: () {context.read<ObjectToSpeechBloc>().add(DetectVehicleObject());},
                      buttonName: "التعرف على وسائل النقل",
                    ),
                    CustomButton(
                      onDoubleTap: () {context.read<ObjectToSpeechBloc>().add(DetectVegetablesObject());},
                      buttonName: "التعرف على الخضروات",
                    ),
                    CustomButton(
                      onDoubleTap: () {context.read<ObjectToSpeechBloc>().add(DetectFruitsObject());},
                      buttonName: "التعرف على الفاكهة",
                    ),

                  ],
                ),
              );
            } else if (state is ObjectToSpeechStateLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            else if (state is  ObjectToSpeechStateAddressClassified) {
              return DetectionWidget(
                detectedName: state.address,
                onDoubleTap: () {
                  context
                      .read<ObjectToSpeechBloc>()
                      .add(AddressToSpeechDone());
                },
                onWillPop: () async{
                  context
                      .read<ObjectToSpeechBloc>()
                      .add(AddressToSpeechDone());
                  return false;
                },

              );
            }
            else if (state is  ObjectToSpeechStateTextSpeech) {
              return DetectionWidget(
                imageFile:state.imageFile,
                detectedName: state.text,
                onDoubleTap: () {
                  context
                      .read<ObjectToSpeechBloc>()
                      .add(ObjectDetectionDone(state.imageFile!.path));
                },
                onWillPop: () async{
                  context
                      .read<ObjectToSpeechBloc>()
                      .add(ObjectDetectionDone(state.imageFile!.path));
                  return false;
                },

              );
            }
            else if (state is ObjectToSpeechStateObjectDetected) {
              return DetectionWidget(
                imageFile: state.imageFile,
                detectedName: state.objectName,
                onDoubleTap: () {
                  context
                      .read<ObjectToSpeechBloc>()
                      .add(ObjectDetectionDone(state.imageFile!.path));
                },
                onWillPop: () async{
                  context
                      .read<ObjectToSpeechBloc>()
                      .add(ObjectDetectionDone(state.imageFile!.path));
                  return false;
                },
              );
            }
            else if (state is ObjectToSpeechStateColorClassified) {
              return DetectionWidget(
                imageFile: state.imageFile,
                detectedName: state.colorName,
                onDoubleTap: () {
                  context
                      .read<ObjectToSpeechBloc>()
                      .add(ObjectDetectionDone(state.imageFile!.path));
                },
                onWillPop: () async{
                  context
                      .read<ObjectToSpeechBloc>()
                      .add(ObjectDetectionDone(state.imageFile!.path));
                  return false;
                },

              );
            }

            else if (state is ObjectToSpeechStateError) {
              context
                  .read<ObjectToSpeechBloc>()
                  .add(AddressToSpeechDone());
            }
            return const Text(
                'Something went wrong! Please re-open the application.');
          },
        ));
  }

}
