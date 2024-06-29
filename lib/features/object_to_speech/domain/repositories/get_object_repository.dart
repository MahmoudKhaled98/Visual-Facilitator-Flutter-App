import '../entities/object_entity.dart';
abstract class GetObjRepository {
  Future<ObjectEntity> getObject(model, labels);
}