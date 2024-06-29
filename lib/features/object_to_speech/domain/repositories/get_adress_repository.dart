import 'package:eye_helper/features/object_to_speech/domain/entities/address_entity.dart';

abstract class GetAddressRepository {
  Future<AddressEntity> getAddress();
}