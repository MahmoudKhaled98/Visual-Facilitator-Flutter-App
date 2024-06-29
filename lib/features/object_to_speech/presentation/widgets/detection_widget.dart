import 'dart:io';
import 'package:eye_helper/features/object_to_speech/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class DetectionWidget extends StatelessWidget {
  final File? imageFile;
  final String? detectedName;
  final void Function()? onDoubleTap;
  final  Future<bool> Function()? onWillPop;

  const DetectionWidget({
    super.key,
    this.imageFile,
    this.detectedName,
    this.onDoubleTap,
    this.onWillPop,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // Add rounded edges
              ),
              child: imageFile==null? Container():Image.file(imageFile!),
            ),
            Container(
                decoration: BoxDecoration(
                  color: const Color(0xffdae9f0).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10), // Add rounded edges
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      detectedName!,
                      style: const TextStyle(
                          fontFamily: "Kufi",
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                  ),
                )),
            imageFile==null?Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/image.png'),
            ):Container(),
            Padding(
              padding: imageFile==null?const EdgeInsets.only(top: 50.0):const EdgeInsets.only(top: 50.0),
              child: CustomButton(
                buttonName: "رجوع",
                onDoubleTap: onDoubleTap,
              ),
            )
          ],
        ),
      ),
    );
  }
}
