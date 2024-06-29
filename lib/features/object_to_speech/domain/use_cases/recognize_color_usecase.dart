import '../../../../core/use_cases/use_case.dart';
import '../entities/color_entity.dart';
import '../repositories/get_color_repository.dart';

class RecognizeColorFromCamUseCase
    implements UseCase<ColorEntity, void> {
  final RecognizeColorRepository _recognizeColorRepository;

  RecognizeColorFromCamUseCase(this._recognizeColorRepository);

  @override
  Future<ColorEntity> call({void params}) {
    return _recognizeColorRepository.recognizeColor();
  }
}