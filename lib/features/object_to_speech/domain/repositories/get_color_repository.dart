import '../entities/color_entity.dart';

abstract class RecognizeColorRepository {
  Future<ColorEntity> recognizeColor();
}