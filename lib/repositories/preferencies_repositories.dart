import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/models/company.dart';

class PreferenciesRepositories {
  static const String keyCompanies = 'companies';

  void save(List<Company> companies) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> companiesStr = [];
    companies.forEach((company) {
      Map<String, dynamic> mapJson = company.toJson();
      String json = jsonEncode(mapJson);
      companiesStr.add(json);
    });
    print(companiesStr);
    prefs.setStringList(keyCompanies, companiesStr);
  }

  Future<List<Company>> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> companiesStr = prefs.getStringList(keyCompanies);

    List<Company> companies = [];
    if(companiesStr != null) {
      companiesStr.forEach((companiesStr) {
        Map<String, dynamic> mapJson = jsonDecode(companiesStr);
        Company company = Company.fromJson(mapJson);
        companies.add(company);
      });
    }

    return companies;
  }

}