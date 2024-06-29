import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class GetImage {
  final ImagePicker imagePicker = ImagePicker();
  File? imageFile;

  Future<File?> takePhoto() async {
    final PermissionStatus cameraPermissionStatus =
        await Permission.camera.request();

    if (cameraPermissionStatus.isGranted) {
      final XFile? pickedImage =
          await imagePicker.pickImage(source: ImageSource.camera);
      imageFile = File(pickedImage!.path);
      return imageFile;
    } else {
      throw Exception('Permission not granted');
    }
  }
}
