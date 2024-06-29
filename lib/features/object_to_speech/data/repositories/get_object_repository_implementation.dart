import '../../domain/repositories/get_object_repository.dart';
import '../data_sources/local/object_from_camera.dart';
import '../models/object_model.dart';

class GetObjImpl implements GetObjRepository {
  final ObjectFromCamera _objectFromCamera;

  GetObjImpl(this._objectFromCamera);

  @override
  Future<ObjectModel> getObject(model, labels) async {
    /// Add parameters (model, label) here for detectObject()

    final objectModel=await _objectFromCamera.detectObject(model, labels);

    return  ObjectModel(objectName: objectModel.objectName,imageFile: objectModel.imageFile);
  }
}
