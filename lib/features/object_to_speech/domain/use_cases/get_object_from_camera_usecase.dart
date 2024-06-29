
import '../../../../core/use_cases/use_case.dart';
import '../entities/object_entity.dart';
import '../repositories/get_object_repository.dart';

///Get the image from camera use-case implementation
class GetObjFromCamUseCase
    implements UseCase<ObjectEntity, void> {
  final GetObjRepository _getObjRepository;

  GetObjFromCamUseCase(this._getObjRepository);

  @override
  Future<ObjectEntity> call({void params, model, labels}) {
    return _getObjRepository.getObject(model, labels);
  }
}
