import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String? address;
  const AddressEntity({this.address});

  @override
  List<Object?> get props {
    return [address];
  }
}