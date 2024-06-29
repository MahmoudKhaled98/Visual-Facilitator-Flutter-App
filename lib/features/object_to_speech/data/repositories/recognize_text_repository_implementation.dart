import '../../domain/entities/text_entity.dart';
import '../../domain/repositories/get_text_repository.dart';
import '../data_sources/local/text_detection.dart';
import '../models/text_model.dart';

class RecognizeTextImpl implements RecognizeTextRepository {
  final RecognizeTextFromCamera _recognizeTextFromCamera;

  RecognizeTextImpl(this._recognizeTextFromCamera);

  @override
  Future<TextEntity> recognizeText() async{
    final textModel=await _recognizeTextFromCamera.recognizeText();

    return  TextModel(text: textModel.text,imageFile: textModel.imageFile);
  }

}