import '../entities/text_entity.dart';
abstract class RecognizeTextRepository {
  Future<TextEntity> recognizeText();
}