import 'package:eye_helper/core/util/text_to_speech_function.dart';
import 'package:eye_helper/features/object_to_speech/data/models/adress_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetAddress{
  String address='';
  Future<AddressModel> getAddress() async{

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      permission = await Geolocator.requestPermission();    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placeMarks = await placemarkFromCoordinates(
        position.latitude, position.longitude, localeIdentifier: 'ar');

    Placemark place = placeMarks[0];

    address = place.street!;
    String modifiedAddress = address.replaceAll(RegExp(r'[a-zA-Z0-9+]'), ''); // Exclude English characters
    SpeakText().speak(" شارع$modifiedAddress");

    return AddressModel(address: address);
  }
}
