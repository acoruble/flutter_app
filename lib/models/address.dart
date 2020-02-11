import 'package:latlong/latlong.dart';

class Address {
  String fullAddress;
  LatLng position;

  Address({this.fullAddress, this.position});

  factory Address.fromGeoJson(Map<String, dynamic> json) {
    Map<String, dynamic> properties = json['properties'] ?? [];
    String name = properties ['name'];
    String city = properties['city'];
    String postcode = properties['postcode'];
    String fullAddress = '$name, $postcode, $city';

    Map<String, dynamic> geometry = json['geometry'] ?? [];
    List<dynamic> coordinates = geometry['coordinates'] ?? [];
    double latitude = coordinates[1] ?? 0;
    double longitude = coordinates[0] ?? 0;
    LatLng position = LatLng(latitude, longitude);

    return Address(fullAddress: fullAddress, position: position);
  }


  Map<String, dynamic> toJson() {
    return {
      'fullAddress': fullAddress,
      'latitude' : position.latitude,
      'longitude': position.longitude,
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        fullAddress: json['fullAddress'],
        position: LatLng(json['latitude'],json['longitude'])
    );
  }
}
