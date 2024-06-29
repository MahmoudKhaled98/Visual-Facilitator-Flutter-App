import 'package:eye_helper/features/object_to_speech/domain/repositories/get_adress_repository.dart';
import '../data_sources/remote/get_address.dart';
import '../models/adress_model.dart';

class GetAddressImpl implements GetAddressRepository {
  final GetAddress _getAddress;

  GetAddressImpl(this._getAddress);

  @override
  Future<AddressModel> getAddress() async{
    final addressModel=await _getAddress.getAddress();

    return  AddressModel(address:addressModel.address);
  }

}