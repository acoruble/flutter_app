import 'package:flutter_app/models/company.dart';
import 'package:flutter_app/repositories/preferencies_repositories.dart';
import 'package:mobx/mobx.dart';

part 'company_store.g.dart';

class CompanyStore = _CompanyStore with _$CompanyStore;

abstract class _CompanyStore with Store {
  final PreferenciesRepositories _preferenceRepository;

  _CompanyStore(this._preferenceRepository) {
    this.load();
  }

  @observable
  ObservableList<Company> companies = ObservableList();

  @action
  void add(Company company) {
    if (company != null) {
      companies.add(company);
      _preferenceRepository.save(companies);
    }
  }

  @action
  void remove(String id) {
    companies.removeWhere((Company company) => company.id == id);
    _preferenceRepository.save(companies);
  }

  @action
  Future<Null> load() async {
    companies.clear();
    companies.addAll(await this._preferenceRepository.load());
  }
}
