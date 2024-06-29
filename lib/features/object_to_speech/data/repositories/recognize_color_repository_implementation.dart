import '../../domain/entities/color_entity.dart';
import '../../domain/repositories/get_color_repository.dart';
import '../data_sources/local/color_detection.dart';
import '../models/color_model.dart';

class RecognizeColorImpl implements RecognizeColorRepository {
  final RecognizeColorFromCamera _recognizeColorFromCamera;

  RecognizeColorImpl(this._recognizeColorFromCamera);

  @override
  Future<ColorEntity> recognizeColor() async{
    final colorModel=await _recognizeColorFromCamera.recognizeColor();

    return  ColorModel(colorName: colorModel.colorName,color: colorModel.color, imageFile: colorModel.imageFile);
  }

}
