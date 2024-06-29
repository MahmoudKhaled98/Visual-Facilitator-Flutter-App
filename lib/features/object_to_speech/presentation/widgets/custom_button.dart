import 'package:eye_helper/core/util/text_to_speech_function.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onDoubleTap;
  final String buttonName;

  const CustomButton(
      {super.key, this.onDoubleTap, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GestureDetector(
          onDoubleTap: onDoubleTap,
          child: ElevatedButton(
            onPressed: (){ SpeakText().speak(buttonName);},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color(0xffdae9f0).withOpacity(0.9)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(24.0), // Larger border radius
                ),
              ),
              side: MaterialStateProperty.all(const BorderSide(
                color: Color(0xffacc8d7),
                width: 4.0,
              )),
              minimumSize: MaterialStateProperty.all(
                  const Size(370, 150)), // Larger button size
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                buttonName,
                softWrap: true,
                style: const TextStyle(
                    fontFamily: 'Kufi',
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold), textAlign: TextAlign.center,// Larger text size
              ),
            ),
          ),
        ),
      ),
    );
  }
}
