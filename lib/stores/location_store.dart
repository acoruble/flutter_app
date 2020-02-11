import 'package:flutter_app/repositories/preferencies_repositories.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'package:mobx/mobx.dart';

part 'location_store.g.dart';

class LocationStore = _LocationStore with _$LocationStore;

abstract class _LocationStore with Store {

  @observable
  LatLng location;

  final Location _locationService = Location();

  @action
  Future<void> init() async {
    if(await this._checkService()) {
      LocationData locationData = await _locationService.getLocation();
      location = LatLng(locationData.latitude, locationData.longitude);
      }
  }

  Future<bool> _checkService() async {
    bool permission = false;
    bool activated = await _locationService.serviceEnabled();
    if (!activated) {
      activated = await _locationService.requestService();
    }
    print('gps activated: $activated');
    if (activated) {
      permission = await _locationService.hasPermission();
      if (!permission) {
        permission = await _locationService.requestPermission();
      }

    }

    return permission;
  }
}
