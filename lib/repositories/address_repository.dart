import 'package:dio/dio.dart';
import 'package:flutter_app/models/address.dart';

class AddressRepository {
  static final String apiUrl = "https://api-adresse.data.gouv.fr";
  Dio _dio;

  AddressRepository() {
    _dio = Dio();
  }

  Future<Response> _get(String query) async {
    return await _dio.get("$apiUrl/$query");
  }

  Future<List<Address>> getAddress(String search) async {
    Response response = await _get("search/?q=$search&limit=15");
    List<Address> addresses = [];
    if(response.statusCode == 200) {
      Map<String, dynamic> json = response.data;
      if (json.containsKey("features")) {
        List<dynamic> features = json ['features'];
        features.forEach((features) {
          addresses.add(Address.fromGeoJson(features));
        });
      }
    }
    return addresses;
  }
}
