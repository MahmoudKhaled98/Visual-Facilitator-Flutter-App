import '../../../../core/use_cases/use_case.dart';
import '../entities/address_entity.dart';
import '../repositories/get_adress_repository.dart';

class GetAddressUseCase
    implements UseCase<AddressEntity, void> {
  final GetAddressRepository _getAddressRepository;

  GetAddressUseCase(this._getAddressRepository);

  @override
  Future<AddressEntity> call({void params}) {
    return _getAddressRepository.getAddress();
  }
}