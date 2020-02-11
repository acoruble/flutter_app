import 'package:uuid/uuid.dart';

import 'address.dart';

class Company {
  String id;
  String name;
  Address address;

  Company({this.id, this.name, this.address}) {
    this.id ??= Uuid().toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address.toJson(),
    };
  }

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
        id: json['id'],
        name: json['name'],
        address: Address.fromJson(json['address']));
  }
}
