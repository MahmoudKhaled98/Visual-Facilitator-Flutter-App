import '../../../../core/use_cases/use_case.dart';
import '../entities/text_entity.dart';
import '../repositories/get_text_repository.dart';

class RecognizeTextFromCamUseCase
    implements UseCase<TextEntity, void> {
  final RecognizeTextRepository _getTextRepository;

  RecognizeTextFromCamUseCase(this._getTextRepository);

  @override
  Future<TextEntity> call({void params}) {
    return _getTextRepository.recognizeText();
  }
}